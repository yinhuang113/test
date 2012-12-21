//  Created by Alejandro Isaza on 2012-12-20.
//  Copyright (c) 2012 Synergy Media. All rights reserved.

#include <gsim/se_dcdt.h>
#include <cstdlib>
#include <iostream>

SeDcdt* createTriangulator(float width, float height);

void readPolygons(SeDcdt* dcdt);
bool readPolygon(const std::string& line, GsPolygon& pol);
bool skipOpening(const std::string& line, std::size_t& i);
bool skipComma(const std::string& line, std::size_t& i);
bool skipClosing(const std::string& line, std::size_t& i);
void skipWS(const std::string& line, std::size_t& i);

void generateSVG(SeDcdt* dcdt);
void generateTriangles(SeDcdt* dcdt);


void printUsage(int argc, const char* argv[]) {
	std::cerr << "Usage: " << argv[0] << " <width> <height> [<format>]\n";
	std::cerr << "\n";
	std::cerr << "Options:\n";
	std::cerr << "  format: The output format, either svg or psql. Default is psql.\n";
	std::cerr << "\n";
}

int main(int argc, const char* argv[]) {
	if (argc < 3) {
		printUsage(argc, argv);
		return 1;
	}
	
	float width = strtof(argv[1], NULL);
	float height = strtof(argv[2], NULL);
	SeDcdt* dcdt = createTriangulator(width, height);
	readPolygons(dcdt);
	
	if (argc >= 4) {
		if (strcmp(argv[3], "svg") == 0)
			generateSVG(dcdt);
		else if (strcmp(argv[3], "psql") == 0)
			generateTriangles(dcdt);
		else {
			printUsage(argc, argv);
			return 1;
		}
	} else {
		generateTriangles(dcdt);
	}
	
    return 0;
}

SeDcdt* createTriangulator(float width, float height) {
	float xmin = 0;
	float ymin = 0;
	float xmax = xmin + width;
	float ymax = ymin + height;
	
	// Create the triangulator
	SeDcdt* dcdt = new SeDcdt(0.5);
	GsPolygon domain(0, 4);
	domain.push(GsVec2(xmin, ymin));
	domain.push(GsVec2(xmax, ymin));
	domain.push(GsVec2(xmax, ymax));
	domain.push(GsVec2(xmin, ymax));
	dcdt->init(domain, 0.5f, 0);
	
	return dcdt;
}

void readPolygons(SeDcdt* dcdt) {
	GsPolygon pol;
	while (std::cin) {
		std::string line;
		std::getline(std::cin, line);
		if (line.empty())
			break;
		
		if (readPolygon(line, pol))
			dcdt->insert_polygon(pol);
		else
			break;
	}
}

bool readPolygon(const std::string& line, GsPolygon& pol) {
	pol.size(0);
	
	std::size_t i = 0;
	skipOpening(line, i);
	
	char* end = 0;
	while (i < line.size()) {
		if (skipClosing(line, i))
			break;
		skipOpening(line, i);
		if (i >= line.size())
			break;
		
		float x = strtof(&line[i], &end);
		if (end == &line[i])
			return false;
		i += (end - &line[i]);
		skipComma(line, i);
		if (i >= line.size())
			return false;
		
		float y = strtof(&line[i], &end);
		if (end == &line[i])
			return false;
		i += (end - &line[i]);
		skipClosing(line, i);
		skipComma(line, i);
		
		pol.push().set(x, y);
	}
	
	return !pol.empty();
}

bool skipOpening(const std::string& line, std::size_t& i) {
	skipWS(line, i);
	if (i < line.size() && line[i] == '(') {
		i += 1;
		return true;
	}
	return false;
}

bool skipComma(const std::string& line, std::size_t& i) {
	skipWS(line, i);
	if (i < line.size() && line[i] == ',') {
		i += 1;
		return true;
	}
	return false;
}

bool skipClosing(const std::string& line, std::size_t& i) {
	skipWS(line, i);
	if (i < line.size() && line[i] == ')') {
		i += 1;
		return true;
	}
	return false;
}

void skipWS(const std::string& line, std::size_t& i) {
	while (i < line.size() && iswspace(line[i]))
		i += 1;
}

void generateSVG(SeDcdt* dcdt) {
	float xmin, xmax, ymin, ymax;
	dcdt->get_bounds(xmin, xmax, ymin, ymax);
	float width = xmax - xmin;
	float height = ymax - ymin;
	
	// Get triangulation
	GsArray<GsPnt2> cedges;
	GsArray<GsPnt2> ucedges;
	dcdt->get_mesh_edges(&cedges, &ucedges);
	
	// Print triangulation
	std::cout << "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
	std::cout << "<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 1.1//EN\" \"http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd\">\n";
	std::cout << "<svg " <<
	"width=\"" << width << "px\" " <<
	"height=\"" << height << "px\" " <<
	"viewBox=\"" << xmin << ' ' << ymin << ' ' << xmax << ' ' << ymax << "\" " <<
	"xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\">\n";
	std::cout << "  <rect " <<
	"x=\"" << xmin << "\" " <<
	"y=\"" << ymin << "\" " <<
	"width=\"" << width << "\" " <<
	"height=\"" << height << "\" " <<
	"fill=\"none\" stroke=\"blue\" stroke-width=\"2\" />\n";
	
	// non-constrained edges
	std::cout << "  <g stroke=\"green\" stroke-width=\"0.5\">\n";
	for (int i = 0; i < ucedges.size(); i += 2) {
		std::cout << "    <line " <<
		"x1=\"" << ucedges[i  ].x << "\" " <<
		"y1=\"" << ucedges[i  ].y << "\" " <<
		"x2=\"" << ucedges[i+1].x << "\" " <<
		"y2=\"" << ucedges[i+1].y << "\" " <<
		"/>\n";
    }
	std::cout << "  </g>\n";
	
	// constrained edges
	std::cout << "  <g stroke=\"blue\" stroke-width=\"0.5\">\n";
	for (int i = 0; i < cedges.size(); i += 2) {
		std::cout << "    <line " <<
		"x1=\"" << cedges[i  ].x << "\" " <<
		"y1=\"" << cedges[i  ].y << "\" " <<
		"x2=\"" << cedges[i+1].x << "\" " <<
		"y2=\"" << cedges[i+1].y << "\" " <<
		"/>\n";
    }
	std::cout << "  </g>\n";
	std::cout << "</svg>\n";
}

void generateTriangles(SeDcdt* dcdt) {
	SeDcdtFace* face = dcdt->mesh()->first()->fac();
	SeDcdtFace* iface = face;
	SeDcdtSymEdge* s;
	
	std::cout.precision(8);
	do {
		s = face->se();
		std::cout << "((" << s->vtx()->p.x << ',' << s->vtx()->p.y << ')' << ',';
		
		s = s->nxt();
		std::cout << '(' << s->vtx()->p.x << ',' << s->vtx()->p.y << ')' << ',';
		
		s = s->nxt();
		std::cout << '(' << s->vtx()->p.x << ',' << s->vtx()->p.y << "))\n";
		
		face = face->nxt();
	} while (face != iface);
}
