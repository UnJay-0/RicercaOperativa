#DATI
set Articoli;
set Fascicoli := 1..3;
param pagineTotali := 44;
param lArticolo{Articoli};
param urgenza{Articoli};

#VARIABILI
var x{Articoli, Fascicoli} binary;
var pMin integer, >=0;
var pMax integer, >=0;

#VINCOLI
subject to capacita {j in Fascicoli}:
	sum {i in Articoli} lArticolo[i] * x[i, j] <= pagineTotali;

subject to pubblicitaMax{j in Fascicoli}:
	pMax >= sum {i in Articoli} lArticolo[i] * x[i, j];
subject to pubblicitaMin{j in Fascicoli}:
	pMin <= sum {i in Articoli} lArticolo[i] * x[i, j];

subject to assegnamento{i in Articoli}:
	sum {j in Fascicoli} x[i, j] <= 1;

subject to UrgenzaV {i in Articoli} :
	sum {j in Fascicoli: j <= urgenza[i]} x[i, j] = 1;

#OBIETTIVO
minimize z: pMax - pMin;

#############################
data;
set Articoli:= A B C D E F G H I J K L;
param : lArticolo urgenza:=
   A          5         2
   B         11         4
   C         17         2
   D         10         4
   E         18         1 
   F          8         4
   G         14         4
   H          9         3
   I         16         3
   J         12         4
   K         14         4
   L         13         4;
end;
