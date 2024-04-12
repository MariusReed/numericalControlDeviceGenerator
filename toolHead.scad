include <variables.scad>;
include <servo.scad>;

module tcRodCutOut(){
	
	translate([tcSmoothRodDiamiter/2+wallThickness,-tcSmoothRodDiamiter/2-wallThickness/2,-tcSmoothRodLenght/2-cutOut/2]){
				
		cylinder(h=tcSmoothRodLenght+cutOut,d=tcSmoothRodDiamiter);
				
	}	
			
	translate([toolCarridgePlateX-tcSmoothRodDiamiter/2-wallThickness,-tcSmoothRodDiamiter/2-wallThickness/2,-tcSmoothRodLenght/2-cutOut/2]){
					
		cylinder(h=tcSmoothRodLenght+cutOut,d=tcSmoothRodDiamiter);
				
	}
	
}

module linearRailBlockCutout(){
	
	cube([mgn12hLength+cutOut,mgn12hWidth+cutOut,mgn12hHeight]);
	
	for (i = [0, 1]) {
		
		for (j = [0, 1]) {
			
			translate([11 + i * mgn12hScrewSpacing, 3.5 + j * mgn12hScrewSpacing, mgn12hHeight]) {
				
				cylinder(h = toolCarridgePlateZ * 2 + cutOut, d = m3ScrewHole);
				
				translate([0,0,toolCarridgePlateZ-m3ScrewHeadHeight]){
				cylinder(h = m3ScrewHeadHeight + cutOut, d = m3ScrewHeadDiamiter);
				}
			}
			
		}
		
	}
	
}

module penToolSlideSideZ(){
	
		
		cube([wallThickness,tcPenSliderY,tcSmoothRodLenght]);
		
		
	
}

module penToolSlideSideX(){
	difference(){
		cube([tcPenSliderX,tcPenSliderY,wallThickness]);
	
		translate([tcSmoothRodDiamiter+wallThickness,tcPenSliderY+cutOut/2,wallThickness/2]){
			
			rotate([90,0,0]){	
				
				cylinder(h=wallThickness/2+cutOut,d=m2ScrewHole);
				
			}
			
		}
	
		translate([tcPenSliderX-tcSmoothRodDiamiter-wallThickness,tcPenSliderY+cutOut/2,wallThickness/2]){
			
			rotate([90,0,0]){	
				
				cylinder(h=wallThickness/2+cutOut,d=m2ScrewHole);
				
			}
			
		}
	}	
}

module toolHeadCarridgeBase(){
	
	difference(){
	
		union(){
			cube([toolCarridgePlateX,toolCarridgePlateY,toolCarridgePlateZ]);
	
			translate([0,-tcSmoothRodDiamiter-wallThickness,toolCarridgePlateZ]){
			
				cube([toolCarridgePlateX,toolCarridgePlateY+tcSmoothRodDiamiter+wallThickness,toolCarridgePlateZ]);
				
			}
		}
		
		translate([toolCarridgePlateX/2-mgn12hLength/2,toolCarridgePlateY/2-mgn12hWidth/2,-mgn12hHeight+wallThickness]){
			
			linearRailBlockCutout();
			
		}
		
		translate([toolCarridgePlateX/2-(servoFeetX*2+servoShelfX)/2,(servoShelfY-servoFeetY)/2,toolCarridgePlateZ]){

			servoShelfMountingHoles();

		}
	}
}

module penToolPlateInterface(){

	
	cube([tcSmoothRodDiamiter+wallThickness,tcPenSliderY,wallThickness]);

}

module penToolHolderCutOut(){
	
	translate([0,-penToolHolderMaxInnerDiameter/2+cutOut,penToolHolderHeight/2]){
		
		rotate([90,0,0]){
			
			cylinder(h=wallThickness*2+cutOut*2,d=m4ScrewHole);
		
		}
		
	}
	
	hull(){	
		
		difference(){
		
			translate([0,0,-cutOut/2]){
			
				cylinder(h=penToolHolderHeight+cutOut,d=penToolHolderMaxInnerDiameter);
			
			}
			
			translate([-penToolHolderMaxInnerDiameter/2,0,-cutOut]){
						
				cube([penToolHolderMaxInnerDiameter,penToolHolderMaxInnerDiameter/2,penToolHolderHeight+cutOut*2]);
			
			}
						
		}
	
		translate([0,penToolHolderMaxInnerDiameter/2,0]){
			
			cylinder(h=penToolHolderHeight+cutOut,d=penToolHolderMinInnerDiameter);
			
		}
		
	}
	
}

