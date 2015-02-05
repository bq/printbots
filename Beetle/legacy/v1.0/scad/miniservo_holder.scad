//MINI SERVO HOLDER
//just for show
//JGH 17/12/2013

difference(){
	cube([28, 16, 17]);	//main box
	
	translate([2,2,2])
	cube([24, 12, 15]);	//hole for servo body
	
	translate([20,2,2])	//hole for servo connector
	cube([10, 12, 5]);
	
	translate([-2,6,15])	//holes for servo screw heads
	cube([30, 4, 2]);

}

translate([20, 5, 0])		//support legs
rotate([0,0,45])
cube([30, 5, 2]);

translate([-13, 26, 0])	//support legs
rotate([0,0,-45])
cube([30, 5, 2]);