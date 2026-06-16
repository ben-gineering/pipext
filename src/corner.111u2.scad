include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>
$fn = 50;

module corner111u2(u) {
base_dia = 2.7 * u;
base_height = 1.25 * u + 5;
clamp_clearence = 0.5;
  
  difference(){
  zmove(base_height/2 + clamp_clearence/2) zcyl(h=base_height - clamp_clearence, d=base_dia, $fn=100, rounding2=1.2*u);
  xmove(0.85*u) zmove(u/2) union(){
    ycyl(h=5*u, d=u);
    move([u/4,0,-u/4]) cuboid([u/2,5*u,u/2]);
    };
  screw_hole(screw_type(u), head="socket", counterbore=0, $fn=32, anchor=CENTER);
  up(12-4) nut_trap_inline(base_height, "M4", $slop=.15);
  }
}

corner111u2(17.2);
yrot(180) zrot(90) corner111u2(17.2);

//xmove(100) front_half() corner111u2(20);
//xmove(100) front_half() yrot(180) zrot(90) corner111u2(20);
//xmove(100) down(8+4) screw(screw_type(20), head="socket", $fn=32, anchor=BOT);
//xmove(100) down(40/2 + 6/2) screw("M6,40", head="socket", $fn=32, anchor=BOT);
//xmove(100) screw("M6,40", head="socket", $fn=32, anchor=CENTER);
