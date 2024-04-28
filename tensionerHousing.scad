include <variables.scad>;
include <functions.scad>;
include <nut.scad>;

module idlerOuterHousing(){
	
	cube([idlerHousingWidth,idlerHousingDepth,idlerHousingHeight]);
	
	}
//need to write a check if the outerExtrusionWidth(idlerHousingWidth) is greater than the GT2_2mmPulleyDiameter or some workaround.
module idlerCutOut(){
	cube([idlerHousingCutOutWidth,idlerHousingCutOutDepth,idlerHousingCutOutHeight]);
	}
//need check to see that the screw hole is smaller than the slide width	
module idlerGearScrewHole(){
	
	translate([idlerHousingWidth/2,GT2_2mmPulleyDiameter/2,-tsHight-cutOut/2]){
		
		union(){
			cylinder(h=idlerScrewLength,d=idlerScrewDiameter);
			cylinder(h=idlerScrewHeadHeight,d=idlerScrewHeadDiameter);
		}
	}	
}
//this be some bullshit that isnot parametric to tsHeight etc.
module tensionerScrewHole(){
	
	cylinder(h=wallThickness*2+cutOut,d=m5ScrewHole);
	translate([0,0,cutOut/2+m5NutHeight/2]){	
		m5Nut();
	}
		
}
//this be some bullshit that isnot parametric to tsHeight etc.
module tensionerPlate(){
	difference(){
		cube([idlerHousingWidth,wallThickness*2,idlerHousingHeight+extrusionHeight/2]);
		translate([idlerHousingWidth/2,wallThickness*2+cutOut/2,extrusionHeight/4]){
			rotate([90,0,0]){
				tensionerScrewHole();
			}
		}
	}
}


module tensionerSlide(){
	
tsPoints = [
  [  0,  0,  0 ],  //0 bottom
  [ tsWidth,  0,  0 ],  //1 bottom
  [ tsWidth,  tsLength,  0 ],  //2 bottom
  [  0,  tsLength,  0 ],  //3 bottom
  [  tsSlant,  0,  tsHight ],  //4 top
  [ tsWidth-tsSlant,  0,  tsHight ],  //5 top
  [ tsWidth-tsSlant,  tsLength,  tsHight ],  //6 top
  [  tsSlant,  tsLength,  tsHight ]]; //7 top
  
  
polyhedron( tsPoints, tsFaces );	
}


module tensionerSlideCutOut(){
 
tsCutOutPoints = [
  [  -cutOut,  0,  -cutOut ],  //0 bottom
  [ tsWidth+cutOut,  0,  -cutOut ],  //1 bottom
  [ tsWidth+cutOut,  tsLength,  -cutOut ],  //2 bottom
  [  -cutOut,  tsLength,  -cutOut ],  //3 bottom
  [  tsSlant-cutOut,  0,  tsHight ],  //4 top
  [ tsWidth-tsSlant+cutOut,  0,  tsHight ],  //5 top
  [ tsWidth-tsSlant+cutOut,  tsLength,  tsHight ],  //6 top
  [  tsSlant-cutOut,  tsLength,  tsHight ]]; //7 top
	

  
polyhedron( tsCutOutPoints, tsFaces );	
}

module tensionerHouslingAllParts(){

difference(){
	
	union(){
		difference(){
			idlerOuterHousing();
			translate([(idlerHousingWidth-idlerHousingCutOutWidth)/2,-cutOut,(idlerHousingHeight-idlerHousingCutOutHeight)/2]){	
				idlerCutOut();
			}
		}
		translate([idlerHousingWidth/2-tsWidth/2,0,-tsHight]){
			tensionerSlide();
		}
		translate([0,idlerHousingDepth,-extrusionHeight/2]){
			tensionerPlate();
		}
	}
	
	idlerGearScrewHole();
}
}
tensionerHouslingAllParts();
