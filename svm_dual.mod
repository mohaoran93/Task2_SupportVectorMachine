reset;
param n := 4;
param m := 79;
param C := 100;

set POINTS := {1..n};
set DATASET := {1..m};

param x{DATASET,POINTS};
param y{DATASET};
#param K{DATASET,DATASET};

data data_train.dat;

param K{i in DATASET, j in DATASET} := sum {t in POINTS} x[i,t]*x[j,t];

#Initializing Y[i]
#for {i in DATASET} {

#	if x[i,1] = 3 then {let y[i] := 1} else{ let y[i] := -1};

#}


var alpha{DATASET} >= 0, <= C;	#
var w{POINTS};	

maximize DUALSVM : (sum {i in DATASET} alpha[i]) - 0.5*(sum {i in DATASET,j in DATASET} alpha[i]*alpha[j]*y[i]*y[j]*K[i,j]);

s.t. CONDITION :  (sum {i in DATASET} alpha[i]*y[i]) = 0;

#option solver snopt;
solve;
for {k in POINTS}{
	let w[k] := sum { r in DATASET} (alpha[r]*y[r]*x[r,k]);
}
display alpha;
display w;
display CONDITION;