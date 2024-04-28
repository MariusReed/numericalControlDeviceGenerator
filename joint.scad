include <variables.scad>;
include <functions.scad>;
include <primitives.scad>;
include <endStop.scad>;
include <tensionerHousing.scad>;

module extrusionBoltHoles(hasEndStop){
	if (hasEndStop==true){
		
			for(boltPlacementZ  = [wallThickness+extrusionSlotOffset+extrusionSlotWidth/2: extrusionSlotMid+extrusionSlotWidth : extrusionHeight]){
			//this exception for the endStop could be better, I just dont know how yet.	something like a "check distance to back of endstop + screw head diameter.									
			for(boltPlacementY = [wallThickness+extrusionDepth/4: extrusionDepth/3 : extrusionDepth]){
					
				
				translate([-cutOut/2,boltPlacementY,boltPlacementZ]){  
				
					rotate([0,90,0]){
						
						
						extrusionBoltPrimitive();
						
					}
					
				}
						
			}
			
		}
		
	}
	else{
		
		for(boltPlacementZ  = [wallThickness+extrusionSlotOffset+extrusionSlotWidth/2: extrusionSlotMid+extrusionSlotWidth : extrusionHeight]){
													
			for(boltPlacementY = [wallThickness+extrusionDepth/4: extrusionDepth/2 : extrusionDepth]){
					
				
				translate([-cutOut/2,boltPlacementY,boltPlacementZ]){  
				
					rotate([0,90,0]){
						
						
						extrusionBoltPrimitive();
						
					}
					
				}
						
			}
			
		}
		
	}
	
}

module extrusionSleevePair(hasEndStop){
	
	translate([0,outerExtrusionWidth,0]){
			
			difference(){
				
				extrusionSleevePrimitive();
			
				
				
				if (hasEndStop==true){
					
					extrusionBoltHoles(true);
					
					translate([-cutOut/2,outerExtrusionDepth-endStopMountingHoleFrontOffset,outerExtrusionHeight-endStopMountingHoleSideOffset]){
					
						endStopCutout();
					}
				}
				
				else{
					
				extrusionBoltHoles();
					
				}
				
			}
			
		translate([outerExtrusionWidth,0,0]){
		
			rotate([0,0,-90]){
				
				difference(){
					
					extrusionSleevePrimitive();
			
					extrusionBoltHoles();
					
				}
				
			}
			
		}
		
	}
	
}

module jointInnerSupportPrimitive(){
	
	difference(){
                
		union(){
                    
			translate([0,0,0]){   
                        
				cube([outerExtrusionDepth,outerExtrusionDepth,frontSupportThickness],false);
                        
			}
                        
			translate([0,0,outerExtrusionHeight-frontSupportThickness]){
                        
				cube([outerExtrusionDepth,outerExtrusionDepth,frontSupportThickness],false);
					
			}
                        
		}
            
		rotate([0,0,45]){
                    
			translate([0,0,-cutOut/2]){
                        
				cube([innerSupportDifference,innerSupportDifference,outerExtrusionHeight+cutOut],false);
                        
			}
                    
		} 
                
	}
	
	translate([outerExtrusionDepth,0,0]){
        
		rotate([0,0,90]){
			
			difference(){
                
				cube([wallThickness,wallThickness,outerExtrusionHeight],false);
                
				translate([wallThickness,wallThickness,outerExtrusionHeight/2]){
                    
					rotate([0,0,45]){
							
						cube([sqrt(2)*wallThickness,sqrt(2)*wallThickness,outerExtrusionHeight+cutOut],true);
						
					}
				
				}
				
			}
			
		}
		
	}
	
}

module jointInnerSupport(){
	
	translate([outerExtrusionWidth,outerExtrusionWidth+outerExtrusionDepth,0]){
		
		rotate([0,0,-90]){
		
			jointInnerSupportPrimitive();
			
		}
		
	}
	
}

module jointOuterSupportPrimitive(hasStepperMotorCutout,backRight){
	
	if (hasStepperMotorCutout==true){
		
		translate([outerExtrusionWidth/2,outerExtrusionWidth/2,(outerExtrusionHeight-stepperMotorMountThickness-stepperMotorHight-cutOut)/2]){
			
            difference(){
                
                cube([outerExtrusionWidth, outerExtrusionWidth, outerExtrusionHeight-stepperMotorMountThickness-stepperMotorHight-cutOut], true);

                rotate([0,0,-135]){

                    translate([outerSupportDifference/2, 0, 0]){

                        cube([outerSupportDifference, outerSupportDifference, outerExtrusionHeight+cutOut], true);

                    }

				}

			} 

		}
		
	}
	
	else{
		
		difference(){
            
			translate([outerExtrusionWidth/2,outerExtrusionWidth/2,outerExtrusionHeight/2]){
				
                cube([outerExtrusionWidth, outerExtrusionWidth, outerExtrusionHeight], true);
				
			}
			if (backRight == true){
			
				translate([outerExtrusionWidth/2-tsWidth/2,-cutOut/2,outerExtrusionHeight-tsHight]){
					tensionerSlideCutOut();
				
				}
			}
			else {
				rotate([0,0,90]){
					translate([outerExtrusionWidth/2-tsWidth/2,-tsLength+cutOut/2,outerExtrusionHeight-tsHight]){
						tensionerSlideCutOut();
					}	
				}
			}
		}	
		
	}
	
}

module stepperMountPrimitive(){
	
	difference(){
                
		cube([stepperMotorWidth,stepperMotorWidth,stepperMotorMountThickness],false);
            
		translate([-stepperMotorWidth/3,-stepperMotorWidth/3,-cutOut/2]){
                    
			cube([stepperMotorWidth,stepperMotorWidth,stepperMotorMountThickness+cutOut]);
			
		}
            
		translate([stepperMotorWidth/2,stepperMotorWidth/2,-cutOut/2]){
                    
            cylinder(stepperMotorMountThickness+cutOut,d=stepperMotorShaftDiameter,false);
		
		}
            
		translate([stepperMotorWidth-stepperThreadExternalOffset,stepperMotorWidth-stepperThreadExternalOffset-stepperThreadInternalOffset,-cutOut/2]){
                    
            cylinder(stepperMotorMountThickness+cutOut,d=stepperMotorScrewDiameter,false );
			
		}
                    
        translate([stepperMotorWidth-stepperThreadExternalOffset,stepperMotorWidth-stepperThreadExternalOffset,-cutOut/2]){
			
            cylinder(stepperMotorMountThickness+cutOut,d=stepperMotorScrewDiameter,false);
			
		}
                    
        translate([stepperMotorWidth-stepperThreadInternalOffset-stepperThreadExternalOffset,stepperMotorWidth-stepperThreadExternalOffset,-cutOut/2]){
                    
            cylinder(stepperMotorMountThickness+cutOut,d=stepperMotorScrewDiameter,false);
		}
                    
	}
	
}

module stepperMount(){
	
	translate([-stepperMotorWidth+outerExtrusionWidth,-stepperMotorWidth+outerExtrusionWidth,outerExtrusionHeight-stepperMotorMountThickness]){
		
		stepperMountPrimitive();
		
	}	
	
}


extrusionSleevePair(false);
jointInnerSupport();
//stepperMount();
//syntax jointOuterSupportPrimitive(hasStepperMotorCutout,backRight)
jointOuterSupportPrimitive(false,false);