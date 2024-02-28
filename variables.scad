
//Universal 
$fn= $preview ? 32 : 64;
tolerance = 0.4; //play for EASY fit
wallThickness = 4;
cutOut = 0.2;

//dimention of extrusion aluminium profile
extrusionHeight = 40;
extrusionWidth = 20;
extrusionDepth = 50;

//extrusionSlotMetrics
extrusionSlotOffset = 6.9;
extrusionSlotWidth = 6.2;
extrusionSlotMid = 13.7;

//dimention of extrusion aluminium and walls
outerExtrusionHeight = extrusionHeight+wallThickness*2;
outerExtrusionWidth = extrusionWidth+wallThickness*2;
outerExtrusionDepth = extrusionDepth+wallThickness;

//inner support
frontSupportThickness = extrusionHeight/10;
innerSupportDifference = sqrt(2)*outerExtrusionDepth;

//outer support
outerSupportDifference = sqrt(2)*outerExtrusionWidth;

//stepper Motor
stepperMotorHight = 31;
stepperMotorWidth = 41;
stepperMotorScrewDiameter = 3;
stepperMotorShaftDiameter = 22;
stepperThreadOffset = 10;
stepperMotorMountThickness = 4;


