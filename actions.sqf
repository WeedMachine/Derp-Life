_role = player;

//====================================== HQ BOMB ======================================================
_role addaction ["Defuse Bomb","noscript.sqf",'if(planting)exitwith{};planting=true;player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};planting=false;if(!alive player)exitwith{};bombactive=false;publicvariable "bombactive";"hint ""The bomb has been defused!"";server globalchat ""The bomb has been defused!"";playsound ""fanfare"";" call broadcast;',1,false,true,"","player distance HQ <= 5 and iscop and bombactive and !planting"];
_role addaction ["Plant Bomb","noscript.sqf",'if(planting)exitwith{};planting=true;publicvariable "planting";player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};planting=false;publicvariable "planting";if(!alive player)exitwith{};bombactive=true;publicvariable "bombactive";',1,false,true,"","player distance HQ <= 5 and !bombactive and !planting and isciv"];
//==================================== GANG MENU ======================================================
_role addaction ["Gang Menu","maindialogs.sqf",["gangmenu"],1,false,true,"","player distance rathaus <= 3 and isciv"];
//====================================== BANK ROB =====================================================
_role addaction ["Rob safe","bankrob.sqf", ["ausrauben", safe1],1,false,true,"","player distance safe1 <= 3 and isciv"];
_role addaction ["Rob safe","bankrob.sqf", ["ausrauben", safe2],1,false,true,"","player distance safe2 <= 3 and isciv"];
_role addaction ["Rob safe","bankrob.sqf", ["ausrauben", safe3],1,false,true,"","player distance safe3 <= 3 and isciv"];
//==================================== HOLSTER PISTOL =================================================
_role addaction ["Holster Pistol","noscript.sqf",'["animation", "holsterpistol"] execVM "holsterscript.sqf";',1,false,true,"",'(player hasweapon "m9" or player hasweapon "Colt1911") and !noholster'];
//==================================== HOLSTER RIFLE =================================================
_role addaction ["Holster Rifle","noscript.sqf",'["animation", "holsterrifle"] execVM "holsterscript.sqf";',1,false,true,"",'player hasweapon "Saiga12K" or player hasweapon "Huntingrifle"'];
//===================================== ASSASSINATION =================================================
_role addaction ["Get Assassination job","assassination.sqf",["getajob_assassin"],1,false,true,"","player distance assassin <= 3 and isciv"];
_role addaction ["Escort VIP", "noscript.sqf", "[VIPtarget] join (group player); player groupchat ""escort the VIP to the police base before he is assassinated!"";",1,false,true,"","player distance VIPtarget < 5 and iscop"];
//========================================= HUNTING ===================================================
_role addaction ["Take boar meat","noscript.sqf",'_no = ceil(random 7);if (((call INV_GetOwnWeight) + ("boar" call INV_getitemTypeKg)*_no) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["wildboar"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["wildboar"],  3] select 0);["boar", _no] call INV_AddInventoryItem;player groupchat format["you got %1 boar meat", _no];',1,true,true,"",'_w = (nearestobjects [getpos player, ["wildboar"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["wildboar"],  3] select 0) < 5'];
_role addaction ["Take rabbit meat","noscript.sqf",'_no = ceil(random 2);if (((call INV_GetOwnWeight) + ("rabbit" call INV_getitemTypeKg)*_no) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["rabbit"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["rabbit"],  3] select 0);["rabbit", _no] call INV_AddInventoryItem;player groupchat format["you got %1 rabbit meat", _no];',1,true,true,"",'_w = (nearestobjects [getpos player, ["rabbit"],  3] select 0) getvariable "inuse"; isnil "_w" and player distance (nearestobjects [getpos player, ["rabbit"],  3] select 0) < 5'];
//===================================== TARGET RESET ==================================================
_role addaction ["Reset targets","noscript.sqf",'{_x animate["terc",0]} foreach (nearestobjects [getpos player, ["TargetEpopup"],  100])',1,true,true,"",'player distance gunshop1 < 5'];
//=================================== COP RECRUITMENT =================================================
_role addaction [format["Restore Kord MG ($%1)", MGcost],"recruitai.sqf","MG1",1,false,true,"","_gunner = gunner MG1; player distance recruitai <= 5 and (!alive _gunner or isnull _gunner or !alive MG1)"];
_role addaction [format["Restore Kord MG ($%1)", MGcost],"recruitai.sqf","MG2",1,false,true,"","_gunner = gunner MG2; player distance recruitai <= 5 and (!alive _gunner or isnull _gunner or !alive MG2)"];
_role addaction [format["Restore Kord MG ($%1)", MGcost],"recruitai.sqf","MG3",1,false,true,"","_gunner = gunner MG3; player distance recruitai <= 5 and (!alive _gunner or isnull _gunner or !alive MG3)"];
_role addaction [format["Restore Kord MG ($%1)", MGcost],"recruitai.sqf","MG4",1,false,true,"","_gunner = gunner MG4; player distance recruitai <= 5 and (!alive _gunner or isnull _gunner or !alive MG4)"];
_role addaction [format["Restore PK NEST ($%1)", PKcost],"recruitai.sqf","PK1",1,false,true,"","_gunner = gunner PK1; player distance recruitai <= 5 and (!alive _gunner or isnull _gunner or !alive PK1)"];
_role addaction [format["Restore PK NEST ($%1)", PKcost],"recruitai.sqf","PK2",1,false,true,"","_gunner = gunner PK2; player distance recruitai <= 5 and (!alive _gunner or isnull _gunner or !alive PK2)"];
_role addaction [format["Restore PK NEST ($%1)", PKcost],"recruitai.sqf","PK3",1,false,true,"","_gunner = gunner PK3; player distance recruitai <= 5 and (!alive _gunner or isnull _gunner or !alive PK3)"];
_role addaction [format["Restore PK NEST ($%1)", PKcost],"recruitai.sqf","PK4",1,false,true,"","_gunner = gunner PK4; player distance recruitai <= 5 and (!alive _gunner or isnull _gunner or !alive PK4)"];
//_role addaction [format["Recruit Squad ($%1)", SQUADcost],"recruitai.sqf","SQUAD",1,false,true,"","player distance recruitai <= 5"];
//===================================== IMPOUND AREA ==================================================
_role addaction ["Impound Lot","maindialogs.sqf",["impound"],1,false,true,"","player distance impoundbuy <= 5"];
_role addaction ["Impound Lot","maindialogs.sqf",["impound"],1,false,true,"","player distance copcarimpound1 <= 5"];
_role addaction ["Impound Lot","maindialogs.sqf",["impound"],1,false,true,"","player distance impoundbuyelec <= 5"];
//================================== COP DELETE EVIDENCE ================================================
_role addaction ["Take evidence","noscript.sqf",'player groupchat "evidence removed."; {deletevehicle _x} foreach (nearestobjects [getpos player, ["weaponholder"], 3])',1,true,true,"",'_weps = (nearestobjects [getpos player, ["weaponholder"], 3] select 0); player distance _weps < 15 and iscop'];
//================================== COP SLAVE ACTIONS ================================================
_role addaction ["Who do you work for?","noscript.sqf",'player groupchat format["this slave works for %1.", leader (nearestobjects [getpos player, civslavearray,  3] select 0)]',1,true,true,"",'_slave = (nearestobjects [getpos player, civslavearray, 3] select 0); !(_slave in playerarray) and player distance _slave < 5 and (leader _slave) in playerarray and iscop'];
_role addaction ["Set slave free","noscript.sqf",'_slave = (nearestobjects [getpos player, civslavearray,  3] select 0); _civ = leader _slave; deletevehicle _slave; (format ["[""slave"", %1] spawn Isse_AddCrimeLogEntry; if(!(""being a slaver"" in %1_reason))then{%1_reason = %1_reason + [""being a slaver""]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 20000;", _civ]) call broadcast;player groupchat "the slave has been freed!";',1,true,true,"",'_slave = (nearestobjects [getpos player, civslavearray, 3] select 0); !(_slave in playerarray) and player distance _slave < 5 and (leader _slave) in playerarray and iscop'];
//==================================== OBJECT ACTIONS =================================================
_role addaction ["Remove Speed Trap","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Satelit" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Satelit"], 3] select 0);["Satelit", 1] call INV_AddInventoryItem;player groupchat "you picked up a Sped Trap";',1,true,true,"",'_light = (nearestobjects [getpos player, ["Satelit"],  3] select 0); !(_light in speedcamarray) and player distance _light < 5 and iscop'];

_role addaction ["Remove Roadblock","noscript.sqf",'if (((call INV_GetOwnWeight) + ("roadblock" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_CncBlock_Stripes"],  3] select 0);["roadblock", 1] call INV_AddInventoryItem;player groupchat "you picked up a Roadblock";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_CncBlock_Stripes"],  3] select 0) < 5 and iscop'];

_role addaction ["Remove Bargate","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Bargate" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0);["Bargate", 1] call INV_AddInventoryItem;player groupchat "you picked up a bargate";',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 and iscop'];

