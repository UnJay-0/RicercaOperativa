#DATI
set Posizioni;
param r{Posizioni};

#VARIABILI
var x{Posizioni} integer, >= 1, <= 9;
var y{Posizioni}, integer, >= 1, <= 9;
var w{Posizioni} binary;
var q{Posizioni} binary;

#VINCOLI



subject to migliaiaToDecine:
	x[3] = y[1];

subject to centinaiaToUnita:
	x[2] = y[0];

subject to decineToCentinaia:
	x[1] = y[2];

subject to unitaToMigliaia:
	x[0] = y[3];

subject to somma:
	x[0] + x[1] * 10 + x[2] * 100 + x[3] * 1000 + y[0] + y[1] * 10 + y[2] * 100 + y[3] * 1000 = r[0] + r[1] * 10 + r[2] * 100 + r[3] * 1000;

subject to conteggioCifreUguali{i in Posizioni, j in Posizioni}:
	 x[i] = w[i] * r[j];

subject to dueCifreUguali:
	sum {i in Posizioni} w[i] >= 2;

########################
data;
set Posizioni := 0 1 2 3;
param r := 
0 2
1 1
2 6
3 8;
end;
