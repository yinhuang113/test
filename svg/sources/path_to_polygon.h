//  Created by Alejandro Isaza on 2012-11-18.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#ifndef __poly__path_to_polygon__
#define __poly__path_to_polygon__

#include "gsim/gs_polygon.h"
#include "svg.h"

#include <list>


namespace mb {
	class path_to_polygon {
	public:
		void convert(svgPath* path);
		
		std::list<GsPolygon> polygons() const {
			return _polygons;
		}
		
	protected:
		void processPathCommand(svgPathCommand* cmd);
		void new_polygon();
		
	private:
		bool _starting;
		GsPnt2 _start;
		GsPnt2 _current;
		GsPnt2 _last_control;
		
		GsPolygon _polygon;
		std::list<GsPolygon> _polygons;
	};
}

#endif
