while {true} do

{

waituntil {bombactive};
playsound "Bank_alarm";
titletext["Terrorists have planted a bomb on the military HQ! The cops have 10 minutes to defuse the bomb!", "PLAIN"];
hint "Terrorists have planted a bomb on the military HQ! The cops have 10 minutes to defuse the bomb!";
server globalchat "Terrorists have planted a bomb on the military HQ! The cops have 10 minutes to defuse the bomb!";
HQbombtimer = 500;

while {bombactive} do

	{

	titletext[format["Detonation in: %1 seconds", HQbombtimer], "PLAIN DOWN"];

	if(HQbombtimer mod 30 == 0 and isServer)then{publicvariable "HQbombtimer"; hint "updating"};

	if(HQbombtimer == 0 and isServer)then

		{

		publicvariable "HQbombtimer";
		"Bo_GBU12_LGB" createvehicle getpos HQ;
		HQ setdamage 1;
		bombactive = false; publicvariable "bombactive";

		};

	HQbombtimer = HQbombtimer - 1;

	sleep 1;

	};

};