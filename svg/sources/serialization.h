//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#ifndef __poly__serialization__
#define __poly__serialization__

#include "polygon.h"
#include "point.h"
#include "vector.h"
#include <iostream>

namespace mb {
	std::ostream& operator<<(std::ostream& os, const vector& v);
	std::ostream& operator<<(std::ostream& os, const point& v);
	std::ostream& operator<<(std::ostream& os, const polygon& v);
	
	std::istream& operator>>(std::istream& is, const vector& v);
	std::istream& operator>>(std::istream& is, const point& v);
	std::istream& operator>>(std::istream& is, const polygon& v);
}

#endif
