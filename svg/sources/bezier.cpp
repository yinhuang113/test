//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#include "bezier.h"

#include <cassert>
#include <cmath>

namespace mb {
	point bezier::eval(real_t t) const {
		real_t s = 1 - t;
		real_t a = s * s * s;
		real_t b = 3 * s * s * t;
		real_t c = 3 * s * t * t;
		real_t d = t * t * t;
		
		point::value_t x = a * p1.x + b * p2.x + c * p3.x + d * p4.x;
		point::value_t y = a * p1.y + b * p2.y + c * p3.y + d * p4.y;
		return point(x, y);
	}
	
	std::pair<bezier, bezier> bezier::split(real_t t) const {
		point p12 = lerp(p1, p2, t);
		point p23 = lerp(p2, p3, t);
		point p34 = lerp(p3, p4, t);
		point p123 = lerp(p12, p23, t);
		point p234 = lerp(p23, p34, t);
		point p1234 = lerp(p123, p234, t);
		
		bezier c1(p1, p12, p123, p1234);
		bezier c2(p1234, p234, p34, p4);
		return std::make_pair(c1, c2);
	}
	
	bezier::list_t bezier::linearize(real_t tol) const {
		return recursive_linearize(*this, tol);
	}
	
	bezier::list_t bezier::recursive_linearize(const bezier& b, real_t tol) {
		// Calculate all the mid-points of the line segments
		point p12 = lerp(b.p1, b.p2, 0.5f);
		point p23 = lerp(b.p2, b.p3, 0.5f);
		point p34 = lerp(b.p3, b.p4, 0.5f);
		point p123 = lerp(p12, p23, 0.5f);
		point p234 = lerp(p23, p34, 0.5f);
		point p1234 = lerp(p123, p234, 0.5f);
		
		// Try to approximate the full cubic curve by a single straight line
        vector v14 = b.p4 - b.p1;  // vector from p1 to p4, the line approximation
		real_t d14 = v14.length(); // distance between p1 an dp4
		vector t = v14 / d14;      // tangent for the line approximation
		vector n = t.perp();       // normal for the line approximation
		
		// perpendicular and tangential distances between the control points and their ideal line locations
		real_t d2p = std::fabs(dot(b.p4 - b.p2, n));
		real_t d2t = std::fabs(dot(b.p2 - b.p1, t) - d14/3.f);
		real_t d3p = std::fabs(dot(b.p4 - b.p3, n));
		real_t d3t = std::fabs(-dot(b.p4 - b.p3, t) - d14/3.f);
		
        if (std::max(d2p + d2t, d3p + d3t) <= tol) {
			list_t l;
			l.push_back(b.p1);
			l.push_back(p1234);
			l.push_back(b.p4);
            return l;
        }
	
		// Continue subdivision
		list_t list1 = recursive_linearize(bezier(b.p1, p12, p123, p1234), tol);
		list_t list2 = recursive_linearize(bezier(p1234, p234, p34, b.p4), tol);
		assert(list1.back() == list2.front());
		list1.pop_back();
		list1.splice(list1.end(), list2);
		return list1;
	}
}