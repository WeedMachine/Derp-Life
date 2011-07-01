_art = _this select 0;
 
if (_art == "use") then 

{
													
_item   = _this select 1;		
_zunah 	= 0;	


{if ((player distance (_x select 0) < (_x select 1)) and (player distance baugebiet  > 48)) exitWith {_zunah = 1;}} forEach CityLocationArray;
{if (player distance (getpos _x) < 20) exitWith {_zunah = 1;}} forEach HideoutLocationArray;						
 
if (_zunah == 1) exitWith {player groupChat localize "STRS_inventar_hideout_wrongplace";};
													
player groupChat format[localize "STRS_inventar_bought_hideout", rolestring];																			
 
_rolepos    = position player;			
_roledir    = getdir player;							
_pos        = [(_rolepos select 0) + ((sin _roledir) * 10), (_rolepos select 1) + ((cos _roledir) * 10),(_rolepos select 2)];	

[_item, -1] call INV_AddInventoryItem;
_x = round (random 30);
sleep _x;

if(player distance baugebiet  < 48) then
{
INV_LizenzOwner = INV_LizenzOwner + ["Citizen of Chernogorsk"];
["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar; 
};
call compile format ['																	

hideout%1%2 = "Land_HouseV_1I4" CreateVehicle %3; 															
hideout%1%2 setVehicleInit "this setVehicleVarName ""hideout%1%2""; hideout%1%2 = this; this setDir %4"; 											


hideoutbox%1%2 = "LocalBasicWeaponsBox" createVehicle (hideout%1%2 buildingPos 2);											
hideoutbox%1%2 setVehicleInit "this setVehicleVarName ""hideoutbox%1%2""; 
hideoutbox%1%2 = this; this setDir %4; 
this setpos (hideout%1%2 buildingPos 1);		

HideoutLocationArray = HideoutLocationArray + [hideout%1%2];

ClearMagazineCargo this; 
ClearWeaponCargo this;";
processInitCommands; 

%1remove = player addaction ["Remove your House", "noscript.sqf", 
"

if(!isnull hideout%1%2)then{deletevehicle hideout%1%2};
if(!isnull hideoutbox%1%2)then{deletevehicle hideoutbox%1%2};
deletemarker %1%2localhideoutmarker;
HideoutLocationArray = HideoutLocationArray - [hideout%1%2];																											
[""House2"", 1] call INV_AddInventoryItem;
",1,false,true,"","player distance hideout%1%2 <= 7"];

%1%2localhideoutmarker = (([hideout%1%2, (name player), "Camp", "ColorWhite", "ICON", [1, 1], "%1%2HideoutMarker"] call ISSE_CreateMarkerGlobalArray) select 1);									
INV_VehicleArray = INV_VehicleArray + [hideoutbox%1%2]; 
"INV_ServerVclArray = INV_ServerVclArray + [hideoutbox%1%2]" call broadcast;
"if (local server) then {publichideoutarray = publichideoutarray + [ [""%1"", [hideoutbox%1%2,hideout%1%2] ] ]}" call broadcast;
																											
',rolestring, round(time), _pos, _roledir];																																			
publicvariable "HideoutLocationArray";																			

};
