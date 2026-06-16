include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>
$fn = 50;

module corner111u3(u) {
base_dia = 2.7 * u;
base_height = 1.25 * u;
tooth_height = 5;
clamp_clearence = 3;
pitch = 360/3;
  
  difference(){
    union(){
      zmove(base_height/2 + clamp_clearence/2) zcyl(h=base_height - clamp_clearence, d=base_dia, $fn=100, rounding2=u) {
        attach(BOT) for (i = [0:3-1])
          zrot(i*pitch+60+3)
            pie_slice(ang=60-3, l=tooth_height, r=base_dia/2);
      }
    }
  zrot(0) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
  zrot(120) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
  zrot(240) xrot(90-54.74) xmove(u) ycyl(h=5*u, d=u);
  down(8+4) screw_hole(screw_type(u), head="socket", counterbore=bore_clearance(u), $fn=32, anchor=BOT);
  up(12-4) nut_trap_inline(2*u, "M4", $slop=.15);
  for (i = [0:3-1])
    zrot(i*pitch+60)
      move([15,-5,2.99]) prismoid(size1=[21.3,10], size2=[10,5], h=5, shift=[5,-2.5]);
  }
}

//corner111u3(17.2);
yrot(180) zrot(-60) corner111u3(17.2);

//front_half() xmove(100) corner111u3(20);
//front_half() xmove(100) yrot(180) zrot(-60) corner111u3(20);
