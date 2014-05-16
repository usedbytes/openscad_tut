/* Tutorial 3 - 2D drawing and extrusion */

/* NB: When doing a "render", 2D and 3D primitives can't be mixed.
 * Extruded 2D counts as 3D */

translate([25, 0, 0]) {
	/* OpenSCAD has a 2D subsystem - squares, circles and polygons */
	translate([0, 0, 0]) circle(2.5, $fn = 50);
	translate([0, 5, 0]) square(5);
	translate([0, 15, 0]) polygon(points = [[0, 0], [5, 0], [5 * cos(60), 5 * sin(60)]],
		paths = [[0, 1, 2]]);

	/* 2D shapes can be extruded */
	color("green") linear_extrude(height = 10) translate([0, -10, 0]) square(5);

	/* You can twist them - that always happens around the origin */
	color("DodgerBlue") linear_extrude(height = 10, twist = 360) translate([0, -15, 0])
		polygon(points = [[0, 0], [5, 0], [5 * cos(60), 5 * sin(60)]],
			paths = [[0, 1, 2]]);

	/* This means the order of operations is important */
	color("red") translate([0, -20, 0])
		linear_extrude(height = 10, twist = 360, slices = 100)
			square(size = 5, center = true);
}

/* One of the most powerful operations is extruding .dxf files */
translate([-20, 10, 0]) {
	color([1, 0.32, 0, 1]) linear_extrude(5) import("data/makespace_logo_m.dxf");
	color([0.57, 1, 0, 1]) translate([0, 0, 5]) linear_extrude(5)
		import("data/makespace_logo_s.dxf");
}

/* There's a special and somewhat bizarre operation called rotate_extrude */
#polygon(points = [[0, 0], [0, 4], [4, 8]], paths = [[0, 1, 2]]);
rotate_extrude() {
	polygon(points = [[0, 0], [0, 4], [4, 8]],
		paths = [[0, 1, 2]]);
}

/* New Feature:
 * Also in new (2014+) versions, there's an offset function */
/* I've not got it to work myself */
translate([-20, -30, 0]) {
	translate([0, 0, -3]) color("red") square(20);
	color("blue") offset(delta = 10, join_type = "miter") square(20);
}
