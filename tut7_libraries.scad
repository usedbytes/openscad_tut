/* Tutorial 7 - Using libraries */

/* You can "include" or "use" scad files to use the modules they contain */

translate([0, 0, -20]) {
	/* "include" is like pasting the file contents here */
	include <tut6_surfaces.scad>
}

/* "use" just makes the file's modules available */

/* OpenSCAD comes with MCAD - a library of useful modules
 * It contains many things - look here: https://github.com/openscad/MCAD */
s = 20;

use <MCAD/regular_shapes.scad>
translate([0, 0, 0]) {
	pentagon(5);
	translate([15, 0, 0]) nonagon_prism(10, 5);
}

/* Gears */
use <MCAD/involute_gears.scad>
translate([0, s, 0]) scale(0.1) bevel_gear_pair();

/* Lego! */
use <MCAD/lego_compatibility.scad>
translate([2 * s, 0, 0])
	block(4, 2, 1, reinforcement = true, solid_bottom = false);

/* *models* of bearings */
use <MCAD/bearing.scad>
translate([0, -s, 0]) bearing();

/* Stepper motor mounts */
use <MCAD/motors.scad>
translate([-50, 0, 0]) stepper_motor_mount(23);

/* Have a look around the 'net for other libraries, or write your own! */