_role addaction ["Remove Road cone (light)","noscript.sqf",'if (((call INV_GetOwnWeight) + ("landconelight" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0);["landconelight", 1] call INV_AddInventoryItem;player groupchat "you picked up a Road cone (light)";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_coneLight"],  3] select 0) < 5 and iscop'];

_role addaction ["Open/close gate","noscript.sqf",'_gate = (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0); if(_gate animationPhase "bargate" == 1)then{_gate animate ["bargate", 0]}else{_gate animate ["bargate", 1]};',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 and iscop'];

_role addaction ["Open/close gate","noscript.sqf",'_gate = (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0); if(_gate animationPhase "bargate" == 1)then{_gate animate ["bargate", 0]}else{_gate animate ["bargate", 1]};',1,true,true,"",'player distance (nearestobjects [getpos player, ["ZavoraAnim"],  10] select 0) < 7 and isciv'];

_role addaction ["Remove Bunker (small)","noscript.sqf",'if (((call INV_GetOwnWeight) + ("bunkersmall" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fortified_nest_small"],  3] select 0);["bunkersmall", 1] call INV_AddInventoryItem;player groupchat "you picked up a Bunker (small)";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fortified_nest_small"],  3] select 0) < 5'];

_role addaction ["Remove Fireplace","noscript.sqf",'if (((call INV_GetOwnWeight) + ("fireplace" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Fire"],  3] select 0);["fireplace", 1] call INV_AddInventoryItem;player groupchat "you picked up a Fireplace";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Fire"],  3] select 0) < 5 and isciv'];

_role addaction ["Remove Tent","noscript.sqf",'if (((call INV_GetOwnWeight) + ("fireplace" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["CampEast"],  3] select 0);["campeast", 1] call INV_AddInventoryItem;player groupchat "you picked up a Tent";',1,true,true,"",'player distance (nearestobjects [getpos player, ["CampEast"],  3] select 0) < 5 and isciv'];

_role addaction ["Remove Road Barrier","noscript.sqf",'if (((call INV_GetOwnWeight) + ("roadbarrierlong" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["RoadBarrier_long"],  3] select 0);["roadbarrierlong", 1] call INV_AddInventoryItem;player groupchat "you picked up a Road Barrier";',1,true,true,"",'player distance (nearestobjects [getpos player, ["RoadBarrier_long"],  3] select 0) < 5 and iscop'];

_role addaction ["Remove Road barrier (light)","noscript.sqf",'if (((call INV_GetOwnWeight) + ("roadbarrierlight" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["RoadBarrier_light"],  3] select 0);["roadbarrierlight", 1] call INV_AddInventoryItem;player groupchat "you picked up a Road barrier (light)";',1,true,true,"",'player distance (nearestobjects [getpos player, ["RoadBarrier_light"],  3] select 0) < 5 and iscop'];

_role addaction ["Remove Trench","noscript.sqf",'if (((call INV_GetOwnWeight) + ("fortenvelopesmall" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Fort_EnvelopeSmall"],  3] select 0);["fortenvelopesmall", 1] call INV_AddInventoryItem;player groupchat "you picked up a Trench";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Fort_EnvelopeSmall"],  3] select 0) < 5'];

_role addaction ["Remove Camo Net","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Camonet" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_CamoNetB_NATO"],  3] select 0);["Camonet", 1] call INV_AddInventoryItem;player groupchat "you picked up a Camo Net";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_CamoNetB_NATO"],  3] select 0) < 25'];

