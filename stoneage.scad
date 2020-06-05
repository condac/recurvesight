//
include <tunable_constants.scad>;
use <common_parts.scad>

// rail dimentions
r_w = 10;
r_h = 4;

wall = 4;
w = r_w+wall*2;
h = r_h+wall;
l = 120;

// mounting to sight part
c_h = 10;
c_w = 40;

// Block length

b_l = 30;
b_w = w + 1;
b_h = 10;

%stone_stick();
%stone_block();


module stone_stick() {
    difference() {
        union() {
            translate([-w/2,0,0]) cube([w,l,h]);
            
        }
        translate([0,0,wall]) beam30(w=r_w, l=l, h=r_h);
        translate([-6/2,0,wall]) cube([6,l,h]);
        screws();
    }
}

%screws();
module screws() {

    translate([0,20+C_MOUNT1_W/2,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=20);
    translate([0,20-C_MOUNT1_W/2,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=20);
    translate([0,20+C_MOUNT1_W/2+C_MOUNT1_W,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=20);
    
    translate([0,l/2+C_MOUNT1_W/2,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=20);
    translate([0,l/2-C_MOUNT1_W/2,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=20);
    translate([0,l/2-C_MOUNT1_W/2-C_MOUNT1_W,wall]) rotate([0,0,0]) M3_flat_screw(l=30,l2=20);
}

module stone_block() {
    
    difference() {
        union() {
            translate([-b_w/2,0,wall+0.5+r_h-0.5]) cube([b_w,b_l,b_h]);
            translate([0,0,wall+0.5]) beam30(w=r_w-1, l=b_l, h=r_h-0.5);
            
            // railwalls
            rw = 5;
            translate([-b_w/2-rw,0,wall/2]) cube([rw,b_l,b_h+r_h+wall/2]);
            translate([+b_w/2,0,wall/2]) cube([rw+3,b_l,b_h+r_h+wall/2]);
        }
        
        // sight rod
        translate([-b_w,b_l-5,wall+r_h+b_h/2]) rotate([0,90,0]) %cylinder(d=C_M4_DIAMETER, h = b_w*2);
        
        // nut & screw
        hh = 6;
        translate([b_w/2-3,5,hh]) rotate([0,90,0]) cylinder(d=C_M3_NUT, h = 3+3, $fn=6);
        translate([b_w/2,5,hh]) rotate([0,90,0]) cylinder(d=C_M3_DIAMETER_THREAD, h = 20);
    }
    
}
translate([0,0,-4]) stone_mount_offset();
module stone_mount_offset() {
    off = 25;
    xx = off + 10;
    yy = C_MOUNT1_W + 10;
    zz = 4;
    difference() {
        translate([-5,0,0]) cube([xx,yy,zz]);
        translate([0,20+C_MOUNT1_W/2,zz]) rotate([0,0,0]) M3_flat_screw(l=30,l2=20);
        translate([0,20-C_MOUNT1_W/2,zz]) rotate([0,0,0]) M3_flat_screw(l=30,l2=20);
        
        translate([xx-10,20+C_MOUNT1_W/2,-zz]) rotate([0,0,0]) cylinder(d=C_M3_DIAMETER_THREAD, h = 20);
        translate([xx-10,20-C_MOUNT1_W/2,-zz]) rotate([0,0,0]) cylinder(d=C_M3_DIAMETER_THREAD, h = 20);
    }
}