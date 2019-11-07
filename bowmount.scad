//
include <tunable_constants.scad>;
use <common_parts.scad>

w = C_SIGHT_MOUNT_S + 10;
h = S_BAR_H+5;
l = 20;

bow_mount_p();
module bow_mount_p() {
    
    
    difference() {
        union() {
            translate([-w/2,-l/2,0]) cube([w,l,h]);
        }
        screws();
        translate([0,-l/2,0]) beam45(w=S_BAR_W+0.5, l=l, h=S_BAR_H+1);
        translate([28,-l/2,15]) rotate([0,180,0]) beam45(w=50, l=l, h=10);
        translate([-28,-l/2,15]) rotate([0,180,0]) beam45(w=50, l=l, h=10);
    }

}

%screws();
module screws() {
    translate([C_SIGHT_MOUNT_S/2,0,5]) M4_button_screw();
    translate([-C_SIGHT_MOUNT_S/2,0,5]) M4_button_screw();
    
    translate([0,0,h]) M4_button_screw(l2=20);
}