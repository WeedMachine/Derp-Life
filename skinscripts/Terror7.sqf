_geld = 'geld' call INV_getitemamount;
if(_geld< SkinTerr)exitwith{player groupchat "not enough money"};
if(_geld >= SkinTerr)exitwith{

['geld', -SkinTerrB] call INV_addinventoryitem;

player groupchat "wait, please";

["GUE_Soldier_sniper"] execVM "changeclass.sqf";

};