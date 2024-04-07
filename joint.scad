include <variables.scad>;
include <primitives.scad>;

//this needs to be re worked
module extrusionBoltHoles(){

	for(boltPlacementZ  = [wallThickness+extrusionSlotOffset+extrusionSlotWidth/2: extrusionSlotMid+extrusionSlotWidth/2 : extrusionHeight]){
													
		for(boltPlacementY = [wallThickness+extrusionDepth/4: extrusionDepth/2 : extrusionDepth]){
					
				
			translate([-cutOut/2,boltPlacementY,boltPlacementZ]){  
				
				rotate([0,90,0]){
						
						
					extrusionBoltPrimitive();
						
            
				}
						
			}
			
		}
		
	}
	
}



module extrusionSleevePair(){
	
	translate([0,outerExtrusionWidth,0]){
			
			difference(){
				
				extrusionSleevePrimitive();
			
				extrusionBoltHoles();
				
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

module jointOuterSupportPrimitive(hasStepperMotorCutout){
	
	if (hasStepperMotorCutout==true){
		
		translate([outerExtrusionWidth/2,outerExtrusionWidth/2,outerExtrusionHeight/2-stepperMotorHight/2]){
			
            difference(){
                
                cube([outerExtrusionWidth, outerExtrusionWidth, outerExtrusionHeight-stepperMotorHight], true);

                rotate([0,0,-135]){

                    translate([outerSupportDifference/2, 0, 0]){

                        cube([outerSupportDifference, outerSupportDifference, outerExtrusionHeight+cutOut], true);

                    }

				}

			} 

		}
		
	}
	
	else{
		
		translate([outerExtrusionWidth/2,outerExtrusionWidth/2,outerExtrusionHeight/2]){
			
            difference(){
                
                cube([outerExtrusionWidth, outerExtrusionWidth, outerExtrusionHeight], true);

                rotate([0,0,-135]){

                    translate([outerSupportDifference/2, 0, 0]){

                        cube([outerSupportDifference, outerSupportDifference, outerExtrusionHeight+cutOut], true);
						
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
            
		translate([stepperMotorWidth-stepperThreadOffset,stepperMotorWidth-31,0]){
                    
            cylinder(stepperMotorMountThickness+cutOut,d=stepperMotorScrewDiameter,false );
			
		}
                    
        translate([stepperMotorWidth-stepperThreadOffset,stepperMotorWidth-stepperThreadOffset,0]){
			
            cylinder(stepperMotorMountThickness+cutOut,d=stepperMotorScrewDiameter,false);
			
		}
                    
        translate([stepperMotorWidth-31,stepperMotorWidth-stepperThreadOffset,0]){
                    
            cylinder(stepperMotorMountThickness+cutOut,d=stepperMotorScrewDiameter,false);
		}
                    
	}
	
}

module stepperMount(){
	
	translate([-stepperMotorWidth+outerExtrusionWidth,-stepperMotorWidth+outerExtrusionWidth,outerExtrusionHeight-	stepperMotorMountThickness]){
		
		stepperMountPrimitive();
		
	}	
	
}

//stepperMount();
//jointOuterSupportPrimitive(true);
//extrusionSleevePair();
//jointInnerSupport();