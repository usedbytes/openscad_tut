/* Tutorial 2 - Boolean operations */

/* $fn can be set globally */
$fn = 100;

/* We can add, subtract and "AND" objects together */

/* a minus b */
difference() {
	cube(size = 10, center = true);
	translate([-5, -5, 5]) cube(size = 10, center = true);
}

/* union adds things together */
union() {
	translate([0, 15, 0]) cylinder(r = 3, h = 15);
	translate([0, 15, 4], center = true) cube(8, center = true);
}

/* intersection is a logical AND */
translate([15, 0, 5]) intersection() {
	#sphere(r = 5, center = true, $fn = 100);
	/* # can be used to put a shape in "debug" colours */
	cylinder(r = 3, h = 10, center= true);
}
