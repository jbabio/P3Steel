// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>

module x_end_motor_base() {
  x_end_base();
	translate([-34,1.5,-6])
   rotate([0,90,0])
    difference() {
    translate(v = [-15,31,26.5-1]) cube(size = [18,44,47], center = true);
    translate([-15+7,0,51-2]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,70,30]);
    translate([-15-18+11,0,51-2]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,70,30]);
    // Bottom corners cutout
    translate([-15+7,10,-19-0]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,60,30]);
    translate([-15-18+11,10,-19-0]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,60,30]);
    translate([-15+7,74,10]) rotate([90,0,45]) translate([-15,-15,0]) cube([30,70,30]);
  }
}

module x_end_motor_holes() {
  x_end_holes();

  // Position to place
	translate([-34,1.5,-6])
  rotate([0,90,0])
    translate(v = [-1,32,30.25-4.25]) {
    // Belt hole
    translate(v = [-14,1,0]) cube(size = [10,46,22], center = true);
	mirror([0,0,1])
	{
    // Motor mounting holes
    translate(v = [20,-15.5,-15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 1.7, $fn = 10);
    //translate(v = [3,-15.5,-15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 10, r = 3.1, $fn = 15);

    translate(v = [20,-15.5,15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 1.7, $fn = 10);
    //translate(v = [3,-15.5,15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 10, r = 3.1, $fn = 15);
	
    translate(v = [20,15.5,-15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 1.7, $fn = 10);
    //translate(v = [3-10,15.5,-15.5]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 10, r = 3.1, $fn = 15);
    //translate(v = [3-10-2-3,15.5,-15.5+3.1]) cube([10,3.1*2,3.1*2], center = true);

    translate(v=[20,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.7, $fn=10);
    //translate(v=[3.5,15.5,15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=15);

    // Material saving cutout
    //translate(v = [-10,12,10]) cube(size = [60,42,42], center = true);

    // Material saving cutout
    translate(v = [-10,40,-30]) rotate(a = [45,0,0])  cube(size = [60,42,42], center = true);
    translate(v = [-10,40,32]) rotate(a = [45,0,0])  cube(size = [60,42,42], center = true);
    translate(v = [-10,-35,39]) rotate(a = [45,0,0])  cube(size = [60,8,42], center = true);
    translate(v = [-10,-35,-38.6]) rotate(a = [135,0,0])  cube(size = [60,8,42], center = true);
	
    // Motor shaft cutout
    translate(v = [0,0,0]) rotate(a = [0,-90,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 17, $fn = 6);

    //translate(v = [-25,-8.5,-30]) cube([30,30,20]);
    //translate([-15-2,-8.5,-19-7.75]) rotate([0,45,0]) cube([30,60,30]);
    //translate(v = [0,15,-4-3.9]) rotate(a = [0,-90+45,0]) rotate(a = [0,0,90]) cylinder(h = 70, r = 17, $fn = 6);
  }

}
}


module x_end_idler_holes() {
  x_end_holes();
  translate(v = [0,-23-3.5/2,30.25-4]) rotate(a = [0,-90,0]) cylinder(h = 80, r = 1.7, $fn = 10);
  translate(v = [2,-23-3.5/2,30.25-4]) rotate(a = [0,-90,0]) cylinder(h = 10, r = 3.1, $fn = 15);
  translate(v = [-22,-23-3.5/2,30.25-4]) rotate(a = [0,-90,0]) rotate(a = [0,0,30]) cylinder(h = 80, r = 3.3, $fn = 6);

//translate(v = [-30,27.9,8.4]) rotate([60,0,0]) cube([40,10,20]);
//translate(v = [-25,10.5,-1.6]) cube([40,20,20]);

	translate([-34,0,-6])
  rotate([0,90,0])
translate(v = [-30,10.5,0]) cube([20,80,80]);
}


// Final part
module x_end_motor() {
mirror([0,1,0])
  difference(){
    x_end_motor_base();
    x_end_motor_holes();
    x_end_idler_holes();
  }
}

x_end_motor();