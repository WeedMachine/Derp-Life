// Airtaxi.sqf 
// Calls a helicopter to players position and flys to destination

_player = _this select 1;
_array  = _this select 3;
_destination = _array select 0;
_money  = 'money' call INV_GetItemAmount;

_startTime = 0;
_startTimedepart = 0;
_cond1 = 0;
_cond2 = 0;
_cond3 = 0;
_cond4 = 0;


if (airtaxisperre == 1) exitwith {
	hint localize "STRS_airtaxigesperrt";
	};

// Fly to Bagango Destination
if (_destination == "bagango") then {
	if (atbagangoinuse) exitwith {hint localize "STRS_airtaxi_bagango_inuse";};
	_cost  = airtaxicost + airtaxitaxes;
	_createpos = getMarkerPos "bagangoairtaxi";
	_playerpos = getpos _player;
	if (interndebug) then { hint "Flight booked to Bagango";};
	if (_money < _cost) exitWith {player groupChat localize "STRS_kein_money";};
	['money', -(_cost)] call INV_AddInventoryItem;
	INV_Steuerngezahlt = INV_Steuerngezahlt + airtaxitaxes;
	airtaxisperre = 1;
	atbagangoinuse = true;
	publicvariable "atbagangoinuse";
	hint localize "STRS_airtaxi_bagango_start";
	// Create it and let it fly to destination
	    AtHeloBagango = createVehicle ["BWC_AlouII_c1", _createpos, [] , 0, "NONE"];
		AtHeloBagango setVehicleInit
		"AtHeloBagango = this;
		this setVehicleVarName ""AtHeloBagango"";
		this setAmmoCargo 0;
		";
		AtGrpBag = createGroup west;
		AtUnitBag =  AtGrpBag createUnit ["SoldierWPilot", _createpos, [], 1, "NONE"];
		[AtUnitBag] join AtGrpBag;
		removeallweapons AtUnitBag;
		AtUnitBag assignAsDriver AtHeloBagango;
		AtUnitBag moveindriver AtHeloBagango;
		AtUnitBag setCaptive true;
		AtUnitBag setBehaviour "careless";
		processInitCommands;
		// Start the check for alive pilot/damahe helo
		["bagango"] execVM "airtaxicheck.sqf";
		AtHeloBagango lock true;
		if (interndebug) then { hint "All Created";};
		AtHeloBagango flyinheight 100;
		AtUnitBag doMove _playerpos;
		waituntil {AtUnitBag distance _playerpos < 150 };
		AtHeloBagango flyinheight 0;
		AtHeloBagango lock false;
		if (interndebug) then { hint "Arrived at pickup";};
		_startTime = time;
		waitUntil
		{
			_cond1 = count crew AtHeloBagango > 1;
			_cond2 = time - _startTime > 5*60;
			_cond1 || _cond2
		};
		if (interndebug) then { hint "coditions reached, now 15s sleeptime";};
		sleep 15;
		if (interndebug) then { hint "15s done, starting";};
		AtHeloBagango flyinheight 100;
		AtUnitBag doMove _createpos;
		waituntil {AtUnitBag distance _createpos < 150};
		if (interndebug) then { hint "Arrived at destination";};
		AtHeloBagango flyinheight 0;
		hint localize "STRS_airtaxi_arrival";
		_startTimedepart = time;
		waitUntil
		{
			_cond3 = count crew AtHeloBagango == 1;
			_cond4 = time - _startTimedepart > 5*60;
			_cond3 || _cond4
		};
		sleep 5;
		if (interndebug) then { hint "Flying to deadposition";};
		AtHeloBagango flyinheight 300;
		AtUnitBag doMove (getMarkerPos "Finish_marker");
		sleep 220;
		deleteVehicle AtUnitBag;
		deleteVehicle AtHeloBagango;
		deleteGroup AtGrpBag;
		if (interndebug) then { hint "All deleted";};
		atbagangoinuse = false;
		publicvariable "atbagangoinuse";
		sleep 300;
		airtaxisperre = 0;
		if (interndebug) then { hint "Blocking gone, can call me again";};
	};

	
