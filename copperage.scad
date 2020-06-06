//
include <tunable_constants.scad>;
use <common_parts.scad>



//copper_stick();
copper_block();

// hinge pin

hp_x = 8;
hp_y = -12;
hp_d = 3;

// hinge
hz = 8;

// bearing MR63
bearing_d = 6;
bearing_h = 2.5;

// stick
sw = 8+2*2+2.5*2;
sl = 120;
sh = 10;
sx = 14;
// stick walls around adjust screw
swall = 5;

    // grove
    gx = 4;
    gy = 8;
    gz = sl - swall*2;
    





sx = 20;
sy = 20;
sz = 80;

// Block
b_x = 25;
b_y = 35;
b_h = 20;

copper_stick();
module copper_stick() {
    rotate([0,0,180]) difference() {
        union() {
            translate([-sx/2, -sy/2, -sz/2]) cube([sx,sy,sz]);
            
        }
        
        translate([-sx-10/2, -sy/2, -sz/2]) cube([sx,sy,sz]);
        
        translate([-10/2, sy/2-5, -sz/2]) rotate([0,0,45]) cube([sx,sy,sz]);
        mirror([0,1,0])translate([-10/2, sy/2-5, -sz/2]) rotate([0,0,45]) cube([sx,sy,sz]);
        
        translate([sx/2-5,sy/2-6, -sz/2]) halfbeam45(x=20,y=20,z=100);
        mirror([0,1,0])  translate([sx/2-5,sy/2-6, -sz/2]) halfbeam45(x=20,y=20,z=100);
        
        translate([0,0, -sz/2-1]) cylinder(d=6, h=110);
        
        translate([0,0, -sz/2-1]) cylinder(d=10, h=4);
        translate([0,0, -sz/2+sz-3]) cylinder(d=10, h=4);
        
        
        hull() {
            temp = sz - 12;
            translate([0,0,-temp/2]) cylinder(d=10, h=temp);
            translate([-50,0,-temp/2]) cylinder(d=10, h=temp);
        }
        
        translate([4, 0, +C_MOUNT1_W/2]) rotate([0,-90,0]) M3_flat_screw(l=30,l2=20);
        translate([4, 0, -C_MOUNT1_W/2]) rotate([0,-90,0]) M3_flat_screw(l=30,l2=20);
    }
    
    
}


module halfbeam45(x=20, y=10,z=10) {
    
    difference() {
        
        cube([x,y,z]);
        rotate([0,0,45]) cube([x*2,y,z]);
    }
    
}


module copper_stick2() {

    difference() {
        union() {
            //translate([-w/2,0,0]) cube([w,l,h]);
            translate([-sh,-sw/2,-sl/2]) cube([sh,sw,sl]);
            translate([0,0,-sl/2]) cylinder(d=14,h=swall);
            translate([0,0,sl/2-swall]) cylinder(d=14,h=swall);
            
        }
        translate([-sh,sx/2,-sl/2]) rotate([0,0,90-45]) cube([sh,sw,sl]);
        translate([-sh,-sx/2,-sl/2]) rotate([0,0,90+45]) translate([-sh,0,0]) cube([sh,sw,sl]);
        
        
        // grove
        translate([-sh+gx,-gy/2,-gz/2]) cube([gx+100,gy,gz]);
        
        screws();
        %screws();
    }
}

module screws() {

    translate([0-sh+gx, 0, +C_MOUNT1_W/2]) rotate([0,90,0]) M3_flat_screw(l=30,l2=20);
    translate([0-sh+gx, 0, -C_MOUNT1_W/2]) rotate([0,90,0]) M3_flat_screw(l=30,l2=20);

    translate([0-sh+gx, 0,C_MOUNT1_W/2 +C_MOUNT1_W/2]) rotate([0,90,0]) M3_flat_screw(l=30,l2=20);
    translate([0-sh+gx, 0,C_MOUNT1_W/2 -C_MOUNT1_W/2]) rotate([0,90,0]) M3_flat_screw(l=30,l2=20);
    
    translate([0-sh+gx, 0,C_MOUNT1_W +C_MOUNT1_W/2]) rotate([0,90,0]) M3_flat_screw(l=30,l2=20);

    // main adjust screw
    translate([0,0,-sl]) cylinder(d=5.1, h=sl*2);
    
