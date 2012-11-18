//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#ifndef __poly__bezier__
#define __poly__bezier__

#include "point.h"
#include <list>

namespace mb {
	class bezier {
	public:
		typedef float real_t;
		typedef std::list<point> list_t;
		
	public:
		point p1, p2, p3, p4;
		
	public:
		bezier() : p1(), p2(), p3() ,p4() {}
		bezier(const point& p1, const point& p2, const point& p3, const point& p4) : p1(p1), p2(p2), p3(p3) ,p4(p4) {}
		
		// Evaluate the Bezier curve at t in [0, 1]
		point eval(real_t t) const;
		
		// Split the curve un two at t in [0, 1]
		std::pair<bezier, bezier> split(real_t t = 0.5f) const;
		
		// Linearize the bezier curve with the given tolerance
		list_t linearize(real_t tol = 1) const;
		
	protected:
		static list_t recursive_linearize(const bezier& b, float tol);
		
	private:
		
	};
}

#endif
