_art 	= _this select 0;
_item 	= _this select 1;
_vcl	= vehicle player;
_type	= typeof _vcl;

if(_art == "use")then

{

if(_vcl == player)exitwith{player groupchat "you must be in a vehicle"};
if(_vcl iskindof "" or _type call INV_getitemTypeKg > 2)exitwith{player groupchat "you can't tune this vehicle"};

if(_vcl iskindof "ship" and ( _item == "supgrade3" or _item == "supgrade4" or _item == "supgrade5"))exitwith{player groupchat "you can only tune boats with speed upgrades 1 or 2!"};

if(_vcl iskindof "armored" and ( _item == "supgrade3" or _item == "supgrade4" or _item == "supgrade5"))exitwith{player groupchat "you can only tune boats with speed upgrades 1 or 2!"};

[_item, -1] call INV_AddInventoryItem; 

if(_item == "supgrade1")then{player groupchat "tuning vehicle..."; _vcl setfuel 0; sleep 6; _vcl setfuel 1; _vcl setvariable ["tuning", 1, true]; player groupchat "vehicle successfully tuned!";}; 
if(_item == "supgrade2")then{player groupchat "tuning vehicle..."; _vcl setfuel 0; sleep 7; _vcl setfuel 1; _vcl setvariable ["tuning", 2, true]; player groupchat "vehicle successfully tuned!";}; 
if(_item == "supgrade3")then{player groupchat "tuning vehicle..."; _vcl setfuel 0; sleep 8; _vcl setfuel 1; _vcl setvariable ["tuning", 3, true]; player groupchat "vehicle successfully tuned!";}; 
if(_item == "supgrade4")then{player groupchat "tuning vehicle..."; _vcl setfuel 0; sleep 9; _vcl setfuel 1; _vcl setvariable ["tuning", 4, true]; player groupchat "vehicle successfully tuned!";}; 
if(_item == "supgrade5")then{player groupchat "tuning vehicle..."; _vcl setfuel 0; sleep 10; _vcl setfuel 1; _vcl setvariable ["tuning", 5, true]; player groupchat "vehicle successfully tuned!";};

};