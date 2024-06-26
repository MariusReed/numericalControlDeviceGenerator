include <variables.scad>;


module extrusionSleevePrimitive(){
	
	difference(){
		
		cube([outerExtrusionWidth, outerExtrusionDepth, outerExtrusionHeight], false);
		
		translate([wallThickness,wallThickness,wallThickness]){
			
			cube([extrusionWidth, extrusionDepth+cutOut, extrusionHeight], false);
			
		}
		
	}                                               
		
}

module extrusionBoltPrimitive(){
	
	cylinder(h=outerExtrusionWidth+cutOut,d=extrusionMountBoltDiameter);
	
}

module xGantryCarriagePrimitive(){
	
	translate([0,0,0]){
		
		difference(){
			
			cube([xCarriageWidth,xCarriageDepth,xCarriageHeight],false);
			
			translate([xCarriageWidth/2-outerExtrusionWidth/2,-cutOut/2,wallThickness]){
				
				cube([outerExtrusionWidth,xCarriageDepth+cutOut,extrusionHeight],false);
				
			}
			
		}
		
	}
	
}

