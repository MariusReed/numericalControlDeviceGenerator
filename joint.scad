include <variables.scad>;

module extrusionSleevePrimitive(){
	
	difference(){
		
		cube([outerExtrusionWidth, outerExtrusionDepth, outerExtrusionHeight], false);
		
		translate([wallThickness,wallThickness,wallThickness]){
			
			cube([extrusionWidth, extrusionDepth+cutOut, extrusionHeight], false);
			
		}
		
	}                                               
		
}

module extrusionSleevePair(){
	
	translate([0,outerExtrusionWidth,0]){
		
		extrusionSleevePrimitive();
		
		translate([outerExtrusionWidth,0,0]){
		
			rotate([0,0,-90]){
			
				extrusionSleevePrimitive();
			
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

jointOuterSupportPrimitive(false);

extrusionSleevePair();

jointInnerSupport();