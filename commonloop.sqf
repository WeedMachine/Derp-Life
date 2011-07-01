_art = _this select 0;

if (_art == "clientloop") then 

{

_w1 = 0;
_w2 = 0;
_w3 = 0;
_LetzterKontostand = 0;

while {true} do 

	{

	if(vehicle player != player and !(vehicle player in INV_VehicleArray) and !(vehicle player in INV_ServerVclArray))then{deletevehicle (vehicle player)};

	if ((_LetzterKontostand != Kontostand) and (Kontostand != StartGeld)) then 

		{								
	
		["Kontostand", Kontostand] spawn ClientSaveVar;	
		_LetzterKontostand = Kontostand;

		};
	
	if(iscop and alive player and weaponsloaded)then

		{

		_updateweps = false;
		_updatemags = false;

		_weapons = weapons player;
		
		for [{_i=0}, {_i < (count _weapons)}, {_i=_i+1}] do 

			{

			if(!((_weapons select _i) in playerweapons))then

				{

				playerweapons = playerweapons + [(_weapons select _i)];
				_updateweps = true;
				

				};

			};

		_weapons = weapons player;

		for [{_i=0}, {_i < (count playerweapons)}, {_i=_i+1}] do 

			{

			if(!((playerweapons select _i) in _weapons))then

				{

				playerweapons = playerweapons - [(playerweapons select _i)];
				_updateweps = true;

				};

			};

		_mags	 = magazines player;

		for [{_i=0}, {_i < (count _mags)}, {_i=_i+1}] do 

			{

			if((_i + 1) > count playermagazines)then

				{

				playermagazines = playermagazines + [(_mags select _i)];
				_updatemags = true;

				};

			};

		_mags	 = magazines player;

		for [{_i=0}, {_i < (count playermagazines)}, {_i=_i+1}] do 

			{

			if((_i + 1) > count _mags)then

				{

				playermagazines set[_i, ""];
				_updatemags = true;

				};

			};

		_mags	 = magazines player;

		for [{_i=0}, {_i < (count _mags)}, {_i=_i+1}] do 

			{

			if((playermagazines select _i) != (_mags select _i))then

				{

				playermagazines set[_i, ""];
				_updatemags = true;

				};

			};

		playermagazines = playermagazines - [""];

		if(_updateweps)then{["playerweapons", playerweapons] spawn ClientSaveVar};
		if(_updatemags)then{["playermagazines", playermagazines] spawn ClientSaveVar};

		};

	coparray          = [cop1,   cop2,   cop3,   cop4,   cop5,   cop6,	cop7,	cop8,	cop9,	cop10,	cop11,	cop12,	cop13,	cop14,	cop15,	cop16,	cop17];
	civarray          = [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34];
	playerarray 	  =	[civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34, cop1, cop2, cop3, cop4, cop5, cop6, cop7,	cop8, cop9, cop10, cop11, cop12, cop13, cop14, cop15, cop16, cop17];

	{if ((player distance (_x select 0)) < (_x select 1)) then {timeinworkplace = timeinworkplace + 1;};} forEach workplacearray;
	
	if (!debug and (player distance terrorhideoutlogic <= 900 or player distance assassinlogic <= 500 or player distance deadcamlogic < 400) and alive player and iscop) then {titleText [localize "STRS_southChernarus_area", "plain"]};

	if (!debug and (player distance terrorhideoutlogic <= 750 or player distance assassinlogic <= 350 or player distance deadcamlogic < 400) and alive player and iscop) then {call TeleToMainbaseFunc;};	

	if(alive player and isciv and player distance Militarybase > 100 and player distance Militarybase <= 160)then{titleText ["This is a restricted area! Turn back or you will be shot!", "plain down"]};
	if(alive player and isciv and captive player and player distance Militarybase <= 100 and !(player call ISSE_IsVictim))then{format['%1 setcaptive false;%1 call reveal;', player] call broadcast};
	if(alive player and isciv and !firingcaptive and !(captive player) and player distance Militarybase > 100)then{format['%1 setcaptive true', player] call broadcast};
	if(isciv and player call ISSE_IsVictim and !(captive player))then{format['%1 setcaptive true', player] call broadcast};
		
	_veh = vehicle player;
	
	if ((player distance getmarkerpos "policebase" < 250 or player distance getmarkerpos "policebase2" < 12) and isciv and !(_veh isKindOf "Air") and !(_veh isKindOf "Ship")) then 

		{

		if (_veh != player) then 
 	
			{
			
			_veh setvelocity [0,0,0];
			player Action ["eject", _veh];
			player Action ["GET OUT", _veh];
			
			};
				if(player distance getmarkerpos "policebase" < player distance getmarkerpos "policebase2" ) then
				{
				_veh setpos getmarkerpos "civarea";
				player setpos getmarkerpos "civarea";
				}
				else
				{
				_veh setpos getmarkerpos "civarea2";
				player setpos getmarkerpos "civarea2";
				};
		player groupchat "You have been teleported out of the cop base!"; 

		};

	if ((alive player) and (DeadWaitSec > (respawnzeit+deadtimebonus))) then 

		{

		DeadWaitSec = DeadWaitSec - deadtimebonus;

		};

	_geld = 'geld' call INV_GetItemAmount;

	if (_geld < 0) then {['geld', 0] call INV_SetItemAmount; _geld = 0;};

	if (Kontostand > bank_limit) then {Kontostand = bank_limit;player groupChat localize "STRS_maxbank";};
	if (_geld > money_limit) then {['geld', money_limit] call INV_SetItemAmount; player groupChat localize "STRS_maxmoney";};

	{	

	if ((rating _x) < 0) then {_x addRating (abs (rating _x))};
	if ((score _x) < 0)  then {_x addScore  (abs (score _x))};

	} forEach playerarray;

	if(!alive HQ)then

		{
	
		0 fademusic 1;
		sleep 3;
		0 fademusic 1;
		playmusic "Track16_Valentine";
		player setpos [(getpos militarybase select 0), (getpos militarybase select 1), (getpos militarybase select 2) + 5500];
		setViewDistance 6000;
		titletext ["The Military Headquaters has been destroyed! The Chernarus Revolution is complete!", "PLAIN", 60];
		format['[%1] exec "ca\air2\halo\data\Scripts\HALO.sqs";', player] call broadcast;
		player removeaction 0;
		player removeaction 1;
		player removeaction 2;
		sleep 81.5;
		endMission "END1";

		};		

	sleep 1;

	};

};


