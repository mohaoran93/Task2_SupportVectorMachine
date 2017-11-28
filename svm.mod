param Input {1..P, 1..N};
param Target_output {1..P};

# The code below presents my very basical idea that need to be discussed this Thursday

#var weights{1..10} >= -1000;
var w{1..n}

param v,e,y

/*approach 1 (just present my idea)*/
minimize Cost:
# sum{j in 1..P}(((1 / (1 + exp(sum{k in 1..I}(-weights[k+N*I]*(1/(1+exp(-sum{i in 1..N} weights[i+N*(k-1)] * (1 / (1+exp(-Input[j,i]))) )))) ))) - Target_output[j])^2);

#sqrt(wTw)/2

/*ve^Ty*/ + sqrt(sum{i in 1..n}w[i]^2)/2

subject to condition1{i in 1..n}:
y >= 0
/*D(Aw - eR) + y >= eye*/



/*approach 2 (just present my idea)*/
minimize Cost:
1/sqrt(wTw)

subject to condition1{i in 1..n}:
y[i]*(w[i]x[i]+b) >= 1
