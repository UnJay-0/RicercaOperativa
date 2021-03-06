#DATI
set Incroci := 1..30;
set adiacenza within Incroci cross Incroci;

#VARIABILI
var x{Incroci} binary;

#VINCOLI
subject to sentinelle {i in Incroci}:
	x[i] + sum {j in Incroci: (i, j) in adiacenza or (j, i) in adiacenza} x[j]  >= 1;

#OBIETTIVO
minimize z: sum {i in Incroci} x[i];

#######################
data;
set adiacenza :=
1 2 ,
1 3 ,
1 4 ,
2 30 ,
3 13 ,
3 16 ,
4 5 ,
4 6 ,
4 24 ,
5 6 ,
5 8 ,
5 13 ,
6 7 ,
7 9 ,
7 10 ,
8 9 ,
8 12 ,
8 13 ,
8 27 ,
9 10 ,
9 27,
10 11 ,
11 23 ,
11 29 ,
12 13 ,
12 18 ,
12 19 ,
12 27 ,
13 14 ,
14 15 ,
14 18 ,
15 16 ,
15 17 ,
18 19 ,
18 28 ,
19 20 ,
19 28 ,
20 21 ,
20 22 ,
20 29 ,
24 25, 
24 26, 
27 29;

end;
