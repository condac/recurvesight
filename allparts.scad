//
use <bowmount.scad>
use <mount_beam.scad>
use <primitive.scad>
use <stoneage.scad>


module primitive() {
    bow_mount_p();
    translate([0,-10,0]) mount_beam_p();

    %translate([0,150,0]) prim_base_p();
}



stoneage();

module stoneage() {
    mount_beam_alt_p();
    translate([-50,160,5]) rotate([-90,-90,0]) union() {
        translate([25,0,4])stone_stick();
        translate([25,0,4])stone_block();
        translate([0,0,-1])stone_mount_offset();
    }
}