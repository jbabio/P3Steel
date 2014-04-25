//-----------------------------------------------------------------
//-  Endstop clamp, derived from the Prusa decorator clamps
//--  (c) Juan Gonzalez Gomez (Obijuan) juan@iearobotics.com, 
//--  April 2013
//-----------------------------------------------------------------

X = 0;
Y = 1;
Z = 2;

//-- Clamp parameters
rod_diam = 8;
clamp_diam = rod_diam + 5;
open_angle = 80;
width = 8;
base_lx = 6.5;
base_ly = 4;
base_lz = width;

zip_tie_holes = [clamp_diam, 1.5, 3];

//-- Internal parameters
open_x = 2*(rod_diam/2)*sin(open_angle/2);

module Prusa_clamp() 
{
  union() {

    //-- Clamp
    difference() {
      //-- outer cylinder
      cylinder(r=clamp_diam/2, h=width);

      //-- Inner cylinder
      cylinder(r=rod_diam/2, h=width+10,center=true);

      //-- Break the ring substracting a cube
      translate([-open_x/2,0,-1])
      cube([open_x, clamp_diam+10, width+2]);
    }

    //-- clamp Base
    translate([0,-clamp_diam/2,base_lz/2])
    cube([base_lx, base_ly, base_lz], center=true);
  }
}


//---  Endstop holder

difference() {

  Prusa_clamp();
  translate([0,
           - clamp_diam/2,
           base_lz/2])
    cube(zip_tie_holes, center=true);
}

