_geld = 'geld' call INV_getitemamount;
if(_geld< Hospital)exitwith{player groupchat "not enough money"};
if(_geld >= Hospital)exitwith{

['geld', -Hospital] call INV_addinventoryitem;

player groupchat "Ready! Good luck!";
player setdammage 0;

};