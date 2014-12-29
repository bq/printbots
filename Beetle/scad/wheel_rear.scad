//REAR WHEEL
//Parametric
//JGH 9/12/2013

//VARIABLES

od=60;				//Diametro externo
thickness=15;	//Grosor
n_tires=2;		//number of O-rings
clearance=3;		//Distance from edge to first O-ring

res=50;		//resolución polígonos

//Servo Horn Parameters
sh_th=2.3;			//Grosor
sh_d=45;				//Diametro
sh_nub_height1=4;	//Nub (enganche)
sh_nub_d1=12.5;
sh_nub_height2=10;
sh_nub_d2=9;


//CODE
wheel_rear();


//servo_horn(sh_th, sh_d, sh_nub_height1, sh_nub_height2, sh_nub_d1, sh_nub_d2, res);

//MODULES

module wheel_rear(){

	translate([0,0,thickness])		//orient the part for printing
	rotate([0,90,0])
	
	difference(){
		Wheel(od/2,thickness,n_tires,clearance);
		rotate([0,90,0])
		translate([0,0,-0.1])
		cylinder(r1=28, r2=25, h=thickness-3.6, $f=res);
	
		translate([9,0,0])
		rotate([0,90,0])
		color([0,0,1])
		servo_horn(sh_th, sh_d, sh_nub_height1, sh_nub_height2, sh_nub_d1, sh_nub_d2, res);

		//Indent for servo screw head
		for (i=[1:2]){
			rotate([360/2*i,0,0])
			translate([12.5, 0, 38.2/2])
			rotate([0,90,0])
			cylinder(r=4.5, h=20, center=false, $fn=res);
		}
	}

	//Indent for servo screw head
	for (i=[1:2]){
		rotate([0,0,360/2*i])
		//translate([12.5, 0, 38.2/2])
		translate([38.2/2, 0, 2.5])
		//rotate([0,90,0])
		cylinder(r=4.5, h=0.2, center=false, $fn=res);//HEIGHT OF MEMBRANE LAYER
	}
}

//SERVO HORN
module servo_horn(sh_th, sh_d, sh_nub_height1, sh_nub_height2, sh_nub_d1, sh_nub_d2, res){
	
		union(){
		
			cylinder(r=sh_d/2, h=sh_th, $fn=res);
			cylinder(r=sh_nub_d1/2, h=sh_nub_height1, $fn=res);
			cylinder(r=sh_nub_d2/2, h=sh_nub_height2, $fn=res);
		
		}
	
		//Holes to attach servo horn
		for (i=[1:8]){
			rotate([0,0,360/8*i])
			translate([38.2/2, 0, 0])
			cylinder(r=1.2, h=20, center=true, $fn=res);
		}

}


//WHEEL
module Wheel (radius, thickness, rubberNumber, clearance){

	//Assuming ruber band thickness is constant (r=2 mm)
	//the indentation on the wheel is half of the rubber thickness
	
	setDistanceOne=thickness/2;		//Distancia del borde de la rueda a la que se debe colocar la goma (cuando solo hay una)
	setDistancePlus=clearance+1.5;	//Distancia del borde de la rueda a la que se debe colocar la primera goma (en caso de uqe haya más de una)
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
	
	}
	}
}

