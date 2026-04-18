//include <BOSL2/std.scad>
//include <BOSL2/screws.scad>
//include <pipext.config.scad>
//
//$fn = 50;
//clamp_clearence = 0;
//
//// Function to create the model
//module corner111u3(u) {
//  difference() {
//    zmove(u/2 + clamp_clearence/2) zcyl(h=10 - clamp_clearence, d=25, $fn=100, chamfer=1);
//    #zrot(0) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
//    #zrot(120) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
//    #zrot(240) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
//    down(u+5) screw_hole(screw_type(20), head="socket", counterbore=bore_clearance(20), $fn=32, anchor=BOT);
//    up(u-5) nut_trap_inline(10, "M4", $slop=.1);
//  }
//}
//
//// Create the model
//corner111u3(10);

include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>
$fn = 50;
base_dia = 28;
tooth_count = 3;
tooth_height = 5;
clamp_clearence = 3;

module corner111u3(u) {
  pitch = 360/3;
  
  difference(){
    union(){
      zmove(6 + clamp_clearence/2) zcyl(h=12 - clamp_clearence, d=base_dia, $fn=100, chamfer=0) {
        attach(BOT) for (i = [0:3-1])
          zrot(i*pitch+60+1)
            pie_slice(ang=60-1, l=tooth_height, r=base_dia/2);
      }
    }
  zrot(0) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
  zrot(120) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
  zrot(240) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
  down(8+4) screw_hole(screw_type(u), head="socket", counterbore=bore_clearance(u), $fn=32, anchor=BOT);
  up(12-4) nut_trap_inline(10, "M4", $slop=.1);
  }
}

corner111u3(10);
//yrot(180) zrot(-60) corner111u3(10);
