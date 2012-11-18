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
mb::polygon convertPathToPolygon(svgPath *path);
std::list<mb::point> convertPathCommandToPolygon(svgPathCommand* cmd, mb::point& current);
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
	
	std::cout << "File parsed!\n";
	std::cout << "Item count: " << ptSvg->tItemList.ui32Count << "\n";
	
	// TODO: convert paths to polygons
	svgItem *item = ptSvg->tItemList.ptItem;
	while (item != NULL) {
		std::cout << "Item id: " << item->szId << "\n";
		if (strcasecmp(item->szId, FLOOR_ID) == 0) {
			std::cout << "Found floor of type " << item->tKind << "\n";
			processItem(item);
		}
		item = item->ptNextItem;
	}
	
	svgFreeDrawing(ptSvg);
	return 0;
}

void processItem(svgItem *item) {
	svgItem *subitem = item->ptFirstChild;
	while (subitem != NULL) {
		std::cout << "Item type: " << subitem->tKind << "\n";
		mb::polygon poly;
		switch (subitem->tKind) {
			case SVG_ITEM_KIND_PATH:
				poly = convertPathToPolygon(&subitem->tParameters.tPath);
				break;
				
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
				SVG_DEBUG_PRINTF("Invalid or unsupported element %d", subitem->tKind);
		}
		std::cout << poly << "\n";
		subitem = subitem->ptNextItem;
	}
}

mb::polygon convertPathToPolygon(svgPath *path) {
	mb::path_to_polygon ptp;
	ptp.convert(path);
	
	mb::polygon poly;
	return poly;
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
	return poly;
}

mb::polygon convertEllipseToPolygon(svgEllipse *ellipste) {
	mb::polygon poly;
	return poly;
}

mb::polygon convertLineToPolygon(svgLine *line) {
	mb::polygon poly;
	return poly;
}

mb::polygon convertPolylineToPolygon(svgPolyline *polyline) {
	mb::polygon poly;
	return poly;
}

mb::polygon convertPolygonToPolygon(svgPolygon* polygon) {
	mb::polygon poly;
	return poly;
}
