//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#include "bezier.h"
#include "serialization.h"

#include <boost/test/unit_test.hpp>
#include <boost/test/floating_point_comparison.hpp>


namespace mb {
	namespace test {
		BOOST_AUTO_TEST_CASE(eval) {
			bezier b(point(0, 0), point(0, 1), point(1, 1), point(1, 0));
			BOOST_CHECK_SMALL(distance(b.eval(0.f), point(0.f, 0.f)), 1e-15f);
			BOOST_CHECK_SMALL(distance(b.eval(1.f), point(1.f, 0.f)), 1e-15f);
			BOOST_CHECK_SMALL(distance(b.eval(.5f), point(.5f, .75f)), 1e-15f);
		}
		
		BOOST_AUTO_TEST_CASE(split) {
			bezier curve(point(0, 0), point(0, 1), point(1, 1), point(1, 0));
			
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
			
			
			curve.p1 = point(726, 608);
			curve.p2 = point(978, 239);
			curve.p3 = point(788, 571);
			curve.p4 = point(638, 702);
			pair = curve.split(0.998f);
			curve1 = pair.first;
			curve2 = pair.second;
			
			BOOST_CHECK_EQUAL(curve.eval(0), curve1.eval(0));
			BOOST_CHECK_EQUAL(curve.eval(0.998f), curve1.eval(1));
			BOOST_CHECK_SMALL((curve.eval(0.998f*0.5f) - curve1.eval(0.5f)).length(), 0.0001f);
			BOOST_CHECK_EQUAL(curve.eval(0.998f), curve2.eval(0));
			BOOST_CHECK_EQUAL(curve.eval(1), curve2.eval(1));
		}
	}
}
