include <variables.scad>;
include <functions.scad>;

m5NutHeight = 3.7+cutOut;
m5NutWidth = 8.8+cutOut;

m8NutHeight = 6.14;
m8NutWidth = 14.4+cutOut;

module m8Nut(){
// Create a hexagon with radical calculus you nerd! 3d shape extruded from 2d plane, noice!
linear_extrude(height = m8NutHeight)
    polygon([for(i=[0:5]) [cos(i*60)*(m8NutWidth/2), sin(i*60)*(m8NutWidth/2)]]);
}

module m5Nut(){
// Create a hexagon with radical calculus you nerd! 3d shape extruded from 2d plane, noice!
linear_extrude(height = m5NutHeight)
    polygon([for(i=[0:5]) [cos(i*60)*(m5NutWidth/2), sin(i*60)*(m5NutWidth/2)]]);
}

//m8Nut();
//m5Nut();