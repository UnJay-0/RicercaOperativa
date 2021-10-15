#DATI
set Mesi;
param richiestaMercato{Mesi};
param produzione{Mesi};
param prezzoIngredienti{Mesi};
param costiMagazzino{Mesi};
param magazzinoIniziale;

#VARIABILI
var x{Mesi} >= 0;
var y{Mesi} >=0;

#VINCOLI
subject to Magazzino {m in Mesi: m >= 7}:
	x[m] + y[m-1] = richiestaMercato[m] + y[m];

subject to magazzinoGiugno:
	x[6] + magazzinoIniziale = richiestaMercato[6] + y[6];

subject to capacitaProduttiva {m in Mesi}:
	x[m] <= produzione[m];

#OBIETTIVO
minimize z: sum {m in Mesi} x[m] * prezzoIngredienti[m] + sum {m in Mesi} y[m] * costiMagazzino[m];

#####################################
data;
set Mesi:= 6 7 8 9;
param richiestaMercato:= 
6	200
7	300
8	500
9	400;
param prezzoIngredienti:=
6	34
7	36
8	32
9	38;
param produzione:=
6	400
7	500
8	300
9	400;
param costiMagazzino:=
6	2000
7	3000
8	2000
9	3000;
param magazzinoIniziale:= 0;
end;
