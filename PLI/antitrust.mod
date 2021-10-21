#DATI
set F;
set P;
param fatturato {F, P};

#VARIABILI
var x {F} binary;
var y0 {P} >= 0;
var y1 {P} >= 0;
var a >= 0;

#VINCOLI
subject to fatturato1 {p in P}:
	sum {f in F} fatturato[f, p] * x[f];
subject to fatturato0 {p in P}:
	sum {f in F} fatturato[f, p] * (1 - x[f]);
subject to maxDifferenza {p in P}:
	a >= y0[p] - y1[p] and a >= y1[p] - y0[p];

#OBIETTIVO
minimize z : a;

################################
data;
set F := 1 2 3 4 5 6 7 8 9 10;
set p := 1 2 3 4 5;
param fatturato : 1 2 3 4 5 :=
  1       15000  20000  18000  58000   2400
  2       20000  10000  20000  57000   1900
  3       18000  23000  17500  55500   9820
  4       21000  12000  16800  48000   6000
  5       12500  10000  10950  62000   7800
  6       13750  22000  14400  60000   2500
  7       20500  21000  21000  59800   1980
  8       14250  23800  21500  55500   3450
  9       10800  14180  25400  53250   6500
 10       13700  13980  20100  57500   4000;
end;
