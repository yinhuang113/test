//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#include "bezier.h"

#include <boost/test/unit_test.hpp>
#include <boost/test/floating_point_comparison.hpp>
#include <iostream>
#include <iomanip>

namespace mb {
	namespace test {
		BOOST_AUTO_TEST_CASE(eval) {
			// a curve having controls points at the corners of a unit square
			bezier b(GsPnt2(0, 0), GsPnt2(0, 1), GsPnt2(1, 1), GsPnt2(1, 0));
			BOOST_CHECK_SMALL(dist(b.eval(0.f), GsPnt2(0.f, 0.f)), 1e-15f);
			BOOST_CHECK_SMALL(dist(b.eval(1.f), GsPnt2(1.f, 0.f)), 1e-15f);
			BOOST_CHECK_SMALL(dist(b.eval(.5f), GsPnt2(.5f, .75f)), 1e-15f);
			
			// a constant-speed line segment
			b.p1 = GsPnt2(0, 0);
			b.p2 = GsPnt2(1, 0);
			b.p3 = GsPnt2(2, 0);
			b.p4 = GsPnt2(3, 0);
			
			// x coordinates must match the parameter times the length at every point
			for (bezier::real_t t = 0; t <= 1; t += 0.1f)
				BOOST_CHECK_SMALL(dist(b.eval(t), GsPnt2(3*t, 0)), 1e-6f);
		}
		
		BOOST_AUTO_TEST_CASE(split) {
			bezier curve(GsPnt2(0, 0), GsPnt2(0, 1), GsPnt2(1, 1), GsPnt2(1, 0));
			
			bezier curve1, curve2;
			std::pair<bezier, bezier> pair = curve.split(0.5f);
			curve1 = pair.first;
			curve2 = pair.second;
			
			BOOST_CHECK_EQUAL(curve.eval(0), curve1.eval(0));
			BOOST_CHECK_EQUAL(curve.eval(0.25f), curve1.eval(0.5f));
			BOOST_CHECK_EQUAL(curve.eval(0.5f), curve1.eval(1));
			BOOST_CHECK_EQUAL(curve.eval(0.5f), curve2.eval(0));
			BOOST_CHECK_EQUAL(curve.eval(0.75f), curve2.eval(0.5f));
			BOOST_CHECK_EQUAL(curve.eval(1), curve2.eval(1));
			
			
			curve.p1 = GsPnt2(726, 608);
			curve.p2 = GsPnt2(978, 239);
			curve.p3 = GsPnt2(788, 571);
			curve.p4 = GsPnt2(638, 702);
			pair = curve.split(0.998f);
			curve1 = pair.first;
			curve2 = pair.second;
			
			BOOST_CHECK_EQUAL(curve.eval(0), curve1.eval(0));
			BOOST_CHECK_EQUAL(curve.eval(0.998f), curve1.eval(1));
			BOOST_CHECK_SMALL((curve.eval(0.998f*0.5f) - curve1.eval(0.5f)).len(), 0.0001f);
			BOOST_CHECK_EQUAL(curve.eval(0.998f), curve2.eval(0));
			BOOST_CHECK_EQUAL(curve.eval(1), curve2.eval(1));
		}
	}
}
