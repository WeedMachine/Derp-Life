respawnarray 		= [respawn1,respawn2,respawn3,respawn4,respawn5,respawn6,respawn7,respawn8,respawn9,respawn10,respawn11,respawn12];
CityLocationArray   = [[CityLogic1, 500], [CityLogic2, 400], [CityLogic4, 500], [CityLogic5, 200], [Militarybase, 200],[CityLogic6, 180],[CityLogic7, 120]];
sobrerlaubt 		= [];
keineGun 			= [];
keincriminal 		= [];
keinterror 			= [];
adminliste 			= ["976769"];
superadminliste 	= ["976769"];
mainvar 			= true;
publicVariable "mainvar";
publicVariable "respawnarray";



//Fucntions
//#0
ServerSchleifeTest =
{
while{true} do
{
player groupchat "Server Active";
sleep 4;
};
};


//#1
ServerSchleife =
{
_counter = 0;
while {true} do 

	{

	if(!alive HQ)then{sleep 85;endMission "END1";};

	
	coparray          = [cop1,   cop2,   cop3,   cop4,   cop5,   cop6,	cop7,	cop8,	cop9,	cop10,	cop11,	cop12,	cop13,	cop14,	cop15,	cop16,	cop17];
	civarray          = [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34];
	playerarray 	  =	[civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34, cop1, cop2, cop3, cop4, cop5, cop6, cop7,	cop8, cop9, cop10, cop11, cop12, cop13, cop14, cop15, cop16, cop17];
	
	if(!serverisrunning) then {[] call INV_GetArrays;};
	
	_counter = _counter + 1;
	
	if(_counter >= 60)then

		{ 

		_counter = 0;

		for [{_i=0}, {_i < (count publicarbeiterarctionarray)}, {_i=_i+1}] do 

			{

			if ( (not((format["%1", ((publicarbeiterarctionarray select _i) select 1)]) call ISSE_UnitExists)) or (isNull((publicarbeiterarctionarray select _i) select 0)) ) then 

				{

				if (not(isNull((publicarbeiterarctionarray select _i) select 0))) then 

					{

					_object = ((publicarbeiterarctionarray select _i) select 0);
					_object setpos [0,0,0]; 																																								
					_object setVehicleinit "";
					deletevehicle _object;	

					};

				publicarbeiterarctionarray SET [_i, ""];
				publicarbeiterarctionarray = publicarbeiterarctionarray - [""];	

				};

			};

		};

	for [{_i=0}, {_i < (count playerarray)}, {_i=_i+1}] do 

		{

		_player = (playerarray select _i);
				
		if (!isnull _player and isnull(call compile format["oldciv%1", (_i + 1)]) and !isPlayer _player) then {deletevehicle _player};
		
		};

	sleep 1;

	};
};


//#2
ServerschleifeAI =
{

while{true}do

	{

	[0,0,0,"SQUAD"] execVM "recruitai.sqf";

	if(!alive MG1gunner)then{_gunner = MG1gunner;sleep 60;if(!isnull _gunner)then{deletevehicle _gunner};};
	if(!alive MG2gunner)then{_gunner = MG2gunner;sleep 60;if(!isnull _gunner)then{deletevehicle _gunner};};
	if(!alive MG3gunner)then{_gunner = MG3gunner;sleep 60;if(!isnull _gunner)then{deletevehicle _gunner};};
	if(!alive MG4gunner)then{_gunner = MG4gunner;sleep 60;if(!isnull _gunner)then{deletevehicle _gunner};};

	if(!alive PK1gunner)then{_gunner = PK1gunner;sleep 60;if(!isnull _gunner)then{deletevehicle _gunner};};
	if(!alive PK2gunner)then{_gunner = PK2gunner;sleep 60;if(!isnull _gunner)then{deletevehicle _gunner};};
	if(!alive PK3gunner)then{_gunner = PK3gunner;sleep 60;if(!isnull _gunner)then{deletevehicle _gunner};};
	if(!alive PK4gunner)then{_gunner = PK4gunner;sleep 60;if(!isnull _gunner)then{deletevehicle _gunner};};

	sleep 1;

	};

};


