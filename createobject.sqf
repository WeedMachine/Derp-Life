_art = _this select 0;

if (_art == "use") then 

{

_item    = _this select 1;
_class	 = _item call INV_getitemClassName;
_exitvar = 0;


if (player != vehicle player) exitWith {player groupChat localize "STRS_inv_item_sperre_invcl";};

	{

	if (player distance (_x select 0) < (_x select 1)) exitWith 

		{

		_exitvar = 1;
		player groupChat localize "STRS_inv_item_sperre_hiernicht";

		};

	} forEach INV_SperrenVerbotArray;

if (_exitvar == 1) exitWith {};

[_item, -1] call INV_AddInventoryItem;	

_pos = [(position player select 0) + (sin(getdir player)*2), (position player select 1) + (cos(getdir player)*2), 0];
_obj = _class createvehicle [0, 0, 0];
_obj setdir getdir player;
_obj setpos _pos;
_time = round time;
lastbuilding = _obj;
playerbaut = true;

Rechtsverschieben 	= player addaction ["Move 1 meter right", "noscript.sqf",' _winkel = getdir lastbuilding; _pos=[ ((position lastbuilding select 0) + cos((360 - _winkel))), ((position lastbuilding select 1) + sin((360 - _winkel))) , (position lastbuilding select 2)]  ; lastbuilding setpos _pos;'];
Linksverschieben 	= player addaction ["Move 1 meter left", "noscript.sqf",'_winkel = getdir lastbuilding; _pos=[ ((position lastbuilding select 0) - cos((360 - _winkel))), ((position lastbuilding select 1) - sin((360 - _winkel))), (position lastbuilding select 2)] ; lastbuilding setpos _pos;'];
Vorverschieben 		= player addaction ["Move 1 meter forward", "noscript.sqf",'_winkel = getdir lastbuilding; _pos=[ ((position lastbuilding select 0) + sin(_winkel)), ((position lastbuilding select 1) + cos(_winkel)) , (position lastbuilding select 2)] ; lastbuilding setpos _pos;'];
Rueckverschieben 	= player addaction ["Move 1 meter backward", "noscript.sqf",'_winkel = getdir lastbuilding; _pos=[ ((position lastbuilding select 0) - sin(_winkel)), ((position lastbuilding select 1) - cos(_winkel)), (position lastbuilding select 2)] ; lastbuilding setpos _pos;'];
Hochverschieben 	= player addaction ["Move 0.5 meter up", "noscript.sqf",'_pos=[ (position lastbuilding select 0); (position lastbuilding select 1) , ((position lastbuilding select 2) + 0.5)] ; lastbuilding setpos _pos;'];
Runterverschieben 	= player addaction ["Move 0.5 meter down", "noscript.sqf",'_pos=[ (position lastbuilding select 0), (position lastbuilding select 1) , ((position lastbuilding select 2) - 0.5)] ; lastbuilding setpos _pos;'];
Rotierenrechts 		= player addaction ["Rotate 10 right", "noscript.sqf",'_dir =(( getdir lastbuilding) + 10); lastbuilding setdir _dir;'];
Rotierenlinks 		= player addaction ["Rotate 10 left", "noscript.sqf",'_dir =(( getdir lastbuilding) - 10); lastbuilding setdir _dir;'];
Rotierenzuspieler 	= player addaction ["Rotate to player", "noscript.sqf",'_dir =(( getdir player) - 180); lastbuilding setdir _dir;'];
Ende 				= player addaction ["Exit", "noscript.sqf",'player removeaction Rechtsverschieben; player removeaction Linksverschieben;player removeaction Vorverschieben;player removeaction Rueckverschieben;player removeaction Runterverschieben;player removeaction Hochverschieben;player removeaction Ende;player removeaction Rotierenrechts; player removeaction Rotierenlinks;player removeaction Rotierenzuspieler; playerbaut = false;'];

call compile format['_obj setvehicleinit "this setvehiclevarname ""%1%2%3""; %1%2%3 = this"; processinitcommands', player, _class, _time];

//(format ["if (local server) then {publicarbeiterarctionarray = publicarbeiterarctionarray + [ [%1%2%3, %1] ];};", player, _class, _time]) call broadcast;

_counter = 0;

while{alive _obj} do

	{

	if(player distance _obj > 600)then{_counter = _counter + 1}else{_counter = 0};

	if(_counter > 1800 )then{player groupchat "WARNING: you have been away from one of your buildings or other objects for more than half an hour, it will despawned in 5 minutes!"; _counter = _counter + 30; sleep 30;};	//Warnung

	if(_counter > 2100)exitwith{player groupchat "you have been away from one of your buildings or other placable objects for more than 1 hour and 5 minutes so it has despawned!"; deletevehicle _obj};	//Meldung und löschen des Objekts

	sleep 1;

	};

};

