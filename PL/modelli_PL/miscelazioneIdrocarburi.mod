#DATI
set Benzine;
set Sostanze;
param upperBounds{Sostanze, Benzine};
param lowerBounds{Sostanze, Benzine};
param risorse{Sostanze};
param costi{Sostanze};
param ricavi{Benzine};

#VARIABILI
var y{Sostanze, Benzine} >= 0;
var x{Benzine} >= 0;

#VINCOLI
subject to lowerBound {j in Sostanze, i in Benzine}:
	y[j, i] >= lowerBounds[j, i];

subject to upperBound {j in Sostanze, i in Benzine}:
	y[j, i] <= upperBounds[j, i];

subject to utilizzoRisorse {j in Sostanze}:
	sum {i in Benzine} y[j, i] <= risorse[j];

subject to Barilitotali {i in Benzine}:
	sum {j in Sostanze} y[j, i] = x[i];

#OBIETTIVO
maximize z: sum {i in Benzine} x[i]*ricavi[i] - sum {j in Sostanze} costi[j] * sum {i in Benzine}  y[j, i];
###########################################
data;
set Benzine := Super Normale Verde;
set Sostanze := A B C D;
param lowerBounds : Super Normale Verde :=
A	0	0	0
B	0.4	0.1	0
C	0	0	0
D	0	0	0;
param upperBounds : Super Normale Verde :=
A	0.3	0.5	0.7
B	1	1	1
C	0.5	1	1
D	1	1	1;
param risorse :=
A	3000
B	2000
C	4000
D	1000;
param costi :=
A 3
B 6
C 4
D 5;
param ricavi :=
Super 5.5
Normale 4.5
Verde 3.5;
end;
