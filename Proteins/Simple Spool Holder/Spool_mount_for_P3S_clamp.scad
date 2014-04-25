include<Spool_mount_for_i3_config.scad>

module anchor_axis(){
	union() {
		translate([0,-height_clamp,width])
			cube([width,height_clamp,110]);
		translate([-width/2-0.7,0,0.2]) scale([0.95,1,1]) anchor();
		translate([-width/2-0.7,0,110+width-0.2]) scale([0.95,1,1]) anchor();
	}
}

rotate([270,0,0]) 
anchor_axis();