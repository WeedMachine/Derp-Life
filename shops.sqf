if(isServer)then

{

INV_itemstocks = 

[
//fs
[25,10,10],
[25,10,10],
[25,10,10],
[25,10,10],
//is
[0,0,0,0,0,0,0,0,0,5,5],
[0,0,0,0,0,0,0,0,0,5,5],
[0,0,0,0,0,0,0,0,0,5,5],
[0,0,0,0,0,0,0,0,0,5,5],
[0,0,0,0,0,0,0,0,0,5,5],
[0,0,0,0,0,0,0,0,0,5,5],
//pub
[3,1,1,3,1,3,3],
//gs
[40,-1,40,-1,40,-1,40,-1,40,-1],
//es
[20,20,20],
//cu
[5,5,4,3,3,3],
[5,5,4,3,3,3],
//cs
[-1,5,5,5,2,2,2,2,2,2,2,3,3],
[-1,5,5,5,2,2,2,2,2,2,2,3,3],
[-1,5,5,5,2,2,2,2,2,2,2,3,3],
[-1,5,5,5,2,2,2,2,2,2,2,3,3],
//ps
[2,2,2,2,2,2,2],
//ts
[3,3,3,3,3,1,2,2,2,3],
//as
[5,2,10],
//bs1
[4,4,2,2,2],
//bs2
[4,4,2,2,2],
//bs3
[4,4,2,2,2],
//tbs
[-1,-1,5],
//bc
-1,
//ms
[15,15,10],
//rs
[100,100,100],
//gds
-1,
//os
-1,
//ws
-1,
//ga
-1,
-1,
-1,
//db1
[0,0,0],
[0,0],
[0],
//ds
-1,
-1,
-1,
-1,
//ca1
-1,
//sa1
[5,-1],
//cv
[-1,-1,-1,-1,-1,-1],
[-1,-1,-1,-1,-1,-1],
//sv1
[-1,-1,-1],
//ca
-1,
-1,
//cp
-1,
-1,
//cr
-1,
//cps
-1,
//terrorshop
-1,
//drs
[25,25,5,5],
//ss
[-1],
//ec
-1,
//hs
[5,10,10,3,3,0,0,0,0,0,0],
//kv
-1,
//ig
[5,5,5]

];

publicvariable "INV_itemstocks";

};

INV_itemmaxstocks = 

[
//Fuel Station fs
[50,20,20],
[50,20,20],
[50,20,20],
[50,20,20],
//Item Shop is
[100,150,350,200,200,80,200,200,200,10,10],
[100,150,350,200,200,80,200,200,200,10,10],
[100,150,350,200,200,80,200,200,200,10,10],
[100,150,350,200,200,80,200,200,200,10,10],
[100,150,350,200,200,80,200,200,200,10,10],
[100,150,350,200,200,80,200,200,200,10,10],
//Beer Shop pub
[15,5,5,15,5,15,15],
//gs
[40,-1,40,-1,40,-1,40,-1,40,-1],
//es
[35,35,35],
//cu
[10,10,8,6,4,3],
[10,10,8,6,4,3],
//cs
[-1,50,50,50,20,20,20,20,20,20,20,30,30,30],
[-1,50,50,50,20,20,20,20,20,20,20,30,30,30],
[-1,50,50,50,20,20,20,20,20,20,20,30,30,30],
[-1,50,50,50,20,20,20,20,20,20,20,30,30,30],
//ps
[5,5,5,5,5,5,5],
//ts
[5,5,5,5,5,5,5,5,5,5],
//as
[5,2,10],
//bs1
[4,4,2,2,2],
//bs2
[4,4,2,2,2],
//bs3
[4,4,2,2,2],
//tbs
[-1,-1,5],
//bc
-1,
//ms
[30,30,20],
//rs
[300,300,300],
//gds
-1,
//os
-1,
//ws
-1,
//ga
-1,
-1,
-1,
//db1
[6,4,3],
[15,10],
[2],
//ds
-1,
-1,
-1,
-1,
//ca1
-1,
//sa1
[5,-1],
//cv
[-1,-1,-1,-1,-1,-1],
[-1,-1,-1,-1,-1,-1],
//sv1
[-1,-1,-1],
//ca
-1,
-1,
//cp
-1,
-1,
//cr
-1,
//cps
-1,
//terrorshop
-1,
//drs
[25,25,5,5],
//ss
[-1],
//ec
-1,
//hs
[5,10,15,20,20,20,20,20,20,20,20],
//kv
-1,
//ig
[30,30,30]
];

