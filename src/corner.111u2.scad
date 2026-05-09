include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>
$fn = 50;

module corner111u2(u) {
base_dia = 2.5 * u;
base_height = 1.25 * u;
clamp_clearence = 1;
  
  difference(){
  zmove(base_height/2 + clamp_clearence/2) zcyl(h=base_height - clamp_clearence, d=base_dia, $fn=100, chamfer=0);
  xmove(0.85*u) zmove(u/2) union(){
    ycyl(h=5*u, d=u);
    move([u/4,0,-u/4]) cuboid([u/2,5*u,u/2]);
    };
  down(8+4) screw_hole(screw_type(u), head="socket", counterbore=bore_clearance(u), $fn=32, anchor=BOT);
  up(12-4) nut_trap_inline(10, "M4", $slop=.1);
  }
}

front_half() corner111u2(10);
yrot(180) zrot(90) corner111u2(10);

xmove(100) front_half() corner111u2(20);
xmove(100) yrot(180) zrot(90) corner111u2(20);
