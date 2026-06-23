include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>
$fn = 50;

module block111u1(u) {
base_dia = 2 * u;
base_height = 1.5 * u;
clamp_clearence = 0.9 * u;

difference(){
  cuboid([base_dia, base_dia, base_height]);
  xmove(base_dia/4) cuboid([base_dia/2+1, base_dia+1, clamp_clearence]);
  ycyl(l=3*u,d=u);
}
}

block111u1(10);
