/* Tutorial 1 - Basic 3D drawing */

/* Comments are C-style, and lines must end with a semicolon */
// Or you can use C++ style if that's your thing

/* There are a few useful special symbols which can be used to modify the
 * behaviour of a node:
 * !: Dicards all other nodes and renders only this one (and its children) as
 *    though it were the only one
 * *: Ignore this node and all children (often easier than commenting out)
 * %: Make this mode (and its children) render as "transparent"
 * #: Make this node (and its children) render in "debug" mode - translucent
 *    pink.
 */

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

/* You can draw polyhedrons using vertices and triangles too */
translate([0, 20, 0]) {
	polyhedron(points = [ [0, 0, 0], [10, 0, 0], [0, 10, 0], [0, 0, 10] ],
		/* Beware of "winding order" - points should go clockwise when
		 * looking at the "outside" of the triangle */
		faces = [ [0, 1, 2], [0, 2, 3], [0, 3, 1], [2, 1, 3] ]);
}