    // bearings
    translate([0,0,-sl/2]) %cylinder(d=10.1, h=4);
    translate([0,0,sl/2-4]) %cylinder(d=10.1, h=4);
}
%block_screws();
module block_screws() {

    translate([b_x-sh,8,0]) rotate([0,-90,0]) M3_button_screw(l=30,l2=20);
    translate([b_x-sh,-8,0]) rotate([0,-90,0]) M3_button_screw(l=30,l2=20);

    translate([0,0,b_h/2-8/2]) bearingscrewss();
    translate([0,0,-b_h/2+8/2]) bearingscrewss();
    
        //hinge pin hole
    translate([hp_x,hp_y,-b_h]) cylinder(d=C_M3_DIAMETER_THREAD, h=30);
}

module copper_block() {
    
    difference() {
        union() {
            translate([0,0,b_h/2-8/2])bearingholderss();
            translate([0,0,-b_h/2+8/2]) bearingholderss();
            
            translate([-sh+5,-17,0]) rotate([0,0,-45]) rotate([0,-90,0]) cylinder(d=8, h=8);
            
            translate([-sh+0,-b_y/2,-b_h/2]) cube([b_x+2,b_y,b_h]);
            
        }
        // stick clearing
        translate([-sh,-sw/2-0.5,-sl/2]) cube([sh+1,sw+1,sl]);
        
        translate([0,0,-b_h]) cylinder(d=15, h=b_h*2);
        
        // hole inside
        h2 = hz+0.2;
        translate([0,-b_y/2,-h2/2]) cube([b_x-sh,b_y-2,h2]);
        
        scale(1.02) copper_stick();
        
        block_screws();
    }
}


module bearingholderss() {
    translate([-sh+1,-sx/2,0]) rotate([0,0,0]) rotate([-90,0,0]) bearingholder();
    mirror([0,1,0]) translate([-sh+1,-sx/2,5]) rotate([0,0,0]) rotate([-90,0,0]) bearingholder();
}


module bearingholder() {
    xx = 8;
    yy = 8;
    zz = 8;

    translate([-bearing_d/2,0,-bearing_h]) difference() {
        union() {
            //%translate([-xx/2,-yy/2,-zz]) cube([xx,yy,zz]);
            translate([0, 0, -zz]) cylinder(d=9, h=zz);
            color("blue") %cylinder(d = bearing_d, h = bearing_h);
            translate([0,0,4.5]) rotate([0,0,0]) %M3_flat_screw(l=12,l2=0);
        }
        translate([0,0,4.5]) rotate([0,0,0]) M3_flat_screw(l=22,l2=0);
    }
}
module bearingscrew() {
    //translate([-bearing_d/2,0,-bearing_h]) translate([0,0,4.5]) rotate([0,0,0]) M3_flat_screw(l=22,l2=0);
}
module bearingscrewss() {
    translate([-sh,-sx/2,0]) rotate([0,0,45]) rotate([-90,0,0]) bearingscrew();
    mirror([0,1,0]) translate([-sh,-sx/2,0]) rotate([0,0,45]) rotate([-90,0,0]) bearingscrew();
}

%copper_hinge();
translate([hp_x, hp_y,0]) rotate([0,0,-20]) translate([-hp_x, -hp_y,0]) copper_hinge();
module copper_hinge() {
    hh = hz;
    translate([0,0,-hz/2]) difference() {
        union() {
            hull() {
                cylinder(d=5, h=hz);
                translate([6,0,0]) cylinder(d=4, h=hz);
            }
            hull() {
                translate([6,0,0]) cylinder(d=4, h=hz);
                translate([hp_x+2,hp_y,0]) cylinder(d=4, h=hz);
            }
            hull() {
                translate([hp_x,hp_y,0]) cylinder(d=8, h=hz);
                translate([hp_x,hp_y-10,0]) cylinder(d=4, h=hz);
            }
            hull() {
                translate([hp_x,hp_y-10,0]) cylinder(d=4, h=hz);
                translate([hp_x-12,hp_y-18,0]) cylinder(d=4, h=hz);
            }
            
        }
        translate([0,0,-0.1]) cylinder(d=5+0.3, h=hz+1);
        
        //hinge pin hole
        translate([hp_x,hp_y,0]) cylinder(d=C_M3_DIAMETER, h=30);
        
        // spring screw
        translate([-6,-18,hz/2]) rotate([0,0,-45]) rotate([0,90,0])  cylinder(d=C_M3_DIAMETER_THREAD, h=30);
    }
}