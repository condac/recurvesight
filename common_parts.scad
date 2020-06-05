include <tunable_constants.scad>;
//common_flat_screw_tap();
module M3_flat_screw(l = 10, l2 = 0) {
    // l2 is amount of the screw that are bigger for sliding through the hole
    tap_z = 1.9;
    rotate([180,0,0])
    union() {
        cylinder(d = C_M3_DIAMETER_THREAD, h= l);
        cylinder(d = C_M3_DIAMETER, h= l2);
        translate([0,0,-0.1+0.1]) cylinder(d1 = 6.5, d2= C_M3_DIAMETER_THREAD, h= tap_z);
        translate([0,0,-0.1]) cylinder(d = 6.5, h= 0.3);
    }
}

module M4_button_screw(l = 10, l2 = 0) {
    rotate([180,0,0])
    union() {
        cylinder(d = C_M4_DIAMETER_THREAD, h= l);
        cylinder(d = C_M4_DIAMETER, h= l2);
        translate([0,0,-4]) cylinder(d = 8, h=4);
    }
}
module M3_button_screw(l = 10, l2 = 0) {
    rotate([180,0,0])
    union() {
        cylinder(d = C_M3_DIAMETER_THREAD, h= l);
        cylinder(d = C_M3_DIAMETER, h= l2);
        translate([0,0,-4]) cylinder(d =6, h=4);
    }
}

module roundedcube(xdim ,ydim ,zdim,rdim){
    hull(){
        fn=30;
        translate([rdim,rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,rdim,0])cylinder(r=rdim, h=zdim, $fn=fn);

        translate([rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
        translate([xdim-rdim,ydim-rdim,0]) cylinder(r=rdim, h=zdim, $fn=fn);
    }
}
//beam45();
module beam45(w = 10, l = 10, h = 8) {
    difference() {
        union() {
            translate([-w/2,0,0]) cube([w,l,h]);
        }
        translate([w/2,0,0]) rotate([0,45,0])translate([-w-h,-1,0]) cube([w+h*2,l+2,h*2]);
        translate([-w/2,0,0]) rotate([0,-45,0])translate([0-w,-1,0]) cube([w+h*2,l+2,h*2]);
    }
}
//beam30();
module beam30(w = 10, l = 10, h = 8) {
    difference() {
        union() {
            translate([-w/2,0,0]) cube([w,l,h]);
        }
        translate([w/2,0,0]) rotate([0,90-30,0])translate([-w-h,-1,0]) cube([w+h*2,l+2,h*2]);
        translate([-w/2,0,0]) rotate([0,-90+30,0])translate([0-w,-1,0]) cube([w+h*2,l+2,h*2]);
    }
}

halfbeam30(w = 100, l = 10, h = 8);
module halfbeam30(w = 10, l = 10, h = 8) {
    difference() {
        union() {
            translate([-w/2,0,0]) cube([w,l,h]);
        }
        translate([0,-l*0.1,0])rotate([0,+30,0]) cube([w+l+h,w+l+h+l*0.1,w+l+h]);
        //translate([-w/2,0,0]) rotate([0,-90+30,0])translate([0-w,-1,0]) cube([w+h*2,l+2,h*2]);
    }
}



module cylinder_outer(height,radius,fn){
   fudge = 1/cos(180/fn);
   cylinder(h=height,r=radius*fudge,$fn=fn);
}

//indicator_dots(2);

module indicator_dots(valueIn) {
    for (a =[0:1:valueIn-1]) {
        translate([a*3,0,0]) cube([2,2,1]);
    }
}