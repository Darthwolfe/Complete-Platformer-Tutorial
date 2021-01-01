/// @description Player Controls, Animations and  Room Collisions

//GET PLAYER INPUT

if (hascontrol)
{

	key_left = keyboard_check(vk_left) || keyboard_check(ord("A")); //move keft with left key or A key

	key_right = keyboard_check(vk_right) || keyboard_check(ord("D")); //move right with right key or D key

	key_jump = keyboard_check(vk_space); //Jump

	if (key_left) || (key_right) || (key_jump)
	{
		controller = 0;
	
	
	}

	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;
		controller = 1;
	
	
	}
}

	
else

{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	
}


	//CALCULATE MOVEMENT

	var move = key_right - key_left;

	hsp = move * walksp; 

	//SET GRAVITY

	vsp = vsp + grv;


	//JUMP CHECK: TO KEEP PLAYER FROM JUMPING IN MIDAIR
	canjump -=1;
	if (canjump > 0) && (key_jump)
	{
		vsp = -7;
		canjump = 0;
	
	}

	//HORIZONTAL COLLISION

	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x = x + sign(hsp);
			
			
			}
		
		hsp = 0;
	
	
	
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



	//ANIMATIONS

	if (!place_meeting(x,y + 1,oWall)) //Checks to see if the player is in the air and uses sprite index to change the sprite to sPlayerA and how fast it should change the image with image speed
	{
			sprite_index = sPlayerA;
			image_speed = 0;
			if (sign(vsp) > 0 ) image_index = 1; 
	
			else
	
			image_index = 0;
	}
else
	{
		canjump = 10;
		if (sprite_index == sPlayerA)
	{	
		audio_sound_pitch(snLanding, choose(0.8,1.0,1.2));
		audio_play_sound(snLanding,4,false);
		repeat(5)
		{
			with (instance_create_layer(x,bbox_bottom,"Dust",oDust))
				{
					
					vsp = 0;
				}
			
		}
		
	}
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = sPlayer;
		
		}
		else
		{
			sprite_index = sPlayerR;
		}
	}


	if (hsp != 0) image_xscale = sign(hsp); //Checks to see if the player is moving left. If so flip the player sprite from right to left with the image x scale command