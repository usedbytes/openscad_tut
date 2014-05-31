/* Tutorial 5 - Projection */

/* OpenSCAD allows 3D objects to be turned into 2D shapes (the opposite of
 * extrusion) */

module thing() {
	rotate([40, 0, 0]) cylinder(h = 25, r = 5, center = true);
}

translate([0, 80, 0]) {
	thing();
	/* You can project all points onto the x/y plane. Like a shadow */
	color("red") translate([-20, 0, 0]) projection(cut = false) thing();
	/* Or only the points where z = 0, like a slice */
	color("blue") translate([20, 0, 0]) projection(cut = true) thing();
}

/* We can use this to make a rudimentary slicer... and no 3D printing
 * tutorial series is complete without Yoda */

/* Yoda model from Cas Moor on Thingiverse. CC-BY-SA
 * http://www.thingiverse.com/thing:306539 */

stl_height = 65;
filename = "data/LOW_POLYGON_YODA_.stl";

module stl_import(filename) {
	import(filename);
}

module x_profile(stl_file) {
	/* Note that projection only works onto the x/y plane, so we
	 * have to rotate the model first, and then un-rotate the projection
	 * afterwards */
	rotate([-90, 0, 0]) projection(cut = false) rotate([90, 0, 0])
		stl_import(stl_file);
}

module y_profile(stl_file) {
	rotate([0, -90, 0]) projection(cut = false) rotate([0, 90, 0])
		stl_import(stl_file);
}

module z_profile(stl_file) {
	projection(cut = false) stl_import(stl_file);
}

/* We can project his "shadow" in each plane */
stl_import(filename);
color("red") translate([0, 60, 0]) x_profile(filename);
color("green") translate([-60, 0, 0]) y_profile(filename);
color("blue") translate([0, 0, -20]) z_profile(filename);

/* Or cut some slices - this could also be achieved with a series of
 * intersections */
slice_delta = 3;
translate([0, 0, stl_height + 10]) {
	for (z = [0 : -slice_delta : -stl_height]) {
		translate([0, 0, -z]) projection(cut = true) translate([0, 0, z])
			stl_import(filename);
	}
}

/* Any 2D shape (including a projection) can be exported to .dxf - this could
 * be useful if you wanted to laser-cut a cross-section of something, or
 * perhaps a base for your 3D printed model! */
