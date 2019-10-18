/// @description instance_destroy();
/// @function instance_destroy
with(Gem_1) acc = 0
instance_destroy();
if !instance_exists(lightningObj1)
{
Gamerule_1.lightOn = false //no longer producing lightning, now the gems can move :)
}


