//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#ifndef __poly__point__
#define __poly__point__

#include "vector.h"

namespace mb {
	class point {
	public:
		typedef float value_t;
		
	public:
		value_t x;
		value_t y;
		
	public:
		point() : x(), y() {}
		point(value_t x, value_t y) : x(x), y(y) {}
		
		// --Aritmetic
		point& operator+=(const vector& v) {
			x += v.x;
			y += v.y;
			return *this;
		}
		point& operator-=(const vector& v) {
			x -= v.x;
			y -= v.y;
			return *this;
		}
		
		point operator+(const vector& v) const {
			return point(x + v.x, y + v.y);
		}
		point operator-(const vector& v) const {
			return point(x - v.x, y - v.y);
		}
		vector operator-(const point& p) const {
			return vector(x - p.x, y - p.y);
		}
		
		// --Comparisson
		bool operator==(const point& p) const {
			return x == p.x && y == p.y;
		}
		bool operator!=(const point& p) const {
			return !(*this == p);
		}
	};
	
	// --Helpers
	inline point lerp(const point& p1, const point& p2, point::value_t t) {
		return point(p1.x + (p2.x - p1.x)*t, p1.y + (p2.y - p1.y)*t);
	}
	
	inline point::value_t distance(const point& p1, const point& p2) {
		return (p2 - p1).length();
	}
}

#endif
