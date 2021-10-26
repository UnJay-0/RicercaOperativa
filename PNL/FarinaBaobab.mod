param cf := 1000.00;
param cv := 10.00;
param k := 80;
param Q := 70;
param P := 20;

#VARIABILE
var A >= 0, <= Q := 65;

#OBIETTIVO
maximize z: P*A - (cv*A + k*sqrt(A));