// Shop items

_emptyshop = [];
_fs = ["kanister", "kleinesreparaturkit", "reparaturkit"];
_is = ["Apfel","Apfelkuchen","blowfish", "mackerel", "herring", "bass", "Bread", "rabbit", "boar", "medikit", "handy"];
_pub = ["beer","beer2","vodka","smirnoff","wiskey","wine","wine2"];
_gs = ["Makarov", "8Rnd_9x18_Makarov", "M9", "Rnd_9x19_M9", "Colt1911", "Rnd_45ACP_1911", "Saiga12K", "Rnd_B_Saiga12_74Slug", "MP5A5","30Rnd_9x19_MP5"];
_es = ["Binocular", "NVGoggles", "GPS"];
_cu = ["nitro", "supgrade1", "supgrade2", "supgrade3", "supgrade4", "supgrade5"];
_cs = ["MMT_Civ","TT650_Civ","TT650_Ins","Tractor","Skoda","SkodaBlue","SkodaRed","SkodaGreen","Lada_base","Lada1","Lada2","Car_hatchback","Car_Sedan","VWGolf"]; 
_ps = ["datsun1_civil_1_open", "datsun1_civil_2_covered", "hilux1_civil_1_open", "hilux1_civil_2_covered", "UAZ_RU","LandRover_CZ_EP1","LandRover_TK_CIV_EP1"];
_av = ["Pickup_PK_INS", "HMMWV"];
_ts = ["Ikarus", "UralCivil", "UralCivil2", "V3S_Civ", "KamazOpen","MTVR","V3S_Open_TK_CIV_EP1","Ural_UN_EP1","Ural_TK_CIV_EP1","Ikarus_TK_CIV_EP1"];
_as = ["Mi17_Civilian","Mi17_medevac_CDF","MV22"];
_bs1 = ["PBX","Zodiac","Smallboat_1","Smallboat_2","Fishing_Boat"];
_bs2 = ["PBX","Zodiac","Smallboat_1","Smallboat_2","Fishing_Boat"];
_bs3 = ["PBX","Zodiac","Smallboat_1","Smallboat_2","Fishing_Boat"];
_tbs = ["PBX", "Zodiac", "RHIB"];
_bc = ["PBX", "Zodiac", "RHIB"];
_td = ["strangemeat", "medikit"];
_ms = ["Shovel","Pickaxe","JackHammer"];
_bb = ["factory","officebuilding","barrack","smallhouse","smallhouse2"];
_rs = ["iron","copper","oil"];
_gds = ["Diamondring","EDiamondring"];
_os = ["OilBarrel"];
_ws = ["Whale"];
_db1 = ["marijuana","cocaine","lsd"];
_db2 = ["cocaine","lsd"];
_db3 = ["heroin","marijuana"];
_dsc = ["cocaine"];
_dsm = ["marijuana"];
_dsl = ["lsd"];
_dsh = ["heroin"];
_ca1 = ["UH1H_TK_GUE_EP1","MH6J_EP1"];
_sa1 = ["MH60S","Pchela1T"];
_cv = ["MMT_USMC", "M1030", "LadaLM", "hilux1_civil_3_open", "UAZ_CDF", "Kamaz"];
_sv1 = ["HMMWV", "HMMWV_Armored","M113_TK_EP1"];
_sv = ["HMMWV", "HMMWV_Armored", "GAZ_Vodnik_MedEvac"];
_drs = ["heroin","lsd","marijuana","cocaine"];
_ss = ["steel"];
_ec = ["ebauteile"];
_hs = ["house","house2","hideout","campeast","fireplace","Barricade","Tor","Jaegerstand","Blechzaun","Camonet","bunkersmall"];
_kv = ["Kaviar"];
_ig = ["OilBarrel","steel","ebauteile"];

_copshop = 

[

"Binocular",
"GPS",
"NVGoggles",
"M1014",
"8Rnd_B_Beneli_74Slug",
"Colt1911",
"Rnd_45ACP_1911",
"M9",
"Rnd_9x19_M9",
"M9SD",
"15Rnd_9x19_M9SD",
"MakarovSD",
"8Rnd_9x18_MakarovSD",
"Donut",
"medikit",
"kleinesreparaturkit",
"reparaturkit",
"kanister",
"defuser",
"waffentasche",
"signtape"

];

_copshop_patrol = 

