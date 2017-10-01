////////////////////////////////////////////////////////////////////////
// Initial Revision:
//   01-Oct-2017
//
// Author:
//
//   David Crook <idcrook@users.noreply.github.com>
//
// Inspired by:
//
//   - http://www.thingiverse.com/thing:2355402
//
// Description:
//
//
// Revisions/Notes:
//
//   v1:
//
//
////////////////////////////////////////////////////////////////////////


use <MCAD/2Dshapes.scad>
use <MCAD/shapes.scad>
use <../libraries/wedge.scad>

  e = 0.02; // small number



module roughAxeHandle (length, width, height, gap_width ) {

  rough_l = length;
  rough_w = width;
  rough_r = gap_width /2;

  linear_extrude(height = height, center = false, convexity = 10)
    complexRoundSquare([rough_w, rough_l],
		       [rough_r, rough_r],
		       [rough_r, rough_r],
		       [rough_r, rough_r],
		       [rough_r, rough_r],
		       center = false);
}

module axeHandle (length, width1, taper_scale, height, gap_width, include_split ) {

  long_to_short_ratio = 2/3;
  long_part  = long_to_short_ratio  * length;
  short_part = (1 - long_to_short_ratio) * length;

  linear_extrude(height = height, center = false, convexity = 10, scale=taper_scale)
    // 2D outline
    difference () {
    // wooden part
    union () {
      // fat part
      ellipsePart(short_part*2,width1,2);

      // skinnier part
      rotate([0,0,180])
	ellipsePart(long_part*2,width1,2);
    }

    if (include_split) {
      // split/cut-out
      square([length*2, gap_width], center = true);
    }
  }



}

test1 = true;
test1 = false;

test2 = true;
//test2 = false;

length_at_handle_base = 57.7;
length_at_handle_top = 58.8;

width_at_handle_base = 22.9;
width_at_handle_top = 19.7;

handle_scale_vector = [1 - (length_at_handle_base-length_at_handle_top)/length_at_handle_base,
		       1 - (width_at_handle_base-width_at_handle_top)/width_at_handle_base,
		       1];

if (test1) {

  %translate([15,0,50])
    rotate([90,0,0])
    scale(3.3*[1,1,1])
    import("Pick_fire_ax__thingi_2355402.stl");

  *translate([15,0,50])
     rotate([90,0,0])
     scale(3.3*[1,1,1])
     import("axehead2__thingi_2350488.stl");


  translate([15,0,100])
  rotate([ -10, -90, 10])
    wedge(61.8, 58.5, 22.7/2);


  *rotate([0, 0, 90])
     roughAxeHandle(58.8, 19.7, 100, 2.8);


    rotate([0, 0, 0])
     axeHandle(length_at_handle_base, width_at_handle_base, handle_scale_vector, 100, 2.8, true);

} else if (test2) {



  intersection() {
    translate([-10,0,40/2])
      cube([80,40,40], center=true);

    difference () {

      translate([15,0,50])
	rotate([90,0,0])
	scale(3.0*[1.0,1.0,1.1])
	import("Pick_fire_ax__thingi_2355402.stl");

      // cut out a spot for axe handle
      rotate([0, 0, 0])
	scale([1.02,1.01,1])
	axeHandle(length_at_handle_base, width_at_handle_base, handle_scale_vector, 100, 2.8, false);


    }
  }
}
else {

  difference () {

    translate([15,0,50])
      rotate([90,0,0])
      scale(3.0*[1.0,1.0,1.1])
      import("Pick_fire_ax__thingi_2355402.stl");

    // cut out a spot for axe handle
    rotate([0, 0, 0])
     axeHandle(length_at_handle_base, width_at_handle_base, handle_scale_vector, 100, 2.8, false);


  }
}
