include <variables.scad>


module servoCutOut(){
	
	cube([servoBodyX,servoBodyY,servoBodyZ]);
	translate([(-servoMountX+servoBodyX)/2,servoMountYOffset,0]){
	cube([servoMountX,servoMountY,servoMountZ]);
		
	}
}

module servoShelfMountingHoles(){
	for (i = [0 : 1]) {
			
		translate([(wallThickness + m3ScrewHole) / 2 + i * (servoShelfX + servoFeetX * 2 - (wallThickness + m3ScrewHole)), servoFeetY / 2, -cutOut / 2]) {
		cylinder(h = servoFeetX + cutOut, d = m3ScrewHole);
			
		}
	}
}

module servoShelfFeet(){
	difference(){
		
		cube([servoShelfX+servoFeetX*2,servoFeetY,servoFeetZ]);
		servoShelfMountingHoles();
		
	}
}

module servoShelf(){
	difference(){
		
		cube([servoShelfX,servoShelfY,servoShelfZ]);
		translate([servoShelfX/2-servoBodyX/2,-cutOut/2,servoShelfZ-servoBodyZ+cutOut/2]){
		servoCutOut();
			
		}
	}
	
	translate([-servoFeetX,(servoShelfY-servoFeetY)/2,0]){
		
		servoShelfFeet();
		
	}
}

