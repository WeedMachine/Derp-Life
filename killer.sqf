_killer 		= _this select 0;		//Person die getötet wurde
_killedbyvehicle 	= _this select 1;
_license 		= _this select 2;
_self			= player;			//Der wirkliche Killer
playerbaut 		= false;

if (player == _killer and !iscop and !suicided) exitWith {};

if (player == _killer and !iscop and suicided) exitWith 

{

player groupChat localize "STRS_handlerdeadpub_suicide"; 
SelfKilled = SelfKilled + 1;
extradeadtime = extradeadtime + suicidepenalty;
["extradeadtime", extradeadtime] spawn ClientSaveVar;

};

if (player == _killer and iscop) exitWith {};

if (_killer in civarray) then 								//Der getötet ist ein Civ

{


	CivsKilled = CivsKilled + 1;
	_gesucht = 0;									//initialisierung von _gesucht 
	call compile format ["_gesucht = %1_wanted;", _killer];				

	_civkopfgeld = call compile format ["kopfgeld_%1", _killer];			//Kopfgeld des Toten wird geladen


	if (iscop or ("bounty" call INV_HasLicense and _civkopfgeld > 20000)) then 				//Ist der Mörder ein Cop oder ein Kopfgeldjäger
	{
	
	
		


		if (_civkopfgeld != 0 and iscop) then 
		{
		_civkopfgeld = _civkopfgeld / 4;
		(format['if (player == %3)then{kontostand = kontostand + %2; player groupChat "You got 1/4 of the civs bounty totaling $%2"}', player, _civkopfgeld, _self]) call broadcast;
		};


		if (_civkopfgeld != 0 and isciv) then 
		{
		_civkopfgeld = _civkopfgeld / 2;
		(format['if (player == %3)then{kontostand = kontostand + %2; player groupChat "You got 1/2 of the civs bounty totaling $%2"}', player, _civkopfgeld, _self]) call broadcast;
		};
		

		if (_gesucht == 0) then {player groupChat format [localize "STRS_handlerdeadpub_civkilled", _killer, (killstrafe call ISSE_str_IntToStr)];extradeadtime = extradeadtime + killedplayerinc;
		["extradeadtime", extradeadtime] spawn ClientSaveVar;};

	} 
	else 
	{	

	extradeadtime = extradeadtime + killedplayerinc;
	["extradeadtime", extradeadtime] spawn ClientSaveVar;
	true call TurnWantedFunc;
		
	if(_killedbyvehicle)then

		{

		INV_LizenzOwner = INV_LizenzOwner - ["car","truck"];
		["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar; 
		player groupchat "You have lost your vehicle licenses for reckless driving!";
		demerits = 0;
		
		}else{

		player groupchat "You are now wanted, and lost your gun licenses!";
		INV_LizenzOwner = INV_LizenzOwner - ["gunprobationpistol","riflelicense","semiautomatic","bounty"];
		["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;
		false call TurnBountyFunc;
		};

	sleep 1;
	(format ["[""KilledCiv"", %1, ""%2""] spawn Isse_AddCrimeLogEntry; if(%1 in civarray)then{if(!(""murder"" in %1_reason))then{%1_reason = %1_reason + [""murder""]}; kopfgeld_%1 = kopfgeld_%1 + 50000};", player, _killer]) call broadcast;

	};

};



if (_killer in coparray) then 

{

CopsKilled = CopsKilled + 1;

if (iscop) then 

	{

	extradeadtime = extradeadtime + killedplayerinc;
	["extradeadtime", extradeadtime] spawn ClientSaveVar;
	player groupChat format [localize "STRS_handlerdeadpub_copkilledbycop", _killer];
	
	if ( (player distance copbase1 <= 400) or (_killer distance copbase1 <= 400) or (CopsKilled > 5) ) then 

		{

		[] execVM "copprison.sqf";

		};

	} 
	else 
	{

	extradeadtime = extradeadtime + killedplayerinc;
	["extradeadtime", extradeadtime] spawn ClientSaveVar;
	player groupChat format [localize "STRS_handlerdeadpub_copkilled", _killer];
	true call TurnWantedFunc;

	if(_killedbyvehicle)then

		{

		INV_LizenzOwner = INV_LizenzOwner - ["car","truck"];
		["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar; 
		player groupchat "You have lost your vehicle licenses for reckless driving!";
		demerits = 0;
		
		}else{

		player groupchat "You are now wanted, and lost your gun licenses!";
		INV_LizenzOwner = INV_LizenzOwner - ["gunprobationpistol","riflelicense","semiautomatic" ,"bounty"];
		["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;

		};

	};

sleep 1;
(format ["[""KilledCop"", %1, ""%2""] spawn Isse_AddCrimeLogEntry; if(%1 in civarray)then{if(!(""murder"" in %1_reason))then{%1_reason = %1_reason + [""murder""]}; kopfgeld_%1 = kopfgeld_%1 + 60000};", player,  _killer]) call broadcast;

};

