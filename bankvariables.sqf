if(debug)then{['geld', 15000000] call INV_addinventoryitem};

StartGeld                = 25000; 
robb_timeSperre          = 600;   
local_useBankPossible    = true;  
maxinsafe                = 100000;
BankRaubKontoverlust     = 4000;  
ShopRaubKontovershop     = 0;
ShopRaubProzentVershop   = 0;
rblock			 = 600;
stolencash		 = 0;
Maxbankrobpercentlost    = 0.1; 
bank_steuer              = 5;     
zinsen_prozent           = 1.5;     
zinsen_dauer             = 300;   
robenable              	 = true;     
Kontostand               = StartGeld; 
shopflagarray            = [shop1,shop2,shop3,shop4,shop5];
bankflagarray            = [mainbank, copbank, copsobr, atm1, atm2, atm3, atmpf, atmassa,bank5,bank6];
drugsellarray		 = [mdrugsell,cdrugsell,ldrugsell,hdrugsell];
TankstellenArray         = 

[
(nearestobject[getpos fuelshop1,"Land_A_FuelStation_Feed"]),
(nearestobject[getpos fuelshop2,"Land_A_FuelStation_Feed"]),
(nearestobject[getpos fuelshop3,"Land_A_FuelStation_Feed"]),
(nearestobject[getpos fuelshop4,"Land_A_FuelStation_Feed"]),
fuelshop5
];



