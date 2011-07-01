_geld = 'geld' call INV_getitemamount;
if(_geld< SkinTerrB)exitwith{player groupchat "not enough money"};
if(_geld >= SkinTerrB)exitwith{

['geld', -SkinTerrB] call INV_addinventoryitem;

player groupchat "wait, please";

["RU_Soldier_sniper"] execVM "changeclass.sqf";

};

