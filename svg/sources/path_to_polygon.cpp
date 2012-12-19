//  Created by Alejandro Isaza on 2012-11-18.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#include "path_to_polygon.h"

#include "bezier.h"
#include "serialization.h"

#include <iostream>
#include <iterator>


namespace mb {	
	void path_to_polygon::convert(svgPath* path) {
		_starting = true;
		_start = GsPnt2::null;
		_current = _start;
		_last_control = _start;
		_polygon.size(0);
		_polygons.clear();
		
		svgPathCommand* cmd = path->ptFirstCommand;
		while (cmd) {
			processPathCommand(cmd);
			if (_starting)
				_start = _current;
			_starting = false;
			
			cmd = cmd->ptNextCommand;
		}
	}
	
	void path_to_polygon::processPathCommand(svgPathCommand* cmd) {
		switch (cmd->tId) {
			case SVG_PATH_CMD_ID_MOVETO_ABS:
				_current.x = cmd->tParameters.tMoveTo.tX.fValue;
				_current.y = cmd->tParameters.tMoveTo.tY.fValue;
				_last_control = _current;
				new_polygon();
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_MOVETO_REL:
				_current.x += cmd->tParameters.tMoveTo.tX.fValue;
				_current.y += cmd->tParameters.tMoveTo.tY.fValue;
				_last_control = _current;
				new_polygon();
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_LINETO_ABS:
				_current.x = cmd->tParameters.tLineTo.tX.fValue;
				_current.y = cmd->tParameters.tLineTo.tY.fValue;
				_last_control = _current;
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_LINETO_REL:
				_current.x += cmd->tParameters.tLineTo.tX.fValue;
				_current.y += cmd->tParameters.tLineTo.tY.fValue;
				_last_control = _current;
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_VERTICAL_LINETO_ABS:
				_current.y = cmd->tParameters.tLineTo.tY.fValue;
				_last_control = _current;
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_VERTICAL_LINETO_REL:
				_current.y += cmd->tParameters.tLineTo.tY.fValue;
				_last_control = _current;
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_HORIZONTAL_LINETO_ABS:
				_current.x = cmd->tParameters.tLineTo.tX.fValue;
				_last_control = _current;
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_HORIZONTAL_LINETO_REL:
				_current.x += cmd->tParameters.tLineTo.tX.fValue;
				_last_control = _current;
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_CUBIC_CURVETO_ABS: {
				mb::bezier b;
				b.p1 = _current;
				b.p2 = GsVec2(cmd->tParameters.tCubicCurveTo.tX1.fValue, cmd->tParameters.tCubicCurveTo.tY1.fValue);
				b.p3 = GsVec2(cmd->tParameters.tCubicCurveTo.tX2.fValue, cmd->tParameters.tCubicCurveTo.tY2.fValue);
				_current.x = cmd->tParameters.tCubicCurveTo.tX.fValue;
				_current.y = cmd->tParameters.tCubicCurveTo.tY.fValue;
				b.p4 = _current;
				_last_control = b.p3;
				bezier::list_t list = b.linearize(1);
				for (bezier::list_t::iterator it = list.begin(); it != list.end(); ++it)
					_polygon.push(*it);
			} break;
				
			case SVG_PATH_CMD_ID_CUBIC_CURVETO_REL: {
				mb::bezier b;
				b.p1 = _current;
				b.p2 = GsVec2(_current.x + cmd->tParameters.tCubicCurveTo.tX1.fValue, _current.y + cmd->tParameters.tCubicCurveTo.tY1.fValue);
				b.p3 = GsVec2(_current.x + cmd->tParameters.tCubicCurveTo.tX2.fValue, _current.y + cmd->tParameters.tCubicCurveTo.tY2.fValue);
				
				_current.x += cmd->tParameters.tCubicCurveTo.tX.fValue;
				_current.y += cmd->tParameters.tCubicCurveTo.tY.fValue;
				b.p4 = _current;
				_last_control = b.p3;
				bezier::list_t list = b.linearize(1);
				for (bezier::list_t::iterator it = list.begin(); it != list.end(); ++it)
					_polygon.push(*it);
			} break;
				
			case SVG_PATH_CMD_ID_SMOOTH_CUBIC_CURVETO_ABS: {
				mb::bezier b;
				b.p1 = _current;
				b.p2 = _current - (_last_control - _current);
				b.p3 = GsVec2(cmd->tParameters.tSmoothCubicCurveTo.tX2.fValue, cmd->tParameters.tCubicCurveTo.tY2.fValue);
				_current.x = cmd->tParameters.tCubicCurveTo.tX.fValue;
				_current.y = cmd->tParameters.tCubicCurveTo.tY.fValue;
				b.p4 = _current;
				_last_control = b.p3;
				bezier::list_t list = b.linearize(1);
				for (bezier::list_t::iterator it = list.begin(); it != list.end(); ++it)
					_polygon.push(*it);
			} break;
				
			case SVG_PATH_CMD_ID_SMOOTH_CUBIC_CURVETO_REL: {
				mb::bezier b;
				b.p1 = _current;
				b.p2 = _current - (_last_control - _current);
				b.p3 = GsVec2(_current.x + cmd->tParameters.tSmoothCubicCurveTo.tX2.fValue, _current.y + cmd->tParameters.tSmoothCubicCurveTo.tY2.fValue);
				
				_current.x += cmd->tParameters.tCubicCurveTo.tX.fValue;
				_current.y += cmd->tParameters.tCubicCurveTo.tY.fValue;
				b.p4 = _current;
				_last_control = b.p3;
				bezier::list_t list = b.linearize(1);
				for (bezier::list_t::iterator it = list.begin(); it != list.end(); ++it)
					_polygon.push(*it);
			} break;
				
			case SVG_PATH_CMD_ID_QUADRATIC_CURVETO_ABS: {
				mb::bezier b;
				b.p1 = _current;
				b.p2 = GsVec2(cmd->tParameters.tQuadraticCurveTo.tX1.fValue, cmd->tParameters.tQuadraticCurveTo.tY1.fValue);
				b.p3 = b.p2;
				_current.x = cmd->tParameters.tQuadraticCurveTo.tX.fValue;
				_current.y = cmd->tParameters.tQuadraticCurveTo.tY.fValue;
				b.p4 = _current;
				_last_control = b.p3;
				bezier::list_t list = b.linearize(1);
				for (bezier::list_t::iterator it = list.begin(); it != list.end(); ++it)
					_polygon.push(*it);
			} break;
				
			case SVG_PATH_CMD_ID_QUADRATIC_CURVETO_REL: {
				mb::bezier b;
				b.p1 = _current;
				b.p2 = GsVec2(_current.x + cmd->tParameters.tQuadraticCurveTo.tX1.fValue, _current.y + cmd->tParameters.tQuadraticCurveTo.tY1.fValue);
				b.p3 = b.p2;
				_current.x += cmd->tParameters.tQuadraticCurveTo.tX.fValue;
				_current.y += cmd->tParameters.tQuadraticCurveTo.tY.fValue;
				b.p4 = _current;
				_last_control = b.p3;
				bezier::list_t list = b.linearize(1);
				for (bezier::list_t::iterator it = list.begin(); it != list.end(); ++it)
					_polygon.push(*it);
			} break;
				
			case SVG_PATH_CMD_ID_SMOOTH_QUADRATIC_CURVETO_ABS: {
				mb::bezier b;
				b.p1 = _current;
				b.p2 = _current - (_last_control - _current);
				b.p3 = b.p2;
				_current.x = cmd->tParameters.tSmoothQuadraticCurveTo.tX.fValue;
				_current.y = cmd->tParameters.tSmoothQuadraticCurveTo.tY.fValue;
				b.p4 = _current;
				_last_control = b.p3;
				bezier::list_t list = b.linearize(1);
				for (bezier::list_t::iterator it = list.begin(); it != list.end(); ++it)
					_polygon.push(*it);
			} break;
				
			case SVG_PATH_CMD_ID_SMOOTH_QUADRATIC_CURVETO_REL: {
				mb::bezier b;
				b.p1 = _current;
				b.p2 = _current - (_last_control - _current);
				b.p3 = b.p2;
				_current.x += cmd->tParameters.tSmoothQuadraticCurveTo.tX.fValue;
				_current.y += cmd->tParameters.tSmoothQuadraticCurveTo.tY.fValue;
				b.p4 = _current;
				_last_control = b.p3;
				bezier::list_t list = b.linearize(1);
				for (bezier::list_t::iterator it = list.begin(); it != list.end(); ++it)
					_polygon.push(*it);
			} break;
				
			case SVG_PATH_CMD_ID_ARCTO_ABS:
				// TODO
				_current.x = cmd->tParameters.tArcTo.tX.fValue;
				_current.y = cmd->tParameters.tArcTo.tY.fValue;
				_last_control = _current;
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_ARCTO_REL:
				// TODO
				_current.x += cmd->tParameters.tArcTo.tX.fValue;
				_current.y += cmd->tParameters.tArcTo.tY.fValue;
				_last_control = _current;
				_polygon.push(_current);
				break;
				
			case SVG_PATH_CMD_ID_CLOSEPATH:
				_current = _start;
				_last_control = _start;
				new_polygon();
				break;
				
			default:
				break;
		}
	}
	
	void path_to_polygon::new_polygon() {
		_polygons.push_back(_polygon);
		_polygon.size(0);
	}
}