/* Tutorial 4 - Programming Constructs */

/* Modules are somewhat like functions, but they "return" objects */
module bit(type = "sphere", size = 10) {
	if (type == "sphere") {
		sphere(r = size / 2, center = true);
	} else if (type == "cube") {
		cube(size = size, center = true);
	} else {
		/* Echo just prints to the output window */
		echo("Unkown type: ", type);
	}
}

/* There are functions too; they return values, not objects. Values can
 * be vectors, matrices, strings... */
function quarter_circles(n) = 90 * n;

/* This will use the default arguments, type = "sphere" and size = 10 */
bit();

n_bits = 3;
arc_angle = quarter_circles(4);

/* For loops are pretty useful. Multiple conditions act like nested loops */
for (i = [0 : (arc_angle / n_bits) : arc_angle]) {
	rotate([0, 0, i]) translate([20, 0, 0]) bit("cube", 20);
}

freq = 5;
amplitude = 20;

/* Add in some trigonomic functions for fun */
for (i = [0 : 1 : arc_angle / 2]) {
	translate([0, i, amplitude * sin(freq * i)])
		bit("sphere", 5, $fn = 18);
}

/* intersection_for() is a special case, it gives the intersection of all
 * of the objects inside the loop - NB: only where *all* of them intersect */
color("red") translate([0, 0, 25]) {
	intersection_for(i = [0 : 60 : 360]) {
		rotate([0, 90, i]) cylinder(r = 10, h = 10, center = true);
	}
}

/* Notice the difference with an intersection() and a for() */
color("orange") translate([0, 0, 50]) {
	intersection() {
		for(i = [0 : 60 : 360]) {
			rotate([0, 90, i]) cylinder(r = 10, h = 10, center = true);
		}
	}
}
