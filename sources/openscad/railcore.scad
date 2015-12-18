module inv_ext2020(l=20, teeth = [1, 1, 1, 1], depth=1.5, tolerance=0.2, thick=3, hole=0, support=[1,1], layer_height=0.3) {
{
    difference() {
      translate([0,0,l/2])
        cube([20+thick,20+thick,l], center=true);
      translate([0,0,thick])ext2020(l=l-thick, teeth=teeth, tolerance=tolerance, depth=depth);
      #translate([0, l+15+layer_height,(l/2)+(hole/2)]) rotate([90,0,0])cylinder(d=hole, h=25+thick*2);
      }
    }
}
module ext2020(l=20, teeth = [1, 1, 1, 1], depth=1.5, tolerance=0.2) {
  scale([1,1,1])translate([0,0,l/2])
  difference(){
    cube([20+tolerance,20+tolerance,l], center=true);
    scale([1,1,1]) {
        if (teeth[0] == 1)
        translate([10-((depth+tolerance)/2)+tolerance,0,0])cube([depth+tolerance,5.68-tolerance,l], center=true);
        if (teeth[1] == 1)
        translate([-10+((depth+tolerance)/2)-tolerance,0,0])cube([depth+tolerance,5.68-tolerance,l], center=true);
    }
    scale([1,1,1]) {
        if (teeth[2] == 1)
        translate([0,10-((depth+tolerance)/2)+tolerance,0])cube([5.68-tolerance,depth+tolerance,l], center=true);
        if (teeth[3] == 1)
        translate([0,-10+((depth+tolerance)/2)-tolerance,0])cube([5.68-tolerance,depth+tolerance,l], center=true);
      }
  }
}
function vwheel_r() = 9.77;
*translate([120,0,0])
rotate([0,-90,0]) {
difference(){
  import("./printrcore-slide1a.stl");
  translate([-3.5,0,8.5])mirror([0,0,1])ext2020(teeth=[0,0,0,0]);
}
translate([-3.5,0,8.5])mirror([0,0,1])inv_ext2020(teeth=[0,1,1,1]);
}

difference() {
  translate([0,0,2.5])cube([55,15+20+vwheel_r()*2, 5], center=true);
  translate([0,10+vwheel_r(),0]) cylinder(d=5.4, h=10);
  translate([-18,-(10+vwheel_r()),0]) cylinder(d=5.4, h=10);
  translate([18,-(10+vwheel_r()),0]) cylinder(d=5.4, h=10);
  for (i = [-1, 1])
    for (j = [-1,1])
      translate([i*24,j*12,3])
        cube([2,7,6], center=true);
  for (i = [-1, 1])
    for (j = [-1,1])
    translate([i*11,(j*((40-28)/2))-4,0])
      cylinder(d=3.4, h=10);

}
*translate([0,25,0])
rotate([90,0,0])import("smartcore-toolhead-1a.stl");
