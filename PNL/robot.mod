#DATI
set Robot := 1..6;
param r {Robot};

#VARIABILI
var x{Robot};
var y{Robot};

var oo{i in Robot, j in Robot: i<>j} = sqrt((x[j] - x[i])^2 + (y[j] - y[i])^2);

#VINCOLI
subject to Sovrapposizioni1 {i in Robot, j in Robot: i<>j}:
	oo[i,j]^2 >= (r[i]+r[j])^2;


	
#OBIETTIVO
minimize z: sum {i in Robot, j in Robot: i<>j} oo[i, j]/2;

######################################################
data;
param r:=
1      120
2       80
3      100
4       70
5       45
6      120;


end;