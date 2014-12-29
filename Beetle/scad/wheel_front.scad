//FRONT WHEEL
//Parametric
//reusing code from UniTrack bot
//JGH 16/12/2013


wheel_front();

module wheel_front(){
//rotate([0,-90,0])
Wheel(35/2, 2, 15, 2, 3);
}

module Wheel (radius, ir, thickness, rubberNumber, clearance){

	//Assuming ruber band thickness is constant (r=2 mm)
	//the indentation on the wheel is half of the rubber thickness
	
	setDistanceOne=thickness/2;		//Distancia del borde de la rueda a la que se debe colocar la goma (cuando solo hay una)
	setDistancePlus=clearance+1.5;	//Distancia del borde de la rueda a la que se debe colocar la primera goma (en caso de que haya más de una)
	rubberDistance=(thickness-2*(clearance+1.5))/(rubberNumber-1);	//Si hay más de una goma, esta equación da la separación necesaria entre las gomas

		if (rubberNumber==1){	//Genera ruedas con una única goma
		
			difference(){
		
				rotate (a=90, v=[0,1,0]){
				cylinder (r=radius, h=thickness, $fn=100);	//fn=100
				}
			
				translate([setDistanceOne,0,0])
				rotate (a=90, v=[0,1,0])
				rotate_extrude($fn=50)	//fn=50
				translate ([radius,0,0])
				circle (r=1.5);

				//axle hole
				translate([-1,0,0])
				rotate([0,90,0])
				cylinder (r=ir, h=thickness+2, $fn=100);
			}
		}
		
		else {	//Genera ruedas con más de una goma
		
			difference(){
		
				rotate (a=90, v=[0,1,0]){
				cylinder (r=radius, h=thickness, $fn=100);	//fn=100
				}
				
				translate([setDistancePlus,0,0])
				for (i=[0:rubberNumber-1])
				translate ([rubberDistance*i, 0, 0])
				
				rotate (a=90, v=[0,1,0])
				rotate_extrude($fn=50)	//fn=50
				translate ([radius,0,0])
				circle (r=1.5);

				//axle hole
				translate([-1,0,0])
				rotate([0,90,0])
				cylinder (r=ir, h=thickness+2, $fn=100);
		
			}
		}

}