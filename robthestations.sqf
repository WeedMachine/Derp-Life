// rob gas station script, called on client, the amount u steal is determined by a server loop, in stationrobloop.sqf
// written by eddie vedder


_selection = ((_this select 3) select 0);

if (_selection == "station 1") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	}; 
(format['if(!("Robbed a gas station" in %1_reason))then{%1_reason = %1_reason + ["Robbed a gas station"]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 10000;', player]) call broadcast;
['geld', station1money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call broadcast;
player sidechat format ["You stole $%1 from the gas station!", station1money];
station1money = 0;
publicvariable "station1money";
};

if (_selection == "station 2") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};
(format['if(!("Robbed a gas station" in %1_reason))then{%1_reason = %1_reason + ["Robbed a gas station"]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 10000;', player]) call broadcast;
['geld', station2money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call broadcast;
player sidechat format ["You stole $%1 from the gas station!", station2money];
station2money = 0;
publicvariable "station2money";
};

if (_selection == "station 3") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};

(format['if(!("Robbed a gas station" in %1_reason))then{%1_reason = %1_reason + ["Robbed a gas station"]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 10000;', player]) call broadcast;
['geld', station3money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call broadcast;
player sidechat format ["You stole $%1 from the gas station!", station3money];
station3money = 0;
publicvariable "station3money";
};

if (_selection == "station 4") then
{
if (!(call INV_isArmed)) exitwith
	{
	player groupchat "You need a gun to rob the station!";
	};

(format['if(!("Robbed a gas station" in %1_reason))then{%1_reason = %1_reason + ["Robbed a gas station"]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 10000;', player]) call broadcast;
['geld', station4money] call INV_AddInventoryItem;
(format ['server globalChat "Someone robbed gas %1!";', _selection]) call broadcast;
player sidechat format ["You stole $%1 from the gas station!", station4money];
station4money = 0;
publicvariable "station4money";
};

// eddie vedder