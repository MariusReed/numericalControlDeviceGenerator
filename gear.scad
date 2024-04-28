include <variables.scad>;
include <functions.scad>;

module gt2IdlerGear(){
	difference(){
	
		union(){
		
			cylinder(h=gt2IdlerGearHeight,d=gt2IdlerGearDiameter);
			cylinder(h=gt2IdlerGearRimHeight,d1=gt2IdlerGearRimDiameter,d2=gt2IdlerGearDiameter);
			translate([0,0,gt2IdlerGearHeight-gt2IdlerGearWallThickness]){
				cylinder(h=gt2IdlerGearRimHeight,d2=gt2IdlerGearRimDiameter,d1=gt2IdlerGearDiameter);
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

//gt2IdlerGear();

//gt2_2mmToothedPulley

// Based on Parametric Pulley with multiple belt profiles
// by droftarts January 2012
// optimized for Thingiverse customizer February 2017

// Based on pulleys by:
// http://www.thingiverse.com/thing:11256 by me!
// https://github.com/prusajr/PrusaMendel by Josef Prusa
// http://www.thingiverse.com/thing:3104 by GilesBathgate
// http://www.thingiverse.com/thing:2079 by nophead

// dxf tooth data from http://oem.cadregister.com/asp/PPOW_Entry.asp?company=915217&elementID=07807803/METRIC/URETH/WV0025/F

gt2_2mmToothProfile = [
    [0.747183,-0.5],
    [0.747183,0],
    [0.647876,0.037218],
    [0.598311,0.130528],
    [0.578556,0.238423],
    [0.547158,0.343077],
    [0.504649,0.443762],
    [0.451556,0.53975],
    [0.358229,0.636924],
    [0.2484,0.707276],
    [0.127259,0.750044],
    [0,0.76447],
    [-0.127259,0.750044],
    [-0.2484,0.707276],
    [-0.358229,0.636924],
    [-0.451556,0.53975],
    [-0.504797,0.443762],
    [-0.547291,0.343077],
    [-0.578605,0.238423],
    [-0.598311,0.130528],
    [-0.648009,0.037218],
    [-0.747183,0],
    [-0.747183,-0.5]
];


// Define function to rotate and extrude the tooth profile
module gt2_2mmTooth() {
	translate([0,0,-cutOut/2]){
		linear_extrude(height=gt2BeltWidth + cutOut*2)
		
			rotate([0,0,90]){
			
				polygon(gt2_2mmToothProfile);
			}
	}
}

// Create the gear by rotating the tooth profile around the cylinder
module gt2ToothedIdlerGear(){
	difference(){
		union(){
			difference() {
				cylinder(h=gt2BeltWidth+cutOut, r=GT2_2mmPulleyDiameter/2); 
				for(i = [0:gt2IdlerToothCount-1]) {
					rotate([0, 0, i * toothAngle])
						translate([GT2_2mmPulleyDiameter/2, 0, 0]) // Adjust the distance from the center
                gt2_2mmTooth();
				}
			}
			
			translate([0,0,-gt2IdlerGearRimHeight]){
				cylinder(h=gt2IdlerGearRimHeight,d1=GT2_2mmPulleyDiameter+gt2IdlerGearRimOverHang,d2=GT2_2mmPulleyDiameter);
				
			}
			
			translate([0,0,gt2BeltWidth+cutOut]){
				cylinder(h=gt2IdlerGearRimHeight,d2=GT2_2mmPulleyDiameter+gt2IdlerGearRimOverHang,d1=GT2_2mmPulleyDiameter);
				
			}
		}
		//cut out for bearing
		translate([0,0,gt2IdlerGearRimHeight-cutOut]){
			cylinder(h=zz608BearingHeight+cutOut,d=zz608BearingOD+cutOut);
		}
		translate([0,0,-gt2IdlerGearRimHeight-cutOut/2]){
			cylinder(h=gt2IdlerGearRimHeight+gt2BeltWidth,d=zz608BearingID+cutOut);
		
		}
	}
	
}

gt2ToothedIdlerGear();