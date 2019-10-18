/// @description Insert description here
if func <= 1 && !gemgotdestroyed
{
	var inside = 1 - power((func-1),2)
	for(var i = 0; i<4;i++)
	{
		if !instance_exists(gem[i])
		{
			gemgotdestroyed = true
		}
		else
		{
			gem[i].x = lerp(gemxxdef[i],gemxx[i],inside)
			gem[i].y = lerp(gemyydef[i],gemyy[i],inside)
		}
	}
	func += 0.1
}
else
{
	if (instance_number(obj_twist_collider2) == 1) Gamerule_2.moving = false
	
	for(var i = 0; i<4;i++)
	{
		with(gem[i])
		{
			if other.gemgotdestroyed
			{
				x = other.gemxx[i]
				y = other.gemyy[i]
			}
			ammoving = false	
		}
	}

	instance_destroy()
}