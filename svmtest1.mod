param mtest := 50; #D

set INPUT_POINTStest := {1..n};
set DATASETtest := {1..mtest};

param x_test{DATASETtest,INPUT_POINTStest};
param y_test{DATASETtest};

param test{DATASETtest};

param correct; 
param wrong;


#param total_digital; 
#param total_miss;


data datasvm2withoutStarTest.dat;

let correct := 0; let wrong := 0;

#let total_hits :=0; let total_misses:=0;

#Checking number of misses for digit 3
for {i in {1..mtest}} {

	#Finding where the point is placed on the hyperplane
	let test[i] := sum {j in POINTS} (x_test[i,j]*w[j]) - b;
	if (test[i] >= 0) then 
	{
		let y_test[i] := 1; 
		let correct := correct+1
	} 
	else 
	{
		let y_test[i] := -1; 
		let wrong := wrong+1
	};
};



display y_test;
		
display correct; 
display wrong;


param Accuracy_Percent := (correct)/mtest;
param Error_Percent := (wrong)/mtest;

display Accuracy_Percent;
display Error_Percent;