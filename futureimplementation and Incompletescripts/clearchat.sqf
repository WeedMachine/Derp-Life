//Disable Chat messages for SLR by MAD T (year 2010)
if (!(clear_chat)) then
{
	clear_chat = true;
	player groupChat "Chat Messages/Hints Disabled in";
	sleep 1;
	player groupChat "3";
	sleep 1;
	player groupChat "2";
	sleep 1;
	player groupChat "1";
	sleep 1;
	while {clear_chat} do 
	{
		clearRadio;
		sleep 0.01;
	};
}
else 
{
	clear_chat = false;
	player groupChat "Chat Messages/Hints Enabled";
};