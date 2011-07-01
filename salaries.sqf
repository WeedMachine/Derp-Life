while {iscop} do 

{

sleep 60;
player groupChat format[localize "STRS_geld_countdown", "2"];
sleep 60;
player groupChat format[localize "STRS_geld_countdown", "1"];
sleep 60;

if(!alive power1 and !alive power2) then {kraftwerk = 2}else{kraftwerk = 1};
_income = add_copmoney;

if ("patrol_training" call INV_HasLicense) then 

	{

	_income = _income + (1000 + random 500 - random 500);

	};

if ("response_training" call INV_HasLicense) then 

	{

	_income = _income + (1500 + random 600 - random 600);

	};
	
if ("air_support_training" call INV_HasLicense) then 

	{

	_income = _income + (2000 + random 750 - random 750);

	};

if ("sobr_training" call INV_HasLicense) then 

	{

	_income = _income + (2500 + random 1000 - random 1000);

	}; 

if (ischief) then 

	{
																					
	_income = _income + chiefExtraPay;                          																											
		
	};

_income = round (_income/kraftwerk);
kontostand = kontostand + _income;
player groupChat format[localize "STRS_geld_copmoneyadd", rolestring, ((round _income) call ISSE_str_IntToStr)];
sleep 1;					
if(ischief)then{player groupchat format["As a Police Chief you get an extra paycheck of $%1.", (chiefExtraPay call ISSE_str_IntToStr)]};   

};

while {isciv} do 

{

sleep 60;
player groupChat format[localize "STRS_geld_countdown", "2"];
sleep 60;
player groupChat format[localize "STRS_geld_countdown", "1"];
sleep 60;
if(!alive power1 and !alive power2) then {kraftwerk = 2}else{kraftwerk = 1};	       
if ((alive player) and (deadcam == 0)) then 

	{

	_workplacepaycheck = 0;
	_uniPaycheck       = 0;	
	_unimsg            = ""; 	
	_atworkplacemsg    = localize "STRS_geld_nowere";									
	_hashideoutmsg     = "";
	_income            = add_civmoney;
	_mygang		   = "None";
	_activecount	   = 0;	
	
	for [{_i=0}, {_i < (count BuildingsOwnerArray)}, {_i=_i+1}] do 

		{

		_check = ( round( (random 2)*((BuyAbleBuildingsArray select _i) select 4) ) );
		_income = _income + _check;
		
		};

	if (timeinworkplace > 0) then 

		{

		_workplacepaycheck = (round(add_workplace/180*timeinworkplace));
		_income = _income + _workplacepaycheck;
		_atworkplacemsg     = localize "STRS_geld_were";	

		};
		
		if ("Citizen of Chernogorsk" call INV_HasLicense) then 

		{

		_income = _income + (10000 + random 1000 - random 1000);

		};
		
		for "_c" from 0 to (count gangsarray - 1) do 

		{

		_gangarray = gangsarray select _c;
		_gangname  = _gangarray select 0;
		_members   = _gangarray select 1;
		
		if((name player) in _members)then

			{

			_mygang = _gangname;

			for "_i" from 0 to (count _members - 1) do 

				{

				_civ = [(_members select _i), civarray] call INV_findunit;

				if(!isnull _civ)then{_activecount = _activecount + 1};

				};

			};
		
		};

	if(_mygang != "None") then

		{

		if(gangarea1 getvariable "control" == _mygang)then{_income = _income + (gangincome/_activecount)};
		if(gangarea2 getvariable "control" == _mygang)then{_income = _income + (gangincome/_activecount)};
		if(gangarea3 getvariable "control" == _mygang)then{_income = _income + (gangincome/_activecount)};

		};			


	timeinworkplace = 0;
	_income = round (_income/kraftwerk);		
	kontostand = kontostand + _income;
	player groupChat format[localize "STRS_geld_civmoneyadd", rolestring, (_income call ISSE_str_IntToStr)];		

	if (isMayor) then 

		{
																					
		MayorSteuern = MayorSteuern + INV_SteuernGezahlt;                     																																							
		MayorSteuern = round((MayorSteuern / 100) * MayorBekommtSteuern); 									
		kontostand = kontostand + MayorSteuern;                           																					
		kontostand = kontostand + MayorExtraPay;                          																											
		player groupchat format["As a Mayor you get an extra paycheck of $%1. You also got $%2 taxes.", (MayorExtraPay call ISSE_str_IntToStr), (MayorSteuern call ISSE_str_IntToStr)];		

		} 
		else 
		{
																																			
		if (INV_SteuernGezahlt > 0) then 

			{	

			(format["if (isMayor) then {MayorSteuern = MayorSteuern + %1;};", INV_SteuernGezahlt]) call broadcast;	

			};	

		};
				
	MayorSteuern   = 0;																		
	INV_SteuernGezahlt = 0;		

	} 
	else 
	{

	player groupChat format[localize "STRS_geld_paycheckdead"];

	};

}; 
