_art  = ((_this select 3) select 0);
_geld = 'geld' call INV_GetItemAmount;

if (_art == "Assistant") exitWith 

{
								
if (localslave >= maxslave) exitWith {role groupChat localize "STRS_slave_zuviele2"};

if (_geld <= slave_cost) exitWith {role groupChat localize "STRS_slave_nomoney2"};

['geld', -(slave_cost)] call INV_AddInventoryItem;

player groupChat format[localize "STRS_slave_gekauft2", rolestring, (slave_cost call ISSE_str_IntToStr)];

_arbeiternummer   = localslavecounter; 																						
localslavecounter = localslavecounter + 1; 															
localslave        = localslave + 1;																									
_slavenumber      = localslavecounter;																				
_slavename        = player;
_civ 		  = Coplavearray select round random(count Coplavearray - 1);

call compile format ['_slavename = "%3" createUnit [position player, group player, "%1Assistant%2 = this; this setVehicleVarName ""%1Assistant%2"";"]; _slavename = %1slave%2;_slavename setpos getpos player', rolestring, _slavenumber, _civ];															
																																																																											
(format ["if (local server) then {publicarbeiterarctionarray = publicarbeiterarctionarray + [ [%1slave%2, %3] ];};", rolestring, _slavenumber, player]) call broadcast;

processInitCommands; 

call compile format ["arbeitergeld%1 = 0;", _arbeiternummer];

_slavemoney = 0;
_exitvar = 0; 
_a1 = 0; 
_action = 0; 

while {true} do 

	{														

	if (_exitvar == 1) exitWith {};

		{

		if ((player distance (_x select 0)) < (_x select 1)) then {call compile format ["arbeitergeld%1 = arbeitergeld%1 + slavemoneyprosekunde + round(random 500 - random 500);", _arbeiternummer];};

		} forEach slavearray;

	for [{_i=0}, {_i < 60}, {_i=_i+1}] do 

		{	

				
		
		if ((player distance _slavename >= 5 or (call compile format ["arbeitergeld%1 == 0", _arbeiternummer])) and _a1 == 1) then {player removeaction _action; _a1 = 0;};																																													
			
		if (player distance _slavename < 5 and _a1 == 0 and (call compile format ["arbeitergeld%1 > 0", _arbeiternummer])) then {_action = player addaction [localize "STRS_slave_moneyaction2", "slaves2.sqf",["geld", _arbeiternummer]]; _a1 = 1;};															
											
		sleep 1;

		};

	};															
			
player removeaction _action;											
sleep 15;							
deletevehicle _slavename;

};

if (_art == "geld") exitWith 

{

_arbeiternummer = (_this select 3) select 1;
_arbeitergeld   = call compile format ["arbeitergeld%1;", _arbeiternummer];
								

if (_arbeitergeld > 0) then 

	{

	['geld', _arbeitergeld] call INV_AddInventoryItem;
	call compile format ["arbeitergeld%1 = 0;", _arbeiternummer];	
	player groupChat format [localize "STRS_slave_geldabnahme_ja2", (_arbeitergeld call ISSE_str_IntToStr)];

	} 

else    {	

	player groupChat localize "STRS_slave_geldabnahme_nein2";

	};

};

