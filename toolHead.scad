include <variables.scad>;
/*
module tcThreadedRodLoop(){
	
	for (right = [-1,1]){
		
		for (left = [-1,1]){
			
		translate([right*(toolCarridgePlateX/2-tcThreadedRodOffset),left*(toolCarridgePlateY/2-tcThreadedRodOffset),(-toolCarridgePlateZ-cutOut)/2])
			
			cylinder(h=toolCarridgePlateZ+cutOut,d=tcThreadedRodDiamiter);
			
		}
	
	}
	
}

module tcSmoothRodPlatform(){
	
	difference(){
	
		translate([0,-toolCarridgePlateY/2-tcSmoothRodPlatformY/2,0]){
			cube([tcSmoothRodPlatformX,tcSmoothRodPlatformY,tcSmoothRodPlatformZ],true);
		}
	
		for (front = [-1,1]){
			
			translate([front*(tcSmoothRodOffset+wallThickness),-toolCarridgePlateY/2-tcSmoothRodPlatformY/2,(-toolCarridgePlateZ-cutOut)/2]){
			
				cylinder(h=toolCarridgePlateZ+cutOut,d=tcSmoothRodDiamiter);
			}
		
		}
	
	}
	
}

module tcLeadScrewHole(){
	
	translate([0,-toolCarridgePlateY/2+tcSmoothRodOffset,(-toolCarridgePlateZ-cutOut)/2]){
			
		cylinder(h=toolCarridgePlateZ+cutOut,d=tcLeadScrewDiamiter);
		
	}
	
}
	


module toolCarridgePlatePrimitive(){
	
	difference(){
		
		cube([toolCarridgePlateX,toolCarridgePlateY,toolCarridgePlateZ],true);
	
		tcThreadedRodLoop();
		
		tcLeadScrewHole();
		
	}
	
	tcSmoothRodPlatform();
	
}

module tcLeadScrewBearingHousing(){
	
	difference(){
		
		cube([tcLeadScrewBearingHousingX,tcLeadScrewBearingHousingY,tcLeadScrewBearingHousingZ],true);
		
		translate([0,0,-(tcLeadScrewBearingHousingZ+cutOut)/2]){
			
			cylinder(h=tcLeadScrewBearingHousingZ+cutOut,d=zz608BearingOD);
			
		}
		
	}
	
}	

module toolHeadSlideHalf(){
	difference(){
		union(){
			hull(){
				for (front = [-1,1]){
			
					translate([front*(tcSmoothRodOffset+wallThickness),-toolCarridgePlateY/2-tcSmoothRodPlatformY/2,0]){
			
						cylinder(h=toolHeadSlideHight, d=lm8luuOD+wallThickness);

					}
		
				}
			
				cylinder(h=toolHeadSlideHight, d=tcLeadScrewDiamiter+wallThickness);
		
			}
			translate([0,0,toolHeadSlideHight/2]){
				
				cube([tcLeadScrewNutWidth,tcLeadScrewNutWidth,toolHeadSlideHight],true);
			}
		}
		
		for (front = [-1,1]){
			
			translate([front*(tcSmoothRodOffset+wallThickness),-toolCarridgePlateY/2-tcSmoothRodPlatformY/2,0]){
			
				cylinder(h=lm8luuHeight/2, d=lm8luuOD);
						
				translate([0,0,toolHeadSlideHight-wallThickness/2]){
							
					cylinder(h=wallThickness/2+cutOut, d=tcSmoothRodDiamiter);
							
				}
				
			}
	
		}
		
		translate([0,0,-cutOut/2]){
			cylinder(h=toolHeadSlideHight+cutOut, d=tcLeadScrewDiamiter);
		}
		
	}
	
}


toolHeadSlideHalf();
//mirror([0,0,1])toolHeadSlideHalf();

module toolCarridgePlateBottom(){
	
	
		translate([0,(-toolCarridgePlateY+tcLeadScrewBearingHousingY)/2,-toolCarridgePlateZ+tcLeadScrewBearingHousingZ/2]){
			
			tcLeadScrewBearingHousing();
			
		}
		
		translate([0,0,toolCarridgePlateZ/2]){
		
			toolCarridgePlatePrimitive();
		
		}
		
	
	
}

module toolCarridgePlateTop(){
	
	
	
	translate([0,0,tcHeight-toolCarridgePlateZ/2]){
		
		toolCarridgePlatePrimitive();

		translate([0,(-toolCarridgePlateY+tcLeadScrewBearingHousingY)/2,toolCarridgePlateZ/2+tcLeadScrewBearingHousingZ/2]){
			
			tcLeadScrewBearingHousing();
			
		}
	}
	
}

module toolCarridge(){
	
	toolCarridgePlateTop();
	
	toolCarridgePlateBottom();
	
}
//tcSmoothRodLenght
//tcSmoothRodDiamiter
//toolCarridge();
*/
module penToolSlideSideZ(){
	
	cube([wallThickness,tcPenSliderY,tcSmoothRodLenght]);
	
}

module penToolSlideSideX(){
	
	cube([tcPenSliderX,tcPenSliderY,wallThickness]);

}

module toolHeadCarridgeBase(){

	cube([toolCarridgePlateX,toolCarridgePlateY,toolCarridgePlateZ]);
	
	translate([0,-tcSmoothRodDiamiter-wallThickness,toolCarridgePlateZ]){
			
		cube([toolCarridgePlateX,toolCarridgePlateY+tcSmoothRodDiamiter+wallThickness,toolCarridgePlateZ]);
			
	}

}

module toolHeadCarridge(){
	//difference(){
		union(){
		
			toolHeadCarridgeBase();
			
			translate([-wallThickness,-tcSmoothRodDiamiter-wallThickness,-tcPenSliderZ/2]){
				
				penToolSlideSideX();
				
			}
			
			translate([-wallThickness,-tcSmoothRodDiamiter-wallThickness,tcPenSliderZ/2-wallThickness]){
				
				penToolSlideSideX();
				
			}
			
			translate([-wallThickness,-tcSmoothRodDiamiter-wallThickness,-tcPenSliderZ/2]){
				
				penToolSlideSideZ();
					
			}
			
			translate([toolCarridgePlateX,-tcSmoothRodDiamiter-wallThickness,-tcPenSliderZ/2]){
				
				penToolSlideSideZ();
				
			}
				
		}
		
		union(){
			
			translate([tcSmoothRodDiamiter/2+wallThickness,-tcSmoothRodDiamiter,-tcSmoothRodLenght/2]){
				
				cylinder(h=tcSmoothRodLenght+cutOut,d=tcSmoothRodDiamiter);
				
			}	
			
			translate([toolCarridgePlateX-tcSmoothRodDiamiter/2-wallThickness,-tcSmoothRodDiamiter,-tcSmoothRodLenght/2]){
					
				cylinder(h=tcSmoothRodLenght+cutOut,d=tcSmoothRodDiamiter);
			}

		}
		
	//}
	
}

toolHeadCarridge();



























