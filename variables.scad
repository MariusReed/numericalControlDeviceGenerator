
//Universal 
$fn= $preview ? 32 : 64;
tolerance = 0.4; //play for EASY fit
wallThickness = 5;
cutOut = 0.2;

//screw hole diamiters 
m2ScrewHole = 2;
m3ScrewHole = 3;
m4ScrewHole = 4;
m5ScrewHole = 5;
m6ScrewHole = 6;

//screw head diamiters
m2ScrewHeadDiamiter = 3.8;
m3ScrewHeadDiamiter = 7.66;
m4ScrewHeadDiamiter = 8.5;
m5ScrewHeadDiamiter = 10;
m6ScrewHeadDiamiter = 10.22;

//screw head hight
m2ScrewHeadHeight = 2;
m3ScrewHeadHeight = 3;
m4ScrewHeadHeight = 4;
m5ScrewHeadHeight = 5;
m6ScrewHeadHeight = 6;

//dimention of extrusion aluminium profile
extrusionHeight = 40;
extrusionWidth = 20;
extrusionDepth = 50;

//extrusionSlotMetrics
extrusionSlotOffset = 6.9;
extrusionSlotWidth = 6.2;
extrusionSlotMid = 13.65;

//dimention of extrusion aluminium and walls
outerExtrusionHeight = extrusionHeight+wallThickness*2;
outerExtrusionWidth = extrusionWidth+wallThickness*2;
outerExtrusionDepth = extrusionDepth+wallThickness;

//Mounting bolts for extrusion
extrusionMountBoltDiameter = 4;
//linear rail blocks
mgn12hHeight = 10;
mgn12hWidth = 27;
mgn12hLength = 45.4;
mgn12hScrewSpacing = 20;

//bearings
zz608BearingOD = 22;
zz608BearingID = 8;
zz608BearingHeight = 7;

lm8luuOD = 15;
lm8luuID = 8;
lm8luuHeight = 45;

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

//active working area dementions
axisLengthY = 500;
axisLengthX = 500;

//machine demetions
machineX = axisLengthX+wallThickness*2+outerExtrusionWidth*2;
machineY = axisLengthY+wallThickness*2+outerExtrusionWidth*2;

//X axis gantry carriage
xCarriageWidth = outerExtrusionDepth;
xCarriageDepth = outerExtrusionWidth*2;
xCarriageHeight = outerExtrusionHeight;

xGantryLength = xCarriageWidth*2+axisLengthX+outerExtrusionDepth*2;

//Z tool carridge rod (tc)
tcSmoothRodLenght = 80;
tcSmoothRodDiamiter = 8+cutOut;

tcSmoothRodOffset = tcSmoothRodDiamiter/2+wallThickness;

tcLeadScrewDiamiter = 8;
tcLeadScrewNutWidth = 15;

//servo dimentions
servoBodyX = 30.5+cutOut;
servoBodyY = 24+cutOut;
servoBodyZ = 12+cutOut;

servoMountX = 10+servoBodyX;
servoMountY = 2.5+cutOut;
servoMountZ = servoBodyZ;
servoMountYOffset = 4.3;

servoShelfX = servoMountX+wallThickness;
servoShelfY = servoBodyY-cutOut;
servoShelfZ = servoBodyZ+wallThickness;

servoFeetX = m3ScrewHole+wallThickness;
servoFeetY = m3ScrewHole+wallThickness;
servoFeetZ = wallThickness;
//tool carridge (tc)
toolCarridgePlateX = tcSmoothRodDiamiter*2+servoShelfX+wallThickness*6+cutOut*2;
toolCarridgePlateY = extrusionHeight;
toolCarridgePlateZ = wallThickness;

tcPenSliderX = toolCarridgePlateX+wallThickness*2;
tcPenSliderY = tcSmoothRodDiamiter+wallThickness;
tcPenSliderZ = tcSmoothRodLenght;

tcPensliderTopCutoutX = tcPenSliderX-tcSmoothRodDiamiter*2-wallThickness*6+cutOut;
tcPensliderTopCutoutY = tcSmoothRodDiamiter+wallThickness+cutOut;
tcPensliderTopCutoutZ = wallThickness+cutOut;

tcSmoothRodPlatformX = toolCarridgePlateX;
tcSmoothRodPlatformY = wallThickness*2+tcSmoothRodDiamiter;
tcSmoothRodPlatformZ = toolCarridgePlateZ;

toolPlateThickness = wallThickness/2;

penToolHolderMaxInnerDiameter = 40;
penToolHolderMinInnerDiameter = 4;
penToolHolderHeight = 15;
penToolHolderOuterDiameter = penToolHolderMaxInnerDiameter+wallThickness*4;

servoLipX = tcPensliderTopCutoutX-wallThickness*2-cutOut;
servoLipY = tcPensliderTopCutoutY-cutOut;
servoLipZ = tcPensliderTopCutoutZ;


