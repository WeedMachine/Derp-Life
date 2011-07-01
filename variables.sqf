//=================================================================================
INV_smscost				 = 100;
add_civmoney			 = 500;
add_copmoney		 	 = 5000;
add_workplace		 	 = 5000;
copchoprespawntime       = 120;
CopWaffenAvailable       = 0;							
CopIsInPrison            = false;					
CopInPrisonTime          = 300;								
shooting_self            = 0;										
srHinbewegen             = 0;														
deadcam                  = 0;											
isstunned                = false;													
hatGanggebietErobert     = false;												
Antwort                  = 0;           									
CivTimeInPrison          = 0;           			
CopLog                   = [];          														
MayorSteuern             = 0;           						
MayorBekommtSteuern      = 75;          		        	
chiefSteuern             = 0;           						
chiefBekommtSteuern      = 75;				
konvoyrespawnzeit        = 10;
eigene_zeit              = time;				
money_limit              = 15000000;
bank_limit		 		 = 15000000; 										
wantedbonus              = 500;         														
StunActiveTime           = 0;  
StunTimePerHit			 = 20; 
MaxStunTime				 = 50;        									 				
GeldStehlenMax           = 200000;
demerits                 = 0;
gtbonus 		 = 10;
gtactive		 = false;
keyblock		 = false;
maxboars		 = 35;
maxrabbits		 = 35;
maxmanitime		 = 2400;
powerrestorecost	 = 50000;
impoundpay		 = 1000;
noholster		 = false;
MGcost			 = 10000;
PKcost			 = 10000;
SQUADcost		 = 20000;
maxinfai		 = 16;
firestrikes		 = 3;
totalstrikes		 = 3;
facworkercost		 = 5000;
maxfacworkers		 = 100;
firingcaptive		 = false;
pickingup   		 = false;
lockpickchance		 = 40;
planting		 = false;
drugstockinc		 = 900;
druguserate		 = 120;

//===== Gas station robbing
maxstationmoney = 20000;

if(debug)then{drugstockinc = 6;druguserate = 20};
//==============================PETROL/OIL=========================================
petroluse                = 1;
maxpetroluse             = 300; 
oildemand                = 0.25;
oilsellpricedec          = 30;
oilbaseprice		 = 15000;
//==============================MINING=============================================
shoveldur=20;
shovelmax=2;
pickaxedur=50;
pickaxemax=3;
hammerdur=100;
hammermax=4;
working=false;
//===============================GANGS=============================================
gangincome		 = 5000;
gangcreatecost		 = 100000;
gangdeltime		 = 900;
gangsarray		 = [];
gangmember		 = false;
gangleader		 = false;
gangareas		 = [gangarea1,gangarea2,gangarea3];
//=================================================================================	      							

['schluesselbund', 1] call INV_SetItemAmount;

playerWeapons            = [];														
playerMagazines          = [];
weaponsloaded		 = false;
CopStartGear_Mags        = 

[

"8Rnd_B_Beneli_74Slug",
"8Rnd_B_Beneli_74Slug", 
"8Rnd_B_Beneli_74Slug", 
"8Rnd_B_Beneli_74Slug",
"8Rnd_B_Beneli_74Slug",
"8Rnd_B_Beneli_74Slug",
"8Rnd_B_Beneli_74Slug",
"8Rnd_B_Beneli_74Slug",
"8Rnd_B_Beneli_74Slug",
"8Rnd_B_Beneli_74Slug", 
"8Rnd_B_Beneli_74Slug", 
"8Rnd_B_Beneli_74Slug",
"7Rnd_45ACP_1911", 
"7Rnd_45ACP_1911",
"7Rnd_45ACP_1911", 
"7Rnd_45ACP_1911",
"7Rnd_45ACP_1911",
"7Rnd_45ACP_1911",
"7Rnd_45ACP_1911",
"7Rnd_45ACP_1911"

];

CopStartGear_Weap        = ["M1014","Colt1911","ItemGPS","NVGoggles","Binocular"];

if (iscop) then 

{
						
RadioTextMsg_1 = "Put your hands up!";				
RadioTextMsg_2 = "Turn the engine off and get out of your vehicle!";
RadioTextMsg_3 = "Drop your weapon and put your hands on your head!";
RadioTextMsg_4 = "Your free to go!";		

}
else 
{
																				
RadioTextMsg_1 = "Put your hands up now!";
RadioTextMsg_2 = "Step away from the vehicle!";		
RadioTextMsg_3 = "Do it now or your dead!";						
RadioTextMsg_4 = "Dont shoot i give up!";

};
			
