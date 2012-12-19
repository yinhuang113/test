
===============================================================
  tripath: triangulation and path planning module of Graphsim
                (c) Marcelo Kallmann 2010
===============================================================

==== TERMS OF DISTRIBUTION ====

  Copyright 2010 Marcelo Kallmann. All Rights Reserved.
  This software is distributed for noncommercial use only, without
  any warranties, and provided that all copies contain the full copyright
  notice licence.txt located at the base folder of the distribution.

==== NOTES ====

  Several measures have been implemented to achieve a robust code,
  however, robustness cannot be guaranteed for all types of input
  because this toolkit relies only on floating point computations.
  
  Read "Navigation Queries from Triangulated Meshes" MIG 2010, for
  an overview of the main features of this toolkit.

==== INSTALLATION GUIDELINES ====

 - Windows: 
   .visual C++ projects are provided in the visualc9 folder

 - Linux: 
   .call make from the linux folder
   .the existing makefiles have not been tested for a while,
     so adjustments will be probably needed

==== DIRECTORIES ORGANIZATION ====

 - bin:      after compilation, will contain test executable
 - glut:     contains glut lib and header file
 - gsim:     header files 
 - lib:      after compilation, will contain the created library
 - linux:    contains the makefiles for compilation under linux
 - src:      C++ sources for the library and test application
 - visualc:  projects for Microsoft Development Environment

