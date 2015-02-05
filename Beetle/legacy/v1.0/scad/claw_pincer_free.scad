//ROBOTIC CLAW
//pincer attached to servo
//JGH 17/12/2013

$fn=25;
height=1.5;

translate([0,0,3])	//Orient for printing
rotate([0,180,0])

//GEAR

translate([-1.5,-2.5,3])
rotate ([0,180,0])
include <claw_gear_free.scad>;



translate([0,0,0])	//Orient for printing
//rotate([0,180,0])
		
//PINCER
difference(){
		
		minkowski(){		//everything inside the Minkoski is double the height (I have no idea why)
							//to fix this I set the variable height=1.5 (it should be 3)
			difference(){
				color([0,0,1])
				hull(){
					translate([1, 0, 0])
					cylinder(r=3, h=height);
		
					translate([5, -6, 0])
					cylinder(r=3, h=height);
					
					translate([25, 0, 0])
					cylinder(r=3, h=height);
					
					translate([35, 40, 0])
					cylinder(r=3, h=height);
					
					translate([5, 50, 0])
					cylinder(r=3, h=height);
				}
				
				hull(){
					translate([-6, 0, 0])
					cylinder(r=3, h=height);
					
					translate([20, 10, 0])
					cylinder(r=3, h=height);
					
					translate([25, 35, 0])
					cylinder(r=3, h=height);
					
					translate([0, 50, 0])
					cylinder(r=3, h=height);
				}
			
			}
		
			cylinder(r=2, h=height);
		
		}

	//SAME HOLES AS IN GEAR
	translate([1.5,-2.5,0]){
	color([0,0,1])
	cylinder(r=3.5/2, h=20, $fn=50, center=true);
	
	}
}


