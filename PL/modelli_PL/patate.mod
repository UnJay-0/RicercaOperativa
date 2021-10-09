#DATA
set fornitori; # fornitori da cui acquistare le patate
set prodotti; # prodotti producibili dai fornitori
param rese {prodotti, fornitori}; # rese dei kg di patate acquistate dai fornitori per prodotto [adimensionale] 
param profitti {fornitori}; # profitti unitari per kg acquistati dai fornitori [£/kg]
param limitazioni {prodotti}; # quantita' massima producibile per prodotto

#VARIABILI
var x {fornitori} >= 0; #kg di patate acquistati per fornitore

#VINCOLI
subject to Quantita {i in prodotti}:
	sum {j in fornitori} x[j] * rese[i, j] <= limitazioni[i];

#OBIETTIVO
maximize z : sum {j in fornitori} x[j] * profitti[j];
######################################
data;
set fornitori := 1 2;
set prodotti := bastoncino piccoli fiocchi;

param rese : 1 2 :=
bastoncino  0.2 0.3
piccoli     0.2 0.1
fiocchi     0.3 0.3;

param profitti := 
1 0.02
2 0.03;

param limitazioni :=
bastoncino 6000
piccoli 4000
fiocchi 8000;
end;
