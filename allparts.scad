//
use <bowmount.scad>
use <mount_beam.scad>
use <primitive.scad>

bow_mount_p();
translate([0,-10,0]) mount_beam_p();

translate([0,150,0]) prim_base_p();