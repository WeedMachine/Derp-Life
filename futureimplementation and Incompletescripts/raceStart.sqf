_cost        = race_join_cost;
_racevehicle = vehicle player;
_money        = 'money' call INV_GetItemAmount;

if (player == _racevehicle)            exitWith {player groupChat localize "STRS_rennen_kein_vehicle";};

if (is_racemember == 1)                exitWith {player groupChat localize "STRS_rennen_already_racemember";};
if (player != driver _racevehicle)     exitWith {player groupChat localize "STRS_rennen_kein_fahrer";};
if (not(_racevehicle isKindOf "Land")) exitWith {player groupChat localize "STRS_rennen_falsches_vcl";};
if (race_started == 1)                 exitWith {player groupChat localize "STRS_rennen_hat_angefangen";};
if (_money < _cost)                     exitWith {player groupChat localize "STRS_rennen_no_racemoney";};

['money', -(_cost)] call INV_AddInventoryItem;player groupChat format[localize "STRS_rennen_joinedrace", player, (_cost call ISSE_str_IntToStr)];

is_racemember = 1;

format ["RennenFahrerArray = RennenFahrerArray + [%1]; RennenFahrzeugArray = RennenFahrzeugArray + [%2];", player, _racevehicle] call ISSE_pub_execPstr;

while {true} do 
{												
if (not(alive player))       exitWith {player groupChat localize "STRS_rennen_tot";};											
if (not(alive _racevehicle)) exitWith {player groupChat localize "STRS_rennen_vcltot";};												
if (race_ended == 1)         exitWith {player groupChat localize "STRS_rennen_zuende";};											
if (is_racemember == 0)      exitWith {/* Man wurde vom Server rausgeworfen */}; 											
sleep 1;
};

is_racemember = 0;