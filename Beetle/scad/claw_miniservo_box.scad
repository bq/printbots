//ROBOTIC CLAW
//For mini servo EMax ES08A
//JGH 16/12/2013

translate([0,0,9])	//orient for printing
rotate([180,0,0])

difference(){
	cube ([32, 15, 9]);			//Main box
	
	translate([12.2, 1.3, 0])	//Area for round parts
	color([1,1,1])
	cube ([16, 12.4, 9]);
	
	translate([3.8, 1.3, 0])		//Area fo square section of servo
	color([0,0,1])
	cube ([24.4, 12.4, 4.8]);

	translate([7.6, 7.5, 3.8])		//Hole for 3M nut
	cylinder(r=3.4, h=4.1, $fn=6);

	translate([7.6, 7.5, 3.8])		//Hole for 3M screw
	cylinder(r=2, h=10, $fn=25);

	translate([2.3, 7.5, 0])			//Holes for underside M2 screws
	cylinder(r=1, h=8, $fn=6);

	translate([29.7, 7.5, 0])
	cylinder(r=1, h=8, $fn=6);
}

