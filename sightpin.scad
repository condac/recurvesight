//
include <tunable_constants.scad>;
use <common_parts.scad>

// Pin hole inner diameter
ph = 2;

// Small ring width
srw = 0.8;

// Large ring inner diameter
ld = 10;

// Large ring width
lrw = 1.2;

// Height
sh = 8;

// mounting shaft diameter
sd = 3.85; // shaft diameter
// mount length
ml = 15;

// Pin holder type
type = 0;//[0:one pin, 1:vertical, 2:horizontal, 3:quad]
// Pin holder width
phw = 0.4;
// Resulution
rs = 64;

sightpin();
module sightpin() {
    difference() {
        union() {
            pipe(id = ph, w = srw, h = sh);
            pipe(id = ld, w = lrw, h = sh);
            mountpipe();
            pinholder();
        }
        
    }
}

module pipe(id = 10, w = 2, h = 10) {
    difference() {
        union() {
            cylinder(d=id + w*2, h = h, $fn=rs);
            
        }
        translate([0,0,-1]) cylinder(d=id, h = h+2, $fn=rs);
        
    }
}
module mountpipe() {
    difference() {
        union() {
            translate([0,0,sh/2]) rotate([90,0,0]) cylinder(d=sh, h=ml, $fn = rs);
        }
        translate([0,1,sh/2]) rotate([90,0,0]) cylinder(d=sd, h=ml+2, $fn = rs);
        translate([0,0,-1]) cylinder(d=ld, h=ml+2, $fn = rs);
    }
    
}

module pinholder() {
    if(type == 0) {
        difference() {
            translate([-phw/2,-ld/2-lrw,0]) cube([phw, ld/2+lrw, sh]);
            translate([0,0,-1]) cylinder(d=ph, h = sh+2, $fn=rs);
        }
    }
    
    if(type == 1) {
        difference() {
            union() {
                rotate([0,0,90]) translate([-phw/2,-ld/2-lrw,0]) cube([phw, ld/2+lrw, sh]);
                rotate([0,0,-90]) translate([-phw/2,-ld/2-lrw,0]) cube([phw, ld/2+lrw, sh]);
                
            }
            translate([0,0,-1]) cylinder(d=ph, h = sh+2, $fn=rs);
        }
    }
    if(type == 2) {
        difference() {
            union() {
                rotate([0,0,0]) translate([-phw/2,-ld/2-lrw,0]) cube([phw, ld/2+lrw, sh]);
                rotate([0,0,-180]) translate([-phw/2,-ld/2-lrw,0]) cube([phw, ld/2+lrw, sh]);
                
            }
            translate([0,0,-1]) cylinder(d=ph, h = sh+2, $fn=rs);
        }
    }
    if(type == 3) {
        difference() {
            union() {
                rotate([0,0,90]) translate([-phw/2,-ld/2-lrw,0]) cube([phw, ld/2+lrw, sh]);
                rotate([0,0,-90]) translate([-phw/2,-ld/2-lrw,0]) cube([phw, ld/2+lrw, sh]);
                rotate([0,0,0]) translate([-phw/2,-ld/2-lrw,0]) cube([phw, ld/2+lrw, sh]);
                rotate([0,0,-180]) translate([-phw/2,-ld/2-lrw,0]) cube([phw, ld/2+lrw, sh]);
                
            }
            translate([0,0,-1]) cylinder(d=ph, h = sh+2, $fn=rs);
        }
    }
}