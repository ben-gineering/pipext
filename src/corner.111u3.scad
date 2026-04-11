include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>

$fn = 50;
clamp_clearence = 1;

// Function to create the model
module corner111u3(u) {
//  difference() {
//    cuboid([u,u,u], chamfer=cube_ch(u)) {};
//    move([u/4,u/4,0]) zcyl(h=2*u,d=8,$fn=30);
//    move([0,-u/4,-u/4]) xcyl(h=2*u,d=8,$fn=30);
//    move([-u/4,0,u/4]) ycyl(h=2*u,d=8,$fn=30);
//    rot([0,-45,-45]) cuboid([8,2*u,2*u]){};
//    }
  difference() {
    zmove(u/2 + clamp_clearence/2) zcyl(h=10 - clamp_clearence, d=25, $fn=100, chamfer=1);
    zrot(0) xrot(54.74) xmove(u) ycyl(h=5*u, d=u);
    zrot(120) xrot(54.74) xmove(u) ycyl(h=5*u, d=u);
    zrot(240) xrot(54.74) xmove(u) ycyl(h=5*u, d=u);
    down(u+5) screw_hole(screw_type(20), head="socket", counterbore=bore_clearance(20), $fn=32, anchor=BOT);
    up(u-5) nut_trap_inline(10, "M4", $slop=.1);
  }
}

// Create the model
corner111u3(10);