//#3
ServerschleifeMayor =
{	

_currentMayor = -1;												
	
while {true} do 

	{
																																																															
	for [{_i=0}, {_i < 51}, {_i=_i+1}] do 

		{	
																																									
		sleep 60;																					

		for [{_k=0}, {_k < count(WahlArray)}, {_k=_k+1}] do 

			{																																								

			if (not((playerstringarray select _k) call ISSE_UnitExists)) then {WahlArray SET [_k, [] ];};

			};			

		};																																																

	_MaxStimmen = 1;																		
	_MaxPos     = -1;												

	for [{_i=0}, {_i < count(WahlArray)}, {_i=_i+1}] do 

		{																																										

		if ( ((count (WahlArray select _i)) > _MaxStimmen) and ((playerstringarray select _i) call ISSE_UnitExists) ) then 

			{
																																												
			_MaxStimmen = (count (WahlArray select _i));																																																				
			_MaxPos     = _i;		

			};		

		};																																										

	if (_MaxPos == -1) then 

		{
																																				
		"hint localize ""STRS_regierung_nomajor"";" call broadcast;																					
		_currentMayor = -1;																		
		
		} else {
																																																																		
		if (_currentMayor == _MaxPos) then 

			{
																																												
			"hint localize ""STRS_regierung_majorstays"";" call broadcast;																																										

			} else {																																				

			_currentMayor = _MaxPos;																																																				
			_MayorString  = (playerstringarray select _currentMayor);																																																				
			format["hint format[localize ""STRS_mayor_new"", ""%3"", %2]; if ((rolenumber-1) == %1) then {isMayor = true; true call TurnMayorFunc;} else {isMayor = false;false call TurnMayorFunc;};", _MaxPos, _MaxStimmen, _MayorString] call broadcast;		
			};		

		};	

	MayorNumber = _currentMayor;												
	PUBLICVARIABLE "MayorNumber";			

	};

};
//#4
ServerschleifeChief =
{	

_currentchief = -1;

while {true} do 

	{

	for [{_i=0}, {_i < 51}, {_i=_i+1}] do 

		{	

		sleep 30;	

		for [{_k=0}, {_k < count(WahlArrayc)}, {_k=_k+1}] do 

			{

			if (not((playerstringarray select _k) call ISSE_UnitExists)) then {WahlArrayc SET [_k, [] ]};	

			};

		};

	_MaxStimmen = 0;
	_MaxPos     = -1;

	for [{_i=0}, {_i < count(WahlArrayc)}, {_i=_i+1}] do 

		{

		if ( ((count (WahlArrayc select _i)) > _MaxStimmen) and ((playerstringarray select _i) call ISSE_UnitExists) ) then 

			{	

			_MaxStimmen = (count (WahlArrayc select _i));
			_MaxPos     = _i;

			};

		};	

	if (_MaxPos == -1) then 

		{

		"hint localize ""STRS_chief_nomajor"";" call broadcast;_currentchief = -1;

		} 
		else 
		{

		if (_currentchief == _MaxPos) then 

			{

			"hint localize ""STRS_chief_majorstays"";" call broadcast;

			} 
			else 
			{

			_currentchief = _MaxPos;
			_chiefString  = (playerstringarray select _currentchief);
			format["hint format[localize ""STRS_chief_new"", ""%3"", %2]; if ((rolenumber-1) == %1) then {ischief = true; true call TurnChiefFunc;} else {ischief = false;};", _MaxPos, _MaxStimmen, _chiefString] call broadcast;	
		
			};

		};

	chiefNumber = _currentchief;
	PUBLICVARIABLE "chiefNumber";

	};

};
//#5
ServerschleifeGangs =
{

_counter = 0;

while {true} do

	{

	for "_c" from 0 to (count gangsarray - 1) do 

		{

		_gangarray = gangsarray select _c;
		_members   = _gangarray select 1;
		
		if(_counter >= gangdeltime and count _members == 0)exitwith{format['gangsarray set[%1, 0]; gangsarray = gangsarray - [0];', _c] call broadcast};

		_lname	   = _members select 0;
			
		if(isnull ([_lname, playerarray] call INV_findunit))then

			{

			_members = _members - [_lname];
			_gangarray set[1, _members];
			format['gangsarray set[%1, %2]', _c, _gangarray] call broadcast;

			};

		};

	if(_counter >= gangdeltime)then{_counter = 0};

	_counter = _counter + 60;

	sleep 60;

	};

};


