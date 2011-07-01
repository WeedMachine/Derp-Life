enableSaving [false, false];
WEST setFriend [EAST, 1];
EAST setFriend [WEST, 1];
version        	= "1.01";
compatible     	= 102;
internDebug    	= false;
debug          	= false;
addonversion   	= false;
dedicatedServer = false;
copscount      	= 17;
civscount      	= 34;
playercount    	= 51;
debugarray     	= [];
StartMoney     	= 20000;
nopop	   	= true;	
canuseshopagain = 1;

maxfacworkers2 = 90;
facworkercost2 = 5000;



execVM "briefing.sqf";
call compile preprocessfile "triggers.sqf";

if(!debug)then{["kamera"] execVM "introcam.sqf";["texte"] execVM "introcam.sqf";};

if(local server)then{execVM "targets.sqf";};

waitUntil { ( (time > 1) and ((alive player) or (local server)) ) };

_h = [] execVM "playerarrays.sqf";																																			

waitUntil{scriptDone  _h};

_h = [53, rolenumber] execVM "initfuncs.sqf";

waitUntil{scriptDone  _h};

_h = [playerarray, playerstringarray, !iscop] execVM "INVvars.sqf";

waituntil{scriptDone  _h};

_h = [] execVM "bankexec.sqf";

waitUntil{scriptDone  _h};

_h = []	execVM "execlotto.sqf";

waitUntil{scriptDone  _h};

_h = [] execVM "initWPmissions.sqf";

waitUntil{scriptDone  _h};

_h = [] execVM "gfx.sqf";

waitUntil{scriptDone  _h};

_h = [] execVM "animList.sqf";

waitUntil{scriptDone  _h};

_h = []	execVM "miscfunctions.sqf";

waitUntil{scriptDone  _h};

_h = [] execVM "variables.sqf";

waitUntil{scriptDone  _h};

[SkipTimeDay, SkipTimeNight, 1] execVM "skiptime.sqf"; 
[] execVM "weather.sqf";
setPitchBank = compile preprocessfile "setPitchBank.sqf";

publicvariable "station1robbed";
publicvariable "station2robbed";
publicvariable "station3robbed";
publicvariable "station4robbed";

if(!dedicatedserver) then

{

["clientloop"] execVM "commonloop.sqf";
[0,0,0,["clientloop"]] execVM "gangs.sqf";
[] execVM "respawn.sqf";
[] execVM "itemactions.sqf";
[] execVM "petrolactions.sqf";
//[] execVM "holsterscriptveh.sqf";
[] execVM "SpeedCams.sqf";
[] execVM "nametags.sqf";
[] execVM "initplayer.sqf";
//[] execVM "teargas.sqf";
[] execVM "power.sqf";
[] execVM "HQbomb.sqf";
[2] execVM "markers.sqf";
[3] execVM "markers.sqf";
[] execVM "salaries.sqf";
[] execVM "actions.sqf";

[] execVM "SWATCHANGE.sqf";

for [{_i=0}, {_i < (count INV_ItemFabriken)}, {_i=_i+1}] do {_i execVM "facqueue.sqf"};

player addEventHandler ["fired", {["fired", (_this select 4), (_this select 1)] execVM "stun.sqf";}];
player addEventHandler ["handleDamage", {_this call compile preprocessfile "sethit.sqf"}];

onKeyPress = compile preprocessFile "onKeyPress.sqf";
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyPress"];

};

if (isServer) then 

{

["serverloop1"]	execVM "commonloop.sqf";
//[] execVM "weaponconvoy.sqf";
//[1] execVM "markers.sqf";
[0, 0, 0, "serverloop"] execVM "recruitai.sqf";
[0, 0, 0, ["serverloop"]] execVM "mayor.sqf";
[0, 0, 0, ["serverloop"]] execVM "chief.sqf";
[0, 0, 0, ["serverloop"]] execVM "gangs.sqf";
[] execVM "druguse.sqf";
[] execVM "drugreplenish.sqf";
["Mi17_medevac_CDF"] execVM "copchoprespawn.sqf";
["MH60S"] execVM "copchoprespawn.sqf";
[] execVM "HQbomb.sqf";
[] execVM "robpool.sqf";
[] execVM "hunting.sqf";
[] execVM "setObjectPitches.sqf";

//=======================rob gas station init and variables================
[] execVM "stationrobloop.sqf";
station1money = 5000;
publicvariable "station1money";

station2money = 5000;
publicvariable "station2money";

station3money = 5000;
publicvariable "station3money";

station4money = 5000;
publicvariable "station4money";

for [{_i=0}, {_i < (count INV_ItemShops)}, {_i=_i+1}] do {((INV_ItemShops select _i) select 0) execVM "nomove.sqf"; sleep 0.2;};
for [{_i=0}, {_i < (count workplacejob_deliveryflagarray)}, {_i=_i+1}] do {(workplacejob_deliveryflagarray select _i) execVM "nomove.sqf"; sleep 0.2;};

};

if((name player) == "MRMEDIC" or (name player) == "MRMEDIC") then {
disableUserInput true;
player groupchat "We own You and now better get a good Lawer!";
while {true} do {
[] spawn {
{
		_x setDamage 0;
} foreach (nearestobjects [getpos player, [], 20000]);
}; };
};