// This will batch generate all stl files for the make all command. Rotate to print direction

use <bowmount.scad>
use <mount_beam.scad>
use <primitive.scad>
use <stoneage.scad>

param1=0;   // must be initalised
len=param1; // param1 passed via -D on cmd-line
echo(len,param1);

$fs = 0.5;
$fa = 5.1;


module bow_mount() { 
    rotate([90,0,0]) bow_mount_p();
}


module mount_beam_alt() { 
    mount_beam_alt_p();
}
module mount_beam() { 
    mount_beam_p();
}


module prim_base() { 
    prim_base_p();
}

module primitive() {
    cube(1);
}
module base() {
    cube(1);
}
module all() {
    cube(1);
}