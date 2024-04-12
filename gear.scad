include <variables.scad>

module gt2IdlerGear(){
	difference(){
	
		union(){
		
			cylinder(h=gt2IdlerGearHeight,d=gt2IdlerGearDiameter);
	
			for (i=[0:1]) {
				translate([0,0,i*(gt2IdlerGearHeight-gt2IdlerGearWallThickness)]){
					cylinder(h=gt2IdlerGearRimHeight,d=gt2IdlerGearRimDiameter);
				}
			}
		}
		union(){
			translate([0,0,gt2IdlerGearHeight-zz608BearingHeight-cutOut/2]){
				
				cylinder(h=zz608BearingHeight+cutOut,d=zz608BearingOD+cutOut);
				
			}
			
			translate([0,0,-cutOut/2]){
				
				cylinder(h=gt2IdlerGearHeight-zz608BearingHeight+cutOut,d=zz608BearingID+cutOut);
				
			}
		}
	}
}

gt2IdlerGear();