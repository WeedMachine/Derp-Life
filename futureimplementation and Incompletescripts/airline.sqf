_art = ((_this select 3) select 0);
if (isNil "INV_LocalplaneKunde" ) then {	INV_LocalplaneKunde = player;																												    };
if (isNil "workplacejob_plane_sperre"		) then {		
workplacejob_plane_sperre = false;				};
if (isNil "workplacejob_plane_kundebeginn"		) then {								
workplacejob_plane_kundebeginn = false;								};
if (isNil "workplacejob_plane_kundeactive"					) then {					
workplacejob_plane_kundeactive = false;					};
if (isNil "workplacejob_plane_active"																						) then {											
workplacejob_plane_active = false;																						};
if (isNil "workplacejob_plane_serverarray"															) then {															
workplacejob_plane_serverarray = [];																														};
if (_art == "serverloop") then {		while {true} do {																														
for [{_i=0}, {_i < (count workplacejob_plane_serverarray)}, {_i=_i+1}] do {																								
if (isNull ((workplacejob_plane_serverarray select _i) select 0)) then {																																																								
if (!(isNull ((workplacejob_plane_serverarray select _i) select 1))) then {	deleteVehicle ((workplacejob_plane_serverarray select _i) select 1);																																																};																								
workplacejob_plane_serverarray set [_i,""];																												
workplacejob_plane_serverarray = workplacejob_plane_serverarray - [""];																																													};				};										sleep 10;											};};
if (_art == "getajob_plane") then {																										
if (workplacejob_plane_sperre) exitWith {		player groupChat format [localize "STRS_workplacemission_plane_alreadyinuse",workplacejob_plane_sperrzeit];						};																							
workplacejob_plane_active = true;												
workplacejob_plane_sperre = true;		while {true} do {																											
_startzahl 		= (floor(random(count workplacejob_plane_zielarray)));						
_start    		= (workplacejob_plane_zielarray select _startzahl);																												
_ziel      		= (workplacejob_plane_zielarray select _startzahl);														
_spielerstart     = getPos (vehicle player);			while {true} do {																								
_zielzahl = (floor(random(count workplacejob_plane_zielarray)));																																										
if (_zielzahl != _startzahl) exitWith {_ziel = (workplacejob_plane_zielarray select _zielzahl);};														};																																																												
_planezeit = time;					call compile format [" ""Civilian%1"" createUnit [[(_start select 0),(_start select 1),0], group civ_logicunit, ""%2planekunde = this; this setVehicleVarName """"%2planekunde""""; this disableAI """"MOVE""""; this disableAI """"TARGET"""";""]; [%2planekunde] join grpNull; ", ((ceil(random(19)))+1), player];																												
processInitCommands;				format["workplacejob_plane_serverarray + [%1, %1planekunde];", player] call ISSE_pub_execPstr;																																																																		
_markerobj = createMarkerLocal ["planekundenmarker",[0,0]];																				
_markername= "planekundenmarker";																														
_markerobj setMarkerShapeLocal "ICON";								
"planekundenmarker" setMarkerTypeLocal "Marker";										
"planekundenmarker" setMarkerColorLocal "ColorBlue";																														
"planekundenmarker" setMarkerTextLocal localize "STRS_workplacemission_plane_marker_kunde";								
_markername SetMarkerPosLocal _start;																
_action = 0;																																														
player groupChat localize "STRS_workplacemission_plane_begin";		while {true} do {		sleep 1;																																	
INV_LocalplaneKunde = player;		call compile format["INV_LocalplaneKunde = %1planekunde", player];																																																												
if ((player != (vehicle player)) and (((vehicle player)) distance INV_LocalplaneKunde < 30) and ((speed ((vehicle player))) < 2) and (not(workplacejob_plane_kundeactive)) and (vehicle player isKindOf "Air")) then {																				
player groupChat localize "STRS_workplacemission_plane_wannagetin";																																
if (((vehicle player) emptyPositions "cargo")>0) then {																																																												
format["%1 assignAsCargo %2; [%1] orderGetIn true;", INV_LocalplaneKunde, (vehicle player) ] call ISSE_pub_execPstr;																																																																	
workplacejob_plane_kundeactive = true;	_warte = time;	waitUntil {(INV_LocalplaneKunde in vehicle player) or ((_warte+10)<time) or (INV_LocalplaneKunde distance (vehicle player) <3)};																																																		
if ((not(INV_LocalplaneKunde in vehicle player)) and (player != (vehicle player))) then {		format["%1 moveInCargo %2",INV_LocalplaneKunde, vehicle player] call ISSE_pub_execPstr;																				};																																																																						
if (not(workplacejob_plane_kundebeginn)) then {		player groupChat localize "STRS_workplacemission_plane_target";																																																																																				
workplacejob_plane_kundebeginn = true;																																																																								
_markername setMarkerPosLocal _ziel;																																																																																				
"planekundenmarker" setMarkerTextLocal localize "STRS_workplacemission_plane_marker_ziel";																																																		}; 					} else {																									
player groupChat localize "STRS_workplacemission_plane_nospace";																				};																					};																																																																																										
if ((player == (vehicle player)) and (workplacejob_plane_kundeactive)) then {		format["%1 action [""getOut"", (%2)]; unassignVehicle %1;",INV_LocalplaneKunde,(vehicle player)] call ISSE_pub_execPstr;								
workplacejob_plane_kundeactive = false;												};																																																																				
if ((not(player == (vehicle player))) and (((vehicle player)) distance _ziel < 30) and ((speed ((vehicle player))) < 2) and (workplacejob_plane_kundeactive) and (INV_LocalplaneKunde in ((vehicle player)))) exitWith {																																																								
_geld = (     ( 500 max ( round((((_spielerstart distance _start)+(_start distance _ziel))*workplacejob_plane_multiplikator)-(time-_planezeit)) ) )     min     workplacejob_plane_maxmoney     );																																												
if (_geld < 0) then {_geld = 0;};			['money', _geld] call INV_AddInventoryItem;			player groupChat format [localize "STRS_workplacemission_plane_success",_geld];				format["%1 action [""getOut"", (%2)]; unassignVehicle %1;",INV_LocalplaneKunde,(vehicle player)] call ISSE_pub_execPstr;						sleep 5;												
format["%1 doMove [(%2 select 0),(%2 select 1),0];", INV_LocalplaneKunde, _ziel] call ISSE_pub_execPstr;			sleep ((random 10)+5);																																													};																																																																																																
if ((not(alive player)) or (not(alive INV_LocalplaneKunde))) exitWith {					player groupChat localize "STRS_workplacemission_plane_failure";								sleep 10;															};																																																																																			
if (not(workplacejob_plane_active)) exitWith {				player groupChat localize "STRS_workplacemission_plane_canceled";																				sleep 10;																								};																														
if (!workplacejob_plane_kundebeginn) then {												
_markername SetMarkerPosLocal getPos INV_LocalplaneKunde;																																	};																																																															
if (((player distance workplacejob_actionflag_search <= 5) or (player distance workplace_getjobflag_2 <= 5) or (player distance workplace_getjobflag_3 <= 5)) and (_action == 0))  then {workplace_getplanecancelaction = player addAction [localize "STRS_workplacemission_plane_cancelaction", "airline.sqf", ["canceljob_plane"]]; _action = 1;};												
if ((((player distance workplacejob_actionflag_search > 5) and (player distance workplace_getjobflag_2 > 5) and (player distance workplace_getjobflag_3 > 5)) and (_action == 1))) then {player removeAction workplace_getplanecancelaction; _action = 0;};				};																																																				
deleteVehicle INV_LocalplaneKunde;				deleteMarkerLocal _markername;																																																														
workplacejob_plane_kundeactive = false;						
workplacejob_plane_kundebeginn = false;																												
if (isNull(INV_LocalplaneKunde)) exitWith {};										
if ((not(alive player)) or (not(alive INV_LocalplaneKunde)) or (not(workplacejob_plane_active))) exitWith {};																																					};																								
player removeAction workplace_getplanecancelaction;						sleep ((workplacejob_plane_sperrzeit)*60);			
workplacejob_plane_active = false;					
workplacejob_plane_sperre = false;};if (_art == "canceljob_plane") then {			player removeAction workplace_getplanecancelaction;														
workplacejob_plane_active = false;};