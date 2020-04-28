///////////////////////////////////////////////////////////////////////////////
// Initial Revision:
//   2020-Apr-19
//
// Author:
//
//   David Crook <idcrook@users.noreply.github.com>
//
// Inspired by:
//
// Description:
//
//   Vertical stand for Raspberry Pi plus 7-inch HDMI touchscreen display with
//   push-buttons
//
// Revisions/Notes:
//
//   2020-Apr-19: Initial dimensions
//
//   2020-Apr-19:
//
///////////////////////////////////////////////////////////////////////////////


use <MCAD/2Dshapes.scad>

include <../libraries/misc/fillet.scad>

include <../libraries/Chamfers-for-OpenSCAD/Chamfer.scad>

/* LCD monitor model */
//use <mockup/HDMI_7inch_touchscreen__dummy.scad>
include <mockup/HDMI_7inch_touchscreen__dummy.scad>



e = 1/128; // small number

case_side_edge_extra = 1.0;
case_top_bottom_edge_extra = 0.5;
panel_shell_thickness = 3.5;
panel_width  = pcb_width + 2*(case_side_edge_extra) + 2*panel_shell_thickness;
panel_height  = pcb_height + 2*(case_top_bottom_edge_extra) + 2*panel_shell_thickness ;

lcd_cutout_x = lcd_width;
lcd_cutout_y = lcd_height;
lcd_translate_x = pcb_rectangular_x_origin + (1/2) * (panel_width - pcb_rectangular_width);
lcd_translate_y = pcb_rectangular_y_origin +
    (1/2) * (panel_height - pcb_rectangular_height) - pcb_to_edge_lcd_bottom;


screw1_pos_x = first_hole_pos_x + panel_shell_thickness + case_side_edge_extra;
screw1_pos_y = first_hole_pos_y + panel_shell_thickness + case_top_bottom_edge_extra;
screw_hole_distance_x = hole_spacing_width;
screw_hole_distance_y = hole_spacing_height;
screw_hole_diameter = hole_diameter;
screw_hole_pad_size = 6.0;
screw_hole_pad_depth = 5.0;

module monitorAndPiAssembly (showPi = false) {

  HDMI_7inch_touchscreen__dummy(showPi);

}

module screw_hole_pad_front_face (pad_size = screw_hole_pad_size, pad_depth = screw_hole_pad_depth,
                                  hole_diameter = screw_hole_diameter) {

    // note: notice tapers smaller at d_top
    d_bot = hole_diameter;
    d_top = (95/100)*hole_diameter;

    difference () {
        cube([pad_size, pad_size, pad_depth + e], center = true);
        translate([0,0,-e])
            cylinder(h = pad_depth + 2*e, d1 = d_bot, d2 = d_top, center = true);

    }
}

module caseFrontPanel () {
    chamfer_size_face = 2;
    thickness_face = 2.0;
    panel_z_height = pcb_to_lcd_glass + pcb_thickness;

    scale_cutout = 0.95;
    translate_scale_cutout = (1/2) * (1/scale_cutout - 1);
    translate_x_cutout = translate_scale_cutout * panel_width;
    translate_y_cutout = translate_scale_cutout * panel_height;

    first_hole_center_inset_x = screw1_pos_x;
    first_hole_center_inset_y = screw1_pos_y;
    hole_distance_x = screw_hole_distance_x ;
    hole_distance_y = screw_hole_distance_y ;
    hole_diameter  = screw_hole_diameter ;

    front_pad_depth = panel_z_height - thickness_face - pcb_thickness;

    hole_origin = [first_hole_center_inset_x + (1/4)*case_side_edge_extra,
                   first_hole_center_inset_y + (1/2)*case_top_bottom_edge_extra ];
    corner_hole_positions = [[hole_origin.x + 0,               hole_origin.y + 0],
                             [hole_origin.x + hole_distance_x, hole_origin.y + 0],
                             [hole_origin.x + 0,               hole_origin.y + hole_distance_y],
                             [hole_origin.x + hole_distance_x, hole_origin.y + hole_distance_y]];


    for (p = corner_hole_positions) {
        translate([p[0], p[1], pcb_thickness+ (1/2)*front_pad_depth ])
            screw_hole_pad_front_face(pad_size = screw_hole_pad_size,
                                      pad_depth = front_pad_depth,
                                      hole_diameter = hole_diameter);
    }


    // bulk - {bulk cutout, screen cutout}
    difference () {
        intersection() {
            // outline with rounded corners
            translate([0, 0, 0])
                cube_fillet([panel_width ,
                             panel_height,
                             panel_z_height], radius=4, $fn=25);

            // add chamfer to top
            scale ([1.0, 1.0, 1.0])
                translate([0, 0, -chamfer_size_face])
                rotate([0,0,0])
                chamferCube([panel_width, panel_height, panel_z_height + chamfer_size_face+ e], ch=chamfer_size_face);
        }

        // bulk cutout
        translate([translate_x_cutout ,
                   translate_y_cutout , -e])
            rotate([0,0,0])
            cube_fillet([panel_width * scale_cutout ,
                         panel_height * scale_cutout ,
                         panel_z_height - thickness_face + 2*e],
                        radius=4, $fn=25);

        // screen cutout
        translate([lcd_translate_x,
                   lcd_translate_y,
                   panel_z_height - thickness_face - e])
            rotate([0,0,0])
            cube_fillet([lcd_cutout_x,
                         lcd_cutout_y,
                         thickness_face + 2*e],
                        radius=0.5, $fn=25);

    }

}

module caseBackPanel () {

    cube([panel_width, panel_height, pcb_to_lcd_glass]);

}




module showTogether() {

    %scale ([1.0,1.0,1.0])
        translate([(1/4)*case_side_edge_extra,
                   (1/2)*case_top_bottom_edge_extra,0])
        rotate([0,0,0])
        monitorAndPiAssembly(showPi = !true);

    scale ([1.0,1.0,1.0])
        translate([0 - panel_shell_thickness - ( case_side_edge_extra) ,
                   0 - panel_shell_thickness - ( case_top_bottom_edge_extra),
                   0])
        rotate([0,0,0])
        caseFrontPanel();

    *scale ([1.0,1.0,1.0])
        translate([0,0,-10])
        rotate([0,0,0])
        caseBackPanel();


}


show_everything = true ;

show_monitor_assembly = true ;

if (show_everything) {
  showTogether();
} else {

  // $preview requires version 2019.05
  fn = $preview ? 30 : 100;

  if (show_monitor_assembly) {

    scale ([1.0,1.0,1.0])
        translate([0,0,0])
        rotate([0,0,0])
        monitorAndPiAssembly();
  }


}