// Fly to Mercalillo Destination
if (_destination == "mercalillo") then {
	if (atmercalilloinuse) exitwith {hint localize "STRS_airtaxi_mercalillo_inuse";};
	_cost  = airtaxicost + airtaxitaxes;
	_createpos = getMarkerPos "mercalilloairtaxi";
	_playerpos = getpos _player;
	if (interndebug) then { hint "Flight booked to Mercalillo";};
	if (_money < _cost) exitWith {player groupChat localize "STRS_kein_money";};
	['money', -(_cost)] call INV_AddInventoryItem;
	INV_Steuerngezahlt = INV_Steuerngezahlt + airtaxitaxes;
	airtaxisperre = 1;
	atmercalilloinuse = true;
	publicvariable "atmercalilloinuse";
	hint localize "STRS_airtaxi_mercalillo_start";
	// Create it and let it fly to destination
	    AtHeloMercalillo = createVehicle ["BWC_AlouII_c1", _createpos, [] , 0, "NONE"];
		AtHeloMercalillo setVehicleInit
		"AtHeloMercalillo = this;
		this setVehicleVarName ""AtHeloMercalillo"";
		this setAmmoCargo 0;
		";
		AtGrpmerc = createGroup west;
		AtUnitmerc =  AtGrpmerc createUnit ["SoldierWPilot", _createpos, [], 1, "NONE"];
		[AtUnitmerc] join AtGrpmerc;
		removeallweapons AtUnitmerc;
		AtUnitmerc assignAsDriver AtHeloMercalillo;
		AtUnitmerc moveindriver AtHeloMercalillo;
		AtUnitmerc setCaptive true;
		AtUnitmerc setBehaviour "careless";
		processInitCommands;
		// Start the check for alive pilot/damahe helo
		["mercalillo"] execVM "airtaxicheck.sqf";
		AtHeloMercalillo lock true;
		if (interndebug) then { hint "All Created";};
		AtHeloMercalillo flyinheight 100;
		AtUnitmerc doMove _playerpos;
		waituntil {AtUnitmerc distance _playerpos < 150 };
		AtHeloMercalillo flyinheight 0;
		if (interndebug) then { hint "Arrived at pickup";};
		AtHeloMercalillo lock false;
		_startTime = time;
		waitUntil
		{
			_cond1 = count crew AtHeloMercalillo > 1;
			_cond2 = time - _startTime > 5*60;
			_cond1 || _cond2
		};
		sleep 15;
		AtHeloMercalillo flyinheight 100;
		AtUnitmerc doMove _createpos;
		waituntil {AtUnitmerc distance _createpos < 150};
		if (interndebug) then { hint "Arrived at destination";};
		AtHeloMercalillo flyinheight 0;
		hint localize "STRS_airtaxi_arrival";
		_startTimedepart = time;
		waitUntil
		{
			_cond3 = count crew AtHeloMercalillo == 1;
			_cond4 = time - _startTimedepart > 5*60;
			_cond3 || _cond4
		};
		sleep 5;
		if (interndebug) then { hint "Flying to deadposition";};
		AtHeloMercalillo flyinheight 300;
		AtUnitmerc doMove (getMarkerPos "Finish_marker");
		sleep 220;
		deleteVehicle AtUnitmerc;
		deleteVehicle AtHeloMercalillo;
		deleteGroup AtGrpmerc;
		if (interndebug) then { hint "All deleted";};
		atmercalilloinuse = false;
		publicvariable "atmercalilloinuse";
		sleep 300;
		airtaxisperre = 0;
		if (interndebug) then { hint "Blocking gone, can call me again";};
	};

	
