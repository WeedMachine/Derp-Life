if (!isCop) exitWith {};

_cop = vehicleVarName player;

/*call compile format ['
	if (isNil "%1_needSupport") then
	{
		%1_needSupport = false;
	};
', _cop];*/


_support = call compile format ['%1_needSupport', _cop];
hint format ["Running!\n%1", _support];
if (!_support) then
{
	call compile format ['%1_needSupport = true; publicVariable "%1_needSupport";', _cop];
	format["if (isCop) then {hint format [localize ""STRS_emergency_cop_panic_needed"", %1];};", _cop] call ISSE_pub_execPstr;
	//hint "need support";
}
else
{
	call compile format ['%1_needSupport = false; publicVariable "%1_needSupport";', _cop];
	//hint "dont need support";
	format["if (isCop) then {hint format [localize ""STRS_emergency_cop_panic_needed_not"", %1];};", _cop] call ISSE_pub_execPstr;
};