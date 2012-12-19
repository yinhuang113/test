/*=======================================================================
   Copyright 2010 Marcelo Kallmann. All Rights Reserved.
   This software is distributed for noncommercial use only, without
   any warranties, and provided that all copies contain the full copyright
   notice licence.txt located at the base folder of the distribution. 
  =======================================================================*/

# include <stdlib.h>
# include <gsim/gs.h>
# include <gsim/gs_output.h>
# include <gsim/gs_string.h>

# ifdef SETUT_FLGLUT
# include "setut_flglut.h"
# else
# include <GLUT/glut.h>
# endif

# if defined(GS_WINDOWS) && !defined(SETUT_FLGLUT)
# include <Windows.h>
int main ( int argc, char** argv );
char *arg[]={"setut","0"};
INT WINAPI WinMain ( HINSTANCE hInst, HINSTANCE, LPSTR strCmdLine, INT ) { return main(0,arg); }
# endif

//====================== Sym Edge Tutorial =====================

// Each example is located in a stand alone file that can be used
// as guide for using SeMesh and related classes.
// Here are the entry-point functions for each of the examples:
extern void mesh_main ();    // in setut_mesh.cpp
extern void import_main ();  // in setut_import.cpp
extern void triface_main (); // in setut_triface.cpp
extern void dt_main ();      // in setut_dt.cpp
extern void ap_main ();      // in setut_ap.cpp
extern void cdt_main ();     // in setut_cdt.cpp
extern void dcdt_main ();    // in setut_dcdt.cpp
extern void lct_main ();     // in setut_lct.cpp

int main ( int argc, char** argv )
 {
   GsString s;// = "8"; 

   gs_show_console (); // force console to open (for windows)

   if ( argc>1 )
    { s = argv[0];
    }
   else if ( s.len()==0 )
    { gsout << "SeMesh and SeTriangulator Tutorial\n\n";
      gsout << "After entering a selection, select the GLUT windows to continue:\n\n";
      gsout << "1. mesh: mesh and operators usage\n";
      gsout << "2. import: importing face-based descriptions\n";
      gsout << "3. triface: triangulating a ccw polygonal face\n";
      gsout << "4. DT: interactive Delaunay point triangulation\n";
      gsout << "5. AP: random agent placement example\n";
      gsout << "6. CDT: interactive constraint addition\n";
      gsout << "7. DCDT: interactive dynamic constrained Delaunay triangulation\n";
      gsout << "8. LCT: local clearance triangulation for extracting paths with clearance\n";
      gsout << "0. quit\n";
      gsout << "\n>";
      s.input();
      if ( s.atoi()==0 ) exit(0);
      gsout << "Running example "<<s<<"...\n\n";
    }

   # if !defined(GS_WINDOWS)
   glutInit ( &argc, argv );
   # endif

   switch ( s.atoi() )
    { case 1 : mesh_main(); break;
      case 2 : import_main(); break;
      case 3 : triface_main(); break;
      case 4 : dt_main(); break;
      case 5 : ap_main(); break;
      case 6 : cdt_main(); break;
      case 7 : dcdt_main(); break;
      case 8 : lct_main(); break;
      default: gsout << "Invalid option.\n";
    }

   return 0;
 }

