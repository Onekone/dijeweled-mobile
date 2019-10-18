/// @description MATCH ANIM
/*var xx = MyPlayer.xx
var xx2 = MyPlayer.xx2
var yy = MyPlayer.yy
var yy2 = MyPlayer.yy2*/
var modi = 1
if Gamerule_1.isReplay modi = 2
if instance_exists(MyPlayer.gemtomove1) && instance_exists(MyPlayer.gemtomove2)
{
	//power(percent,2)
	SWAP_X = round(lerp(0,SWAP_X_END,power(percent,2))) //- x
	SWAP_Y = round(lerp(0,SWAP_Y_END,power(percent,2))) //- y

	percent += 0.1/modi

	if percent <= 1 alarm[5] = 1
	else
	{
		percent = 0
		SWAP_X = round(lerp(0,SWAP_X_END,1)) //- x
		SWAP_Y = round(lerp(0,SWAP_Y_END,1)) //- y
		x += SWAP_X		
		y += SWAP_Y
		SWAP_X = 0
		SWAP_Y = 0
		SWAP_X_END = 0
		SWAP_Y_END = 0
		if (!isturnback) {with(MyPlayer) alarm[2] = 5}
		else {alarm[2] = 5;Gamerule_1.moving = false; with(MyPlayer) alarm[7] = 3}
	}
}
else 
{
	//instance_destroy(instance_position(xx,yy,stopper))
	//instance_destroy(instance_position(xx2,yy2,stopper))
	instance_destroy(MyPlayer.gemtomove1)
	instance_destroy(MyPlayer.gemtomove2)
	with(MyPlayer) alarm[2] = 5
}