//  Created by Alejandro Isaza on 2012-11-18.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#ifndef __poly__path_to_polygon__
#define __poly__path_to_polygon__

#include "polygon.h"
#include "svg.h"

namespace mb {
	class path_to_polygon {
	public:
		void convert(svgPath* path);
		
	protected:
		void processPathCommand(svgPathCommand* cmd);
		void new_polygon();
		
	private:
		bool _starting;
		point _start;
		point _current;
		point _last_control;
		
		mb::polygon _polygon;
	};
}

#endif
