include<Spool_mount_for_P3S_config.scad>

//sujeccion al marco
module frame_mount(){
	difference()
	{
		cube([length_frame_mount,height,width]);
		translate([6,6,0]) 
			cube([length_frame_mount-3,3,width]);
	}
}

//liston para el soporte
module strip_support(){
		rotate([0,0,160])
			difference(){
				translate([0,-height,0]) 
					cube([length_strip,height,width]);
				translate([0,0.1,-0.1])
					scale([1,1.01,1.02]) anchor();
			}
}

//enganche para el rollo
module axis_support(){
	translate([-121.5,39.9,0]) difference() {
		cube([length_axis_support,height,width]);
		union(){
			translate([0,4.5,0])
				cube([length_axis_support-8	,height/2,width]);
			translate([length_axis_support-8,height/2,0])
				cylinder(r=4.5, h=width, $fn=20);
		}
	}
}

union(){
	frame_mount();
	strip_support();
	axis_support();
}