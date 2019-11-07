//
include <tunable_constants.scad>;
use <common_parts.scad>

wall = 4;
w = 3+wall*2;
h = 4;
l = 100;


// mounting to sight part
c_h = 10;
c_w = 40;


prim_base_p();

module prim_base_p() {
    difference() {
        union() {
            translate([-85,0,0]) stick();
            translate([-20,-20,0]) roundedcube(c_w,20,c_h,3);
        }
        screws();
        translate([-20,-28,0]) cube([c_w,20,c_h]);
    }
}

module stick() {
    difference() {
        union() {
            roundedcube(l+wall*2, w, h,3);
            
        }
        hull() {
            translate([wall+0,w-wall,0]) cylinder(d=3, h=h);
            translate([wall+l,w-wall,0]) cylinder(d=3, h=h);
        }
    }
}
%screws();
module screws() {

    translate([C_MOUNT1_W/2,-28,c_h/2]) rotate([90,0,0]) M3_button_screw(l=30,l2=0);
    translate([-C_MOUNT1_W/2,-28,c_h/2]) rotate([90,0,0]) M3_button_screw(l=30,l2=0);
}