//#6
ServerSchleifeDrugs =
{
while {true} do

{

for [{_i=0}, {_i < (count drugsellarray)}, {_i=_i+1}] do 

	{

	_obj 	= drugsellarray select _i;
	_list 	= _obj getvariable "druglist";
	
	if(!isnil "_list") then

		{
		
		_count = count _list;
	
		for [{_j=0}, {_j < _count}, {_j=_j+1}] do 

			{

			_arr = _list select _j;
			_num = (_arr select 1) - 1;
			if(_num == 0)then{_list set[_j, 0]; _list = _list - [0]}else{_arr set[1, _num];_list set[_j, _arr]};
		
			};

		if(_count > 0)then{_obj setvariable["druglist", _list, true]};

		};

	};

sleep druguserate;

};
};


//#7
ServerSchleifeHQBomb =
{
while {true} do

{

waituntil {bombactive};
playsound "Bank_alarm";
titletext["Terrorists have planted a bomb on the military HQ! The cops have 10 minutes to defuse the bomb!", "PLAIN"];
hint "Terrorists have planted a bomb on the military HQ! The cops have 10 minutes to defuse the bomb!";
server globalchat "Terrorists have planted a bomb on the military HQ! The cops have 10 minutes to defuse the bomb!";
HQbombtimer = 500;

while {bombactive} do

	{

	titletext[format["Detonation in: %1 seconds", HQbombtimer], "PLAIN DOWN"];

	if(HQbombtimer mod 30 == 0 and isServer)then{publicvariable "HQbombtimer"; hint "updating"};

	if(HQbombtimer == 0 and isServer)then

		{

		publicvariable "HQbombtimer";
		"Bo_GBU12_LGB" createvehicle getpos HQ;
		HQ setdamage 1;
		bombactive = false; publicvariable "bombactive";

		};

	HQbombtimer = HQbombtimer - 1;

	sleep 1;

	};

};
};


//#8
ServerSchleifeTankstellenRaub =
{
robpoolsafe1 		 = 0; 
robpoolsafe2 		 = 0;
robpoolsafe3 		 = 0;

if(debug)then

{

robpoolsafe1 		 = 5000; 
robpoolsafe2 		 = 5000;
robpoolsafe3 		 = 5000;

};

while{true} do

{

if(robpoolsafe1 < maxinsafe)then{robpoolsafe1 = robpoolsafe1 + round random 2000; publicvariable "robpoolsafe1"};
if(robpoolsafe2 < maxinsafe)then{robpoolsafe2 = robpoolsafe2 + round random 2000; publicvariable "robpoolsafe2"};
if(robpoolsafe3 < maxinsafe)then{robpoolsafe3 = robpoolsafe3 + round random 2000; publicvariable "robpoolsafe3"};

sleep 30;

};
};


