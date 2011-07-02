// Drugdealer on Wheels Script
if ((!isServer) and (!Server_Client)) exitWith {};
while {true} do 
{
	_randomVehicle = ["challenger","datsun1_civil_1_open","arpg_sedanRed","arpg_sedanBlack","FFS_Felicia_tun","Skoda","car_hatchback"];
	_vclClass = _randomVehicle select (ceil random ((count _randomVehicle)-1));
    _spawn_pos = call compile format ["markerPos 'drugstop%1';", ceil random 19];
    drugvehicle = createVehicle [_vclClass, _spawn_pos, [] , 0, "NONE"];
    drugvehicle setVehicleInit
      "drugvehicle = this;
      this setVehicleVarName ""drugvehicle"";
      this setVehicleLock ""LOCKED"";
      this setAmmoCargo 0;
	  ";
	  publicvariable "drugvehicle";
    drggrp = createGroup east;
    drug_einheit =  drggrp createUnit ["Civilian4", _spawn_pos, [], 1, "NONE"];
    [drug_einheit] join drggrp;
	removeallweapons drug_einheit;
    drug_einheit assignAsDriver drugvehicle;
	drug_einheit moveindriver drugvehicle;
	drug_einheit setCaptive true;
	drug_einheit setBehaviour "careless";
	publicvariable "drug_einheit";
    processInitCommands;
    _old_random_val = -1;
    while {alive drug_einheit && alive drugvehicle} do {
        _random_val = ceil random 19;
        while {_random_val == _old_random_val} do {
            _random_val = ceil random 19;
        };
		
		// Place the Driver in the Car	
			if ((!(drug_einheit in drugvehicle)) and (alive drug_einheit))
				then{
					drug_einheit moveInDriver drugvehicle;
					drug_einheit assignAsDriver drugvehicle;
				};

			if (alive drug_einheit)
				then {
					drugvehicle setDamage 0;
				};

        _old_random_val = _random_val;
        call compile format ["
            drug_einheit doMove markerPos 'drugstop%1';
            while {drug_einheit distance markerPos 'drugstop%1' > 20 && alive drug_einheit && alive drugvehicle} do {
                sleep 5;
            };
        ", _random_val];
        if (!alive drugvehicle || !alive drug_einheit) exitWith {};
        sleep 1000 + random 500;
        drugvehicle setfuel 1;
    };
	deleteVehicle drugvehicle;
	deleteVehicle drug_einheit;
	deleteGroup drggrp;
	sleep 1000 + random 500;
};