include <variables.scad>;




module extrusionSleevePrimitive(){
	difference(){
		cube([outerExtrusionWidth, outerExtrusionDepth, outerExtrusionHeight], false);
		
		translate([wallThickness,wallThickness,wallThickness]){
			
		cube([extrusionWidth, extrusionDepth+cutOut, extrusionHeight], false);
			
		}
	}                                               
		
}

module extrusionSleevePair(){
	translate([0,outerExtrusionWidth,0]){
	extrusionSleevePrimitive();
	translate([outerExtrusionWidth,0,0]){
		rotate([0,0,-90]){
			extrusionSleevePrimitive();
		}
	}
	}
	
}




extrusionSleevePair();