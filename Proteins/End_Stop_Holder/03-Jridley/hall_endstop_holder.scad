// mount for hall effect sensors from RepRapDiscount

screw_dia = 3.7;
screw_spacing = 17.3;

// self tapping screw
st_screw_dia = 3.1;
st_screw_depth = 6;

rod_dia = 8.3;
nut_wrench = 5.7;
nut_dia = nut_wrench/cos(30);
nut_height=3;
spacing_from_rod = 6;
clamp_depth = 3; // depth beyond rod
buffer = 2;

// tweaks per machine
standoff_height = max(spacing_from_rod, clamp_depth+buffer);
offset = 11; // amount to move the sensor to the side

main_height = max(nut_dia, screw_dia+buffer*2);
main_depth = rod_dia + clamp_depth*2;
main_width = screw_spacing+nut_dia;

difference()
{
	solids();
	holes();
}

module solids()
{
		hull()
		{
			for(x=[-main_width/2-offset, main_width/2])
				for (y=[-main_depth/2+buffer, main_depth/2-buffer])
					translate([x,y,0])
						cylinder(r=buffer, h=main_height+0.01, $fn=12);
		}

	// standoffs
	translate([-offset,0,0])
	for (x=[-1,1])
	{
		translate([screw_spacing/2*x, rod_dia/2, main_height/2])
			rotate([-90,0,0])
				cylinder(r=screw_dia/2 + buffer, h=standoff_height);
	}
}

module holes()
{
	// hole for rod
	cylinder(r=rod_dia/2, h=main_height+0.01, $fn=20);

	// compression slice
	translate([-buffer-offset/2, 0,main_height/2])
		cube([screw_spacing+nut_dia+buffer*2+offset, buffer, main_height+0.1], center=true);

	// screw holes
	// machine screw
	translate([-screw_spacing/2-offset, -main_depth/2-0.01, main_height/2])
		rotate([-90,0,0])
		{
			// screw hole
			cylinder(r=screw_dia/2, h=main_depth+standoff_height, $fn=20);
			// nut trap
			cylinder(r=nut_dia/2, h=nut_height, $fn=6);
		}

	// self tapping screw
	translate([screw_spacing/2-offset, rod_dia/2+standoff_height-st_screw_depth, main_height/2])
		rotate([-90,0,0])
		{
			// screw hole
			cylinder(r=st_screw_dia/2, h=st_screw_depth, $fn=20);
		}

}