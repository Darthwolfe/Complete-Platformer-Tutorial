x += lengthdir_x(spd,direction);  //This will move the bullets in the X direction of the gun
y += lengthdir_y(spd,direction);  //This will move the bullets in the Y direction of the gun


/// This will allow the bullet to shoot and damage and child of pShootable
if (place_meeting(x,y,pShootable))
{
	with (instance_place(x,y,pShootable))
	{
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}
	
	instance_destroy();
}




if (place_meeting(x,y,oWall)) && (image_index != 0) //This checks for a collison with just the wall 
{
	while (place_meeting(x,y,oWall))  //While there is a collision this will move the bullet one pixel backwords of the direction the object came from
	{
	x -= lengthdir_x(1,direction);  
	y -= lengthdir_y(1,direction);

	}
	spd = 0;
	instance_change(oHitSpark,true); //This changes the bullet object to the HitSpark object
}

