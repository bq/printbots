//BATTERY PACK HOLDER
//(For clip closing prototype)
//¿¿parametric??
//JGH 16/12/2013

battery_holder();

module battery_holder(){
difference(){
	union(){
		//MAIN BOX
		difference(){
			union(){
				//External holder dimensions
				translate([0,1,0])
				cube([65, 58, 28], center=true);
		
				//clip brackets
				translate([-65/2+3.5,-31,0])
				color([1,0,0])
				cube([7, 6, 28], center=true);
		
				translate([65/2-3.5,-31,0])
				color([1,0,0])
				cube([7, 6, 28],center=true);
			}
			
			//Battery pack dimensions
			translate([0, -1, 0])
			cube([51, 55, 30], center=true);
		
			//clip hole substraction
			translate([0,-30,0])
			color([1,0,0])
			cube([68, 4, 14], center=true);
		
		}
		
		//ATTACHMENT EAR
		translate([0, 33.5,-12.5])
		difference(){
			minkowski(){
				cube([26,6,3], center=true);
				cylinder(r=2, h=1, $fn=20);
			}
			
			//NUT HOLES
			translate([17/2,1,0])
			cylinder(r=6.5/2, h=10, $fn=6);
			
			translate([-17/2,1,0])
			cylinder(r=6.5/2, h=10, $fn=6);
			
			//SCREW HOLES
			translate([17/2,1,0])
			cylinder(r=3.3/2, h=10, $fn=60, center=true);
			
			translate([-17/2,1,0])
			cylinder(r=3.3/2, h=10, $fn=60, center=true);
		}
		
		//ARDUINO HOLE SUPPORTS
		difference(){
			translate([19.5,15,-14])
			rotate([-22,0,0])
			cube([13, 10, 35]);
			
			translate([0,0,50+14])	//HUGE CUBE ABOVE
			cube([100,100,100], center=true);
			
			translate([0,0,-50-14])		//HUGE CUBE BELOW
			cube([100,100,100], center=true);
			
			translate([0, -1, 0])		//SUBTRACT INSIDE
			cube([51, 55, 30], center=true);
		
		}
		
		difference(){
			translate([-10,15,-14])
			rotate([-22,0,0])
			cube([13, 10, 35]);
			
			translate([0,0,50+14])	//HUGE CUBE ABOVE
			cube([100,100,100], center=true);
			
			translate([0,0,-50-14])		//HUGE CUBE BELOW
			cube([100,100,100], center=true);
			
			translate([0, -1, 0])		//SUBTRACT INSIDE
			cube([51, 55, 30], center=true);
		
		}
	}
	
	//ARDUINO MOUNTING HOLES
	translate([65/2-3.5,-21,15])
	rotate([0,0,180])
	union(){
		cylinder(r=3.1/2, h=20, center=true, $fn=20);
		
		translate([5.1,-50.8-1.3,0])
		cylinder(r=3.1/2, h=20, center=true, $fn=20);
		
		translate([27.9+5.1,-50.8-1.3,0])
		color([0,0,1])
		cylinder(r=3.1/2, h=20, center=true, $fn=20);
	}
}
}


	
	







