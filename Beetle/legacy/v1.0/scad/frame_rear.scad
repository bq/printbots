//SERVO HOLDER
//for SM-S4303R cont. rot. servos
//JGH 16/12/2013

use <SM-S4303R.scad>;

res=50;

frame_rear();


//MODULES

module frame_rear(){
difference(){
	union(){
		thin_single_servo_holder();
		
		translate([0,0.0001,0])	//Solución cutreeeeeeee
		mirror([0, 1, 0])			//Si no da error al generar stl porqu elas caras están en el mismo plano
		thin_single_servo_holder();
	}

	translate([60.5,0,27])
	rotate([0,40,0])
	cube([30,100,10], center=true);
}


//ENGANCHE CON FRONT
difference(){
	translate([53.5, 3.5, 0])
	cube([10, 10, 15]);
	
	translate([58.5,8.5,10])	//Holes for screws (add nut imprint?)
	color([1,0,0])
	cylinder(r=3.6/2, h=30, center=true, $fn=25);
}

difference(){
	translate([53.5, -13.5, 0])
	cube([10, 10, 15]);

	translate([58.5,-8.5,10])
	color([1,0,0])
	cylinder(r=3.6/2, h=30, center=true, $fn=25);
}
}

module thin_single_servo_holder(){
	translate([0, -4, 0])
	difference(){
		single_servo_holder();
		cube([80, 4, 50]);
	}
}

module single_servo_holder(){
	difference (){
	
	cube ([65, 43, 22]);	//main body
	
	//Servo subtraction
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
}
