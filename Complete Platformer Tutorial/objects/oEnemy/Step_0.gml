

//SET GRAVITY

vsp = vsp + grv;

//HORIZONTAL COLLISION

if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
			
			
		}
		
	hsp = -hsp;
	
	
	
}

x = x + hsp;


//VERTICAL COLLISION

if (place_meeting(x, y + vsp, oWall))
{
	while (!place_meeting(x, y + sign(vsp), oWall))
		{
			y = y + sign(vsp);
			
			
		}
		
	vsp = 0;
	
	
	
}

y = y + vsp;

//Dont walk off the edge

if (grounded) && (afraidofheights) && (!place_meeting(x+hsp,y+1,oWall))
{
	hsp = -hsp;
}
//ANIMATIONS

if (!place_meeting(x,y + 1,oWall)) //Checks to see if the player is in the air and uses sprite index to change the sprite to sPlayerA and how fast it should change the image with image speed
{
		grounded = false;
		sprite_index = sEnemyA;
		image_speed = 0;
		if (sign(vsp) > 0 ) image_index = 1; 
	
		else
	
		image_index = 0;
}
else
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = sEnemy;
		
	}
	else
	{
		sprite_index = sEnemyR;
	}
}


if (hsp != 0) image_xscale = sign(hsp) * size; //Checks to see if the player is moving left. If so flip the player sprite from right to left with the image x scale command
image_yscale = size;