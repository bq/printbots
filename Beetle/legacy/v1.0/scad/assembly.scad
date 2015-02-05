//EscarabajoBOT Assembly
//JGH 10/1/2014

use<frame_front.scad>;
use<frame_rear.scad>;
use<wheel_rear.scad>;
use<wheel_front.scad>;
use<battery_pack_holder.scad>;

//FRONT FRAME
translate([0,22.5,12.5])
frame_front();

//REAR FRAME
translate([0,126,40])
rotate([180,0,0])
rotate([0,0,90])
frame_rear();

//REAR WHEELS
translate([-43.5,106,30])
rotate([0,-90,0])
wheel_rear();

translate([43.5,106,30])
rotate([0,90,0])
wheel_rear();

//FRONT WHEELS
translate([-58.5,15+22.5,35/2])
wheel_front();

translate([58.5-15,15+22.5,35/2])
wheel_front();

//BATTERY HOLDER
color([1,1,1])
translate([0,102,54])
rotate([0,0,180])
battery_holder();


