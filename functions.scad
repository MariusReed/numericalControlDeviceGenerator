include <variables.scad>;

function toothSpacing(toothPitch,pitchLlineOffset)
	= (2*((gt2IdlerToothCount*toothPitch)/(3.14159265*2)-pitchLlineOffset)) ;
toothAngle = 360 / gt2IdlerToothCount;
//ill just leave this here, it was throughing an error when i had it in variables
GT2_2mmPulleyDiameter = toothSpacing (2,0.254);

//function xAxisCenter(){
	
	//}
	
//function yAxisCenter(){
	
	//}

//function machineCenter(){
	
	//}
	
//function xGearIdlerPosition(){
	
	//}
