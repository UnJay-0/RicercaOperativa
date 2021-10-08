#DATI
set Reparti; # reparti produttivi 
set Modelli; # modelli sviluppati
param CapacitaProduttive {Reparti}; # capacita produttive di ogni reparto
param TempiDiLavorazione {Reparti, Modelli}; # tempi di lavorazione di ogni reparto per modello 
param Profitti {Modelli}; # profitti per unita di modello 

#VARIABILI
var x {Modelli} >= 0; # numero di unita prodotte per modello

#VINCOLI
subject to consumi {i in Reparti}:
	sum {j in Modelli} x[j] * TempiDiLavorazione[i, j] <= CapacitaProduttive[i];
	
#OBIETTIVO

maximize z: 
	sum {j in Modelli} x[j] * Profitti[j]; 
##########################
data;
set Reparti := Motori Carrozzeria A B C;
set Modelli := A B C;
param CapacitaProduttive := 
	Motori 120 
	Carrozzeria 80 
	A 96
	B 102
	C 40;
param TempiDiLavorazione: A B C :=
	Motori 3	2	1
	Carrozzeria 1	2	3
	A 2	0	0
	B 0	3	2
	C 0	0	2;
param Profitti:=
	A	840
	B	1120
	C	1200;
end;
