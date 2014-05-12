/* Tutorial 1 - Basic 3D drawing */

/* Comments are C-style, lines must end with a semicolon */

/* 3D fundamental shapes are easy */
sphere(r = 10, center = true);

/* Operations are chained */
translate([0, -20, 0]) cube(10, center = true);

/* They are evaluated right-to-left */
color("red") translate([20, 0, 0]) rotate([0, 90, 0])
	cylinder(r = 3, h = 10, center = true);
color([0, 1, 0, 0.5]) rotate([0, -90, 0]) translate([20, 0, 0])
	cylinder(r = 3, h = 10, center = true);

/* The special variable $fn changes how rounded things are */
translate([-20, 0, 0]) cylinder(r = 5, h = 10, $fn = 6);
translate([-35, 0, 0]) cylinder(r1 = 5, r2 = 0, h = 5, $fn = 4);