if (_art == "serverloop1") then 

{

_counter = 0;

while {true} do 

	{

	if(!alive HQ)then{sleep 85;endMission "END1";};

	
	coparray          = [cop1,   cop2,   cop3,   cop4,   cop5,   cop6,	cop7,	cop8,	cop9,	cop10,	cop11,	cop12,	cop13,	cop14,	cop15,	cop16,	cop17];
	civarray          = [civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34];
	playerarray 	  =	[civ1, civ2, civ3, civ4, civ5, civ6, civ7, civ8, civ9, civ10, civ11, civ12, civ13, civ14, civ15, civ16, civ17, civ18, civ19, civ20, civ21, civ22, civ23, civ24, civ25, civ26, civ27, civ28, civ29, civ30, civ31, civ32, civ33, civ34, cop1, cop2, cop3, cop4, cop5, cop6, cop7,	cop8, cop9, cop10, cop11, cop12, cop13, cop14, cop15, cop16, cop17];

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

if(true)exitwith{};

for [{_i=0}, {_i < (count publichideoutarray)}, {_i=_i+1}] do 

		{

		_civ = (publichideoutarray select _i) select 0;

		if (!(_civ call ISSE_UnitExists) or isNull(((publichideoutarray select _i) select 1) select 0)) then 

			{

				{

				if (NOT(isNull _x)) then 

					{

					_x setVehicleinit "";
					deletevehicle _x;

					};

				} forEach ((publichideoutarray select _i) select 1);

			publichideoutarray SET [_i, ""];
			publichideoutarray = publichideoutarray - [""];

			};

		};
