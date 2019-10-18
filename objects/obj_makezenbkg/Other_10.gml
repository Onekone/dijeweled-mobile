/// @description Change background
var l1 = layer_background_get_id(layer_get_id("bg_BOT"))
var l2 = layer_background_get_id(layer_get_id("Backgrounds_1"))
bkg++
switch bkg
{
	case 0:
		layer_background_sprite(l1,spr_zenbkg_00a)
		layer_background_sprite(l2,spr_zenbkg_00b)
		layer_background_htiled(l2,true)
		break;
	case 1:
		layer_background_sprite(l1,spr_zenbkg_01a)
		layer_background_sprite(l2,spr_zenbkg_01b)
		layer_background_htiled(l2,true)
		break;
	case 2:
		layer_background_sprite(l1,spr_zenbkg_02a)
		layer_background_sprite(l2,spr_zenbkg_02b)
		layer_background_htiled(l2,true)
		break;
	case 3:
		layer_background_sprite(l1,spr_zenbkg_03a)
		layer_background_sprite(l2,spr_zenbkg_03b)
		layer_background_htiled(l2,true)
		break;
	case 4:
		layer_background_sprite(l1,spr_zenbkg_04a)
		layer_background_sprite(l2,spr_zenbkg_04b)
		layer_background_htiled(l2,true)
		break;
	default:
		bkg = 0
		layer_background_sprite(l1,spr_zenbkg_00a)
		layer_background_sprite(l2,spr_zenbkg_00b)
		layer_background_htiled(l2,true)
		break;
}