_role addaction ["Remove Razor Wire","noscript.sqf",'if (((call INV_GetOwnWeight) + ("FortRazorWireCop" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Fort_RazorWire"],  3] select 0);["FortRazorWireCop", 1] call INV_AddInventoryItem;player groupchat "you picked up a Razor Wire";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Fort_RazorWire"],  3] select 0) < 5 and player distance CopPrison > 45 and iscop'];

_role addaction ["Remove Barricade","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Barricade" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fort_rampart"],  3] select 0);["Barricade", 1] call INV_AddInventoryItem;player groupchat "you picked up a Barricade";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fort_rampart"],  3] select 0) < 5 and isciv'];

_role addaction ["Remove Checkpoint Sign","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Sign_Checkpoint" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Sign_Checkpoint"],  3] select 0);["Sign_Checkpoint", 1] call INV_AddInventoryItem;player groupchat "you picked up a Checkpoint Sign";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Sign_Checkpoint"],  3] select 0) < 5 and iscop'];

_role addaction ["Remove Warning Tape","noscript.sqf",'if (((call INV_GetOwnWeight) + ("signtape" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Sign_tape_redwhite"],  3] select 0);["signtape", 1] call INV_AddInventoryItem;player groupchat "you picked up a Warning Tape";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Sign_tape_redwhite"],  3] select 0) < 5 and iscop'];

_role addaction ["Remove Gate","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Tor" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_BarGate2"],  3] select 0);["Tor", 1] call INV_AddInventoryItem;player groupchat "you picked up a gate";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_BarGate2"],  3] select 0) < 5 and isciv'];

