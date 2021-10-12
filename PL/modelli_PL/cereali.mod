#DATI
param nC; # numero di cereali
param nL; # numero di lotti
set cereali := 1..nC; # tipologie di cereali
set lotti := 1..nL; # lotti
param dimensioneLotti{lotti}; # dimensione dei lotti [acri]
param profitti {cereali}; # profitti unitari per quintali prodotti per cereale [$/q]
param area {lotti, cereali}; # area necessaria per quintale di cereale da produrre [acri]
param acqua {cereali}; # acqua necessaria per quintale di cereale da produrre
param A; # acqua disponibile

#VARIABILI
var x{lotti, cereali} >= 0 # quintali di cereali prodotti per area

#VINCOLI
subject to areaNecessaria {i in lotti}:
	sum {j in cereali} x[i, j] * area[i, j] <= dimensioneLotti[i];

subject to acquaNecessaria:
	sum {i in lotti} sum {j in cereali} x[i, j] * acqua[j] <= A;

#OBIETTIVO
maximize z: sum {i in lotti} sum {j in cereali} x[i, j] * profitti[j];

###################################################
data;
param nC := 6;
param nL := 2;

param dimensioneLotti := 
1 200
2 400;

param profitti :=
1 48
2 62
3 28
4 36
5 122
6 94;

param area : 1 2 3 4 5 6 :=
1 0.02 0.03 0.02 0.016 0.05 0.04
2 0.02 0.034 0.024 0.02 0.06 0.034;

param acqua :=
1 0.000000120
3
4
5
6;

param A; 
end;
