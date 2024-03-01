include <variables.scad>;
include <joint.scad>;




module gantrySleeve(){
	
	translate([0,outerExtrusionWidth,xCarriageHeight]){
		rotate([0,0,-90]){
		extrusionSleevePrimitive();
		}
	}	
	
	translate([axisLengthX+wallThickness*2,0,xCarriageHeight]){
		rotate([0,0,90]){
		extrusionSleevePrimitive();
		}
		
	}	
	
}



module xGantryCarriagePrimitive(){
	translate([0,-xCarriageDepth/4,0]){
	cube([xCarriageWidth,xCarriageDepth,xCarriageHeight],false);
	}
}

module xGantryCarriage(position){
	
	if (position=="left"){
		
		xGantryCarriagePrimitive();
		
	}
	
	else if (position =="right"){
		translate ([axisLengthX+wallThickness*2-outerExtrusionDepth,0,0]){
		xGantryCarriagePrimitive();
		}
	}
	else{
	
		echo("please define xGantryCarriage(position) either left or right");
	
		}
}

function supportMatix =
gantrySleeve();
xGantryCarriage("left");
xGantryCarriage("right");