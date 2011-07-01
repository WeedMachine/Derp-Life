_vcls = nearestobjects [getpos player, ["LandVehicle", "Air"], 7];
_vcl = _vcls select 0;

if(!(_vcl in INV_VehicleArray))exitwith{player groupchat "You don't have the key to this vehicle!";};
if(!isnull _vcl)then
{
if (!(createDialog "itemkaufdialog")) exitWith {hint "Dialog Error!";};
if (isNil "INV_StorageDialoge") then {INV_StorageDialoge = 0;} else {INV_StorageDialoge = INV_StorageDialoge + 1;};
private ["_veh"];
_this     = _this select 3;
_arrname  = _this select 0; 
_public   = _this select 1;
_arr      = call compile _arrname;
_extra    = [];
_vclStore = false;
_vclClass = "";

_arrname2  = format["%1_storage", _vcl];
_arr2      = call compile _arrname2;
_extra =  ["vcl",(typeOf _vcl),_vcl];	

CtrlSetText [91,"Vehicle"];
CtrlSetText [92,"Factory"];
//sleep 0.1; 

_weight   = _arrname2 call INV_GetStorageWeight;
_vclStore = true; 
_vclClass = (typeOf _vcl);
_maxweight = _vclClass call INV_getvehmaxkg;
CtrlSetText [765,format ["Storage: %1/%2", _weight, _maxweight]];

for [{_i=0}, {_i < (count _arr2)}, {_i=_i+1}] do 

{

_item   = ((_arr2 select _i) select 0);
_anzahl = ((_arr2 select _i) select 1);
_infos  = _item call INV_getitemArray;

if (_anzahl > 0) then 

	{

	_index  = lbAdd [1, (format ["%1 (%2x, %3kg)", (_infos call INV_getitemName), (_anzahl call ISSE_str_IntToStr), (_infos call INV_getitemTypeKg)])];
	lbSetData [1, _index, (format ["%1", _item])];

	};

};


//HIER BEGINNT DER FABRIK AUFRUF!!!
for [{_i=0}, {_i < (count _arr)}, {_i=_i+1}] do 

{

_item   = ((_arr select _i) select 0);
_anzahl = ((_arr select _i) select 1);
_infos  = _item call INV_getitemArray;

if (_anzahl > 0) then 

	{

	_index  = lbAdd [101, (format ["%1 (%2x, %3kg)", (_infos call INV_getitemName), (_anzahl call ISSE_str_IntToStr), (_infos call INV_getitemTypeKg)])];
	lbSetData [101, _index, (format ["%1", _item])];
	
	};

};


buttonSetAction [3,   format['if ((lbCurSel 1) >= 0) then {["autonehmen",  "%1", ctrlText 2, (lbData [1, (lbCurSel 1)]),"%3", %2,"%4"] execVM "addstorage.sqf"; closedialog 0; [0,0,0,["%1", "%3", %2]] execVM "carstorage.sqf";};', _arrname, _extra, _public, _arrname2] ];	//extra kann raus
buttonSetAction [103, format['if ((lbCurSel 101) >= 0) then {["autoablegen", "%1", ctrlText 102, (lbData [101, (lbCurSel 101)]), "%3", %2,"%4"] execVM "addstorage.sqf"; closedialog 0; [0,0,0,["%1", "%3", %2]] execVM "carstorage.sqf";};', _arrname, _extra, _public, _arrname2] ];

while {ctrlVisible 1015} DO 

{

_cursel = (lbCurSel 1);

if (_cursel >= 0) then 

	{

	_item   = lbData [1, (lbCurSel 1)];
        _anzahl = ((_arr select _cursel) select 1);
	_infos  = _item call INV_getitemArray;
	_slider = ctrlText 2;                      
	if (!(_slider call ISSE_str_isInteger)) then {_slider = 0;};
	_slider      = _slider call ISSE_str_StrToInt;  
	if (_slider < 0) then {_slider = 0;};
	CtrlSettext [3,  format [localize "STRS_inv_storagedialog_take", (_slider call ISSE_str_IntToStr), ((_slider*(_infos call INV_getitemTypeKg)) call ISSE_str_IntToStr)]];

	} 
	else 
	{

	CtrlSettext [3,  "/"];};
	_cursel = (lbCurSel 101);
	
	if (_cursel >= 0) then 

		{

		_item   = lbData [101, (lbCurSel 101)]; 
		_anzahl = _item call INV_GetItemAmount;
		_infos  = _item call INV_getitemArray;
		_slider = ctrlText 102;
                if (!(_slider call ISSE_str_isInteger)) then {_slider = "0";};
		_slider = _slider call ISSE_str_StrToInt;  
		if (_slider < 0) then {_slider = 0;};
		CtrlSettext [103,  format [localize "STRS_inv_storagedialog_drop", (_slider call ISSE_str_IntToStr), ((_slider*(_infos call INV_getitemTypeKg)) call ISSE_str_IntToStr)]];

		} 
		else 
		{

		CtrlSettext [103,  "/"];

		};

	sleep 0.3;
	if (INV_StorageDialoge > 1) exitWith {};

};

INV_StorageDialoge = INV_StorageDialoge - 1;
};