//
include <tunable_constants.scad>;
use <common_parts.scad>

// rail dimentions
r_w = 10;
r_h = 4;

wall = 4;
w = r_w+wall*2;
h = r_h+wall;
l = 100;

// mounting to sight part
c_h = 10;
c_w = 40;


//prim_base_p();
stick();
module prim_base_p() {
    difference() {
        union() {
            translate([0,0,0]) rotate([0,0,90]) rotate([0,90,0]) stick();
            translate([-20,-20,0]) roundedcube(c_w,20,c_h,3);
        }
        screws();
        translate([-20,-28,0]) cube([c_w,20,c_h]);
    }
}

module stick() {
    difference() {
        union() {
            translate([-w/2,0,0]) cube([w,l,h]);
            
        }
        translate([0,0,wall]) beam30(w=r_w, l=l, h=r_h);
        screws();
    }
}

%screws();
module screws() {

    translate([0,20+C_MOUNT1_W/2,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=0);
    translate([0,20-C_MOUNT1_W/2,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=0);
    
    translate([0,30+C_MOUNT1_W/2,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=0);
    translate([0,30-C_MOUNT1_W/2,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=0);
}