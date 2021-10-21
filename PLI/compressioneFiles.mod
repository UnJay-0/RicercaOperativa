#DATI
set Files;
set CD;
param dimensione{Files};
param compressi{Files};
param d {CD};

#VARIABILI
var x{Files, CD} binary;
var y{Files, CD} binary;

#VINCOLI
subject to unicoCD {i in Files}:
	sum {j in CD} (x[i, j] + y[i, j]) = 1;

subject to inserimentoFiles {j in CD}:
sum {i in Files} (x[i, j] * dimensione[i] + y[i, j] *  compressi[i]) <= d[j];

#OBIETTIVO
minimize z: sum {i in Files} sum {j in CD} y[i, j];

######################
data;
set Files := 1 2 3 4 5 6 7 8; 
set CD:= 1 2 3;

param dimensione :=
1        450         
2        550         
3        600         
4        120          
5        530         
6        480         
7        200         
8        240;

param compressi := 
1        220
2        240
3        235
4        70
5        260
6        240
7        180
8        110;

param d := 
1 700
2 700
3 700;
end;
