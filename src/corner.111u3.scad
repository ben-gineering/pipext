include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>

$fn = 50;
pipedia = 10;

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
    zmove(5) zcyl(h=10, d=25, $fn=100, chamfer=1);
    zrot(0) xrot(45) xmove(pipedia) ycyl(h=2*u, d=pipedia);
    zrot(120) xrot(45) xmove(pipedia) ycyl(h=2*u, d=pipedia);
    zrot(240) xrot(45) xmove(pipedia) ycyl(h=2*u, d=pipedia);
    down(u-5) screw_hole(screw_type(u), head="socket", counterbore=bore_clearance(u), $fn=32, anchor=BOT);
  }
}

// Create the model
corner111u3(20);
