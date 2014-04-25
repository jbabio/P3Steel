//
//
//Variables

width=8;
length_frame_mount=30;
length_strip=120;
length_axis_support=15;
height=18;

//Liston de enlace
height_clamp=width/3;

//enganche
module anchor(){
	translate([height/2,0,width/2]) rotate([90,0,0]) 
	union(){
		cylinder(r=height/8, h=height_clamp, $fn=30);
		translate([0,0,height_clamp/2])
			cube([height/8,width,height_clamp],center=true);
	}
}