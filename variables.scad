
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
extrusionSlotMid = 13.65;

//dimention of extrusion aluminium and walls
outerExtrusionHeight = extrusionHeight+wallThickness*2;
outerExtrusionWidth = extrusionWidth+wallThickness*2;
outerExtrusionDepth = extrusionDepth+wallThickness;

//Mounting bolts for extrusion
extrusionMountBoltDiameter = 4;

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

//X axis gantry carriage
xCarriageWidth = outerExtrusionDepth;
xCarriageDepth = outerExtrusionWidth*2;
xCarriageHeight = outerExtrusionHeight;

xGantryLength = xCarriageWidth*2+axisLengthX+outerExtrusionDepth*2;

//Z tool carridge (tc)
tcThreadedRodDiamiter = 8;
tcThreadedRodOffset = tcThreadedRodDiamiter/2+wallThickness;
tcSmoothRodDiamiter = 8;
tcSmoothRodOffset = tcSmoothRodDiamiter/2+wallThickness;

tcLeadScrewDiamiter = 8;
tcLeadScrewNutWidth = 15;

toolCarridgePlateX = tcThreadedRodDiamiter*2+tcSmoothRodDiamiter*2+tcLeadScrewDiamiter+wallThickness*6;
toolCarridgePlateY = extrusionDepth;
toolCarridgePlateZ = wallThickness;

tcHeight = extrusionHeight+toolCarridgePlateZ*2+cutOut*2;

tcSmoothRodPlatformX = toolCarridgePlateX;
tcSmoothRodPlatformY = wallThickness*2+tcSmoothRodDiamiter;
tcSmoothRodPlatformZ = toolCarridgePlateZ;

tcLeadScrewBearingHousingX = wallThickness*2+tcLeadScrewDiamiter+tcSmoothRodDiamiter*2;
tcLeadScrewBearingHousingY = tcSmoothRodDiamiter >= tcLeadScrewDiamiter ? tcSmoothRodDiamiter+wallThickness*2:tcLeadScrewDiamiter+wallThickness*2;
tcLeadScrewBearingHousingZ = wallThickness;

toolHeadSlideHight = (lm8luuHeight+wallThickness)/2;
