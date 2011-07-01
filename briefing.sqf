if(player diarySubjectExists "info")exitwith{};

player createDiarySubject ["changelog","Changelog"];
player createDiarySubject ["rules","General Rules"];
player createDiarySubject ["controls","Controls"];
player createDiarySubject ["info","CLR Guide"];
player createDiarySubject ["bugs","Official Website/Bugs"];
player createDiarySubject ["credits","TeamSpeak 3"];

player createDiaryRecord ["credits", 
[
"", 
"
HGs TeamSpeak 3; <br/>
<br/>
IP:95.156.208.109 Port:9987<br/>
<br/>
It was edited by TeeTime and Titan0815 specialy for HGs server<br/>
Read Server Rules<br/>
MadMardigan for writing much of the info in this briefing.<br/>
Anyone who has ever worked on Sahrani Life.<br/> 
The original authors of Sahrani Life (Issetea and Fewo) wished noone to modify it, however to do this they encrypted the mission so that it could only be played on their server(s).<br/>
Thus, I (pogoman) have made made this edit of an older, less encrypted version of the mission so that we can run Sahrani Life (or now Chernarus Life) servers in Australia :).<br/>
In my opinion it is a great thing to make a mission good enough that others will want to modify it, and although I would not normally go against the author's wishes I believe that in this case those wishes are irrational :P.<br/>
"
]
];

player createDiaryRecord ["bugs", 
[
"", 
"
Official website<br/>
http://www.hgsued.de/<br/>
report any bugs on the forums<br/>
"
]
];

player createDiaryRecord ["info", 
[
"Factories", 
"
Location: Check map, there is a general factory/ car factory/ boat factory marked in blue<br/>
Cost/pay: Varies?<br/>
Req: None?<br/>
Info:  You can purchase various factories in CLR.  Take cars for example, there are only a certain amount of cars in the vehicle shops.  When the players have purchased them all, someone will have to buy the car factory and make more vehicles.  To do this simply find the ""car factory"" in Electro and purchase the factory,  then access the factory's storage via the mouse scroll wheel.  You will get a inventory interface much like the car inventory.  You need to put money into the storage to begin manufacturing vehicles.
<br/>
Once you've done this, simple start to manufacture a selected vehicle and wait for the required time.  When the time is up you can create the vehicle.
<br/>
This simple process is the same for any factory type interface you may encounter in CLR.<br/>
<br/>
<br/>
Special Factorys are factorys were you can make only things for the export.<br/>
Special Factorys are Oil Process factory, Steel Factory, Electronic Component Factory and Diamond Process factory.<br/>
Items you can produce there need ressources and not only money! Since 2.1.3 there are some Vehicle which need Res too!<br/>
Vehicle:<br/>
Mi17: 6 Steel ,2 Electronic Component and 20000$<br/>
Mi-8MT: 10 Steel ,5 Electronic Component and 50000$<br/>
Mi-17-IVA Medevac: 5 Steel ,5 Electronic Component and 10000$<br/>
Mi-17-Civil: 6 Steel ,2 Electronic Component and 20000$<br/>
MV 22: 15 Steel ,5 Electronic Component and 80000$<br/>
MTVR: 2 Steel and 1 Electronic Component<br/>
<br/>
Items:<br/>
Bread(factory); 1 wheat<br/>
Bread(license); 2 wheat<br/>
Apllepie (only factory): 3 wheat and 2 apple<br/>
Electronic Component(only factory); 5 copper and 1000$<br/>
Steel(only factory); 5 iron<br/>
OilBarrel(factory); 5 oil<br/>
OilBarrel(license); 15 oil<br/>
DiamondRing(license); 12 diamond rocks<br/>
DiamondRing(factory); 6 diamond rocks<br/>
Expensive DiamondRing(only factory); 5 diamond rocks and 5 gold
"
]
];

