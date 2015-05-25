difference() {
  translate([0,12,0])rotate([90,0,0])translate([0.4,0.4,0])import("src/attach1.stl");
  translate([0,0,8])cube([80,40,50]);
}
translate([10,12,0])
  difference() {
    cube([25,23,8]);
    translate([10+2.5,10,0])cylinder(r=10,h=10,$fs=0.1);
    translate([12,25,3])
      rotate([90,0,0])translate([1.6/2, 1.6/2,0])cylinder(r=1.6, h=10, $fs=0.1);
  }