[

"Sign_Checkpoint",
"roadblock",
"FortRazorWireCop",
"Satelit",
"bunkersmall",
"fortenvelopesmall",
"roadbarrierlong",
"roadbarrierlight",
"landconelight",
"bargate",
"Jaegerstand",
"Sandsacke",
"Baracke",
"nitro",
"supgrade1",
"supgrade2",
"supgrade3",
"supgrade4",
"supgrade5"

];

_copshop_response = 

[

"MP5A5",
"30Rnd_9x19_MP5",
"MP5SD",
"30rnd_9x19_MP5SD",
"Bizon",
"64Rnd_9x19_Bizon",
"Bizon_Silenced",
"64Rnd_9x19_SD_Bizon",
"AKS74U",
"30Rnd_545x39_AK",
"AKS_74_UN_Kobra",
"30Rnd_545x39_AKSD"

];

_copshop_sobr = 

[

"M4A1_AIM_CAMO",
"M4A1_HWS_GL_CAMO",
"30Rnd_556x45_Stanag",
"M4A1_AIM_SD_CAMO",
"M4A1_HWS_GL_SD_CAMO",
"30Rnd_556x45_StanagSD",
"1Rnd_HE_M203",
"1Rnd_Smoke_M203",
"AK74",
"AK74GL",
"30Rnd_545x39_AK",
"1Rnd_HE_GP25",
"1Rnd_SMOKE_GP25",
"VSS_vintorez",
"20Rnd_9x39_SP5_VSS",
"PK",
"100Rnd_762x54_PK",
"HandGrenade_East",
"PipeBomb",
"RPG18",
"RPG18_mag",
"Strela",
"Strela_mag",
"vclammo"

];

_terrorshop = 

[

"Binocular",
"GPS",
"NVGoggles",
"AK_47_M",
"30Rnd_762x39_AK47",
"AK74",
"AK74GL",
"AKS74pso",
"30Rnd_545x39_AK",
"1Rnd_HE_GP25",
"1Rnd_SMOKE_GP25",
"PK",
"100Rnd_762x54_PK",
"HandGrenade_East",
"RPG7V",
"PG7V",
"Strela",
"Strela_mag",
"PipeBomb",
"medikit",
"kanister",
"reparaturkit",
"lighter",
"strangemeat",
"selbstmordbombe",
"zeitzuenderbombe",
"fernzuenderbombe",
"aktivierungsbombe",
"geschwindigkeitsbombe",
"fernzuender",
"bunkersmall",
"fortenvelopesmall",
"fireplace",
"campeast",
"lockpick",
"vclammo"
 
];

_gangshop_buy = 

[

"Binocular",
"GPS",
"NVGoggles",
"Makarov",
"8Rnd_9x18_Makarov",
"M9",
"Rnd_9x19_M9",
"Colt1911",
"Rnd_45ACP_1911",
"Saiga12K",
"Rnd_B_Saiga12_74Slug",
"MP5A5",
"30Rnd_9x19_MP5",
"HandGrenade_East",
"medikit",
"kleinesreparaturkit",
"reparaturkit",
"kanister",
"lockpick"

];