player createDiaryRecord ["info", 
[
"Farming/Fishing", 
"
Bread:<br/>
Location: Check the map for ""Harvest Area""<br/>
Cost: $20,000 +/-<br/>
Pay: Varies<br/>
Req: [Tractor:$?], [Driver's License: $10,000],[Baker's License: $10,000]<br/>
Info:  This is a time consuming but legal and well paying job.  This is also something you can do right away after spawning.  First get a driver's license from the city hall, then head off to the car shop to buy a tractor.  Head on over to the ""harvest area"" located on the map near Balota.  There you can drive up and down the dirt rows until you gather enough wheat.  You will randomly ""harvest"" different amounts of wheat, 2-8 pieces at a time.  When you've gathered enough you will get a green measage indicating that your inventory is full.  You can use the ""T"" button to stash all that wheat into your tractor and continue to harvest the wheat.  Once you're full, head on back to Chern to process the wheat into bread.  At the bread processing area you'll need to purchase the ""baker's license"".  After that simply mouse scroll to ""process wheat"" until all the wheat in your inventory is processed.  At this point the wheat becomes bread which you can eat or sell.  Continue to process all the wheat, then he<br/>ad out to a store located on the map with a small blue box.  Stores are located all over the map so you can sell them where ever you like.  I think the price changes for this item as demand increases for that specific store.  IE some stores may pay more than others.
<br/>
Like I said, this is a time consuming avenue for making money but you can make quite a bit depending on the demand.  I believe I sold 50-100 Bread and got 100k for it.
<br/>
Fishing<br/>
Location:  Check the map out in the ocean<br/>
Cost: $11,000+/- depending upon the boat cost<br/>
Pay: ?<br/>
Req: [Boat License: $5,000],[Boat: Varies depending upon the boat]<br/>
<br/>
Notes: run into the ocean and swim to the fishing area.  There you will need to hold ""alt"" and spin your mouse around in circles real quick.  Wait until I can test this out or someone else write up this one lol.
"
]
];

player createDiaryRecord ["info", 
[
"Gangs", 
"
Being in a gang has several benefits:<br/>
Firstly, you are all in the same squad, which has the benefits of group channel chat etc.<br/>
Secondly, as a gang you'll all share a paycheck of $3000 between you for each gang area you control.<br/>
There will be more features coming later since this is basically just a trial run.<br/>
The cost to create a gang is $100000.<br/>
Once you have joined a gang you will always be in it unless the gang leader kicks you, or you leave via the gang menu.<br/>
The gang leader can kick members or block players from joining the gang in the Manage gang section of the gang menu.<br/>
Inactive gang members (ie members not currently ingame) cannot be kicked, however if the gangleader disconnects a new one will be selected. Also inactive gang members do not take part of the paycheck.<br/>
In order for a gang to control a gang area they only need walk up to the flag area and either neutralise or capture the flag.<br/>
This will take some time so if there are other gangs in the area be weary.<br/>
"
]
];

player createDiaryRecord ["info", 
[
"Basic jobs", 
"
Workplace's<br/>
Locations: check the map, there are 3 locations marked with yellow flags and a yellow circle.  Can't miss them.<br/>
Cost/Pay: Varies depending on which workplace you want to buy.<br/>
Req:  Money<br/>
Purpose:  Here you can walk up to the flag pole and mouse scroll.  You have several options, purchase workplace, courier mission, taxi mission.  By purchasing the workplace you get extra money each paycheck wired to your account.  Courier and Taxi missions are leagal mission for you to start making money.  Once you start a mission you can access the ""mission info"" via mouse scroll.  This will give you all the info you will need.  Check your map for the required destination and get moving quickly.  Some of the missions give you very little time.  Later you can get speed upgrades for your vehicle.
<br/>
Courier Missions:<br/>
Pay: $3,000-$80,000<br/>
Req: None<br/>
Info:  When you select the courier mission you will sometimes be given all the info you need, most of the time however you will need to use your scroll mouse wheel to find that info under ""?mission info?"".  Each time you choose this mission you will randomly be given a DP or Drop Point as your target location.  Use the map to find the DP# and head off quickly.  Some of the missions have very little time and if you fail you will have to wait a period of time to choose another.  Remember that there are 3 locations so a good rule of thumb is just to head off to the closest one.  However, I'm finding that the odds of getting higher paying missions are greater if you get missions from Workplace 2 or 3.  The reason for this is that the missions give you more money depending on the distance.  All you have to do is pull up to the location and run next to the civilian AI standing there.   It will automatically give you a completed mission and money in your pocket.  I would suggest you use a car for these as the motor <br/>bikes tend to get you killed.
<br/>
Taxi Missions:<br/>
Pay: $3,000-$80,000<br/>
Req: None<br/>
Info:  Same as the courier missions except this mission continues without you needing to return to a workplace and there is no time limit.  Simply check the map for a yellow ""pick up marker"" and head off to that location.  There you will need to pull up to the civilian AI and wait for them to get into your vehicle.  Once they're in just check your map for the drop off location.  Pull up to that area and they will get out of the vehicle on their own.  If by any chance you pop your tire and do not have a repair kit, the AI will continue to follow you around.
"
]
];

