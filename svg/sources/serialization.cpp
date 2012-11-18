//  Created by Alejandro Isaza on 2012-11-17.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#include "serialization.h"

#include <sstream>

namespace mb {
	std::ostream& operator<<(std::ostream& os, const vector& v) {
		os << v.x << " " << v.y;
		return os;
	}
	
	std::ostream& operator<<(std::ostream& os, const point& v) {
		os << v.x << " " << v.y;
		return os;
	}
	
	std::ostream& operator<<(std::ostream& os, const polygon& v) {
		for (polygon::const_iterator it = v.vertices_begin(); it != v.vertices_end(); ++it)
			os << *it << "\n";
		return os;
	}
	
	std::istream& operator>>(std::istream& is, vector& v) {
		is >> std::skipws >> v.x >> v.y;
		return is;
	}
	
	std::istream& operator>>(std::istream& is, point& p) {
		is >> std::skipws >> p.x >> p.y;
		return is;
	}
	
	std::istream& operator>>(std::istream& is, polygon& v) {
		v.clear();
		
		std::string line;
		while (std::getline(is, line)) {
			std::stringstream ss(line);
			point p;
			ss >> p;
			v.add_vertex(p);
		}
		return is;
	}
}