// Fly to Pita Destination
if (_destination == "pita") then {
	if (atpitainuse) exitwith {hint localize "STRS_airtaxi_pita_inuse";};
	_cost  = airtaxicost + airtaxitaxes;
	_createpos = getMarkerPos "pitaairtaxi";
	_playerpos = getpos _player;
	if (interndebug) then { hint "Flight booked to pita";};
	if (_money < _cost) exitWith {player groupChat localize "STRS_kein_money";};
	['money', -(_cost)] call INV_AddInventoryItem;
	INV_Steuerngezahlt = INV_Steuerngezahlt + airtaxitaxes;
	airtaxisperre = 1;
	atpitainuse = true;
	publicvariable "atpitainuse";
	hint localize "STRS_airtaxi_pita_start";
	// Create it and let it fly to destination
	    AtHelopita = createVehicle ["BWC_AlouII_c1", _createpos, [] , 0, "NONE"];
		AtHelopita setVehicleInit
		"AtHelopita = this;
		this setVehicleVarName ""AtHelopita"";
		this setAmmoCargo 0;
		";
		AtGrppita = createGroup west;
		AtUnitpita =  AtGrppita createUnit ["SoldierWPilot", _createpos, [], 1, "NONE"];
		[AtUnitpita] join AtGrppita;
		removeallweapons AtUnitpita;
		AtUnitpita assignAsDriver AtHelopita;
		AtUnitpita moveindriver AtHelopita;
		AtUnitpita setCaptive true;
		AtUnitpita setBehaviour "careless";
		processInitCommands;
		// Start the check for alive pilot/damage helo
		["pita"] execVM "airtaxicheck.sqf";
		AtHelopita lock true;
		if (interndebug) then { hint "All Created";};
		AtHelopita flyinheight 100;
		AtUnitpita doMove _playerpos;
		waituntil {AtUnitpita distance _playerpos < 150 };
		AtHelopita flyinheight 0;
		AtHelopita lock false;
		if (interndebug) then { hint "Arrived at pickup";};
		_startTime = time;
		waitUntil
		{
			_cond1 = count crew AtHelopita > 1;
			_cond2 = time - _startTime > 5*60;
			_cond1 || _cond2
		};
		sleep 15;
		AtHelopita flyinheight 100;
		AtUnitpita doMove _createpos;
		waituntil {AtUnitpita distance _createpos < 150};
		if (interndebug) then { hint "Arrived at destination";};
		AtHelopita flyinheight 0;
		hint localize "STRS_airtaxi_arrival";
		_startTimedepart = time;
		waitUntil
		{
			_cond3 = count crew AtHelopita == 1;
			_cond4 = time - _startTimedepart > 5*60;
			_cond3 || _cond4
		};
		sleep 5;
		if (interndebug) then { hint "Flying to deadposition";};
		AtHelopita flyinheight 300;
		AtUnitpita doMove (getMarkerPos "Finish_marker");
		sleep 220;
		deleteVehicle AtUnitpita;
		deleteVehicle AtHelopita;
		deleteGroup AtGrppita;
		if (interndebug) then { hint "All deleted";};
		atpitainuse = false;
		publicvariable "atpitainuse";
		sleep 300;
		airtaxisperre = 0;
		if (interndebug) then { hint "Blocking gone, can call me again";};
	};
	
	
// Fly to paraiso Destination
if (_destination == "paraiso") then {
	if (atparaisoinuse) exitwith {hint localize "STRS_airtaxi_paraiso_inuse";};
	_cost  = airtaxicost + airtaxitaxes;
	_createpos = getMarkerPos "paraisoairtaxi";
	_playerpos = getpos _player;
	if (interndebug) then { hint "Flight booked to paraiso";};
	if (_money < _cost) exitWith {player groupChat localize "STRS_kein_money";};
	['money', -(_cost)] call INV_AddInventoryItem;
	INV_Steuerngezahlt = INV_Steuerngezahlt + airtaxitaxes;
	airtaxisperre = 1;
	atparaisoinuse = true;
	publicvariable "atparaisoinuse";
	hint localize "STRS_airtaxi_paraiso_start";
	// Create it and let it fly to destination
	    AtHeloparaiso = createVehicle ["BWC_AlouII_c1", _createpos, [] , 0, "NONE"];
		AtHeloparaiso setVehicleInit
		"AtHeloparaiso = this;
		this setVehicleVarName ""AtHeloparaiso"";
		this setAmmoCargo 0;
		";
		AtGrpparaiso = createGroup west;
		AtUnitparaiso =  AtGrpparaiso createUnit ["SoldierWPilot", _createpos, [], 1, "NONE"];
		[AtUnitparaiso] join AtGrpparaiso;
		removeallweapons AtUnitparaiso;
		AtUnitparaiso assignAsDriver AtHeloparaiso;
		AtUnitparaiso moveindriver AtHeloparaiso;
		AtUnitparaiso setCaptive true;
		AtUnitparaiso setBehaviour "careless";
		processInitCommands;
		AtHeloparaiso lock true;
		// Start the check for alive pilot/damage helo
		["paraiso"] execVM "airtaxicheck.sqf";
		if (interndebug) then { hint "All Created";};
		AtHeloparaiso flyinheight 100;
		AtUnitparaiso doMove _playerpos;
		waituntil {AtUnitparaiso distance _playerpos < 150 };
		AtHeloparaiso flyinheight 0;
		AtHeloparaiso lock false;
		if (interndebug) then { hint "Arrived at pickup";};
		_startTime = time;
		waitUntil
		{
			_cond1 = count crew AtHeloparaiso > 1;
			_cond2 = time - _startTime > 5*60;
			_cond1 || _cond2
		};
		sleep 15;
		AtHeloparaiso flyinheight 100;
		AtUnitparaiso doMove _createpos;
		waituntil {AtUnitparaiso distance _createpos < 150};
		if (interndebug) then { hint "Arrived at destination";};
		AtHeloparaiso flyinheight 0;
		hint localize "STRS_airtaxi_arrival";
		_startTimedepart = time;
		waituntil
		{
			_cond3 = count crew AtHeloparaiso == 1;
			_cond4 = time - _startTimedepart > 5*60;
			_cond3 || _cond4
		};
		sleep 5;
		if (interndebug) then { hint "Flying to deadposition";};
		AtHeloparaiso flyinheight 300;
		AtUnitparaiso doMove (getMarkerPos "Finish_marker");
		sleep 220;
		deleteVehicle AtUnitparaiso;
		deleteVehicle AtHeloparaiso;
		deleteGroup AtGrpparaiso;
		if (interndebug) then { hint "All deleted";};
		atparaisoinuse = false;
		publicvariable "atparaisoinuse";
		sleep 300;
		airtaxisperre = 0;
		if (interndebug) then { hint "Blocking gone, can call me again";};
	};
	
	
