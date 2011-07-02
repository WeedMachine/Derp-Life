// Check if Airtaxi Driver was killed an give a Public hint about that.

_art = _this select 0;

// Check for Airtaxi bagango
if (_art == "bagango") then {
	if (interndebug) then {hint "Bagango deadcheck running";};
	while {true} do {
		_dmghelo = getDammage AtHeloBagango;
		if (!alive AtUnitBag || _dmghelo >= 0.2) exitWith {
			"hint localize ""STRS_airtaxi_bagango_killed"";" call ISSE_pub_execPstr;
			AtHeloBagango lock true;
			sleep 300;
			deleteVehicle AtUnitBag;
			deleteVehicle AtHeloBagango;
			atbagangoinuse = false;
			publicvariable "atbagangoinuse";
			airtaxisperre = 0;
		};
	sleep 2;	
	};
};
// Check for Airtaxi Mercalillo
if (_art == "mercalillo") then {
	if (interndebug) then {hint "Bagango deadcheck running";};
	while {true} do {
		_dmghelo = getDammage AtHeloMercalillo;
		if (!alive AtUnitmerc || _dmghelo >= 0.2) exitWith {
			"hint localize ""STRS_airtaxi_mercalillo_killed"";" call ISSE_pub_execPstr;
			AtHeloMercalillo lock true;
			sleep 300;
			deleteVehicle AtUnitmerc;
			deleteVehicle AtHeloMercalillo;
			atmercalilloinuse = false;
			publicvariable "atmercalilloinuse";
			airtaxisperre = 0;
		};
	sleep 2;	
	};
};

// Check for Airtaxi Pita
if (_art == "pita") then {
	if (interndebug) then {hint "Pita deadcheck running";};
	while {true} do {
		_dmghelo = getDammage AtHelopita;
		if (!alive AtUnitpita || _dmghelo >= 0.2) exitWith {
			"hint localize ""STRS_airtaxi_pita_killed"";" call ISSE_pub_execPstr;
			AtHelopita lock true;
			sleep 300;
			deleteVehicle AtUnitpita;
			deleteVehicle AtHelopita;
			atpitainuse = false;
			publicvariable "atpitainuse";
			airtaxisperre = 0;
		};
	sleep 2;	
	};
};
// Check for Airtaxi Paraiso
if (_art == "paraiso") then {
	if (interndebug) then {hint "Bagango deadcheck running";};
	while {true} do {
		_dmghelo = getDammage AtHeloparaiso;
		if (!alive AtUnitparaiso || _dmghelo >= 0.2) exitWith {
			"hint localize ""STRS_airtaxi_paraiso_killed"";" call ISSE_pub_execPstr;
			AtHeloparaiso lock true;
			sleep 300;
			deleteVehicle AtUnitparaiso;
			deleteVehicle AtHeloparaiso;
			atparaisoinuse = false;
			publicvariable "atparaisoinuse";
			airtaxisperre = 0;
		};
	sleep 2;	
	};
};
// Check for Airtaxi Rahmadi
if (_art == "rahmadi") then {
	if (interndebug) then {hint "Bagango deadcheck running";};
	while {true} do {
		_dmghelo = getDammage AtHelorahmadi;
		if (!alive AtUnitrahmadi || _dmghelo >= 0.2) exitWith {
			"hint localize ""STRS_airtaxi_rahmadi_killed"";" call ISSE_pub_execPstr;
			AtHelorahmadi lock true;
			sleep 300;
			deleteVehicle AtUnitrahmadi;
			deleteVehicle AtHelorahmadi;
			atrahmadiinuse = false;
			publicvariable "atrahmadiinuse";
			airtaxisperre = 0;
		};
	sleep 2;	
	};
};
// Check for Airtaxi Corazol-City
if (_art == "corazol") then {
	if (interndebug) then {hint "Bagango deadcheck running";};
	while {true} do {
		_dmghelo = getDammage AtHelocorazol;
		if (!alive AtUnitcorazol || _dmghelo >= 0.2) exitWith {
			"hint localize ""STRS_airtaxi_corazol_killed"";" call ISSE_pub_execPstr;
			AtHelocorazol lock true; 
			sleep 300;
			deleteVehicle AtUnitcorazol;
			deleteVehicle AtHelocorazol;
			atcorazolinuse = false;
			publicvariable "atcorazolinuse";
			airtaxisperre = 0;
		};
	sleep 2;	
	};
};