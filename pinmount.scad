//
include <tunable_constants.scad>;
use <common_parts.scad>


wall = 4;
w = 15;
h = 10;
l = 11;



pinmount_M4();
module pinmount_M4() {
    difference() {
        union() {
            translate([-w/2,0,0]) cube([w,l,h]);
            translate([-10/2,l/2,h]) rotate([0,0,-90]) halfbeam30(w=l, l=10, h=7);
            
        }
        
        screws();
    }
}

%screws();
module screws() {

    // pin
    translate([-20,l/2,h/2])rotate([0,90,0]) cylinder(d=C_M4_DIAMETER_THREAD, h = 50);
    
    // lock screw
    translate([0,l/2,-5]) rotate([180,0,0]) M3_flat_screw(l=h/2+5,l2=5.2);
    
    // mount screw & nut
    translate([0,l,h+3/2+1]) rotate([90,0,0]) cylinder(d=C_M3_NUT, h = 3, $fn=6);
    
    translate([0,l,h+3/2+1]) rotate([90,0,0]) cylinder(d=C_M3_DIAMETER_THREAD, h = 30);
}
