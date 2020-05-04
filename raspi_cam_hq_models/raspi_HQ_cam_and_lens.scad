///////////////////////////////////////////////////////////////////////////////
// Initial Revision: 2020-May-04
// Author: David Crook <idcrook@users.noreply.github.com>
//
// Description:
//
//   Vertical stand for Raspberry Pi plus 7-inch HDMI touchscreen display with
//   push-buttons
//
// Revisions/Notes:
//
// 2020-May-04: Start with models for camera and 6mm lens
//
//
///////////////////////////////////////////////////////////////////////////////

/* Pi HQ camera model - include allows variables in that files scope */
//use <models/HQ_Camera_model.scad>
include <models/HQ_Camera_model.scad>

//use <models/Lens_6mm_model.scad>
include <models/Lens_6mm_model.scad>

//use <models/Lens_16mm_model.scad>
include <models/Lens_16mm_model.scad>

e = 1/128; // small number

camera_zero_translate_y_with_tripod_mount = tripod_mount_base_height + (1/2) * (sensor_housing_base_outer_diameter - pcb_height) ;
camera_zero_translate_z = pcb_back_sensor_housing_fastener_z_height;

// center is middle of pcb
lens_6mm_translate_x = (1/2)*(pcb_width - body_diameter_6mm);
lens_6mm_translate_y = (1/2)*(pcb_height - body_diameter_6mm);
lens_6mm_translate_z = (pcb_thickness + back_focal_length_6mm);

lens_16mm_translate_x = (1/2)*(pcb_width - body_diameter_16mm);
lens_16mm_translate_y = (1/2)*(pcb_height - body_diameter_16mm);
// takes into account C/CS adapter ring
lens_16mm_translate_z = (pcb_thickness +  back_focal_length_16mm );

module camera_only () {
    // position so base of tripod mount is at y==0
    translate([0,
               camera_zero_translate_y_with_tripod_mount,
               camera_zero_translate_z]) {
        raspi_hq_camera_model(install_ccs_adapter = false,
                              install_tripod_mount = true);
    }
}

module camera_ccs_adapter_only () {
    // position so base of tripod mount is at y==0
    translate([0,
               camera_zero_translate_y_with_tripod_mount,
               camera_zero_translate_z]) {
        raspi_hq_camera_model(install_ccs_adapter = true,
                              install_tripod_mount = true);
    }

}

module camera_and_6mm_assembly () {

    // position so base of tripod mount is at y==0
    translate([0,
               camera_zero_translate_y_with_tripod_mount,
               camera_zero_translate_z]) {

        raspi_hq_camera_model(install_ccs_adapter = false,
                              install_tripod_mount = true);

        translate([lens_6mm_translate_x,
                   lens_6mm_translate_y,
                   lens_6mm_translate_z])
            lens_6mm_model();
    }
}

module camera_and_16mm_assembly () {

    // position so base of tripod mount is at y==0
    translate([0,
               camera_zero_translate_y_with_tripod_mount,
               camera_zero_translate_z]) {

        raspi_hq_camera_model(install_ccs_adapter = true,
                              install_tripod_mount = true);

        translate([lens_16mm_translate_x,
                   lens_16mm_translate_y,
                   lens_16mm_translate_z])
            lens_16mm_model();
    }
}

module showTogether() {

    x_spacing = 40;
    y_spacing = 55;

    scale ([1.0,1.0,1.0])
        translate([0,0,0])
        rotate([0,0,0])
        camera_and_16mm_assembly();

    scale ([1.0,1.0,1.0])
        translate([x_spacing,0,0])
        rotate([0,0,0])
        camera_and_6mm_assembly();

    scale ([1.0,1.0,1.0])
        translate([0,y_spacing,0])
        rotate([0,0,0])
        camera_ccs_adapter_only();

    scale ([1.0,1.0,1.0])
        translate([x_spacing, y_spacing,0])
        rotate([0,0,0])
        camera_only();


}

show_everything = true ;

show_camera_and_6mm = true ;

show_camera_and_16mm = !show_camera_and_6mm ;

if (show_everything) {
    showTogether();
} else {

    // $preview requires version 2019.05
    fn = $preview ? 30 : 100;

    if (show_camera_and_6mm) {

        scale ([1.0,1.0,1.0])
            translate([0,0,0])
            rotate([0,0,0])
            camera_and_6mm_assembly();
    }

    if (show_camera_and_16mm) {

        scale ([1.0,1.0,1.0])
            translate([0,0,0])
            rotate([0,0,0])
            camera_and_16mm_assembly();
    }


}
