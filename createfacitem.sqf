if ((_this select 0) == "") exitWith {player groupChat localize "STRS_inv_no_selection";};
_item        = _this select 0;
_fabriknum   = _this select 1;
_type        = _this select 2;
_queue       = (INV_ItemFabriken select _fabriknum) select 8;
_ablage      = (INV_ItemFabriken select _fabriknum) select 7;
_spawn       = (INV_ItemFabriken select _fabriknum) select 4;
_crate       = (INV_ItemFabriken select _fabriknum) select 3;
_name        = (INV_ItemFabriken select _fabriknum) select 2;
_infos       = _item call INV_getitemArray;
_cost	     = (_infos call INV_getitemBuyCost)*0.5;
_itemart     = _infos call INV_getitemType; 
_amount      = (["geld", _ablage] call INV_GetStorageAmount);

_nichtmoglich = 0;
_EFabrik = 0;
_benoetigteItems = (_item call INV_getitemMaterials);



_extraItems = ["ebauteile","Bread","steel","OilBarrel","EDiamondring","Diamondring","Apfelkuchen"]; //"Mi17_Civilian","Mi17_Ins","Mi17_medevac_Ins","Mi17_medevac_CDF","MV22","MTVR"

{
if(_item == _x ) then
{
_EFabrik = 1;
};
} forEach _extraItems;





if(_item == "Mi17_Civilian")then{_spawn = afacspawn};

if(_type == "mani")then

{

	if (_EFabrik == 1) then
	{
		//Schleife die überprüft ob alle benötigten Res da sind
		{
		_cost = (_x select 1);													//Holt sich die Anzahl der benötigeten Res aus dem Itemarray
		_amount = ([(_x select 0), _ablage] call INV_GetStorageAmount);			//holt sich den Lagerbestand der aktuellen betrachteten Ressource
		if (_amount < _cost) then {_nichtmoglich = 1;};
		} forEach _benoetigteItems;	
		
		if (_nichtmoglich == 1) exitWith {player groupChat localize "STRS_inv_fac_not_enough"};	//bricht das Skript ab wen nicht genug Res da sind
		
		//Schleife welche die Res vom Lager abzieht
		{
		_cost = (_x select 1);
		[(_x select 0), -(_cost), _ablage] call INV_AddItemStorage;
		}forEach _benoetigteItems;
		
		call compile format['%1 = %1 + [_item]; %2pend = %2pend + 1; ["%2pend", %2pend] spawn ClientSaveVar;', _queue, _item];
		player groupChat "Added to the production line";
		call compile format['["%1", %1] spawn ClientSaveVar;["%2", %2] spawn ClientSaveVar;', _ablage, _queue];
	}
	else
	{
		if (_amount < _cost) exitWith {player groupChat localize "STRS_inv_fac_not_enough"};
		["geld", -(_cost), _ablage] call INV_AddItemStorage;
		call compile format['%1 = %1 + [_item]; %2pend = %2pend + 1; ["%2pend", %2pend] spawn ClientSaveVar;', _queue, _item];
		player groupChat "Added to the production line";
		call compile format['["%1", %1] spawn ClientSaveVar;["%2", %2] spawn ClientSaveVar;', _ablage, _queue];
	};
};

if(_type == "create")then

{

if(fvspam)exitwith{}; 

call compile format['favail = %1avail; if(%1avail > 0)then{%1avail = %1avail - 1;["%1avail", %1avail] spawn ClientSaveVar};', _item];
if(favail < 1)exitwith{player groupchat "There are no vehicles of this type available"}; 

if (_itemart == "Item")     then {player groupchat "creating...";fvspam=true;sleep 1;[_item, 1, _ablage] spawn INV_CreateItem;fvspam=false};
if (_itemart == "waffe")    then {player groupchat "creating...";fvspam=true;sleep 1;[(_infos call INV_getitemClassName), 1, _crate] spawn INV_CreateWeapon;fvspam=false};
if (_itemart == "magazin")  then {player groupchat "creating...";fvspam=true;sleep 1;[(_infos call INV_getitemClassName), 1, _crate] spawn INV_CreateMag;fvspam=false};
if (_itemart == "Fahrzeug") then {player groupchat "creating...";fvspam=true;sleep 5;[_item, _spawn] spawn INV_CreateVehicle;fvspam=false};

player groupchat "item created!";

};

if(_type == "export")then

{

if (_itemart == "magazin")exitwith{player groupchat "you cannot export this item!"};   

if(fvspam)exitwith{}; 

call compile format['favail = %1avail', _item];
if(favail < 1)exitwith{player groupchat "There are no items/vehicles of this type available"}; 

if (_itemart == "Fahrzeug") then {[_item] execVM "choosecity.sqf";};
if (_itemart == "Item") then {[_item] execVM "choosecity2.sqf";};
if (_itemart == "waffe") then {[_item] execVM "choosecity2.sqf";};

};