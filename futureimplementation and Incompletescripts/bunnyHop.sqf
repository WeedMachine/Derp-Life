//Bunny Hop for SLR by MAD T (year 2010)
_vehicle = vehicle player;

if ((getPos _vehicle select 2 ) < 0.1) then 
{
_vel = velocity _vehicle;
_dir = direction _vehicle;
_vehicle setVelocity [(_vel select 0)+(sin _dir),(_vel select 1)+
(cos _dir),5];
};