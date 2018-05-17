
Base_Bottom_OD = 40;
Base_Top_OD = 44;
Base_ID = 36;
Hose_ID = 30;
Base_H = 9;
Base_Hi = 7;
Pipe_H = 50;
Wall_T = 3;
Ring_H = 6;

module base() {
    difference() {
        cylinder(Base_H, Base_Bottom_OD/2, Base_Top_OD/2, $fn=100, center=true);
        union() {
            translate ([0,0,-(Base_H/2)-1]) rotate([0,0,0])
                cylinder(Base_Hi, Base_ID/2, Hose_ID/2-Wall_T, $fn=100);
        }
    }
}

module pipe() {
    translate ([0,0,(Base_H/2)]) rotate([0,0,0])
        cylinder(Pipe_H, Hose_ID/2, Hose_ID/2, $fn=100);
    for (offset=[(Base_H/2)+Ring_H:Ring_H:(Base_H/2)+Pipe_H-Ring_H])
        translate ([0,0,offset]) rotate([0,0,0])
            cylinder(Ring_H, Hose_ID/2+0.5, Hose_ID/2, $fn=100);
}

difference() {
    union() {
        base();
        pipe();
    }
    union() {
        translate ([0,0,-(Base_H/2)-1]) rotate([0,0,0])
            cylinder(Base_H+Pipe_H+2, Hose_ID/2-Wall_T, Hose_ID/2-Wall_T, $fn=100);
    }
}
