/// @description COllison Event With pShootable and all children that inherit code from it

with (other) 

{
	hp--; // this add one to the variable
	flash = 3;
	hitfrom = other.direction;
}

instance_destroy();