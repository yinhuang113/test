#include "bezier.h"
#include "path_to_polygon.h"
#include "polygon.h"
#include "serialization.h"

#include "svg.h"
#include <iostream>
#include <iterator>
#include <list>
#include <strings.h>

#define FLOOR_ID "FLOOR"

void processItem(svgItem *item);
std::list<mb::polygon> convertPathToPolygons(svgPath *path);
mb::polygon convertRectToPolygon(svgRect *rect);
mb::polygon convertCircleToPolygon(svgCircle *circle);
mb::polygon convertEllipseToPolygon(svgEllipse *ellipste);
mb::polygon convertLineToPolygon(svgLine *line);
mb::polygon convertPolylineToPolygon(svgPolyline *polyline);
mb::polygon convertPolygonToPolygon(svgPolygon* polygon);


int main(int argc, char* argv[]) {
	if (argc < 2) {
		std::cerr << "Please specify the SVG file name\n";
		return -1;
	}

	// Open the SVG file
	svgDrawing *ptSvg = svgOpenFile(argv[1]);
	if (ptSvg == NULL) {
		std::cerr << "ERROR(" << svgGetLastError() << "): " << svgGetLastErrorDescription() << ".\n";
		return -1;
	}
	
	// Process all top level elements
	svgItem *item = ptSvg->tItemList.ptItem;
	while (item != NULL) {
		std::cout << "# id: " << item->szId << "\n";
		processItem(item);
		item = item->ptNextItem;
	}
	
	svgFreeDrawing(ptSvg);
	return 0;
}

void processItem(svgItem *item) {
	svgItem *subitem = item->ptFirstChild;
	while (subitem != NULL) {
		mb::polygon poly;
		switch (subitem->tKind) {
			case SVG_ITEM_KIND_PATH: {
				std::list<mb::polygon> list = convertPathToPolygons(&subitem->tParameters.tPath);
				for (std::list<mb::polygon>::iterator it = list.begin(); it != list.end(); ++it)
					std::cout << *it << "\n";
			} break;
				
			case SVG_ITEM_KIND_RECT:
				poly = convertRectToPolygon(&subitem->tParameters.tRect);
				break;
				
			case SVG_ITEM_KIND_CIRCLE:
				poly = convertCircleToPolygon(&subitem->tParameters.tCircle);
				break;
				
			case SVG_ITEM_KIND_ELLIPSE:
				poly = convertEllipseToPolygon(&subitem->tParameters.tEllipse);
				break;
				
			case SVG_ITEM_KIND_LINE:
				poly = convertLineToPolygon(&subitem->tParameters.tLine);
				break;
				
			case SVG_ITEM_KIND_POLYLINE:
				poly = convertPolylineToPolygon(&subitem->tParameters.tPolyline);
				break;
				
			case SVG_ITEM_KIND_POLYGON:
				poly = convertPolygonToPolygon(&subitem->tParameters.tPolygon);
				break;
				
			case SVG_ITEM_KIND_GROUP:
			case SVG_ITEM_KIND_TITLE:
			case SVG_ITEM_KIND_DESC:
			default:
				std::cerr << "Invalid or unsupported element " << subitem->tKind;
		}
		if (!poly.empty())
			std::cout << poly << "\n";
		subitem = subitem->ptNextItem;
	}
}

std::list<mb::polygon> convertPathToPolygons(svgPath *path) {
	mb::path_to_polygon ptp;
	ptp.convert(path);
	return ptp.polygons();
}

mb::polygon convertRectToPolygon(svgRect *rect) {
	float x = rect->tX.fValue;
	float y = rect->tY.fValue;
	float w = rect->tWidth.fValue;
	float h = rect->tHeight.fValue;
	
	mb::polygon poly;
	poly.add_vertex(mb::point(x, y));
	poly.add_vertex(mb::point(x, y + h));
	poly.add_vertex(mb::point(x + w, y + h));
	poly.add_vertex(mb::point(x + w, y));
	return poly;
}

mb::polygon convertCircleToPolygon(svgCircle *circle) {
	mb::polygon poly;
	// TODO
	std::cerr << "Circle elements are not supported\n";
	return poly;
}

mb::polygon convertEllipseToPolygon(svgEllipse *ellipste) {
	mb::polygon poly;
	std::cerr << "Ellipse elements are not supported\n";
	return poly;
}

mb::polygon convertLineToPolygon(svgLine *line) {
	mb::polygon poly;
	poly.add_vertex(mb::point(line->tX1.fValue, line->tY1.fValue));
	poly.add_vertex(mb::point(line->tX2.fValue, line->tY2.fValue));
	return poly;
}

mb::polygon convertPolylineToPolygon(svgPolyline *polyline) {
	mb::polygon poly;
	svgPoint* point = &polyline->tFirstPoint;
	while (point) {
		poly.add_vertex(mb::point(point->tX.fValue, point->tY.fValue));
		point = point->ptNextPoint;
	}
	return poly;
}

mb::polygon convertPolygonToPolygon(svgPolygon* polygon) {
	mb::polygon poly;
	svgPoint* point = &polygon->tFirstPoint;
	while (point) {
		poly.add_vertex(mb::point(point->tX.fValue, point->tY.fValue));
		point = point->ptNextPoint;
	}
	return poly;
}
