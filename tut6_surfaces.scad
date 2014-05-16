/* Tutorial 6 - Surfaces, images, depth-maps */

/* A surface can be generated from a text file, where each sample is a decimal
 * number, layed out in rows and columns:
 *  1  2  3  4
 *  5  6  7  8
 *  9 10 10 12
 * 13 14 15 16
 */
color("red") resize([16, 16, 16])
	surface(file = "simple.dat");

/* This surface was generated from the contents of this file:
 *  $ ./gen_surf.py surfaces.scad > surface.dat
 */
color("green") translate([16, 0, 0]) resize([16, 16, 16])
	surface(file = "surfaces.dat");

/* New feature:
 * You can also generate surfaces from PNG images. The z-height is calculated
 * from the greyscale value of each pixel. File from OpenSCAD wiki. CC-BY-SA
 * http://commons.wikimedia.org/wiki/File:OpenSCAD_surface_example_input_image.png */
/* I can't get this to work myself! Your mileage may vary.
color("blue") translate([32, 0, 0]) resize([16, 16, 16])
	surface(file = "OpenSCAD_surface_example_input_image.png", center = true);
*/
