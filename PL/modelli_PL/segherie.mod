#DATI
set Raccolta := 1..15;
set Segherie := 1..5;
set Coord := 1..2;
param posRaccolta{Raccolta, Coord};
param legnaRaccolta{Raccolta};
param costoTrasporto;
param posSegherie{Segherie, Coord};
param costiManutenzione{Segherie};
param capacita{Segherie};

#VARIABILI
var x {Segherie} binary;
var y {Raccolta, Segherie} >= 0, <= 1;

#VINCOLI
subject to utilizzo {i in Raccolta}:
	sum {j in Segherie} y[i, j] = 1;

subject to assegnamento {j in Segherie}:
	sum {i in Raccolta} (legnaRaccolta[i] * y[i, j]) <= capacita[j] * x[j];

#OBIETTIVO
minimize z: sum {j in Segherie} (x[j] * costiManutenzione[j]) + sum {j in Segherie} (sum {i in Raccolta} costoTrasporto * legnaRaccolta[i] * y[i, j] * sqrt((posRaccolta[i, 1] - posRaccolta[j, 1])^2 + (posRaccolta[i, 2] - posRaccolta[j, 2])^2));
###################
data;
param posRaccolta: 1 2 :=
1 40 66     
2 76 17     
3 11 47     
4 65 58     
5 18 88     
6 19 2     
7 62 62     
8 90 17     
9 66 95     
10 42 100     
11 95 12     
12 16 26     
13 7 71     
14 75 43     
15 30 76;

param legnaRaccolta :=
1    58
2    35
3    27
4    42
5    60
6    31
7    18
8    24
9    36
10    37
11    48
12    39
13    53
14    61
15    29;

param costoTrasporto := 5;
 

param posSegherie : 1 2 :=
1 25 20           
2 55 25           
3 90 15           
4 15 45           
5 85 55;           

param costiManutenzione:=
1           3000                  
2           4500                 
3           3000                 
4           4400                 
5           4600;

param capacita :=
1                190 
2                240
3                200
4                220
5                190;
end;
