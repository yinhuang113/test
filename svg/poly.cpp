#include "bezier.h"
#include "path_to_polygon.h"

#include "svg.h"
#include "gsim/gs_polygon.h"
#include <iomanip>
#include <iostream>
#include <iterator>
#include <list>
#include <strings.h>

#define FLOOR_ID "FLOOR"

void processItem(const std::string& label, svgItem *item);
void printPolygon(const GsPolygon& polygon);
std::list<GsPolygon> convertPathToPolygons(svgPath *path);
GsPolygon convertRectToPolygon(svgRect *rect);
GsPolygon convertCircleToPolygon(svgCircle *circle);
GsPolygon convertEllipseToPolygon(svgEllipse *ellipste);
GsPolygon convertLineToPolygon(svgLine *line);
GsPolygon convertPolylineToPolygon(svgPolyline *polyline);
GsPolygon convertPolygonToPolygon(svgPolygon* polygon);

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
		gsout << "# id: " << item->szId << "\n";
		processItem(item->szId, item);
		item = item->ptNextItem;
	}
	
	svgFreeDrawing(ptSvg);
	return 0;
}

void processItem(const std::string& label, svgItem *item) {
	int count = 0;
	svgItem *subitem = item->ptFirstChild;
	while (subitem != NULL) {
		GsPolygon poly;
		switch (subitem->tKind) {
			case SVG_ITEM_KIND_PATH: {
				std::list<GsPolygon> list = convertPathToPolygons(&subitem->tParameters.tPath);
				for (std::list<GsPolygon>::iterator it = list.begin(); it != list.end(); ++it) {
					std::cout << label << std::setfill('0') << std::setw(3) << count << '\t';
					printPolygon(*it);
					count += 1;
				}
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
		if (!poly.empty()) {
			std::cout << label << std::setfill('0') << std::setw(3) << count << '\t';
			printPolygon(poly);
			count += 1;
		}
		subitem = subitem->ptNextItem;
	}
}

void printPolygon(const GsPolygon& polygon) {
	const int size = polygon.size();
	std::cout << '(';
	for (int i = 0; i < size; i += 1) {
		std::cout << '(' << polygon.get(i).x << ',' << polygon.get(i).y << ')';
		if (i < size - 1)
			std::cout << ',';
	}
	std::cout << ')' << '\n';
}

std::list<GsPolygon> convertPathToPolygons(svgPath *path) {
	mb::path_to_polygon ptp;
	ptp.convert(path);
	return ptp.polygons();
}

GsPolygon convertRectToPolygon(svgRect *rect) {
	float x = rect->tX.fValue;
	float y = rect->tY.fValue;
	float w = rect->tWidth.fValue;
	float h = rect->tHeight.fValue;
	
	GsPolygon poly;
	poly.push(GsVec2(x, y));
	poly.push(GsVec2(x, y + h));
	poly.push(GsVec2(x + w, y + h));
	poly.push(GsVec2(x + w, y));
	return poly;
}

GsPolygon convertCircleToPolygon(svgCircle *circle) {
	GsPolygon poly;
	// TODO
	std::cerr << "Circle elements are not supported\n";
	return poly;
}

GsPolygon convertEllipseToPolygon(svgEllipse *ellipste) {
	GsPolygon poly;
	std::cerr << "Ellipse elements are not supported\n";
	return poly;
}

GsPolygon convertLineToPolygon(svgLine *line) {
	GsPolygon poly;
	poly.push(GsVec2(line->tX1.fValue, line->tY1.fValue));
	poly.push(GsVec2(line->tX2.fValue, line->tY2.fValue));
	return poly;
}

GsPolygon convertPolylineToPolygon(svgPolyline *polyline) {
	GsPolygon poly;
	svgPoint* point = &polyline->tFirstPoint;
	while (point) {
		poly.push(GsVec2(point->tX.fValue, point->tY.fValue));
		point = point->ptNextPoint;
	}
	return poly;
}

GsPolygon convertPolygonToPolygon(svgPolygon* polygon) {
	GsPolygon poly;
	svgPoint* point = &polygon->tFirstPoint;
	while (point) {
		poly.push(GsVec2(point->tX.fValue, point->tY.fValue));
		point = point->ptNextPoint;
	}
	return poly;
}
