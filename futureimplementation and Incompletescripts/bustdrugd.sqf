// Bust the Drugdealer
// bustdrugd.sqf
if ((iscop) && (!atBusting)) then 
{
	(format ["if (iscop) then {atBusting = true; Kontostand = Kontostand + 15000; player groupChat localize ""STRS_drugdealer_busted_more_money"";};"]) call ISSE_pub_execPstr;
	drug_einheit setDamage 1;
	drugvehicle setDamage 1;
	sleep ((random 13) + 5);
	deleteVehicle drug_einheit;
	deleteVehicle drugvehicle;
	(format ["atBusting = false; hint localize ""STRS_drugdealer_busted"";"]) call ISSE_pub_execPstr;
};