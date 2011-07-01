playing_lotto = 0;

LottoArray = 

[

//	0			 	1				 2			3				4   	Position im Array
["lotto1", 	"Cheap ticket",	 		100,		300,		 	20],							
["lotto2", 	"Normal ticket", 		2000,		6000, 		 	20],			
["lotto3", 	"Super ticket",	 		5000, 		15000, 		 	20],								
["lotto4", 	"Super Plus ticket",	10000,  	30000, 			20],								
["lotto5",	"Mega ticket",			100000, 	1000000, 		20]

];

// Orte an denen man Lotto spielen kann( Händler)
LottoFlags = 									

[

[shop1,["lotto1", "lotto2", "lotto3"]],
[shop2,["lotto1", "lotto2", "lotto3"]],
[shop3,["lotto1", "lotto2", "lotto3"]],
[shop4,["lotto1", "lotto2", "lotto3", "lotto4"]]
//[DP23,["lotto1", "lotto2", "lotto3", "lotto5"]]			cheater lotto
//[DP24,["lotto1", "lotto2", "lotto3", "lotto5"]]			cheater lotto

];

GetLottoArray = 

{

private ["_c", "_lotto"];	

for "_c" from 0 to (count LottoArray - 1) do

	{	

	if (((LottoArray select _c) select 0) == _this) exitWith { (LottoArray select _c) };

	};

};