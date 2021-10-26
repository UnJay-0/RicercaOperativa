#DATI
set Memorie;
set Orbite;
param input{Memorie, Orbite};
param window{Orbite};
param capacita{Memorie};
param contenutoIniziale{Memorie};
param velocita;

#VARIABILI
var x{Memorie, Orbite} >= 0;
var y{i in Memorie, Orbite} <= capacita[i], >=0;
var c;
#VINCOLI
subject to massimaCapacitaRaggiunta {i in Memorie, j in Orbite}:
	c >= (100*y[i, j])/capacita[i];
subject to capacitaTrasmissione {j in Orbite}:
	sum {i in Memorie} x[i,j] <= window[j] * velocita;m

subject to riempimentoMemorie {i in Memorie, j in Orbite: j >= 2}:
	input[i, j] + y[i, j-1] = x[i, j] + y[i, j];

subject to riempimentoIniziale {i in Memorie}:
	input[i, 1] + contenutoIniziale[i] = x[i, 1] + y[i, 1];

subject to scaricamentoPossibile {i in Memorie, j in Orbite}:
	x[i, j] <= y[i, j];

#OBIETTIVO
minimize z: c;

##########################
data;
set Memorie:= 1 2 3 4 5;
set Orbite := 1 2 3 4 5 6 7 8 9 10;
param input : 1 2 3 4 5 :=
1 35 0 80 25 50
2 200 70 100 25 0
3 0 150 0 25 100
4 600 300 0 25 75
5 200 0 210 25 200
6 50 0 85 0 45
7 40 60 50 0 300
8 300 90 20 60 0
9 0 100 100 60 20
10 0 20 100 60 250;
param window :=
1 45
2 47
3 55
4 45
5 35
6 42
7 30
8 35
9 44
10 40;
param capacita :=
1 1000 
2 1200 
3 1000 
4 500 
5 700;
param contenutoIniziale := 
1 500
2 600
3 500
4 250
5 350;

param velocita := 9;
end;
