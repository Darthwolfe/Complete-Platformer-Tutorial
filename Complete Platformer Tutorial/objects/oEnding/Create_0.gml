/// @description Insert description here

gunsprite = layer_sprite_get_id("TitleAssets","gGun"); //The is a variable that was set by pulling the Gun sprite's ID from the TitleAssets Layer

if (global.hasgun == true) && (global.kills > 0) //This will check our global flags to see if we Pickup the gun object in the game and if we killed anyone

	// The way we will print out multiple lines of text for this ending is by using the array 
	
	{
		endtext[0] = "And on this day our protaginst had slain " + string(global.kills) + "people."; // We use a string function to printout the number of kills for our player to our sentence on the screen. And in this case we are calling that global flag for player kills.
		if (global.kills == 1) endtext[0] = "And on this day our hero killed a guy fo no reason.";
		endtext[1] = "But some of those people had guns too, so....";
		endtext[2] = "Yea.";
		endtext[3] = "He was probably saving the world, or something.";
		endtext[4] = "Regardless, he was arrested two days later, and spent the rest of his life in prison.";
		endtext[5] = "I mean, the defense team tried to argue that the super ulra awesome sexy recoil effects and hit flashes were to blame, \nbut to no avail.";
		endtext[6] = "The park ranger would later state she was and I quote... \"not angry, just disappointed.\"";
		endtext[7] = "The end.";
	
	}
else
	{
		layer_sprite_destroy(gunsprite);//This checks to see if the gun object we made was destroyed by checking the gunsprite variable. In otherwords it checks to see if we didnt picked up the gun
		endtext[0] = "On this day our hero had a wonderful, serene walk through a national park\nand didn't even murder anyone.";
		endtext[1] = "They reported a discarded firearm to the local authorities\nand were thanked profusely for assisting in an ongoing crime investigation.";
		endtext[2] = "And all it took was behaviour that outside of a video game context\none would hope is completely normal.";
		endtext[3] = "Heh. Who would have thought?";
		endtext[4] = "The end.";
	}
	
spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text = "";