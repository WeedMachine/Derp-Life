_this    = _this select 3;
_number  = _this select 0;
_art     = _this select 1;

if ((_art == "remove") or (_art == "add")) then 

{

if (_art == "add") then 

	{
	_uid = getPlayerUID vehicle  player;
	_license = ((INV_Lizenzen select _number) select 0);
	_name    = ((INV_Lizenzen select _number) select 2);
	_cost    = ((INV_Lizenzen select _number) select 3);
	if (_license call INV_HasLicense) exitWith {player groupChat localize "STRS_inv_buylicense_alreadytrue";};
	if (('geld' call INV_GetItemAmount) < _cost) exitWith {player groupChat localize "STRS_inv_buylicense_nomoney";};
	if(_license == "car" or _license == "truck")then{demerits = 10};	//demerits = Punkte wie in Flensburg

	if(_license == "bounty" and (CopsKilled >5)) exitWith {player groupChat "You killed to many Cops to become a bountyhunter."};
	//if(_license == "sobr_training" and !(_uid in sobrerlaubt)) exitWith { player groupChat "You are not able to become a SOBR. If you a are good cop make a post in the HGS Forum then you will be able to buy this license."};
	if(_license == "gunprobationpistol" and (_uid in keineGun)) exitWith { player groupChat "Its not allowed to you to buy this license! You should think about changing your Gameplay!"};
	if(_license == "response_training" and (_uid in keincriminal)) exitWith { player groupChat "Its not allowed to you to buy this license! You should think about changing your Gameplay!"};
	if(_license == "terror" and (_uid in keinterror)) exitWith { player groupChat "Its not allowed to you to buy this license! You should think about changing your Gameplay!"};
	
	

	['geld', -(_cost)] call INV_AddInventoryItem;
	player groupChat format[localize "STRS_inv_buylicense_gottraining", (_cost call ISSE_str_IntToStr), _name];

	if(_license == "bounty") then {true call TurnBountyFunc;};
	
	
	
	
	//if(_license == "terrorist")exitwith{[terroristarray select round random(count terroristarray - 1)] execVM "changeclass.sqf";};
	//if(_license == "sobr_training" and !(ischief))exitwith{["MVD_soldier"] execVM "changeclass.sqf";};
    //if(_license == "sobr_training" and ischief)exitwith{["RUS_COMMANDER"] execVM "changeclass.sqf";};
	
	INV_LizenzOwner = INV_LizenzOwner + [_license];
	["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;
	
	} 
	else 
	{

	_license = ((INV_Lizenzen select _number) select 0);
	name    = ((INV_Lizenzen select _number) select 2);
	if (not(_license call INV_HasLicense)) exitWith {player groupChat localize "STRS_inv_buylicense_alreadyfalse";};
	INV_LizenzOwner = INV_LizenzOwner - [_license];
	if(_license == "bounty") then {false call TurnBountyFunc;};
	player groupChat format[localize "STRS_inv_buylicense_losttraining", _name];
	["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;

	};

};

