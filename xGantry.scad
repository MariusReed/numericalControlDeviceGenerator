include <variables.scad>;
include <joint.scad>;
include <primitives.scad>;





module xGantrySleeve(){
	
	translate([xCarriageWidth/2+outerExtrusionDepth/2,xCarriageDepth/2+outerExtrusionHeight/2,xCarriageHeight]){
		
		rotate([0,90,-90]){
			
			extrusionSleevePrimitive();
			
		}
		
	}	
	
	translate([xGantryLength-xCarriageWidth,xCarriageDepth/2-outerExtrusionHeight/2,xCarriageHeight]){
		
		rotate([0,90,90]){
			
			extrusionSleevePrimitive();
			
		}
		
	}	
	
}


module xGantryCarriage(position){
	
	if (position=="left"){
		
		xGantryCarriagePrimitive();
		
	}
	
	else if (position=="right"){
		
		translate ([xGantryLength-xCarriageWidth,0,0]){
			
		xGantryCarriagePrimitive();
			
		}
		
	}
	
	else{
	
		echo("please define xGantryCarriage(position) either left or right");
	
		}
		
}



xGantrySleeve();
xGantryCarriage("left");
xGantryCarriage("right");