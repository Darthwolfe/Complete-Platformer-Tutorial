/// @description Equip Gun

global.hasgun = true; //This will check on the creation that if this variable is false then its will just destroy the gun based on the past level

instance_create_layer(oPlayer.x,oPlayer.y,"Gun",oGun); //Makes an instance of the gun object on the gun layer

instance_destroy(); //Destroys the object