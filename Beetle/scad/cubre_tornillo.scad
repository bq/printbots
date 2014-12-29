//SCREW COVER
//for pionty screw in servo wheel
//JGH 4/1/2013

difference(){
	union(){
		cylinder(r2=3.5, r1=4.5, h=10, $fn=100);
		translate([0,0,12])
		sphere(r=4.5, $fn=100);
	}
	
	cylinder(r=1.2, h=22, $fn=100, center=true);

}
