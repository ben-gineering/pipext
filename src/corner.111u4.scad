include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>
$fn = 50;
base_dia = 28;
clamp_clearence = 0.5;

module corner111u4(u) {
  
  difference(){
  zmove(6 + clamp_clearence/2) zcyl(h=12 - clamp_clearence, d=base_dia, $fn=100, chamfer=0);
  zrot(0) xmove(u) zmove(u/2) union(){
    ycyl(h=5*u, d=u);
    move([u/4,0,-u/4]) cuboid([u/2,5*u,u/2]);
    };
  zrot(180) xmove(u) zmove(u/2) union(){
    ycyl(h=5*u, d=u);
    move([u/4,0,-u/4]) cuboid([u/2,5*u,u/2]);
    };
  down(8+4) screw_hole(screw_type(u), head="socket", counterbore=bore_clearance(u), $fn=32, anchor=BOT);
  up(12-4) nut_trap_inline(10, "M4", $slop=.1);
  }
}

corner111u4(10);
//yrot(180) zrot(90) corner111u4(10);