//#9
ServerSchleifeHunting =
{
while{true}do

{

for [{_i=0}, {_i < (count huntingarray)},{_i=_i+1}] do 

	{
	
	_pos  	= getmarkerpos ((huntingarray select _i) select 0);
	_area 	= (huntingarray select _i) select 1;
	_exit 	= false;

	_boars 	= nearestobjects [_pos, ["wildboar"], _area];
	_boars2 = nearestobjects [_pos, ["wildboar"], (_area + 200)]; 
	if(count _boars2 > count _boars)then{deletevehicle (_boars2 select (count _boars2 - 1))};

	//_rabbits  = nearestobjects [_pos, ["rabbit"], _area];
	//_rabbits2 = nearestobjects [_pos, ["rabbit"], (_area + 200)]; 
	//if(count _rabbits2 > count _rabbits)then{deletevehicle (_rabbits2 select (count _rabbits2 - 1))};
	
	{if(_x distance _pos < _area)exitwith{_exit=true}} foreach playerarray; 

	if(_exit)exitwith{};

	_boars = nearestobjects [_pos, ["wildboar"], _area];
	if(count _boars < maxboars)then{createAgent ["Wildboar", _pos, [], _area, "NONE"];};
	
	//_rabbits  = nearestobjects [_pos, ["rabbit"], _area]; hint str count _rabbits;
	//if(count _rabbits < 5)then{_unit = createAgent ["rabbit", _pos, [], _area, "NONE"];};
	
	};

sleep 120;

};
};


//#10
ServerFunktionCreateAtms =
{
[alight, 1, 0] call setPitchBank;
[alight2, 1, 0] call setPitchBank;
[agunbox, 0, 3] call setPitchBank;

atv1 attachTo [atm1, [-0.7,0,0.7]];
atv2 attachTo [atm2, [-0.7,0,0.7]];
atv3 attachTo [atm3, [-0.7,0,0.7]];
atv4 attachTo [atm4, [-0.7,0,0.7]];
atv5 attachTo [atm5, [-0.7,0,0.7]];

atv1 setdir -90;
atv1 setpos getpos atv1;
atv2 setdir -90;
atv2 setpos getpos atv2;
atv3 setdir -90;
atv3 setpos getpos atv3;
atv4 setdir -90;
atv4 setpos getpos atv4;
atv5 setdir -90;
atv5 setpos getpos atv5;

anb1 attachTo [atm1, [-1.05,0.03,0.01]]; 
anb1 setVectorDirAndUp [[0, 0, 1],[-2, 0, 0]];
anb2 attachTo [atm2, [-1.05,0.03,0.01]]; 
anb2 setVectorDirAndUp [[0, 0, 1],[-2, 0, 0]];
anb3 attachTo [atm3, [-1.05,0.03,0.01]]; 
anb3 setVectorDirAndUp [[0, 0, 1],[-2, 0, 0]];

anb1 setpos getpos anb1;
anb2 setpos getpos anb2;
anb3 setpos getpos anb3;
};


//#11
ServerSchleifeTankstellenRaub2 =
{
while {true} do
{
_randomamount = ceil ((random 250) + 250);
if (station3money < maxstationmoney) then
	{	
	station1money = station1money + _randomamount;
	if (station1money > maxstationmoney) then {station1money = maxstationmoney;};
	};

if (station3money < maxstationmoney) then
	{
	station2money = station2money + _randomamount;
	if (station2money > maxstationmoney) then {station2money = maxstationmoney;};
	};
if (station3money < maxstationmoney) then
	{
	station3money = station3money + _randomamount;
	if (station3money > maxstationmoney) then {station3money = maxstationmoney;};
	};
if (station4money < maxstationmoney) then
	{
	station4money = station4money + _randomamount;
	if (station4money > maxstationmoney) then {station4money = maxstationmoney;};
	};
publicvariable "station1money";
publicvariable "station2money";
publicvariable "station3money";
publicvariable "station4money";

sleep 30;
};
};


