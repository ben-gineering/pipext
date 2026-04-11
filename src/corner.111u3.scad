include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>

$fn = 50;
clamp_clearence = 0;

// Function to create the model
module corner111u3(u) {
  difference() {
    zmove(u/2 + clamp_clearence/2) zcyl(h=10 - clamp_clearence, d=25, $fn=100, chamfer=1);
    #zrot(0) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
    #zrot(120) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
    #zrot(240) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
    down(u+5) screw_hole(screw_type(20), head="socket", counterbore=bore_clearance(20), $fn=32, anchor=BOT);
    up(u-5) nut_trap_inline(10, "M4", $slop=.1);
  }
}

// Create the model
corner111u3(10);
