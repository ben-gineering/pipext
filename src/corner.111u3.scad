include <BOSL2/std.scad>
include <BOSL2/screws.scad>
include <pipext.config.scad>

washer_thickness_2020 = 0;
washer_diameter_2020 = 0;

// Function to create the model
module corner111u3(u) {
  difference() {
    cuboid([u,u,u], chamfer=cube_ch(u)) {};
    move([u/4,u/4,0]) zcyl(h=2*u,d=8,$fn=30);
    move([0,-u/4,-u/4]) xcyl(h=2*u,d=8,$fn=30);
    move([-u/4,0,u/4]) ycyl(h=2*u,d=8,$fn=30);
    #rot([0,-45,-45]) cuboid([8,2*u,2*u]){};
    }
}

// Create the model
corner111u3(20);
