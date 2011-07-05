_art = _this select 0;

if (_art == "use") then 
{													
INV_exitSeil     = false;														
_transporter = vehicle player;				
_objects     = nearestObjects [_transporter, ["Car"], 20];										
_exit        = false;							

if (not ((typeOf(_transporter)) isKindOf "air") ) exitWith {player groupChat localize "STRS_inv_item_seil_notinheli";};										
if ((count _objects) == 0) exitWith {player groupChat localize "STRS_inv_item_seil_notcloseenough";};						
if (((getPos _transporter) select 2) < 10) exitWith {player groupChat localize "STRS_inv_item_seil_closetoground";};																																
if (!(_transporter in INV_VehicleArray)) exitWith {player groupChat localize "STRS_inv_item_seil_nokey";};

_turnOn = false;					
		
if (call compile format["isNil(""%1_Seil_on"")", _transporter]) then
{																												
_turnOn = true;													
}
else 
{						
if (call compile format["not(%1_Seil_on)", _transporter]) then {_turnOn = true;} else {_turnOn = false;};							
};			
if (not(_turnOn)) exitWith {};																					

_transportObject = _objects select 0;						
_transportAction = _transporter addAction [localize "STRS_inv_item_seil_action_release", "someCompile.sqf", '["seilLoslassen"] execVM "heliLift.sqf";']; 																				
format["[""seilVisualisieren"", %1, %2] execVm ""heliLift.sqf"";", _transporter, _transportObject] call ISSE_pub_execPstr;																										
_altePos = [0,0,0];											
_neuePos = [0,0,0];								

while {true} do 
{																								
if ( (isNull    _transporter) or (isNull    _transportObject) ) exitWith {};																				
if ( (not alive _transporter) or (not alive _transportObject) ) exitWith {};																														
if (((getPos _transporter) select 2) < 10) then {																																													

_neuePos = [((getPos _transporter) select 0), ((getPos _transporter) select 1), 0];				

} 
else 
{																																	
_neuePos = [((getPos _transporter) select 0), ((getPos _transporter) select 1), (((getPos _transporter) select 2)-10)];																												
};															

_transportObject setPos _neuePos;																										
_transportObject setVectorDirAndUp [(vectorDir _transporter), (vectorUp _transporter)];																								

if (exitSeil) exitWith {player groupChat localize "STRS_inv_item_seil_action_released";};																																		

sleep 0.02;								
};																																	

if (not(isNull _transportObject)) then 
{										
_transporter removeAction _transportAction;													
};																					

call compile format["%1_Seil_on = false; publicVariable ""%1_Seil_on"";", _transporter];
};

if (_art == "seilLoslassen") then { INV_exitSeil = true; };

if (_art == "seilVisualisieren") then 
{					
_obj1   = _this select 1;															
_obj2   = _this select 2;			
_driver = driver _obj1;																									

call compile format["%1_Seil_on = true;", _obj1];		

while {( (_driver == driver _obj1) and (alive _obj1) and (call compile format["%1_Seil_on", _obj1]) )} do {								

if ( (isNull _obj1) or (isNull _obj2) ) exitWith {};																												

_pos1     = getPos _obj1;                          																														
_pos2     = getPos _obj2;                          														
_dis        = _obj1 distance _obj2;                  																								
_disX      = ((_pos1 select 0) - (_pos2 select 0)); 				
_disY      = ((_pos1 select 1) - (_pos2 select 1)); 																						
_disZ      = ((_pos1 select 2) - (_pos2 select 2)); 																						
_anzahl   = _dis * 2;                              										
_stufeX   = (_disX / _anzahl);                     								
_stufeY   = (_disY / _anzahl);                     																										
_stufeZ   = (_disZ / _anzahl);                     																		

for [{_i=0}, {_i < _anzahl}, {_i=_i+1}] do 
{																											
_posX = (_pos1 select 0) - (_stufeX * _i);																																				
_posY = (_pos1 select 1) - (_stufeY * _i);																																													
_posZ = (_pos1 select 2) - (_stufeZ * _i);																		
_pos  = [_posX, _posY, _posZ];																					

Drop 
[
"\ca\data\cl_basic", "", 	"Billboard", 1,  0.1 /* lifetime */,  _pos,	[0, 0, 0],  1, 	1.275, 	 1,  0, 	[0.4, 0.2, 0] /* size */,  [ [0.05, 0.05, 0.05, 0.8], [0.05, 0.05, 0.05, 0.8], [0.05, 0.05, 0.05, 0.8] ] /* color */, 	[0, 0, 0],  3, 	0.2, 	"", 	"",   ""																			
];																												

};																								
sleep 0.01;										
};
};