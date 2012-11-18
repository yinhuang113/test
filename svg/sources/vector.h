//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#ifndef __poly__vector__
#define __poly__vector__

#include <cmath>

namespace mb {
	class vector {
	public:
		typedef float value_t;
		
	public:
		value_t x;
		value_t y;
		
	public:
		vector() : x(), y() {}
		vector(value_t x, value_t y) : x(x), y(y) {}
		
		// --Aritmetic
		vector& operator+=(const vector& v) {
			x += v.x;
			y += v.y;
			return *this;
		}
		vector& operator-=(const vector& v) {
			x -= v.x;
			y -= v.y;
			return *this;
		}
		vector& operator*=(const value_t& s) {
			x *= s;
			y *= s;
			return *this;
		}
		vector& operator/=(const value_t& s) {
			return operator*=(static_cast<value_t>(1)/s);
		}
		vector operator-() const {
			return vector(-x, -y);
		}
		
		vector operator+(vector v) const {
			v += *this;
			return v;
		}
		vector operator-(vector v) const {
			v -= *this;
			return v;
		}
		vector operator*(value_t s) const {
			vector v(*this);
			v *= s;
			return v;
		}
		vector operator/(value_t s) const {
			vector v(*this);
			v /= s;
			return v;
		}
		
		// --Comparisson
		bool operator==(const vector& v) const {
			return x == v.x && y == v.y;
		}
		bool operator!=(const vector& v) const {
			return !(*this == v);
		}
		
		// --Helpers
		value_t length() const {
			return std::sqrt(x*x + y*y);
		}
		vector unit() const {
			return *this / length();
		}
		vector perp() const {
			return vector(-y, x);
		}
	};
	
	inline vector::value_t dot(const vector& v1, const vector& v2) {
		return v1.x * v2.x + v1.y * v2.y;
	}
}

#endif
