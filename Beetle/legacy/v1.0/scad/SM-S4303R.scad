//SERVO MODEL SM-S4303R
//continous rotation
//JGH 9/12/2013

//VARIABLES
Subtract_holes=false;	//true model or substraction model
res=100;					//Resolution of cylinders


//CODE
servo(Subtract_holes, res);




//MODULES

module servo (Subtract_holes, res){

	if (Subtract_holes==true){
		union(){
			difference(){	
			body(res);
			holes(res);
			
			}
		
			//Ear tabs
			translate([-5,32.5, 9.5])
			cube([5, 1.5, 2]);
			
			translate([42,32.5, 9.5])
			cube([5, 1.5, 2]);
		}
	
	}
	
	if (Subtract_holes==false){
		union(){	
		body(res);
		holes(res);
		
		//Ear tabs
		translate([-5,32.5, 9.5])
		cube([5, 1.5, 11.5]);
		
		translate([42,32.5, 9.5])
		cube([5, 1.5, 11.5]);
		
		}
	}

}


module body(res){
difference(){
union(){

	cube([42,40,21]);				//Body
	
	translate([-8,29,0])			//Ears
	cube([42+16, 3.5, 21]);
	
	translate([31,40,21/2]){		//Nub
	rotate([-90,0,0]){
	cylinder(r1=13/2, r2=11.5/2, h=2, $fn=res);
	cylinder(r=3, h=6, $fn=res);
	translate([-20,-1.5,0])
	cube([15,3,1]);
	}
	}

	translate([42,4,21/2-4])		//wire attachment
	cube([15,6,8]);

}

//Ángulo
//translate([0,33,-2])
//rotate([0,0,40])
//cube([25,25,30]);

}
}


module holes(res){
//Agujeros
union(){
translate([-4.5,30,5.5])
rotate([90,0,0])
cylinder(r=3.5/2, h=20, center=true, $fn=res);

translate([-4.5,30,15.5])
rotate([90,0,0])
cylinder(r=3.5/2, h=20, center=true, $fn=res);

translate([46.5,30,5.5])
rotate([90,0,0])
cylinder(r=3.5/2, h=20, center=true, $fn=res);

translate([46.5,30,15.5])
rotate([90,0,0])
cylinder(r=3.5/2, h=20, center=true, $fn=res);

}
}