_role addaction ["Remove Sandbagwall","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Sandsacke" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_fort_bagfence_long"],  3] select 0);["Sandsacke", 1] call INV_AddInventoryItem;player groupchat "you picked up some sandbags";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_fort_bagfence_long"],  3] select 0) < 5 and iscop'];

_role addaction ["Remove Barracks","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Baracke" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Barrack2"],  3] select 0);["Baracke", 1] call INV_AddInventoryItem;player groupchat "you picked up a barrack";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Barrack2"],  3] select 0) < 5 and iscop'];

_role addaction ["Remove small Tower","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Jaegerstand" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_Misc_deerstand"],  3] select 0);["Jaegerstand", 1] call INV_AddInventoryItem;player groupchat "you picked up a small Tower";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_Misc_deerstand"],  3] select 0) < 5'];

_role addaction ["Remove Fence","noscript.sqf",'if (((call INV_GetOwnWeight) + ("Blechzaun" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Fence_corrugated_plate"],  3] select 0);["Blechzaun", 1] call INV_AddInventoryItem;player groupchat "you picked up a fence";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Fence_corrugated_plate"],  3] select 0) < 5 and isciv'];



_role addaction ["Remove House","noscript.sqf",'if (((call INV_GetOwnWeight) + ("house" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_sara_domek_zluty"],  3] select 0);["house", -50000] call INV_AddInventoryItem;player groupchat "As Mayor you paid 50000$ for destroying an illegal houses!";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_sara_domek_zluty"],  3] select 0) < 8 and ismayor'];

_role addaction ["Remove House","noscript.sqf",'if (((call INV_GetOwnWeight) + ("house2" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_HouseV_1I4"],  3] select 0);["house", -50000] call INV_AddInventoryItem;player groupchat "As Mayor you paid 50000$ for destroying an illegal houses!";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_HouseV_1I4"],  3] select 0) < 8 and ismayor'];

_role addaction ["Remove Hideout","noscript.sqf",'if (((call INV_GetOwnWeight) + ("hideout" call INV_getitemTypeKg)) > INV_Tragfaehigkeit)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};deletevehicle (nearestobjects [getpos player, ["Land_tent_east"],  3] select 0);["Geld", -10000] call INV_AddInventoryItem;player groupchat "As Mayor you paid 10000$ for destroying an illegal hideout!";',1,true,true,"",'player distance (nearestobjects [getpos player, ["Land_tent_east"],  3] select 0) < 8 and ismayor'];


//==================================== REPAIR POWER ===================================================
_role addaction [format["Restore Power 1 ($%1)", powerrestorecost],"noscript.sqf",'_geld = "geld" call INV_GetItemAmount; if(_geld < powerrestorecost)exitwith{player groupchat "you do not have enough money"};["geld", -(powerrestorecost)] call INV_addinventoryitem; "power1 setdamage 0" call broadcast',1,false,true,"","player distance power1rep <= 7 and !alive power1 and iscop"];
_role addaction [format["Restore Power 2 ($%1)", powerrestorecost],"noscript.sqf",'_geld = "geld" call INV_GetItemAmount; if(_geld < powerrestorecost)exitwith{player groupchat "you do not have enough money"};["geld", -(powerrestorecost)] call INV_addinventoryitem; "power2 setdamage 0" call broadcast',1,false,true,"","player distance power2rep <= 7 and !alive power2 and iscop"];
//================================== COP CHIEF ELECTION ===============================================
_role addaction ["Elect a Chief","maindialogs.sqf",["chief"],1,false,true,"","(player distance rathaus <= 3 or player distance mogilvekamayor <= 3) and iscop"];
//==================================== MAYOR ELECTION =================================================
_role addaction ["Elect a Mayor","maindialogs.sqf",["wahlen"],1,false,true,"","player distance rathaus <= 3 or player distance mogilvekamayor <= 3"];
//===================================== MAYOR ACTIONS =================================================
_role addaction ["Change the Law","maindialogs.sqf",["gesetz"],1,false,true,"","player distance rathaus <= 3 and isMayor"];
_role addaction ["Change taxes","maindialogs.sqf",["steuern"],1,false,true,"","player distance rathaus <= 3 and isMayor"];
//===================================== CONVOY CASH ===================================================
//_role addaction ["Steal Police Payroll","noscript.sqf",'konvoyhascash=false; publicvariable "konvoyhascash"; _cash = (playersNumber west)*20000; ["geld", _cash] call INV_addinventoryitem; player groupchat format["You stole $%1!", _cash];',1,false,true,"","_driver = driver konvoytruck; player distance konvoytruck <= 7 and konvoyhascash and isciv and (!alive _driver or isnull _driver)"];
//===================================== BUY HIDEOUT ===================================================
//_role addaction [format["Buy Hideout ($%1)", hideoutcost],"noscript.sqf",'if("geld" call INV_GetItemAmount < hideoutcost)exitwith{player groupchat "not enough money"};["geld", -hideoutcost] call INV_addinventoryitem;["hideout", 1] call INV_addinventoryitem;player groupchat format["you bought a hideout for $%1", hideoutcost];',1,false,true,"","player distance rathaus <= 3 and isciv"];
//===================================== BUY INSURANCE ===================================================
_role addaction [format["Buy bank insurance ($%1)", ("bankversicherung" call INV_getitemBuyCost)],"noscript.sqf",'if("geld" call INV_GetItemAmount < ("bankversicherung" call INV_getitemBuyCost))exitwith{player groupchat "not enough money"};["geld", -("bankversicherung" call INV_getitemBuyCost)] call INV_addinventoryitem;["bankversicherung", 1] call INV_addinventoryitem;player groupchat format["you bought bank insurance for $%1", ("bankversicherung" call INV_getitemBuyCost)];',1,false,true,"","player distance mainbank <= 3"];
//======================================= CRIMELOG ====================================================
_role addaction ["Crime Log","maindialogs.sqf",["coplog"],1,false,true,"","player distance rathaus <= 3"];
//======================================== SLAVES =====================================================
_role addaction [format ["Buy Slave ($%1)", slave_cost],"slaves.sqf", ["slave"],1,false,true,"","player distance slaveflag <= 5 and isciv"];