// Fly to rahmadi Destination
if (_destination == "rahmadi") then {
	if (atrahmadiinuse) exitwith {hint localize "STRS_airtaxi_rahmadi_inuse";};
	_cost  = airtaxicost + airtaxitaxes;
	_createpos = getMarkerPos "rahmadiairtaxi";
	_playerpos = getpos _player;
	if (interndebug) then { hint "Flight booked to rahmadi";};
	if (_money < _cost) exitWith {player groupChat localize "STRS_kein_money";};
	['money', -(_cost)] call INV_AddInventoryItem;
	INV_Steuerngezahlt = INV_Steuerngezahlt + airtaxitaxes;
	airtaxisperre = 1;
	atrahmadiinuse = true;
	publicvariable "atrahmadiinuse";
	hint localize "STRS_airtaxi_rahmadi_start";
	// Create it and let it fly to destination
	    AtHelorahmadi = createVehicle ["BWC_AlouII_c1", _createpos, [] , 0, "NONE"];
		AtHelorahmadi setVehicleInit
		"AtHelorahmadi = this;
		this setVehicleVarName ""AtHelorahmadi"";
		this setAmmoCargo 0;
		";
		AtGrprahmadi = createGroup west;
		AtUnitrahmadi =  AtGrprahmadi createUnit ["SoldierWPilot", _createpos, [], 1, "NONE"];
		[AtUnitrahmadi] join AtGrprahmadi;
		removeallweapons AtUnitrahmadi;
		AtUnitrahmadi assignAsDriver AtHelorahmadi;
		AtUnitrahmadi moveindriver AtHelorahmadi;
		AtUnitrahmadi setCaptive true;
		AtUnitrahmadi setBehaviour "careless";
		processInitCommands;
		AtHelorahmadi lock true;
		// Start the check for alive pilot/damage helo
		["rahmadi"] execVM "airtaxicheck.sqf";
		if (interndebug) then { hint "All Created";};
		AtHelorahmadi flyinheight 100;
		AtUnitrahmadi doMove _playerpos;
		waituntil {AtUnitrahmadi distance _playerpos < 150 };
		AtHelorahmadi flyinheight 0;
		AtHelorahmadi lock false;
		if (interndebug) then { hint "Arrived at pickup";};
		_startTime = time;
		waitUntil
		{
			_cond1 = count crew AtHelorahmadi > 1;
			_cond2 = time - _startTime > 5*60;
			_cond1 || _cond2
		};
		sleep 15;
		AtHelorahmadi flyinheight 100;
		AtUnitrahmadi doMove _createpos;
		waituntil {AtUnitrahmadi distance _createpos < 150};
		if (interndebug) then { hint "Arrived at destination";};
		AtHelorahmadi flyinheight 0;
		hint localize "STRS_airtaxi_arrival";
		_startTimedepart = time;
		waituntil
		{
			_cond3 = count crew AtHelorahmadi == 1;
			_cond4 = time - _startTimedepart > 5*60;
			_cond3 || _cond4
		};
		sleep 5;
		if (interndebug) then { hint "Flying to deadposition";};
		AtHelorahmadi flyinheight 300;
		AtUnitrahmadi doMove (getMarkerPos "Finish_marker");
		sleep 220;
		deleteVehicle AtUnitrahmadi;
		deleteVehicle AtHelorahmadi;
		deleteGroup AtGrprahmadi;
		if (interndebug) then { hint "All deleted";};
		atrahmadiinuse = false;
		publicvariable "atrahmadiinuse";
		sleep 300;
		airtaxisperre = 0;
		if (interndebug) then { hint "Blocking gone, can call me again";};
	};
	
	
