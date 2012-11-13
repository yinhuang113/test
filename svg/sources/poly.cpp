#include <iostream>
#include "svg.h"

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
	
	return 0;
}
