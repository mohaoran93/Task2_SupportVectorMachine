reset;
param n := 4;
param m := 79;
param C := 500000;
#param gama := 0.05;

set POINTS := {1..n};
#set INPUT_POINTS := {1..n};
set DATASET := {1..m};

param x{DATASET,POINTS};
param y{DATASET};
#param K{DATASET,DATASET};

data data_train.dat;

param K{i in DATASET, j in DATASET} := sum {t in POINTS} x[i,t]*x[j,t];
#param K{i in DATASET, j in DATASET} := exp (-gama*(sum{t in POINTS} (x[i,t]-x[j,t])^2));

#Initializing Y[i]
#for {i in DATASET} {

#	if x[i,1] = 3 then {let y[i] := 1} else{ let y[i] := -1};

#}


var alpha{DATASET} >=0, <= C;	# 

maximize DUALSVM : (sum {i in DATASET} alpha[i]) - 0.5*(sum {i in DATASET,j in DATASET} alpha[i]*alpha[j]*y[i]*y[j]*K[i,j]);

s.t. CONDITION :  sum {i in DATASET} alpha[i]*y[i] = 0;

#option solver snopt;
solve;
display alpha;
