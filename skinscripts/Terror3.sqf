_geld = 'geld' call INV_getitemamount;
if(_geld< SkinTerr)exitwith{player groupchat "not enough money"};
if(_geld >= SkinTerr)exitwith{

['geld', -SkinTerr] call INV_addinventoryitem;

player groupchat "wait, please";

["GUE_Soldier_3"] execVM "changeclass.sqf";

};