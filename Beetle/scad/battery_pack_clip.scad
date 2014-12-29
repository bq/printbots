//Battery pack clip
//for SM-S4303R cont. rot. servos
//JGH 16/12/2013


difference(){

	union(){
		cube ([73, 13, 2]);		//Main base
		cube ([4, 13, 5]);		//Tope
		
		translate([69, -3, 0])	//Clip
		cube ([4, 19, 2]);
	}


	//Cylinder subtraction
	translate([35, 6.5, 0])
	cylinder(r=5, h=20, center=true);
	
	//Cube subtraction
	translate([35+20,6.5,0])
	cube([40,10,20], center=true);
}