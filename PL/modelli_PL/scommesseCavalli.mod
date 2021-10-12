#DATI
set Cavalli;
param q{Cavalli};
param b;

#VARIABILI
var x{Cavalli} >= 0;
var y >= 0;

#VINCOLI
subject to Budget:
	sum {c in Cavalli} x[c] <= b;

subject to maxmin {c in Cavalli}:
	y <= x[c]*q[c];

#OBIETTIVO
maximize z: y;
########################
data;
set Cavalli := Fulmine Freccia Dardo Lampo;
param q := 
Fulmine 3 
Freccia 4 
Dardo 5
Lampo 6;
param b := 57;
end;