player createDiaryRecord ["info", 
[
"Licenses", 
"
Just about everything in Chern requires you to own a license.  I'll go through all the legal license's and let you discover the illegal ones on your own.
<br/>
Driver's license:<br/>
Location: Chern City Building, mouse scroll next to the lady<br/>
Cost: $10,000<br/>
Purpose: Allows you to buy/drive cars and motor bikes legally.  If you get caught speeding through the ""speed traps"" you can loose your license and become wanted.  Once you loose your license you can purchase another one.  If you loose your license you will not be able to purchase new cars.
<br/>
Truck License:<br/>
Location: Chern City Building, mouse scroll next to the lady<br/>
Cost:$15,000<br/>
Purpose: Same as driver's license but for trucks/offroads/urals
<br/>
Boat License:<br/>
Location: Chern City Building, mouse scroll nest to the lady<br/>
Cost:$5,000<br/>
Purpose: allows you to purchase boats at the boat shops.
<br/>
Bountyhunter License:<br/>
Location: Chern City Bilding, mouse scroll next to the lady<br/>
Cost: $50,000<br/>
Purpose: Allows to kill wanted persons with a bounty of $30,000 or higher. You will get half of the bounty.
<br/>
Terrorist training:<br/>
Location: Paradies Island mouse scroll next to the terrorshop<br/>
Cost: $250,000<br/>
Purpose: Allows you to purchase weapons at terrorshop
<br/>
Engineer's License:<br/>
Location: Chern City Building, mouse scroll next to the lady<br/>
Cost: $25,000<br/>
Purpose: Allows you to purchase repair kits, speed upgrades for cars/boats, and do some other things like drill for oil.
<br/>
Gun License:<br/>
Location: Check map.  Located in north eastern chern you will see ""gun license"" in blue.<br/>
Cost: Varies depending upon the tax settings. (usually around $25,000)<br/>
Purpose:  Allows you to legally purchase simple weapons from the gun shop.  You must first buy the temp license, then complete the license course.  While I know it can be frustrating for you new guys, it is not impossible.  Keep at it until you can complete the course.
"
]
];

player createDiaryRecord ["info", 
[
"Objectives", 
"
Civilian:<br/>
As a Civilian (or just civ) you should obey the laws, which have been made by the cops and the mayor. You can break these, but then you have to expect to get punished. This can lead from fines to terms of imprisonment and in the extreme case to death. So you should obey the laws.<br/>
Your overall objective as a civilian is to destroy the military HQ, which is in the military headquaters area marked on the map (ie stage a revolution).<br/>
This base can be defended by ai and police however so do not assault it ill prepared.<br/>
Alternatively you can simply roleplay doing legitimate activities.<br/>
<br/>
Police:<br/>
As a policeman (or just cop) you must ensure that all players adhere to the rules set up by the mayor and are punished accordingly with offence. However force of arms should be considered only as last resort or when lives are at stake. You are not to take lethal action against any civ unless they are a clear threat to other players. The shotgun has the ability to fire beanbag rounds. This is a ""non deadly"" munition.<br/>
It is also your job to make sure the Military headquaters remains properly defended by ai, which can be purchased at the respawn bunker in the copbase.<br/>
"
]
];

