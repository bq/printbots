//FRONT FRAME
//JGH 27/12/2013

$fn=100;

frame_front();

//MODULES

module frame_front(){
	difference(){
		union(){
		
		// BASE
			hull(){
				translate([0,22.5,-1])
				cube([86 + 16*2 + 11*2, 55, 2], center=true);
	
				translate([79,49,-1])	//Rounded corners
				cylinder(r=4, h=2, center=true);

				translate([79,49-22+5.5,-1])	//Rounded corners
				cylinder(r=4, h=2, center=true);
	
				mirror(){
					translate([79,49,-1])
					cylinder(r=4, h=2, center=true);
				}

				mirror(){
					translate([79,49-22+5.5,-1])	//Rounded corners
					cylinder(r=4, h=2, center=true);
				}
			}
		
			translate([0, 15, 0]){	//move fenders back to make room for the claw
		
		// LEFT FENDER
			difference(){
				translate([43 + 16/2, 0, 5])
				rotate([0, 90, 0])
			
				union(){
					difference(){
						cylinder(r=38/2, h=16+10, center=true);	//front wheel fender
						translate ([38/2, 0,0])
						cube([38, 38, 50], center=true);
					}
					
					translate ([5/2, 0,0])
					cube([5, 38, 16+10], center=true);		//raise center of wheel
				}
	
				translate([30,-30,15]) //Top fender cut off
				cube([40, 60, 15]);
			}

			
		//RIGHT FENDER
			difference(){
				translate([-(43 + 16/2), 0, 5])
				rotate([0, 90, 0])
			
				union(){
					difference(){
						cylinder(r=38/2, h=16+10, center=true);	//front wheel fender
						translate ([38/2, 0,0])
						cube([38, 38, 50], center=true);
					}
					
					translate ([5/2, 0,0])
					cube([5, 38, 16+10], center=true);		//raise center of wheel
				}

				translate([-70,-30,15])	 //Top fender cut off
				cube([40, 60, 15]);
			}
			}// end del translate fenders back
		}
		
		// FENDER SUBTRACTIONS
		translate([0, 15, 0])
		union(){										
			translate([43 + 16/2, -3.5, 0])
			cube([17, 45, 50], center=true);	//hole for front wheel
			
			translate([-(43 + 16/2), -3.5, 0])
			cube([17, 45, 50], center=true);	//hole for front wheel
			
			translate([0, 0, 5])
			rotate([0, 90, 0])
			cylinder(r=3.75/2, h=200, center=true);	//hole both screws that hold the wheels
			
			translate([37, 0, 5])
			rotate([0, 90, 0])
			cylinder(r=6.6/2, h=10, center=true, $fn=6); //Nut Hole

			translate([-37, 0, 5])
			rotate([0, 90, 0])
			cylinder(r=6.6/2, h=10, center=true, $fn=6);	//Nut Hole

			translate([67, 0, 5])
			rotate([0, 90, 0])
			cylinder(r=3.1, h=10, center=true, $fn=100); //screw head indent

			translate([-67, 0, 5])
			rotate([0, 90, 0])
			cylinder(r=3.1, h=10, center=true, $fn=100);	//screw head indent

			//attachment hole subtraction
			translate([8.5,30,0])	//Holes for screws
			color([1,0,0])
			cylinder(r=3.6/2, h=30, center=true);
			
			translate([-8.5,30,0])
			color([1,0,0])
			cylinder(r=3.6/2, h=30, center=true);
			
		}

		sensor_octopus_holes();	//holes for Octopus sensor
		translate([-51.5,0,0])
		sensor_octopus_holes();

		//HOLES FOR SIDE SENSORS
		translate([91,14,0])
		rotate([0,0,90]){
		//	//Sensor OCTOPUS
		//	//SCREW HOLES
			translate([35,12,0])
			cylinder(r=3.5/2, h=10, center=true);

			translate([35-22+5.5,12,0])
			cylinder(r=3.5/2, h=10, center=true);
			
			//HOLE FOR COMPONENTS
			translate([24.5,19,0]) 
			cube([13,4,6], center=true);
		}

		mirror([]){
			translate([91,14,0])
			rotate([0,0,90]){
			//	//Sensor OCTOPUS
			//	//SCREW HOLES
				translate([35,12,0])
				cylinder(r=3.5/2, h=10, center=true);
				
				translate([35-22+5.5,12,0])
				cylinder(r=3.5/2, h=10, center=true);

				//HOLE FOR COMPONENTS
				translate([24.5,19,0]) 
				cube([13,4,6], center=true);
			}
		}

		translate([0,162.6,0])
		cylinder(r=130, h=5, $fn=6, center=true);

	}			
	
	//MINISERVO HOLDER
	color([1,0,0])
	translate([28/2, 11, -2])
	rotate([0, 0, 180])
	difference(){
		cube([28, 16, 17]);	//main box
		
		translate([2,2,2])
		cube([24.1, 12.1, 15]);	//hole for servo body
		
		translate([20,2,2])	//hole for servo connector
		cube([10, 12, 5]);
		
		translate([-2,6,15])	//holes for servo screw heads
		cube([30, 4, 2]);
	
	}
	
	// ENGANCHE A REAR
	translate([0,-2.5,0]){
		difference(){
			union(){
				//translate([-13.5, 37.5, -2])		//BASE
				//cube([10*2+7, 15, 2]);
		
				translate([3.8, 42.5, -2])		//ENGANCHES
				cube([9.7, 10, 15]);
				
				translate([-13.5, 42.5, -2])
				cube([9.7, 10, 15]);
				
				translate([-13.5, 42.5, -2])	//Base support enganches
				cube([19, 10, 5]);
			}
		
			translate([8.5,47.5,0])	//Holes for screws
			color([1,0,0])
			cylinder(r=3.6/2, h=30, center=true);
			
			translate([-8.5,47.5,0])
			color([1,0,0])
			cylinder(r=3.6/2, h=30, center=true);
		}
	}
}

module sensor_octopus_holes(){

	//SCREW HOLE
	translate([35,13,0])
	cylinder(r=3.8/2, h=10, center=true);
	
	//HOLE FOR COMPONENTS
	translate([24.5,10,0]) 
	cube([13,22,6], center=true);
}

////Sensor OCTOPUS
////SCREW HOLES
//translate([35,10,0]){	
//	cylinder(r=3.5/2, h=10, center=true);
//	translate([-9.5,-13.5, 0])
//	cylinder(r=3.5/2, h=10, center=true);
//}
//
////HOLE FOR COMPONENTS
//translate([24.5,10,0]) 
//cube([13,22,6], center=true);
//
////PCB SIZE
//translate([23.5,12,0])	
//color([1,1,10])
//cube([19,27,5], center=true);