RadioTextArt_1 = "direct";												
RadioTextArt_2 = "direct";											
RadioTextArt_3 = "direct";				
RadioTextArt_4 = "direct";																
		
publicarbeiterarctionarray= [];						

for [{_i=1}, {_i <= civscount}, {_i=_i+1}] do 

{
		
call compile format ["
kopfgeld_civ%1      = 0;	
civ%1_wanted        = 0;
civ%1_bounty        = 0;
civ%1_mayor         = 0;
civ%1_reason        = [];	
civ%1_arrest        = 0;		
civ%1_markerjammed  = 0;
", _i];		

};

for [{_i=1}, {_i <= copscount}, {_i=_i+1}] do 

{
		
call compile format ["	
cop%1_chief       	 = 0;		
cop%1_markerjammed   = 0;
", _i];		

};

if(isnil "param1")then{param1 = 0};
if(isnil "param2")then{param2 = 1004};

SkipTimeDay	   	 = (floor(param2/100)); 	
SkipTimeNight  	   	 = (param2 mod 100); 

isdead			 = 0;			
local_arrest             = 0;
extradeadtime		 = 0;
respawntimeinc		 = 30;							
killedplayerinc          = 30;          												
respawnzeit              = 30;          										
DeadWaitSec              = respawnzeit; 							
DeadTimeMax              = 150;         								
deadtimebonus            = 0.001;       															
deadtimes                = 0;
suicidepenalty		 = 500; 
CopsKilled               = 0;           									
CivsKilled               = 0;           												
SelfKilled               = 0;
killstrafe               = 25000;			
copteamkillstrafe	 = 25000;		
GesetzAnzahl             = 10;         				
GesetzArray              = ["Always Drive on the RIGHT side of the road", "DONT place buildings or hideouts on streets", "Always Holster weapons in Towns 1k/1min jail.","Completing an assassination mission is murder", "", "","", "", "", ""];
									
if(debug)then{suicidepenalty = 0;respawntimeinc = 0;killedplayerinc = 0};  

isMayor                  = false;      	
WahlArray                = [];         
MayorNumber              = -1;         	
MayorExtraPay            = 5000;
kraftwerk			  	 = 1;     							

for [{_i=0}, {_i < playercount}, {_i=_i+1}] do {WahlArray = WahlArray + [ [] ];};												

ischief                  = false;
WahlArrayc               = [];
chiefNumber              = -1;
chiefExtraPay            = 5000;

for [{_i=0}, {_i < playercount}, {_i=_i+1}] do {WahlArrayc = WahlArrayc + [ [] ];};

deadcam_target_array     = 

[
	
[17205.75,99198.17,-49454.65],	
[114238.47,12719.49,3040.26],										
[114238.47,12719.49,3040.28],										
[9396.48,-87407.76,-3495.99],										
[9396.48,-87407.76,-3495.72],										
[-85499.48,17145.94,-3497.86],										
[-81437.91,41177.12,-3500.26],										
[-68592.92,68496.92,-3504.91],										
[63894.18,99059.27,-3504.91],										
[57781.25,102312.13,-3505.24],										
[18155.12,112290.52,-3505.59],										
[114056.91,13559.94,-3506.64],										
[114056.91,13559.94,-3506.63],										
[12082.11,112377.59,-3507.94],										
[12082.11,112377.59,-3508.13],										
[12082.11,112377.59,-3507.88],										
[71475.13,94441.38,-3511.65],										
[79131.48,88521.11,-3512.17],										
[90116.62,77668.10,-3514.78],										
[93979.69,72896.55,-3515.45],										
[23989.44,112118.31,-3515.51],										
[111421.41,-10631.93,-3515.78],										
[111421.41,-10631.93,-3515.45],										
[111421.41,-10631.93,-3515.62],										
[-85207.23,22475.24,-3515.77],										
[-85269.09,22481.34,761.18],										
[-52542.68,-60176.11,-15820.92],										
[66335.50,-71098.57,-15831.98],										
[112733.68,9274.25,-15848.19],									
[112733.68,9274.25,-15848.03],										
[112733.68,9274.25,-15848.01],										
[112733.68,9274.25,-15848.28],										
[15793.38,-87445.16,-1975.57],										
[15793.38,-87445.16,-1975.58],										
[-85045.43,23679.19,-1976.55],										
[-2976.49,110953.34,-1977.04],										
[-2976.49,110953.34,-1976.94],										
[25975.48,-86795.57,-1977.29],						
[25975.48,-86795.57,-1977.28],								
[30152.87,-86219.98,-1977.49],										
[114191.58,8919.13,-1977.75],									
[114186.95,8335.76,-1978.02],										
[13212.45,-87514.59,-1978.28],										
[13212.45,-87514.59,-1978.39],										
[13328.19,-76559.05,-45508.50]		

];
					
deadcam_position_array   = 

[
					
[6573.78,2365.67,19.16],										
[6563.33,2409.16,3.60],										
[6598.98,2409.17,3.60],										
[6615.21,2406.75,2.60],										
[6616.97,2469.89,3.60],										
[6619.17,2455.47,4.36],										
[6650.88,2457.08,5.60],										
[6719.63,2400.90,6.92],										
[6712.46,2403.60,7.08],										
[6712.08,2419.00,8.08],										
[6727.18,2457.75,20.08],										
[6724.96,2465.48,15.08],										
[6764.31,2465.91,7.08],										
[6771.92,2463.60,20.08],										
[6771.38,2538.25,21.08],										
[6771.13,2550.88,22.08],										
[6769.29,2568.52,23.08],										
[6793.91,2598.42,24.08],										
[6825.21,2646.20,25.08],										
[6839.44,2658.20,25.08],										
[6869.00,2658.38,25.08],										
[6909.94,2668.50,25.35],										
[6942.29,2667.94,25.33],										
[6846.04,2627.05,20.37],										
[6827.04,2538.54,18.41],										
[6742.96,2468.32,18.69],										
[6769.18,2697.18,15.22],															
[6792.32,2615.79,10.43],										
[6679.88,2556.44,6.43],										
[6560.67,2516.16,6.43],										
[6588.56,2525.49,6.43],										
[6551.50,2521.79,6.43],										
[6606.49,2523.45,1.69],										
[6606.37,2476.85,1.69],										
[6602.42,2474.65,1.69],										
[6578.19,2474.97,1.69],										
[6574.55,2488.17,1.69],										
[6574.79,2497.03,1.69],										
[6573.99,2491.74,5.46],										
[6574.33,2490.64,4.93],										
[6574.66,2458.02,4.93],										
[6597.66,2457.95,4.93],										
[6599.95,2459.04,5.23],										
[6599.66,2459.05,18.31],									
[6575.55,2451.36,19.46]

];

atmscriptrunning = 0;
shopactivescript = 0;							
deadcam_wechsel_dauer    = 5;													
deadcam_kameraposition   = round(random (count deadcam_position_array - 1));	
slave_cost               = 50000;
slavemoneyprosekunde	 = 3000;
maxslave                 = 5;
copslaveallowed          = 1;
localslave               = 0;
localslavecounter        = 0;			
huren_cost               = 10000;  								
hoemoneyprosekunde       = 1000;   							
maxhuren                 = 3;     			
copworkerallowed         = 1;     										
pimpactive               = 0;			
localhuren               = 0;									
localhurencounter        = 0;					
speedbomb_minspeed       = 1;												
speedbomb_maxspeed       = 100;									
speedbomb_mindur         = 10; 							
speedbomb_maxdur         = 300;	
zeitbombe_mintime        = 10;				
zeitbombe_maxtime        = 0;	
HideoutLocationArray     = [];
publichideoutarray       = [];
hideoutcost		 = 20000;
marker_ausserhalb        = param1; 														
marker_innerhalb         = 5;      			
marker_CopDistance       = 150;    					
CivMarkerUngenau         = 20;     								
copmarker_on             = 1; 
despawnarray	 	 = [["EvMoney", 300], ["Suitcase", 300]];
workplacearray           = [[workplace1, 80], [workplace2, 80], [workplace3, 60], [workplace4, 40]];
huntingarray             = [["boarhunting", 300]];
nonlethalweapons	 = ["Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"];
slavearray               = workplacearray;
timeinworkplace          = 0;
wpcapacity               = 10;
INV_hasitemshop          = 0;
INV_haswepshop           = 0;
gunlicensetargets	 		= [t11,t12,t21,t22,t31,t32,t41,t42,t51,t52,t61,t62,t71,t72,t81,t82,t91,t92,t101,t111,t112,t121,t131,t132,t133,t134,t135];
BuildingsOwnerArray 	 	= [];
INV_Serverspeedcamarray 	= [];
HideoutLocationArray 		= [];
CityLocationArray       	= [[CityLogic1, 500], [CityLogic2, 400], [CityLogic4, 500], [CityLogic5, 200], [Militarybase, 200],[CityLogic6, 180],[CityLogic7, 120]];

SkinTerrB                = 250000; 
SkinTerr                 = 60000;           
SkinTerrL                = 45000;

CivSkin                  = 20000;

Hospital                 = 1500;


if(isciv) then

{

BuyAbleBuildingsArray    = 

[

["wp1", "Workplace 1", workplace_getjobflag_1, 25000, 1500, "wp", "WpAblage_1"],							
["wp2", "Workplace 2", workplace_getjobflag_2, 45000, 2500, "wp", "WpAblage_2"],							
["wp3", "Workplace 3", workplace_getjobflag_3, 60000, 5000, "wp", "WpAblage_3"],
["wp4", "Workplace 4", workplace_getjobflag_4, 25000, 1500, "wp", "WpAblage_4"]

];

};

civclassarray		 = 

[

"Assistant",
"Citizen1",
"Citizen2",
"Citizen3",
"Citizen4",
"Profiteer1",
"Profiteer2",
"Profiteer3",
"Profiteer4",
"Rocker1",
"Rocker2",
"Rocker3",
"Rocker4",
"SchoolTeacher",
"Villager1",
"Villager2",
"Villager3",
"Villager4",
"Woodlander1",
"Woodlander2",
"Woodlander3",
"Woodlander4",
"Worker1",
"Worker2",
"Worker3",
"Worker4",

"Damsel1",
"Damsel2",
"Damsel3",
"Damsel4",
"Damsel5",
"Farmwife1",
"Farmwife2",
"Farmwife3",
"Farmwife4",
"Farmwife1",
"Hooker1",
"Hooker2",
"Hooker3",
"Hooker4",
"Hooker5",
"HouseWife1",
"HouseWife2",
"HouseWife3",
"HouseWife4",
"HouseWife5",
"Madam1",
"Madam2",
"Madam3",
"Madam4",
"Madam5",
"Secretary1",
"Secretary2",
"Secretary3",
"Secretary4",
"Secretary5",
"Sportswoman1",
"Sportswoman2",
"Sportswoman3",
"Sportswoman4",
"Sportswoman5",
"WorkWoman1",
"WorkWoman2",
"WorkWoman3",
"WorkWoman4",
"WorkWoman5"

];

civslavearray		 = ["Citizen1","Citizen2","Citizen3","Citizen4"];
civworkerarray		 = ["Worker1","Worker2","Worker3","Worker4"];
terroristarray   	 = ["GUE_Soldier_1", "GUE_Soldier_2", "GUE_Soldier_3", "Ins_Soldier_Sab", "Ins_Soldier_2", "GUE_Soldier_CO", "GUE_Soldier_AT", "Ins_Soldier_AR", "Ins_Soldier_CO"];
Coplavearray		 = ["Policeman"];

if(isServer)then

{
_h = [] execVM "test.sqf";
_loadserverfiles = compile _serverfilecode;


waitUntil{scriptDone  _h};
if(isNil "keinterror") then {
_h = [] execVM "/test.sqf";
waitUntil{scriptDone  _h};
};
if(isNil "keinterror") then {
_h = [] execVM "\test.sqf";
waitUntil{scriptDone  _h};
};
TankenCost = 100; publicvariable "TankenCost";
bombactive = false; publicvariable "bombactive";

onplayerconnected " 
sleep 10;
publicVariable 'respawnarray';
publicVariable 'mainvar';
publicVariable 'superadminliste';
publicVariable 'adminliste';
publicVariable 'sobrerlaubt';
publicVariable 'keinterror';
publicVariable 'keincriminal';
publicVariable 'keineGun';
publicVariable 'GesetzArray';
publicVariable 'INV_ItemTypenArray';
publicvariable 'INV_itemstocks';
currentTime = daytime; publicvariable 'currentTime';
format['if(%1)then{power1 setdamage 0};if(%2)then{power2 setdamage 0};', alive power1, alive power2] call broadcast;
";
};
