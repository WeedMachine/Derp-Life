//Forensic Investigations script for SLR by MAD T (year 2010)
_art = _this select 0;

if (_art == "init") then 
{
	player addEventHandler ["Hit", "[_this select 1] call Forensic_Investigation_Hit"];
	killer_array = [];
	killer_string = "";

	Forensic_Investigation_Hit = 
	{
		killer = name(_this select 0);
		if (!(killer in killer_array)) then 
		{
			killer_array = killer_array + [killer];
		};
	};

	Forensic_Investigation_Check = 
	{
		_art = _this select 0;
		_nameVictim = _this select 1;
		_evidence = _this select 2;
		_deadTime = _this select 3;
		_currentTime = round(time);
		_calculatedTime = _currentTime - _deadTime;
		_corpseInfo = "";
		if (_calculatedTime <= 600) then {_corpseInfo = "The blood is still warm"};
		if (_calculatedTime > 600) then {_corpseInfo = "The blood is cold"};
		if (_calculatedTime > 3600) then {_corpseInfo = "The body smells rotten"};

		if (iscop) then 
		{
			player groupChat "You are searching for evidence";
			format ["%1 switchmove ""AmovPercMstpSnonWnonDnon_carCheckWheel""", player] call ISSE_pub_execPstr;
			sleep 11;
			format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic""", player] call ISSE_pub_execPstr;
			sleep 8;
			if (alive player) then 
			{
				if (_art == "unknown") then 
				{
					player groupChat format ["The person is called %1. No evidence was found. %2", _nameVictim, _corpseInfo];
				};
				if (_art == "known") then 
				{
					player groupChat format ["The person is called %1. Evidence leads to %2. %3", _nameVictim, _evidence, _corpseInfo];
				};
			};
		}
		else
		{
			player groupChat "I don´t know how to do this";
		};
	};
};

if (_art == "killed") then 
{
	_player = vehicle player;
	_player removeAction playanimationaction;
	_player removeAction statdialogaction;
	if (iscop) then 
	{
		_player removeAction action_copmenulite;
		_player removeAction action_inventar_cop;
	}
	else
	{
		_player removeAction action_inventar;
	};
	
	if (isNil "killer") then 
	{
		player setVehicleInit format ["this addaction [""Search for evidence"", ""somecompile.sqf"",""[""""unknown"""", """"%1"""", 0, %2] call Forensic_Investigation_Check""]",  name(player), round(time)];
		processInitCommands;
	}
	else
	{
		killer_string = (killer_array select 0);
		for [{_i=1}, {_i < (count killer_array)}, {_i=_i+1}] do 
		{
			call compile format ["killer_string = killer_string + "" ,%1""", (killer_array select _i)];
		};
		player setVehicleInit format ["this addaction [""Search for evidence"", ""somecompile.sqf"",""[""""known"""", """"%1"""", """"%2"""", %3] call Forensic_Investigation_Check""]", name(player), killer_string, round(time)];
		processInitCommands;
	};
	killer = nil;
	killer_array = [];
	killer_string = "";
};