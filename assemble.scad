include <variables.scad>;
include <primitives.scad>;
//include <xGantry.scad>;
//include <toolHead.scad>;
include <joint.scad>;

module cornerJoint(position) {
	
    if (position == "frontLeft") {
        translate([0,0,0]) {
           
            rotate([0,0,0]) {
                stepperMount();
                jointOuterSupportPrimitive(true);
                extrusionSleevePair();
                jointInnerSupport();
            }
        }
    } else if (position == "frontRight") {
		
        translate([machineX,0,0]) {
            
            rotate([0, 0, 90]) { 
				
                stepperMount();
                jointOuterSupportPrimitive(true);
                extrusionSleevePair();
                jointInnerSupport();
				
            }
        }
    } else if (position == "backLeft") {
        translate([0, machineY, 0]) { 
			
            rotate([0,0,270]) { 
				
                jointOuterSupportPrimitive(false);
                extrusionSleevePair();
                jointInnerSupport();
            }
        }
    } else if (position == "backRight") {
        translate([machineX,machineY,0]) { 
			
            rotate([0,0,180]) { 
				
                jointOuterSupportPrimitive(false);
                extrusionSleevePair();
                jointInnerSupport();
				
            }
        }
    } else {
        echo("Invalid position specified in cornerJoint module!");
    }
}

//call modules
cornerJoint("frontLeft");
cornerJoint("backLeft");
cornerJoint("frontRight");
cornerJoint("backRight");