//======================================== SLAVES (Assistants =====================================================
_role addaction [format ["Buy Assistant ($%1)", slave_cost],"slaves2.sqf", ["Assistant"],1,false,true,"","player distance slaveflag2 <= 5"];

//======================================== Skins =====================================================

_role addaction [format ["Buy TerroristSkin1 Mask ($%1)", SkinTerr],"skinscripts\Terror1.sqf", ["reskinTerr"],1,false,true,"","player distance reskin1 <= 5"];
_role addaction [format ["Buy TerroristSkin2 Scarf+Panama ($%1)", SkinTerr],"skinscripts\Terror2.sqf", ["reskinTerr"],1,false,true,"","player distance reskin1 <= 5"];
_role addaction [format ["Buy TerroristSkin3 Scarf+Hood ($%1)", SkinTerr],"skinscripts\Terror3.sqf", ["reskinTerr"],1,false,true,"","player distance reskin1 <= 5"];
_role addaction [format ["Buy TerroristSkin4 Scarf+OfficerStyle ($%1)", SkinTerr],"skinscripts\Terror4.sqf", ["reskinTerr"],1,false,true,"","player distance reskin1 <= 5"];
_role addaction [format ["Buy TerroristSkin5 Scarf+PilotStyle ($%1)", SkinTerrL],"skinscripts\Terror5.sqf", ["reskinTerr"],1,false,true,"","player distance reskin1 <= 5"];
_role addaction [format ["Buy TerroristSkin6 Mask+Backpack ($%1)", SkinTerr],"skinscripts\Terror6.sqf", ["reskinTerr"],1,false,true,"","player distance reskin1 <= 5"];
_role addaction [format ["Buy TerroristSkin7 SniperStyle ($%1)", SkinTerrB],"skinscripts\Terror7.sqf", ["reskinTerr"],1,false,true,"","player distance reskin1 <= 5"];

_role addaction [format ["Buy RusTerroristSkin1 Mask+Hood ($%1)", SkinTerr],"skinscripts\Island1.sqf", ["reskinTerr"],1,false,true,"","player distance reskin2 <= 5"];
_role addaction [format ["Buy RusTerroristSkin2 NoMask+GuerrillaStyle ($%1)", SkinTerr],"skinscripts\Island2.sqf", ["reskinTerr"],1,false,true,"","player distance reskin2 <= 5"];
_role addaction [format ["Buy RusTerroristSkin3 Mask ($%1)", SkinTerr],"skinscripts\Island3.sqf", ["reskinTerr"],1,false,true,"","player distance reskin2 <= 5"];
_role addaction [format ["Buy RusTerroristSkin4 NoMask+OfficerStyle ($%1)", SkinTerr],"skinscripts\Island4.sqf", ["reskinTerr"],1,false,true,"","player distance reskin2 <= 5"];


_role addaction [format ["Buy Skin Civ1 ($%1)", CivSkin],"skinscripts\CivSkin1.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ2 ($%1)", CivSkin],"skinscripts\CivSkin2.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ3 ($%1)", CivSkin],"skinscripts\CivSkin3.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ4 ($%1)", CivSkin],"skinscripts\CivSkin4.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ5 ($%1)", CivSkin],"skinscripts\CivSkin5.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];

