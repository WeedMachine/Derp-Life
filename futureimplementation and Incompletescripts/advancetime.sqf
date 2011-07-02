private ["_hour"];
while {true} do {
	sleep 10;
	_hour = date select 3;
	if ((_hour >= 2 and _hour < 7) or (_hour >= 16 and _hour < 21)) then {
		setDate [date select 0, date select 1, date select 2, date select 3, (date select 4) + 1.67];
	} else {
		if (_hour >= 7 and _hour < 16) then {
			setDate [date select 0, date select 1, date select 2, date select 3, (date select 4) + 1.87];
		} else {
			setDate [date select 0, date select 1, date select 2, date select 3, (date select 4) + 4.17];
		};
	};
};
