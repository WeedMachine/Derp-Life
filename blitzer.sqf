_art = _this select 0;
 
if (_art == "use") then 

{
													
_item   = _this select 1;		
_zunah 	= 0;	

{if (player distance (getpos _x ) < 400) exitWith {_zunah = 1;}} forEach INV_Serverspeedcamarray;						
 
if (_zunah == 1) exitWith {player groupChat "You can't place a second speedcam in this area";};
if (count INV_Serverspeedcamarray > 15) exitWith {player groupChat "You can't place more speedcams on this map";};																															
 
_rolepos    = position player;			
_roledir    = getdir player;							
_pos        = [(_rolepos select 0) + ((sin _roledir) * 10), (_rolepos select 1) + ((cos _roledir) * 10),(_rolepos select 2)];	

call compile format ['																		

speedcam%1%2 = "Satelit" CreateVehicle %3; 															
speedcam%1%2 setVehicleInit "this setVehicleVarName ""speedcam%1%2""; speedcam%1%2 = this; this setDir %4"; 												

INV_Serverspeedcamarray = INV_Serverspeedcamarray + [speedcam%1%2];


processInitCommands; 

%1remove = player addaction ["Remove your Speedcam", "noscript.sqf", 
"
if(!isnull speedcam%1%2)then{deletevehicle speedcam%1%2};

INV_Serverspeedcamarray = INV_Serverspeedcamarray - [speedcam%1%2];

deletemarker %1%2localspeedcammarker;																											
[""Satelit"", 1] call INV_AddInventoryItem;
",1,false,true,"","player distance speedcam%1%2 <= 7"];

%1%2localspeedcammarker = (([speedcam%1%2, ("Your Speedcam"), "mil_dot", "ColorBlack", "ICON", [1, 1], "%1%2speedcamMarker"] call ISSE_CreateMarkerArray) select 1);									

"if (local server) then {publicspeedcamarray = publicspeedcamarray + [ [""%1"", [speedcam%1%2] ] ]}" call broadcast;
																											
',rolestring, round(time), _pos, _roledir];	
					
																			
[_item, -1] call INV_AddInventoryItem;
publicvariable "INV_Serverspeedcamarray";
};