_role addaction [format ["Buy Skin Civ6 ($%1)", CivSkin],"skinscripts\CivSkin6.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ7 ($%1)", CivSkin],"skinscripts\CivSkin7.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ8 ($%1)", CivSkin],"skinscripts\CivSkin8.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ9 ($%1)", CivSkin],"skinscripts\CivSkin9.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ10 ($%1)", CivSkin],"skinscripts\CivSkin10.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];

_role addaction [format ["Buy Skin Civ11 ($%1)", CivSkin],"skinscripts\CivSkin11.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ12 ($%1)", CivSkin],"skinscripts\CivSkin12.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ13 ($%1)", CivSkin],"skinscripts\CivSkin13.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ14 ($%1)", CivSkin],"skinscripts\CivSkin14.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ15 ($%1)", CivSkin],"skinscripts\CivSkin15.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];

_role addaction [format ["Buy Skin Civ16 ($%1)", CivSkin],"skinscripts\CivSkin16.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ17 ($%1)", CivSkin],"skinscripts\CivSkin17.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ18 ($%1)", CivSkin],"skinscripts\CivSkin18.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ19 ($%1)", CivSkin],"skinscripts\CivSkin19.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];
_role addaction [format ["Buy Skin Civ20 ($%1)", CivSkin],"skinscripts\CivSkin20.sqf", ["reskinCiv"],1,false,true,"","player distance reskin3 <= 5 and isciv"];




_role addaction [format ["Buy USA Style 1 ($%1)", SkinTerr],"skinscripts2\USA1.sqf", ["reskinSWAT"],1,false,true,"","player distance reskin4 <= 5"];
_role addaction [format ["Buy USA Style 2 ($%1)", SkinTerr],"skinscripts2\USA2.sqf", ["reskinSWAT"],1,false,true,"","player distance reskin4 <= 5"];
	
_role addaction [format ["Buy Sniper Style ($%1)", SkinTerrB],"skinscripts2\Sniper.sqf", ["reskinSWAT"],1,false,true,"","player distance reskin4 <= 5"];
	
_role addaction [format ["Buy Specnaz 1 Style ($%1)", SkinTerr],"skinscripts2\Specnaz1.sqf", ["reskinSWAT"],1,false,true,"","player distance reskin4 <= 5"];
_role addaction [format ["Buy Specnaz 2 Style ($%1)", SkinTerr],"skinscripts2\Specnaz2.sqf", ["reskinSWAT"],1,false,true,"","player distance reskin4 <= 5"];
	
_role addaction [format ["Buy CDF Universal Soldier Style ($%1)", SkinTerr],"skinscripts2\CDF.sqf", ["reskinSWAT"],1,false,true,"","player distance reskin4 <= 5"];
	
	


//==================================== Hospitals in Cities ================================================

_role addaction [format ["Healt for ($%1)", Hospital],"newscripts\Chernhospital.sqf", ["healt"],1,false,true,"","player distance Hospital1 <= 5"];

_role addaction [format ["Healt for ($%1)", Hospital],"newscripts\Chernhospital.sqf", ["healt"],1,false,true,"","player distance Hospital2 <= 5"];


