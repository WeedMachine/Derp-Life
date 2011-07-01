//written by eddie vedder

_label = _this select 0;

if (_label == "basicintro") then 

{

titleCut ["","BLACK OUT",0];
sleep 1;
disableuserinput true;
titletext [localize "STRS_anfang_laden","plain"];
sleep 8;
playmusic "Track16_Valentine";
titletext [localize "STRS_anfang_02","plain"];
sleep 8;
titletext [localize "STRS_anfang_03","plain"];
sleep 8;			
titletext [localize "STRS_anfang_04","plain"];
sleep 8;
3 fademusic 0;

titletext [localize "STRS_anfang_06","plain"];
sleep 8;


disableuserinput false;
titleCut ["","BLACK IN",0];


};