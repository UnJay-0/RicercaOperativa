#DATI
param nP;
param nO;
set posizioni := 1..nP;
set organi := 1..nO;
param T {posizioni};
param A {organi, posizioni};
param L {posizioni};
param G;
param M {organi};

#VARIABILI
var x {posizioni} >= 0;

#VINCOLI
subject to RadiazioniPosizione {j in posizioni} :
	x[j] <= L[j];

subject to TotaleRadiazioni :
	sum {j in posizioni} x[j] <= G;

subject to AssorbimentoRadiazioni {i in organi} :
	sum {j in posizioni} x[j] * A[i, j] <= M[i];

#OBIETTIVO

maximize z : sum {j in posizioni} x[j] * T[j];

################################
data;
param nP := 5;
param nO := 7;
param T := 
1	0.4
2	0.3
3	0.25
4	0.7
5	0.5;

param A : 1 2 3 4 5 :=
1	0.1 0.0 0.0 0.1 0.2
2	0.1 0.0 0.15 0.0 0.1
3	0.0 0.1 0.0 0.0 0.0
4	0.0 0.2 0.1 0.1 0.0
5	0.1 0.0 0.2 0.0 0.1
6	0.1 0.3 0.15 0.1 0.1
7	0.2 0.1 0.15 0.0 0.0;

param L := 
1 12
2 13
3 10
4 15
5 15;

param G := 60;

param M := 
1 5.5
2 9.0
3 6.0
4 2.4
5 7.0
6 5.5
7 9.5;
end;