INV_ItemShops = [

[fuelshop1,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
[fuelshop2,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
[fuelshop3,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],
[fuelshop4,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],

[shop1,"Item Shop",dummyobj,dummyobj,_is,_is,true],
[shop2,"Item Shop",dummyobj,dummyobj,_is,_is,true],
[shop3,"Item Shop",dummyobj,dummyobj,_is,_is,true],
[shop4,"Item Shop",dummyobj,dummyobj,_is,_is,true],
[shop5,"Item Shop",dummyobj,dummyobj,_is,_is,true],
[shop6,"Item Shop",dummyobj,dummyobj,_is,_is,true],

[pub1,"Pub",dummyobj,dummyobj,_pub,_pub,true],

[gunshop1,"Gun Shop",gunbox1,dummyobj,_gs,_gs,true],

[equipshop,"Equipment Shop",equipbox,dummyobj,_es,_es,true],

[tuning1,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true],
[tuning2,"Car Upgrades",dummyobj,dummyobj,_cu,_cu,true],

[carshop1,"Car Shop",dummyobj,carspawn1,_cs,_cs,true],
[carshop2,"Car Shop",dummyobj,carspawn2,_cs,_cs,true],
[carshop3,"Car Shop",dummyobj,carspawn3,_cs,_cs,true],
[carshop4,"Car Shop",dummyobj,carspawn4,_cs,_cs,true],

[pickupshop1,"Pickup + Jeep Shop",dummyobj,pickupspawn1,_ps,_ps,true],
					
[truckshop,"Truck Shop",dummyobj,truckspawn,_ts,_ts,true],

[airshop,"Air Shop",dummyobj,asairspawn,_as,_as,true],

[boatshop1, "Boat Shop",dummyobj,boatspawn1,_bs1,_bs1,true],

[boatshop2, "Boat Shop",dummyobj,boatspawn2,_bs2,_bs2,true],

[boatshop3, "Boat Shop",dummyobj,boatspawn3,_bs3,_bs3,true],

[tboatshop, "Terrorist Boat Shop",dummyobj,tboatspawn,_tbs,_tbs,true],

[cboatshop,"Boat Shop",dummyobj,cboatspawn,_bc,_bc,true],

[Oil_1,"Mining equipment",dummyobj,dummyobj,_ms,_ms,true],

[resourcesell,"Sell Resources",dummyobj,dummyobj,_rs,_rs,true],

[DiamondShop,"Pawn Shop",dummobj,dummyobj,_emptyshop,_gds,true],

[OilSell1,"Oil Dealer", dummyobj,dummyobj, _emptyshop,_os,true],

[whalesell,"Sell Whale",dummyobj,dummyobj,_emptyshop,_ws,true],

[gangarea1,"Gang Shop",gangbox1,dummyobj,_gangshop_buy,_gangshop_buy,false],
[gangarea2,"Gang Shop",gangbox2,dummyobj,_gangshop_buy,_gangshop_buy,false],
[gangarea3,"Gang Shop",gangbox3,dummyobj,_gangshop_buy,_gangshop_buy,false],

[gangarea1,"Drug Trafficking",dummyobj,dummyobj,_db1,_emptyshop,true],
[gangarea2,"Drug Trafficking",dummyobj,dummyobj,_db2,_emptyshop,true],
[gangarea3,"Drug Trafficking",dummyobj,dummyobj,_db3,_emptyshop,true],

[cdrugsell,"Sell Cocaine",dummyobj,dummyobj,_emptyshop,_dsc,true],
[mdrugsell,"Sell marijuana",dummyobj,dummyobj,_emptyshop,_dsm,true],
[ldrugsell,"Sell LSD",dummyobj,dummyobj,_emptyshop,_dsl,true],
[hdrugsell,"Sell Heroin",dummyobj,dummyobj,_emptyshop,_dsh,true],

[copair,"Police Air-Vehicle Shop",dummyobj, cairspawn,_ca1,_ca1,true],
[swatair,"SOBR Air_Vehicles Shop",dummyobj, saairspawn,_sa1,_sa1,true],

[copcar,"Police vehicle Shop",dummyobj, ccarspawn,_cv,_cv,true],
[copcar2,"Police vehicle Shop",dummyobj, ccarspawn2,_cv,_cv,true],

[swatcar,"SOBR Vehicle Shop",dummyobj, scarspawn,_sv1,_sv1,true],

[copbasic,"Generic Police Shop",copbasic,dummyobj, _copshop,_copshop,false],
[copbasic2,"Generic Police Shop",copbasic2,dummyobj, _copshop,_copshop,false],

[coppatrol,"Patrol-Officer",coppatrol,dummyobj,_copshop_patrol,_copshop_patrol,true],
[coppatrol2,"Patrol-Officer",coppatrol2,dummyobj,_copshop_patrol,_copshop_patrol,true],
[copcriminal,"Criminal Response-Officer",copcriminal,dummyobj,_copshop_response,_copshop_response,true],
[copswat,"SOBR",copswat,dummyobj,_copshop_sobr,_copshop_sobr,true],
[terrorshop,"Terrorist Shop",tgunbox,dummyobj,_terrorshop,_terrorshop,true],
[drugseller,"Buy Drugs",dummyobj,dummyobj,_drs,_emptyshop,true],
[steelseel,"Export Steel",dummobj,dummyobj,_ss,_ss,true],
[electronicseel,"Export Electronic Components",dummobj,dummyobj,_emptyshop,_ec,true],
[markler,"House Shop",dummobj,dummyobj,_hs,_hs,true],
[kaviarverkauf,"Sell Caviar",dummyobj,dummyobj,_emptyshop,_kv,true],
[Industriegueter,"Industrial Goods",dummyobj,dummyobj,_ig,_ig,true]

];