//==================================== PRIVATE STORAGE ================================================
_role addaction ["Private storage (saved)","storage.sqf",["private_storage", "save"],1,false,true,"","player distance storage < 7"];
//========================================= BAIL ======================================================	 
_role addaction [format ["Pay Bail", slave_cost],"maindialogs.sqf", ["bail"],1,false,true,"","player distance bailflag <= 5 and isciv"];
//====================================== GUN LICENSE ==================================================	 
_role addaction ["Take practical test (Pistol probationary license required)","guntest.sqf",["test"],1,false,true,"","player distance Licenseflag2 <= 5 and isciv and !gtactive and !(""semiautomatic"" call INV_HasLicense)"];
_role addaction ["Get rifle license (requires pistol license and 50000)","guntest.sqf",["rifle"],1,false,true,"","player distance Licenseflag2 <= 5 and isciv and !gtactive"];
_role addaction ["Test info","guntest.sqf",["info"],1,false,true,"","player distance Licenseflag2 <= 5 and isciv"];
//===================================== ITEM PROCESS ==================================================	 
_role addaction ["Process Diamond rock","itemprocess.sqf",["Diamond rock", "Diamondring", 12, "diamond"],1,false,true,"","player distance Diamond_1 <= 5"];
_role addaction ["Process Wheat","itemprocess.sqf",["getreide", "Bread", 2, "Baker"],1,false,true,"","player distance Bakery_1 <= 5"];
_role addaction ["Process Oil","itemprocess.sqf",["Oil", "OilBarrel", 15, "oil"],1,false,true,"","player distance Oil_1 <= 5"];
_role addaction ["Make some Caviar","itemprocess.sqf",["Stoer", "Kaviar", 1, "kaviar"],1,false,true,"","player distance Kaviafabrik <= 5"];
//ga1
_role addaction ["Process LSD","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga1"],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_mygang))"];
_role addaction ["Process Cocaine","itemprocess.sqf",["Unprocessed_Cocaine", "cocaine", 5, "cocaine ga1"],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_mygang))"];
//ga2
_role addaction ["Process LSD","itemprocess.sqf",["Unprocessed_LSD", "lsd", 5, "lsd ga2"],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_mygang))"];
_role addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga2"],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_mygang))"];
//ga3
_role addaction ["Process Heroin","itemprocess.sqf",["Unprocessed_Heroin", "heroin", 5, "heroin ga3"],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_mygang))"];
_role addaction ["Process Marijuana","itemprocess.sqf",["Unprocessed_Marijuana", "marijuana", 5, "marijuana ga3"],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_mygang))"];
//======================================== WORKERS =====================================================
//_role addaction [format ["Buy a worker ($%1)", huren_cost],"worker.sqf", ["holen"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv"];		
//======================================= WORKPLACE ====================================================
_role addaction ["Get courier job","delivery.sqf", ["getajob_delivery"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5 or player distance workplace_getjobflag_4 <= 5) and isciv"];
		
_role addaction ["Cancel delivery mission","delivery.sqf", ["cancel"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5 or player distance workplace_getjobflag_4 <= 5) and isciv and alreadygotaworkplacejob == 1"];
		
_role addaction ["Get taxi job","taxi.sqf", ["getajob_taxi"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5 or player distance workplace_getjobflag_4 <= 5) and isciv"];
		
_role addaction ["Finish taxi mission","taxi.sqf", ["canceljob_taxi"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5 or player distance workplace_getjobflag_4 <= 5) and isciv and workplacejob_taxi_active"];
	
_role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 0) select 1, (BuyAbleBuildingsArray select 0) select 3],"buyshop.sqf", ["immobilie", 0],1,false,true,"","player distance ((BuyAbleBuildingsArray select 0) select 2) <= 5 and !(((BuyAbleBuildingsArray select 0) select 0) in BuildingsOwnerArray)"];	

_role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 1) select 1, (BuyAbleBuildingsArray select 1) select 3],"buyshop.sqf", ["immobilie", 1],1,false,true,"","player distance ((BuyAbleBuildingsArray select 1) select 2) <= 5 and !(((BuyAbleBuildingsArray select 1) select 0) in BuildingsOwnerArray)"];	

_role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 2) select 1, (BuyAbleBuildingsArray select 2) select 3],"buyshop.sqf", ["immobilie", 2],1,false,true,"","player distance ((BuyAbleBuildingsArray select 2) select 2) <= 5 and !(((BuyAbleBuildingsArray select 2) select 0) in BuildingsOwnerArray)"];

