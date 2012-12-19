//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#ifndef __poly__bezier__
#define __poly__bezier__

#include "gsim/gs_vec2.h"
#include <list>

namespace mb {
	class bezier {
	public:
		typedef float real_t;
		typedef std::list<GsPnt2> list_t;
		
	public:
		GsPnt2 p1, p2, p3, p4;
		
	public:
		bezier() : p1(), p2(), p3() ,p4() {}
		bezier(const GsPnt2& p1, const GsPnt2& p2, const GsPnt2& p3, const GsPnt2& p4) : p1(p1), p2(p2), p3(p3) ,p4(p4) {}
		
		// Evaluate the Bezier curve at t in [0, 1]
		GsPnt2 eval(real_t t) const;
		
		// Split the curve un two at t in [0, 1]
		std::pair<bezier, bezier> split(real_t t = 0.5f) const;
		
		// Linearize the bezier curve with the given tolerance. The tolerance expresses how much the control points
		// for each segment bezier deviate from their constant-speed line positions. 
		list_t linearize(real_t tol = 1) const;
		
	protected:
		static list_t recursive_linearize(const bezier& b, real_t tol);
		
	private:
		
	};
}

#endif
