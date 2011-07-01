INV_PLAYERLIST	        = _this select 0; 
INV_PLAYERSTRINGLIST    = _this select 1;
INV_CANDOILLEGAL        = _this select 2;
INV_ROLESTRING          = format["%1", player]; 
INV_CALL_CREATVEHICLE   = "vehdespawn.sqf";
INV_MAX_ITEMS           = 10000000;
INV_MAX_DROPS	 	= 300;
INV_PLAYERCOUNT         = count INV_PLAYERSTRINGLIST;
INV_SaveVclArray        = true; 
INV_VehicleArray        = [];
INV_ServerVclArray      = [];   
INV_SaveObjArray        = false;
INV_shortcuts           = true;
INV_SperrenVerbotArray  = [[copbase1, 250],[sperrenverbot1, 250],[civspawn, 25],[sperrenverbot3, 30 ],[CopPrison, 45],[licenseflag2, 35],[banklogic, 19],[gunshop1, 15]];
INV_Serverspeedcamarray = [speed1,speed2,speed3,speed4,speed5]; publicVariable "INV_Serverspeedcamarray";
INV_JIP = true; publicVariable "INV_JIP";


_handler = [] execVM "INVfunctions.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "createfunctions.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "carparks.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "masterarray.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "shops.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "facharvest.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "licensearray.sqf";
waitUntil {scriptDone _handler};
_handler = [] execVM "initfilenames.sqf";
_handler = [] execVM "vclarrsave.sqf";

if (!dedicatedServer) then 

{

_handler = [] execVM "shopfarmfaclicenseactions.sqf";

};