_role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 3) select 1, (BuyAbleBuildingsArray select 3) select 3],"buyshop.sqf", ["immobilie", 3],1,false,true,"","player distance ((BuyAbleBuildingsArray select 3) select 2) <= 5 and !(((BuyAbleBuildingsArray select 3) select 0) in BuildingsOwnerArray)"];		
//====================================== VEHICLE ACTIONS ================================================
_role addaction [localize "STRS_addaction_trunk_see","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);_str = format["%1_storage", _vcl];[_str] execVM "vehiclecheck.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and !(_vcl in INV_VehicleArray) and _vcl in INV_ServerVclArray and iscop'];

_role addaction [localize "STRS_addaction_trunk_check","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);_str = format["%1_storage", _vcl];if([_vcl,_str] call INV_RemoveIllegalStorage)then{call compile format["publicvariable ""%1"";", _str]};',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and !(_vcl in INV_VehicleArray) and _vcl in INV_ServerVclArray and iscop'];

_role addaction ["Impound vehicle","noscript.sqf",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);[_vcl, "impound"] execVM "impound.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and _vcl in INV_ServerVclArray and iscop'];

_role addaction ["Pull out","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) execVM "pullout.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and count (crew _vcl) > 0 and _vcl in INV_ServerVclArray and (call INV_isArmed)'];

_role addaction [localize "STRS_addAction_vehicleinfo","noscript.sqf",'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) execVM "vehinfo.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 5 and _vcl in INV_ServerVclArray'];
//======================================== GANG FLAGS ===================================================
_role addaction ["Neutralise flag","gangflags.sqf",[gangarea1, "neutralise"],1,false,true,"",'_control = gangarea1 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea1 <= 8 and _control != (call INV_mygang) and _control != "" and gangmember and !pickingup'];

_role addaction ["Neutralise flag","gangflags.sqf",[gangarea2, "neutralise"],1,false,true,"",'_control = gangarea2 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea2 <= 8 and _control != (call INV_mygang) and _control != "" and gangmember and !pickingup'];

_role addaction ["Neutralise flag","gangflags.sqf",[gangarea3, "neutralise"],1,false,true,"",'_control = gangarea3 getvariable "control";if(isnil "_control")then{_control = ""};player distance gangarea3 <= 8 and _control != (call INV_mygang) and _control != "" and gangmember and !pickingup'];

_role addaction ["Capture flag","gangflags.sqf",[gangarea1, "capture"],1,false,true,"",'_control = gangarea1 getvariable "control";player distance gangarea1 <= 10 and isnil "_control" and gangmember and !pickingup'];

_role addaction ["Capture flag","gangflags.sqf",[gangarea2, "capture"],1,false,true,"",'_control = gangarea2 getvariable "control";player distance gangarea2 <= 10 and isnil "_control" and gangmember and !pickingup'];

_role addaction ["Capture flag","gangflags.sqf",[gangarea3, "capture"],1,false,true,"",'_control = gangarea3 getvariable "control";player distance gangarea3 <= 10 and isnil "_control" and gangmember and !pickingup'];
//======================================== SHOP EXPORT ==================================================
_num1  = (shop1 call INV_getshopnum);
_num2  = (shop2 call INV_getshopnum);
_num3  = (shop3 call INV_getshopnum);
_num4  = (shop4 call INV_getshopnum);
_num5  = (shop5 call INV_getshopnum);
_num6  = (shop6 call INV_getshopnum);
_role addaction ["Chernogorsk Merchant","shopdialogs.sqf",[_num1],1,false,true,"","player distance shop1export <= 3"];
_role addaction ["Elektrozavodsk Merchant","shopdialogs.sqf",[_num2],1,false,true,"","player distance shop2export <= 3"];
_role addaction ["Balota Merchant","shopdialogs.sqf",[_num3],1,false,true,"","player distance shop3export <= 3"];
_role addaction ["Kamyshovo Merchant","shopdialogs.sqf",[_num4],1,false,true,"","player distance shop4export <= 3"];
_role addaction ["Mogilevka Merchant","shopdialogs.sqf",[_num5],1,false,true,"","player distance shop5export <= 3"];
_role addaction ["Kozlovka Merchant","shopdialogs.sqf",[_num6],1,false,true,"","player distance shop6export <= 3"];
//======================================= GANG GUNSHOPS ==================================================
_num1  = (gangarea1 call INV_getshopnum)-3;
_num2  = (gangarea2 call INV_getshopnum)-3;
_num3  = (gangarea3 call INV_getshopnum)-3;
_role addaction ["Gang Shop","shopdialogs.sqf",[_num1],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and (_control == (call INV_mygang))"];
_role addaction ["Gang Shop","shopdialogs.sqf",[_num2],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and (_control == (call INV_mygang))"];
_role addaction ["Gang Shop","shopdialogs.sqf",[_num3],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and (_control == (call INV_mygang))"];

//====================================== DRUG TRAFFICKING ===============================================
//_num1  = (gangarea1 call INV_getshopnum);
//_num2  = (gangarea2 call INV_getshopnum);
//_num3  = (gangarea3 call INV_getshopnum);
//_role addaction ["Drug Trafficking","shopdialogs.sqf",[_num1],1,false,true,"","_control = gangarea1 getvariable ""control"";!isnil ""_control"" and player distance gangarea1 <= 5 and isciv"];
//_role addaction ["Drug Trafficking","shopdialogs.sqf",[_num2],1,false,true,"","_control = gangarea2 getvariable ""control"";!isnil ""_control"" and player distance gangarea2 <= 5 and isciv"];
//_role addaction ["Drug Trafficking","shopdialogs.sqf",[_num3],1,false,true,"","_control = gangarea3 getvariable ""control"";!isnil ""_control"" and player distance gangarea3 <= 5 and isciv"];


//===================================== Gas station Robbing===============================================

_gsshop1 = fuelshop1 addaction ["Rob Gas Station 1","robthestations.sqf",["station 1"],1,false,true,"","isciv and station1money >= 5000"];

_gsshop2 = fuelshop2 addaction ["Rob Gas Station 2","robthestations.sqf",["station 2"],1,false,true,"","isciv and station2money >= 5000"];

_gsshop3 = fuelshop3 addaction ["Rob Gas Station 3","robthestations.sqf",["station 3"],1,false,true,"","isciv and station3money >= 5000"];

_gsshop4 = fuelshop4 addaction ["Rob Gas Station 4","robthestations.sqf",["station 4"],1,false,true,"","isciv and station4money >= 5000"];

















