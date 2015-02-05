//SERVO HOLDER
//for SM-S4303R cont. rot. servos
//JGH 16/12/2013

use <SM-S4303R.scad>;

res=100;

difference (){

cube ([65, 43, 22]);

//Servo subtracion
translate([11.5,5,2])
servo(false, 25);


//Side cube subtractions
translate([4,18, 0])
cube([15, 21, 50], center=true);

translate([61,18, 0])
cube([15, 21, 50], center=true);

translate([0,0, 0])
cube([15, 21, 50], center=true);

translate([65,0, 0])
cube([15, 21, 50], center=true);

//Agujeros tuercas
translate([11.5,-7.5,2]){

translate([-4.5,30,5.5])
rotate([90,0,0])
cylinder(r=6.6/2, h=20, center=true, $fn=6);

translate([-4.5,30,15.5])
rotate([90,0,0])
cylinder(r=6.6/2, h=20, center=true, $fn=6);

translate([46.5,30,5.5])
rotate([90,0,0])
cylinder(r=6.6/2, h=20, center=true, $fn=6);

translate([46.5,30,15.5])
rotate([90,0,0])
cylinder(r=6.6/2, h=20, center=true, $fn=6);
}

//Agujeros cabeza tornillo
translate([11.5,20,2]){

translate([-4.5,30,5.5])
rotate([90,0,0])
cylinder(r=6.2/2, h=20, center=true, $fn=res);

translate([-4.5,30,15.5])
rotate([90,0,0])
cylinder(r=6.2/2, h=20, center=true, $fn=res);

translate([46.5,30,5.5])
rotate([90,0,0])
cylinder(r=6.2/2, h=20, center=true, $fn=res);

translate([46.5,30,15.5])
rotate([90,0,0])
cylinder(r=6.2/2, h=20, center=true, $fn=res);
}
}