//#12
ServerSchleifeMarkerCiv =
{

_UpdateArray = [];															
_MarkerArray = [];

	{
																
	_markername = format ["%1_marker", _x];																														
	_civmarker  = createmarker [_markername, [-1000, -1000] ]; 																		
	_civmarker  setMarkerShape "ICON";				
	_markername setMarkerType  "Dot";																
	_markername setMarkerColor "ColorYellow";																										
	_markername setMarkerText  format["", _x];																						
	_markername setMarkerSize  [1.2, 1.2];												
	_UpdateArray = _UpdateArray + [0];																						
	_MarkerArray = _MarkerArray + [_markername];	

	} forEach civstringarray;

while {true} do 

	{																					

	for [{_i=0}, {_i < (count civstringarray)}, {_i=_i+1}] do 

		{																																										

		_civ             = civarray select _i;									
		_civstring       = civstringarray select _i;						
		_LastUpdate      = _UpdateArray select _i;																																							
		_markername      = _MarkerArray select _i;
																																															
		if (isnull _civ or !isPlayer _civ) then 

			{

			_markername setMarkerPos (getmarkerpos "marker_dead");

			} 
			else 
			{
			
			if ((call compile format ["%1_wanted;", _civstring]) == 1) then {_markername setMarkerColor "ColorRed";} 
			else 
			{
				if ((call compile format ["%1_mayor;", _civstring]) == 1) then
				{
				_markername setMarkerColor "ColorBlack";
				}
				else
				{
					if ((call compile format ["%1_bounty;", _civstring]) == 1 and iscop) then
					{
					_markername setMarkerColor "ColorBrown";
					}
					else
					{
					_markername setMarkerColor "ColorYellow";
					};
				};
			};
			_IsInVisibleArea = false; 																																								
			{if ((_civ distance (_x select 0)) < (_x select 1)) then {_isInVisibleArea = true;};} forEach CityLocationArray;																								
			{if ((_civ distance _x) < (marker_CopDistance))     then {_isInVisibleArea = true;};} forEach coparray;																																																																																																								
			
			if(isadmin)then
			{
			_isInVisibleArea = true;
			};
			
			if (not(_IsInVisibleArea)) then 

				{

				if (marker_ausserhalb > 0) then 

					{	
					
					if (time > (_LastUpdate+marker_ausserhalb)) then 

						{

						_posX = ((getpos _civ) select 0) + (random CivMarkerUngenau) - (random CivMarkerUngenau);																																																																													
						_posY = ((getpos _civ) select 1) + (random CivMarkerUngenau) - (random CivMarkerUngenau);																																																																						
						if (alive _civ) then {_markername setMarkerPos [_posX, _posY];};																																																								
						_UpdateArray SET [_i, time];																																																						
						
						};																														

					} 
					else 
					{
																																				
					_markername setMarkerPos (getmarkerpos "marker_dead");																																																							

					};																																				

				} 
				else 
				{
																									
				if (alive _civ) then {_markername setMarkerPos [(getpos _civ select 0), (getpos _civ select 1)];};																									
				_UpdateArray SET [_i, time];

				};

			};

		};

	sleep marker_innerhalb;

	};

};


//Aufrufe
if(!isDedicated) then {[] spawn ServerSchleifeTest;};
[] spawn ServerSchleife;
[] spawn ServerschleifeAI;
[] spawn ServerschleifeMayor;
[] spawn ServerschleifeChief;
[] spawn ServerschleifeGangs;
[] spawn ServerSchleifeDrugs;
[] spawn ServerSchleifeHQBomb;
[] spawn ServerSchleifeTankstellenRaub;
[] spawn ServerSchleifeHunting;
[] spawn ServerSchleifeTankstellenRaub2;
[] spawn ServerSchleifeMarkerCiv;

[] call ServerFunktionCreateAtms;

[] execVM "drugreplenish.sqf";		//Unötig	?
["Mi17_medevac_CDF"] execVM "copchoprespawn.sqf";	//Unötig ?
["MH60S"] execVM "copchoprespawn.sqf";		//Unötig ?

//=======================rob gas station init and variables================
station1money = 5000;
publicvariable "station1money";

station2money = 5000;
publicvariable "station2money";

station3money = 5000;
publicvariable "station3money";

station4money = 5000;
publicvariable "station4money";
//No Move
for [{_i=0}, {_i < (count INV_ItemShops)}, {_i=_i+1}] do {((INV_ItemShops select _i) select 0) execVM "nomove.sqf"; sleep 0.2;};
for [{_i=0}, {_i < (count workplacejob_deliveryflagarray)}, {_i=_i+1}] do {(workplacejob_deliveryflagarray select _i) execVM "nomove.sqf"; sleep 0.2;};