player createDiaryRecord ["controls", 
[
"", 
"
Civilian:<br/>
#1: Stats<br/>
here is where you will find a great deal of useful information.  Anything from how much money you are carrying to who has a bounty and how much that bounty may be.
<br/>
#2: Inventory:<br/>
-this will tell you what you are carrying and also provides an interface to use some of those items in your inventory.  For example, if your getting the measage, ""You Are Starving"" and you have 10 fish in your inventory.  Press the #2, highlight ""fish"", change the number in the box to ""10"", then click ""use"".  That will make your charactor eat the fish and you will loose some hunger (high hunger is a bad thing).  You may also notice ""key chain"" in your inventory.  This will hold all your keys to the vehicles you own.  You can give these keys to other players via this interface but know that they need to be near you for something like 5 seconds to receive the item.
<br/>
#3: Hands Up<br/>
This button will make your charactor put his hands up.  This is useful for when you want to show the coppers that you are not a threat and are cooperating.  They can then restrain you if they feel the need.
<br/>
#4: Hands Down<br/>
this button will return you to a normal pos from ""hands up"".
<br/>
E: Action<br/>
this button is your basic ""action button"".  this is how you will interact with the various interfaces around Chern such as shops and ATM's.  This will also allow you to attempt to steal from other players.  You can only steal money if the other player has been knocked unconscious or is restrained.
<br/>
T: Access Inventory<br/>
when you own a car or other vehicle, you can access that car's inventory by standing next to the car and pressing ""T"".  You will then be shown two box's.  The left box is what is in the car, and the right box is what is in your inventory.  Highlight the object you want to transfer, then select the amount and press the button on the side that has the item.  Car's hold a certain amount of weight just like your charactor so be aware of what you stash in there.  Also, if your vehicle is destroyed then you will loose whatever you place in here.  Coppers can search for drugs or other ileagal items.  If they find them in your car it will disappear and the coppers gain money equal to the value of the drugs.
<br/>
F: rate of fire<br/>
For the gun license course you will need to switch fire mode to use the weapon.  if your pistol is hidden in your inventory then you will need to press this to take off the safety as well.
<br/>
Y (Z auf deutschen Tastaturen): animationlist<br/>
Opens a list of spezial animations you can use for fun or Roleplay
<br/>
left shift+F: Stun<br/>
If you have a gun in your hands, you can stand next to another player and perform a stun action.  Be aware that this will knock all of the other players weapons out onto the ground, so if you don't want to piss everyone off, only do this to your enemies.
<br/>
0-0-6, 0-0-7, 0-0-8: shout outs<br/>
Press these buttons to shout out measages on the fly.  For civilians the default says ""Don't Shoot, I surrender!"".  For cops, it says a variety of things but mainly says, ""Put up your hands or your dead"" kinda thing.
<br/>
0-0: options<br/>
this should give you the options for video settings, shout outs, fix head bug, and even a quick-brief tutorial on CLR.""
<br/>
Cops:<br/>
`(tilde key (to the left of the 1 key): COPMENU. allows you to civcam or satcam civs, set their bounties, set them free and more. you have more options if you use the copmenu whilst in a vehicle.
<br/>
F (in a vehicle): SIREN ON/OFF.<br/>
"
]
];

player createDiaryRecord ["rules", 
[
"", 
"
<br/>
		MOST IMPORTANT RULE!!!<br/>
    COPS SHOULD ONLY SHOOT LETHAL ROUNDS IF HIS LIFE IS IN DANGER<br/>
<br/>
1.-Deliberate deathmatching is forbidden. Civs and cops should only get into firefights for legitimate reasons relating to crimes. Deliberate overdriving of other players (civs and cops) is deathmatching.<br/>
<br/>
2.-The police always have the power to conduct random searches.<br/>
<br/>
3.-Cops should only use lethal force if players lives are directly threatened. The stun weapons may be used for any situation where the civ is non compliant.<br/>
<br/>
4.-Cops may use firearms against fleeing, non compliant vehicles of all sorts, cops may use deadly force against any armed vehicle any time.<br/>
<br/>
5.-Cops may confiscate any weaopns and vehicles that were used in a crime. Weapons should be sold or destroyed. Vehicles can bu picked up from the copbase if they are impounded.<br/>
<br/>
6.-If a car accident happens between the players, they have to call the cops to sort the things out. The guilty have to pay compensation for the destroyed or damaged vehicle. In the case of a car: 15.000$, trucks: 25.000$ if the vehicle is only damaged and not able to move, a compensation for a repair kit or a large repair kit is enough. Compensation is paid for vehicles only and not for cargo or any installed upgrades.<br/>
<br/>
7.-Cops have to obey the laws the same way as the civilians does. Speeding or driving offroad is only legitime while on duty (with sirens on). Abusing Cops rights is illegal and will be punished by kick.<br/>
<br/>
8.-Please, this game is based on roleplaying, at least try to behave and communicate properly.<br/>
<br/>
9.-Offensive language, cheating, hacking, bugusing, exploiting, abusing cop rights, abusing mayor rights, rassism, will be punished with a kick or ban.<br/>
<br/>
10.-Abusing adminrights will be punished with permanent ban.<br/>
<br/>
11.-Its only allowed to Bountyhunters to kill wanted persons with a bounty of or over 30k.<br/>
<br/>
12.-Its not allowed to Camp at Terrorbase or Paradise Island. Terrorplaces are neutral! No shotouts there!<br/>
<br/>
<br/>
Basic Laws:<br/>
Every citizen AND cop have to obey these laws.<br/>

1 ñ In the playworld, we drive on the right side of the street/road.<br/>
2 ñ Lights have to be turned on at night
3 ñ The Right of way has to be followed
4 ñ Driving offroad is not allowed except for harvesting and mining<br/>
5 ñ Landing at streets and roads is not allowed.
6 ñ Property of goverment (Weapons, vehicles and equipment) may NOT be traded to civilians.<br/>
7 ñ The mayor may not create laws, which offend basic laws and serverrules.<br/>
8 ñ Civs may use their weapons only for self defence.<br/>
9 ñ Bounty hunters may hunt down wanted murders only if their bounty is over 30.000$ AND they need a bounty hunter license for this purpose.<br/>

To make sure that every cop gives the same punishment to civilians, we have set up an information table bellow, there you can see how crime have to be punished.<br/>

Violation Level 1 (low priority crimes)<br/>
Thieving and robbing (except bank robbing), all sorts of traffic offenses, entering illegal areas, all attempts for murder or bank robbing.<br/>
Those crimes are handled as follows:<br/>
10.000$ ticket OR 1 minute in Jail<br/>
<br/>
Violation Level 2 (mid priority crimes)<br/>
Bank robbing, reckless behavior with death as consequence, attempted murder.<br/>
Those crimes are handled with 30.000$ ticket or 3 minutes in Jail.<br/>
<br/>
Violation Level 3 (high priority crimes)<br/>
Murder, drugdealing, illegal whale trading, illegal holding of weapons, illegal weapons trading, assassination missions.<br/>
Those crimes are handled with 50.000$ ticket or 5 minutes in Jail.<br/>
<br/>
Violation Level 4 (terrorism)<br/>
All sorts of terrorism, including multiple murder, running rampage, holding and using all sorts of explosive devices, multiple destroying othe civs property and property of goverment.<br/>
Those crimes are handled with 250.000$ ticket or 15 minutes in Jail.<br/>
<br/>
Violation Level 5 (Actions against the Serverrules/ Spirit of the Game / !!->No New Life Rule<-!!)<br/>
Destroying important Buildings (Shops,Factorys,Gunlicense, Bridges) 60 min Jailtime!<br/>
Cop hunting /massiv Cop Killing for Fun. Killing 5 Cops without a reason 30 min Jailtime.<br/>
Build a house on a Street 120 min Jailtime<br/>
<br/>
<br/>
<br/>
<br/>

German Serverregeln:<br/>

1.-Deathmatching ist verboten. Civs und Cops sollten nur gerechtfertigterweise in Feuergefechte geraten, also durch kriminelle Handlungen.<br/>
   Das absichtliche ueberfahren von civs oder cops IST deathmatching.<br/>
<br/>
2.-Die Polizei hat immer das Recht zufaellige Durchsuchungen durchzufuehren.<br/>
<br/>
3.-Polizei sollte toedliche Waffengewalt nur einsetzen, wenn das Leben von Spielern (einschlieﬂlich ihres eigenen) in Gefahr ist. Stunwaffen duerfen in jeder Situation angewendet werden.<br/>
<br/>
4.-Waffengewalt gegen fluechtige Fahrzeuge sowie bewaffnete Fahrzeuge ist erlaubt.<br/>
<br/>
5.-Polizisten duerfen Waffen und Fahrzeuge, welche in kriminellen Handlungen in Verbindung stehen, beschlagnahmen. Waffen sollten verkauft oder zerstoert werden.<br/> 
<br/>
6.-Bei Unfaellen muss der Schuldige eine Kompensation fuer das von ihm zerstoerte Fahrzeug leisten. Die Hoehe der Kompensationszahlung betraegt bei PKW=15.000$, bei LKW=25.000$. Falls das Fahrzeug nur beschaedigt und nicht mehr fahrtuechtig sein sollte, wird nur der Preis fuer ein Repairkit oder ein groﬂes Repairkit gezahlt.<br/>
   Der Schuldige kann fuer verlorene Ladung oder eingebaute Upgrades nicht zur Rechenschaft gezogen werden.<br/>
<br/>
7.-Die Polizei muss sich an Gesetze genauso halten wie Zivilisten.<br/>
Verkehrsverstoeﬂe sind aber im Einsatz erlaubt.<br/>
<br/>
8.-Rollenspielmaeﬂige Kommunikation ist bei diesem Spiel angebracht.<br/>
<br/>
9.-Anschnauzen, beschimpfen, Rassistische Aussagen, Cheaten, Bugusing, Exploiting, Ausnuetzung der Polizeirechte und der Buergermeisterrechte werden mit kicks oder sogar Banns bestraft.<br/>
<br/>
10.-Das Ausnuetzen von Adminrechten wird mit permanenten Bann bestraft.<br/>
<br/>
11.- Bountyhunter(Kopfgeldjaeger) duerfen nur dann gesuchte Personen erschie0en wen ihr Kopfgeld 30000 oder mehr betraegt.<br/>
<br/>
<br/>
<br/>
Grundgesetze:<br/>
An Gesetze muessen sich Zivilisten und Polizisten halten.<br/>

1 ñ In der Spielwelt herrscht Rechtsverkehr<br/>
2 ñ Licht bei Nacht ist Pflicht<br/>
3 ñ Vorrangregeln sind zu beachten<br/>
4 ñ Gelaendefahrten sind verboten, Ausnahme gilt fuer Ernte- oder Abbaueinsaetze<br/>
5 ñ Das Landen mit Helikoptern ist nicht erlaubt<br/>
6 ñ Regierungseigentum (Waffen, Fahrzeuge, etc.)darf nicht an Zivilisten verkauft werden.<br/>
7 ñ Der Buergermeister darf keine Gesetze erlassen, welche gegen die Grundgesetze und Serverregeln verstoﬂen.<br/>
8 ñ  Zivilisten duerfen ihre Waffe zur Selbstverteidigung verwenden.<br/>
9 ñ Kopfgeldjaeger duerfen nur Moerder jagen, wenn deren Kopfgeld ueber 30.000$ hoch ist und sie eine gueltige Lizenz haben.<br/>

Um eine einheitliche und unmissverstaendliche Bestrafung gewaehrleisten zu koennen, werden alle Delikte oder Gesetzesverstoeﬂe in 4 Vergehensstufen gegliedert.<br/>

Vergehensstufe 1: 1 Minute oder 10.000$<br/>
<br/>
Stehlen (auﬂer Bankraub), Verkehrsdelikte, Betreten von illegalen Gebieten, illegaler Waffenbesitz.<br/>
Vergehensstufe 2: 3 Minuten oder 30.000$<br/>
<br/>
Bankraub, Todschlag, versuchter Mord<br/>
<br/>
Vergehensstufe 3: 5 Minuten oder 50.000$<br/>
<br/>
Mord<br/>
Vergehensstufe 4: 15 Minuten oder 250.000$<br/>
<br/>
Mehrfacher Mord, Amoklauf, illegaler Umgang mit Sprengstoff, Terrorismus.<br/>
<br/>
Vergehensstufe 5: (Handlungen gegen die Server Regeln / gegen den Geist des Spiels / Hier gibt es keine New Life Rule!)<br/>
<br/>
Zerstˆrung von wichtigen Geb‰ude des Spiels (Shops,Br¸cken,Fabriken) mindestens 60 Minuten Gef‰ngnis.<br/>
Polizisten Jagd / Tˆten von Polizisten zum Spaﬂ. Tˆten von 5 Cops OHNE Grund 30 Minuten Gef‰gnis.<br/>
Bauen von H‰usern auf Straﬂen 120 Minuten Gef‰gnis.<br/>
"
]
];

player createDiaryRecord ["changelog", 
[
"", 
"
2.1.5<br/>
Invasion added. Every 3 hours<br/>

2.1.4<br/>
<br/>
SOBR Whitelist removed<br/>
creat Object system improved<br/>
<br/>
The rp-mod Server is only again! Player who want more Roleplay and a Statssavesystem can now play there!<br/>
For the rp-mod Server you need one addon and a Server passwort. You can find both at the HGS website or at http://forum.rp-mods.com/ <br/>
<br/>
2.1.3a<br/>
<br/>
THIS IS THE LAST VERSION FOR ARMA 2 ONLY<br/>
<br/>
COPS the Mogilevka Policestation has a carshop!! There is no need to run to Cherno!<br/>
<br/>
some bugs got fixeed<br/>
Now all air vehicle are special items<br/>
Jail has been redesigned<br/>
playernumber is now 51<br/>
price for apples raised<br/>
police impound moved<br/>
new impound area in elec<br/>
Workplace 4 added near Mogilevka<br/>
carshop added in Mogilevka<br/>
MTVR added as special item<br/>
blowe up the powerplant will now reduce the income to 50% and double up the production time<br/>
price of the first house changed<br/>
second house added<br/>
caviar as a new illegal item added linked to the new illegal fishing area<br/>
House Shop added. place where you can buy Houses Hideouts and other Objects<br/>
Industrial Goods Shop added in Elec. There you can buy and seel Steel Oilbarrel and E-Components for making special items<br/>
air-support-training will now raise your income<br/>
New Objects:<br/>
Small Tower<br/>
Sandbagwall Cops<br/>
Barracks Cops<br/>
Gate Civs<br/>
Fence Civs<br/>
<br/>
THIS IS THE LAST VERSION FOR ARMA 2 ONLY<br/>
<br/>
<br/>
2.1.3<br/>
some bugs got fixeed (Lottotrees...)<br/>
<br/>
Mi17 and Mi-8MT became special items<br/>
Applefield added<br/>
Applepie added<br/>
Industrial Bakery added<br/>
Whitelist for SOBR Training added;<br/>
Blacklist for Gunlicense added;<br/>
Blacklist for Terror Training added;<br/>
Blacklist for Criminal Response added;<br/>
For more Information about the Lists visit http://www.hgsued.de and look at the Forum.<br/>
<br/>
2.1.2<br/>
Steel,Electronic Component, Diamonds Process and oil are now real factorys<br/>
You can still buy diamonds process and oil process license<br/>
lotto fixed<br/>
Gold Mine added<br/>
expensive Diamondring added<br/>
speed trap fixed<br/>
bountyhunter and mayor have now own map marker<br/>
building a house in Cherno will give you a bonus income<br/>
speed traps have now a new model<br/>
cops are not longer able to buy mining tools or factorys<br/>
Factorys have now a Carstorage for dircet transfer between car and factory<br/>
warning tape added (cops only)<br/>
<br/>
Civ can now Rob Gasstaions (You need a gun to do this) (Script written by EddiVedder)<br/>
Animationlist added (Script written by EddiVedder)<br/>
<br/>
2.1.1<br/>
Mogilevka became a real City(Shop,Bank,Policestation)<br/>
Kozlovka became a real city (Shop,Bank,Copper Mine)<br/>
Electronic Component Factory added (place where you can process your copper)<br/>
Electronic Component Export added<br/>
Cops will now recive money for every car they impound<br/>
House added! Dont build Houses on Streets!<br/>
Player neighborhood added (only place where you can build houses in Cherno)<br/>
your objects will not longer removed when you die! Use that option carefully otherwiese the server could crash!!!!<br/>
SOBR SHop has now vehicle ammo<br/>
Process Licenses are now much more expensive<br/>
Terror Training added 250k you need it to buy weapon at paradise island<br/>
<br/>
2.1.0<br/>
Drug Dealer moved<br/>
Drugseller added. There you can buy little ammounts of drugs to deal with them.<br/>
Steel mine removed<br/>
iron mine moved<br/>
Steel Factory added<br/>
Steel Export added. you are now able to export steel like oil<br/>
player slots raised to 40<br/>
<br/>
2.0.9<br/>
Balota carshop fixed.<br/>
SOBR has not longer a special skin.<br/>
checkpoint sign added (only for cops).<br/>
barricade added (only civs can use them).<br/>
new briefing.<br/>
bountyhunter added. please read the rules before you become one!<br/>
general factory can now export to all shops(mining, equipment, fuel, tuning).<br/>
vehicle factory can now export pickups and chopper.<br/>

2.0.8<br/>
Camonet added (general factory)<br/>
razorwire added (cops only)<br/>
normal police chooper is now cheaper<br/>

2.0.7<br/>
vodnik deleted.<br/>
workercost fixed. Now $50,000 for 10 Worker.<br/>


2.594<br/>
<br/>
cops updates;<br/>
license prices reduced alittle<br/>
cops now get 1/4 the bounty for killing a wanted person<br/>
drug search spaming fixes<br/>
when giving a wanted now your name shows, should stop people making false wanted<br/>
<br/>
exporting to gun shop works with weapons and is good money<br/>
<br/>
Fix for wanted not showing up when killing a civ<br/>
<br/>
if you kill a cop by shooting you now lose your gun licenses<br/>
<br/>
trucks at truck shop no longer have ammo and nades<br/>
<br/>
gangs now give you 3k each in your salaries<br/>
<br/>
drugs prices increased 20-40%<br/>
<br/>


2.592<br/>
<br/>
quick fix for wanted not working right<br/>
<br/>
2.591<br/>
<br/>
bread now fills you up more<br/>
<br/>
you can now gather diamonds, rings are worth more <br/>
<br/>
atm glitch fixed<br/>
<br/>
deep sea bass are now lighter and worth more, so its more profitable to fish for them<br/>
<br/>
you now only loose your gun licenses when you shoot someone<br/>
<br/>
2.59<br/>
<br/>
running people over now makes you wanted and removes your car and truck licenses<br/>
<br/>
shop buy/sell glitch fixed<br/>
<br/>
possible fix to the player number<br/>
<br/>
diamond and oil processing fixed, both licenses now cheaper<br/>
<br/>
2.57<br/>
<br/>
the cop drug search now works for unprocessed drugs<br/>
makes wanted and gives bounty<br/>
drug bounty has been increased<br/>
suggested jail time is now 1min per 25k of drugs (was 20k)<br/>
<br/>
2.56<br/>
<br/>
this version does not have the resources in manufacturing<br/>
<br/>
the buy/sell window now closes after use<br/>
<br/>
drugs and drug license's reworked <br/>
theres now individual licenses for each drug and area<br/>
license are now just 10k<br/>
drug sell and drug gathering points moved to places with more activity<br/>
changes to drug weights, process, and sell price<br/>
<br/>
several mining bugs fixed<br/>
jackhammer working<br/>
items are giving properly<br/>
<br/>
unlimited bicycles in car shops<br/>
<br/>
diamond rings prices make less so more inline with other jobs<br/>
<br/>
sell prices of iron steel copper oil increased<br/>
oil added to sell resource<br/>
oil is now alittle heavier<br/>
<br/>

2.5<br/>
<br/>
Added: SOBR base<br/>
<br/>
Added: Drug farming, you now have to farm the drugs and then process them at the correct gang area<br/>
<br/>
Added: Diamond mining, you change them to diamond rings at diamond processing then sell them to the pawn shop<br/>
<br/>
Added: Drunk script you can now get drunk<br/>
<br/>
Added: Alcohol Factory to fill the pub up in cherno or to start up your own pub etc<br/>
<br/>
Added: Weapon Factory, the gun shop now starts off with 0 stock for the weapons you make them at the weapon factory then sell them to the gun shop<br/>
<br/>
Changed: Terro base has been moved to the main land<br/>
<br/>
Changed: Armed vehicle licence and shop removed you now have to make them at the Terrorist Vehicle factory<br/>
<br/>
Changed: All weapons and bombs etc at Terro Base now require Terror Training<br/>
<br/>
Changed: It now takes 1 hour for placable objects to despawn<br/>
<br/>
Changed: The banks safe now takes longer to fill up<br/>
<br/>
And A few other little tweaks<br/>
<br/>
"
]
];

player selectDiarySubject "changelog"; 










