/// @description Enemy gun Code
x = owner.x;//This will allow each instance of oEgun to follow its owner "which is the enemy" by the x axis
y = owner.y+10;//This will allow each instance of oEgun to follow its owner by the y axis

image_xscale = abs(owner.image_xscale); // We use abs to always get a postive number back that way if we used image x scale to flip a number we can flip it back
image_yscale = abs(owner.image_yscale); // We use abs to always get a postive number back that way if we used image y scale to flip a number we can flip it back

//This will make sure that our player object exists.

if (instance_exists(oPlayer))
{
	if (oPlayer.x < x) image_yscale = -image_yscale;                     //we will know if the player is to the left or right of the gun if this is true or false and depending on that the code that will flip the sprite image on the Y axis
	if (point_distance(oPlayer.x,oPlayer.y,x,y) < 600)                         //THis will return the player x and y position to the instances x and y coodinate in this step event. And if the players distance is less than 600 pixels the follow code will run
	{
		image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);          //This will aim the gun at the players location
		countdown--;                                                     //This Starts the frame countdown by one frame at a time
		if (countdown <= 0)
		{	
			countdown = countdownrate;
			if(!collision_line(x,y,oPlayer.x,oPlayer.y,oWall,false,false)) //This creates a virtual line that checks to see if there is a wall
			{
				audio_sound_pitch(snShot,choose(0.8,1.0,1.2));
				audio_play_sound(snShot,5,false);
				with (instance_create_layer(x,y,"Bullets",oEbullet))
				{
					spd = 10;
					direction = other.image_angle + random_range(-3,3);
					image_angle = direction;
				}
			}
		}
	}
	
}