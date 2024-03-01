include <variables.scad>;

module tcThreadedRodLoop(){
	
	for (right = [-1,1]){
		
		for (left = [-1,1]){
			
		translate([right*(toolCarridgePlateX/2-tcThreadedRodOffset),left*(toolCarridgePlateY/2-tcThreadedRodOffset),(-toolCarridgePlateZ-cutOut)/2])
			
			cylinder(h=toolCarridgePlateZ+cutOut,d=tcThreadedRodDiamiter);
			
		}
	
	}
	
}

module tcSmoothRodLoop(){
	
	for (front = [-1,1]){
			
		translate([front*(tcSmoothRodOffset+wallThickness),-toolCarridgePlateY/2+tcSmoothRodOffset,(-toolCarridgePlateZ-cutOut)/2]){
			
			cylinder(h=toolCarridgePlateZ+cutOut,d=tcSmoothRodDiamiter);
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
		
		tcSmoothRodLoop();
		
		tcLeadScrewHole();
		
	}
	
}

toolCarridgePlatePrimitive();