// Fly to corazol Destination
if (_destination == "corazol") then {
	if (atcorazolinuse) exitwith {hint localize "STRS_airtaxi_corazol_inuse";};
	_cost  = airtaxicost + airtaxitaxes;
	_createpos = getMarkerPos "corazolairtaxi";
	_playerpos = getpos _player;
	if (interndebug) then { hint "Flight booked to corazol";};
	if (_money < _cost) exitWith {player groupChat localize "STRS_kein_money";};
	['money', -(_cost)] call INV_AddInventoryItem;
	INV_Steuerngezahlt = INV_Steuerngezahlt + airtaxitaxes;
	airtaxisperre = 1;
	atcorazolinuse = true;
	publicvariable "atcorazolinuse";
	hint localize "STRS_airtaxi_corazol_start";
	// Create it and let it fly to destination
	    AtHelocorazol = createVehicle ["BWC_AlouII_c1", _createpos, [] , 0, "NONE"];
		AtHelocorazol setVehicleInit
		"AtHelocorazol = this;
		this setVehicleVarName ""AtHelocorazol"";
		this setAmmoCargo 0;
		";
		AtGrpcorazol = createGroup west;
		AtUnitcorazol =  AtGrpcorazol createUnit ["SoldierWPilot", _createpos, [], 1, "NONE"];
		[AtUnitcorazol] join AtGrpcorazol;
		removeallweapons AtUnitcorazol;
		AtUnitcorazol assignAsDriver AtHelocorazol;
		AtUnitcorazol moveindriver AtHelocorazol;
		AtUnitcorazol setCaptive true;
		AtUnitcorazol setBehaviour "careless";
		processInitCommands;
		// Start the check for alive pilot/damage helo
		["corazol"] execVM "airtaxicheck.sqf";
		AtHelocorazol lock true;
		if (interndebug) then { hint "All Created";};
		AtHelocorazol flyinheight 100;
		AtUnitcorazol doMove _playerpos;
		waituntil {AtUnitcorazol distance _playerpos < 150 };
		AtHelocorazol flyinheight 0;
		AtHelocorazol lock false;
		if (interndebug) then { hint "Arrived at pickup";};
		_startTime = time;
		waitUntil
		{
			_cond1 = count crew AtHelocorazol > 1;
			_cond2 = time - _startTime > 5*60;
			_cond1 || _cond2
		};
		sleep 15;
		AtHelocorazol flyinheight 100;
		AtUnitcorazol doMove _createpos;
		waituntil {AtUnitcorazol distance _createpos < 150};
		if (interndebug) then { hint "Arrived at destination";};
		AtHelocorazol flyinheight 0;
		hint localize "STRS_airtaxi_arrival";
		_startTimedepart = time;
		waituntil
		{
			_cond3 = count crew AtHelocorazol == 1;
			_cond4 = time - _startTimedepart > 5*60;
			_cond3 || _cond4
		};
		sleep 5;
		if (interndebug) then { hint "Flying to deadposition";};
		AtHelocorazol flyinheight 300;
		AtUnitcorazol doMove (getMarkerPos "Finish_marker");
		sleep 220;
		deleteVehicle AtUnitcorazol;
		deleteVehicle AtHelocorazol;
		deleteGroup AtGrpcorazol;
		if (interndebug) then { hint "All deleted";};
		atcorazolinuse = false;
		publicvariable "atcorazolinuse";
		sleep 300;
		airtaxisperre = 0;
		if (interndebug) then { hint "Blocking gone, can call me again";};
	};