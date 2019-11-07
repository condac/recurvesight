//
include <tunable_constants.scad>;
use <common_parts.scad>

w = C_SIGHT_MOUNT_S + 10;
h = 10;
l = 150;


// mounting to sight part
c_h = 10;
c_w = 40;
mount_beam_p();
module mount_beam_p() {
    
    
    difference() {
        union() {
            beam45(w=S_BAR_W, l=l, h=5);
            translate([-20,l,0]) roundedcube(c_w,20,c_h,3);
        }
        screws();
        translate([-20,l+8,0]) cube([c_w,20,c_h]);
    }

}

%screws();
module screws() {
    for (a =[0:20:120]) {
        
        translate([0,10+a,h]) M4_button_screw(l= 20, l2=0);
    }
    translate([C_MOUNT1_W/2,l,c_h/2]) rotate([90,0,0]) M3_button_screw(l2=0);
    translate([-C_MOUNT1_W/2,l,c_h/2]) rotate([90,0,0]) M3_button_screw(l2=0);
}