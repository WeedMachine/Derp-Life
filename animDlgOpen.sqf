//  Animations Dialogue
// animDlgOpen.sqf
//Eddie Vedder
if (!(createDialog "animationsdialog")) exitWith 
{
	hint "Dialog Error!";
};
if(player distance CopPrison < 45) exitWith {};
{
	_index = lbAdd [1, (_x select 3)];	
	lbSetData [1, _index, (_x select 1)];
} forEach ANIM_AllAnimationArray;

buttonSetAction [2, "[lbCurSel 1, (lbData [1, (lbCurSel 1)])] execVM ""animplay.sqf""; closedialog 0;"];