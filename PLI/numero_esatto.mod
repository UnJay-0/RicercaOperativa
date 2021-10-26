#DATI
set Cifre;
set Posizioni;
param A {Cifre, Posizioni};
param B {Cifre, Posizioni};
param C {Cifre, Posizioni};
param D {Cifre, Posizioni};

#VARIABILI
var n {Cifre, Posizioni} binary;

#VINCOLI
subject to cifra {j in Posizioni}:
	sum {i in Cifre} (n[i, j]) = 1;
subject to cifre_diverse {i in Cifre}:
	sum {j in Posizioni} (n[i, j]) = 1;


subject to diff_A:
	sum {i in Cifre, j in Posizioni: A[i,j] = 1} (A[i, j] - n[i, j]) = 2;

subject to diff_B:
	sum {i in Cifre, j in Posizioni: B[i,j] = 1} (B[i, j] - n[i, j]) = 8;

subject to diff_C:
	sum {i in Cifre, j in Posizioni: C[i,j] = 1} (C[i, j] - n[i, j]) = 9;

subject to diff_D:
	sum {i in Cifre, j in Posizioni: D[i,j] = 1} (D[i, j] - n[i, j]) = 6;

######################
data;
set Cifre := 0 1 2 3 4 5 6 7 8 9;
set Posizioni := 0 1 2 3 4 5 6 7 8 9;
param A: 0 1 2 3 4 5 6 7 8 9 :=
0 0 0 0 0 0 0 0 1 0 0
1 0 0 0 0 1 0 0 0 0 0
2 1 0 0 0 0 0 0 0 0 0
3 0 0 0 1 0 0 0 0 0 0
4 0 1 0 0 0 0 0 0 0 0
5 0 0 1 0 0 0 0 0 0 0 
6 0 0 0 0 0 1 0 0 0 0 
7 0 0 0 0 0 0 0 0 0 1
8 0 0 0 0 0 0 0 0 1 0 
9 0 0 0 0 0 0 1 0 0 0;
param B: 0 1 2 3 4 5 6 7 8 9 :=
0 0 0 0 0 0 1 0 0 0 0
1 0 0 0 1 0 0 0 0 0 0
2 0 0 0 0 1 0 0 0 0 0
3 0 0 0 0 0 0 0 0 1 0
4 0 0 0 0 0 0 0 1 0 0
5 0 0 0 0 0 0 0 0 0 1 
6 1 0 0 0 0 0 0 0 0 0 
7 0 0 1 0 0 0 0 0 0 0
8 0 1 0 0 0 0 0 0 0 0 
9 0 0 0 0 0 0 1 0 0 0;
param C: 0 1 2 3 4 5 6 7 8 9 :=
0 0 1 0 0 0 0 0 0 0 0
1 0 0 0 0 1 0 0 0 0 0
2 0 0 0 1 0 0 0 0 0 0
3 1 0 0 0 0 0 0 0 0 0
4 0 0 0 0 0 0 1 0 0 0
5 0 0 0 0 0 0 0 1 0 0 
6 0 0 0 0 0 0 0 0 0 1 
7 0 0 0 0 0 0 0 0 1 0
8 0 0 0 0 0 1 0 0 0 0 
9 0 0 1 0 0 0 0 0 0 0;
param D: 0 1 2 3 4 5 6 7 8 9 :=
0 0 0 0 0 1 0 0 0 0 0
1 0 0 1 0 0 0 0 0 0 0
2 1 0 0 0 0 0 0 0 0 0
3 0 0 0 1 0 0 0 0 0 0
4 0 1 0 0 0 0 0 0 0 0
5 0 0 0 0 0 0 0 1 0 0 
6 0 0 0 0 0 0 0 0 0 1 
7 0 0 0 0 0 0 0 0 1 0
8 0 0 0 0 0 1 0 0 0 0 
9 0 0 0 0 0 0 1 0 0 0;
end;
