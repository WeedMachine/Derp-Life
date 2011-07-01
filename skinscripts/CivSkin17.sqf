_geld = 'geld' call INV_getitemamount;
if(_geld< CivSkin)exitwith{player groupchat "not enough money"};
if(_geld >= CivSkin)exitwith{

['geld', -CivSkin] call INV_addinventoryitem;

player groupchat "wait, please";

["ru_villager3"] execVM "changeclass.sqf";

};