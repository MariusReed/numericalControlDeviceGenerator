include <variables.scad>;

module endStopCutout(){
	
	rotate([0,90,0]){
		
		cylinder(h=endStopMountingHoleDepth,d=m2ScrewHole);
	
		translate([endStopMountingHoleSpacing,0,0]){
		
			cylinder(h=endStopMountingHoleDepth,d=m2ScrewHole);
	
		}
		
	}
	
}


