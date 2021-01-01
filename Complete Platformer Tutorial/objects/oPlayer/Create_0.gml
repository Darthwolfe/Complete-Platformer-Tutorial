/// @description Creation of Declared Variables


//declare variables
hsp = 0; //Horizontal Speed
vsp = 0; //Vertical Speed
grv = 0.3; //Gravity
walksp = 4; //Walk SPeed
hascontrol = true;
controller = 0; //Determines if we are using a controller
canjump = 0;

game_set_speed(60, gamespeed_fps);// This will keep the game running at 60fps without it its can shift and get stuck at a random value