module penToolHolder(){
	
	translate([toolCarridgePlateX/2,-penToolHolderOuterDiameter/2-tcPenSliderY-toolPlateThickness-cutOut,-penToolHolderHeight/2]){
		
		difference(){	
			union(){
			cylinder(h=penToolHolderHeight,d=penToolHolderOuterDiameter);
				
				translate([-penToolHolderOuterDiameter/2,0,0]){
					
					cube([penToolHolderOuterDiameter,penToolHolderOuterDiameter/2,penToolHolderHeight]);	
					
				}
				
			}
			penToolHolderCutOut();	
			
		}
			
	}	
	
}

module penToolPalteServoLip(){
 cube ([servoLipX,servoLipY,servoLipZ]);
}
module penToolPlate(){
	
	difference(){
		
		union(){
			
				translate([(toolCarridgePlateX-servoLipX-cutOut)/2,-servoLipY-cutOut,tcSmoothRodLenght/2-servoLipZ]){
					penToolPalteServoLip();
				}
			translate([-wallThickness,-tcPenSliderY-wallThickness/2-cutOut,-penToolHolderHeight/2]){
		
				cube([toolCarridgePlateX+wallThickness*2,toolPlateThickness,tcSmoothRodLenght/2+penToolHolderHeight/2]);
				
				
				translate([wallThickness/2+tcSmoothRodDiamiter/2,wallThickness/2,0]){
			
					penToolPlateInterface();
			
				}
		
				translate([wallThickness/2+tcSmoothRodDiamiter/2,wallThickness/2,tcSmoothRodLenght/2-wallThickness-cutOut]){
			
					penToolPlateInterface();
			
				}
		
				translate([toolCarridgePlateX-wallThickness/2-tcSmoothRodDiamiter,wallThickness/2,0]){
			
					penToolPlateInterface();
			
				}
		
				translate([toolCarridgePlateX-wallThickness/2-tcSmoothRodDiamiter,wallThickness/2,tcSmoothRodLenght/2-wallThickness-cutOut]){
			
					penToolPlateInterface();
			
				}
		
			}
	
		}
		union(){
			
			tcRodCutOut();
		
		}
	
	}
	
}


module toolHeadCarridge(){
	difference(){
		union(){
		
			toolHeadCarridgeBase();
			
			translate([-wallThickness,-tcSmoothRodDiamiter-wallThickness,-tcPenSliderZ/2]){
				
				penToolSlideSideX();
				
			}
			
			translate([-wallThickness,-tcSmoothRodDiamiter-wallThickness,tcPenSliderZ/2-wallThickness]){
				difference(){
					
					penToolSlideSideX();
					
					translate([tcPenSliderX/2-tcPensliderTopCutoutX/2,-cutOut/2,-cutOut/2]){
					
						cube([tcPensliderTopCutoutX,tcPensliderTopCutoutY,tcPensliderTopCutoutZ]);	
					
					}
					
				}
				
			}
			
			translate([tcSmoothRodDiamiter+wallThickness*2-cutOut,-tcPenSliderY,wallThickness*2]){
				cube([wallThickness,tcPenSliderY,tcSmoothRodLenght/2-wallThickness*2]);
			}
			
			translate([toolCarridgePlateX-tcSmoothRodDiamiter-wallThickness*3+cutOut,-tcPenSliderY,wallThickness*2]){
				cube([wallThickness,tcPenSliderY,tcSmoothRodLenght/2-wallThickness*2]);
			
			}
				
			translate([-wallThickness,-tcSmoothRodDiamiter-wallThickness,-tcPenSliderZ/2]){
				
				penToolSlideSideZ();
					
			}
			
			translate([toolCarridgePlateX,-tcSmoothRodDiamiter-wallThickness,-tcPenSliderZ/2]){
				
				penToolSlideSideZ();
				
			}
				
		}
		
		union(){
			
			tcRodCutOut();
				
		}

	}
	
}
	


toolHeadCarridge();
penToolPlate();
penToolHolder();

translate([(toolCarridgePlateX-servoShelfX)/2,0,toolCarridgePlateZ*2]){
servoShelf();	
}






















