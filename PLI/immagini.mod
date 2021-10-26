#DATI
set Richieste;
param iniziale {Richieste};
param finale {Richieste};
param tempoTrasmissione {Richieste};
param valore {Richieste};
param tempo;

#VARIABILI
var x {Richieste} binary;

#VINCOLI
subject to sovrapposizioni {i in Richieste, j in Richieste: (i < j) and (finale[i] < iniziale[j]) and finale[j] < iniziale[i]}:
	x[i] + x[j] <= 1;

subject to tempoTotale:
	sum {i in Richieste} x[i] * tempoTrasmissione[i] <= tempo;

#OBIETTIVO
maximize z: sum {i in Richieste} x[i] * valore[i];
