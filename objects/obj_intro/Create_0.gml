/// @description Insert description here
// You can write your code in this editor
depth = 1
randomize()
alpha = 0
pressed = 0
func = 0
audio_play_sound(mus_intro,0,1)
image_speed = 0.1
var myweekday = date_get_weekday(date_current_datetime());
switch myweekday
{
	case 0: myweekday = "Sunday" break;
	case 1: myweekday = "Monday" break;
	case 2: myweekday = "Tuesday" break;
	case 3: myweekday = "Wednesday" break;
	case 4: myweekday = "Thursday" break;
	case 5: myweekday = "Friday" break;
	case 6: myweekday = "Saturday" break;
}
y += 256
text[0] = "Are all the bugs fixed yet?"
text[1] = "The music is funky, amirite?"
text[2] = "Yes, this message box changes everytime you open the game, cool, right?"
text[3] = "If somehow you are not in the Discord server, here is the link: https://discord.gg/X9z4jfW"
text[4] = "I missed all the days of college for this, you better enjoy it"
text[5] = "Skaven is the best senpai"
text[6] = "Waffles or pancakes, we still are going to die in the end. So just eat both"
text[7] = "Curb your Dijeweled bugs"
text[8] = "I swear I am running out of ideas of what to write here"
text[9] = "Oh hey, didn't see you there"
text[10] = "One day the bots will rule all the universe and there's nothing you can do about it"
text[11] = "I am trying to be better than the Bejeweled's 3 mantras"
text[12] = "Game is still unplayable on some pcs, Valve plz fix"
text[13] = "YoYo Games I love you <3"
text[14] = "E-A SPORTS. ITS IN THE GAME..... or it's in the 19.99$ DLC"
text[15] = "U N B E L I E V A B L E"
text[16] = "Rarara is my waifu"
text[17] = "I just imagined how Dijeweled would sound like if Gordon Ramsay voiced it"
text[18] = "I hope this game doesn't get a C&D soon"
text[19] = "Half Life 3 when"
text[20] = "Dijeweled Single update when"
text[21] = "I love you"
text[22] = "IS IT JIF OR GIF?"
text[23] = "Noone has found the easter egg on Dijeweled Single yet lmao"
text[24] = "Give me your money, this is a robbery"
text[25] = "Why are you playing me, PUBG is the trend now"
text[26] = "Today it's " + myweekday + ", the worst day of the week"
text[27] = "Today it's " + myweekday + ", the best day of the week"
text[28] = "Y'know, maybe you should ask the bots for a coffee or something"
texttouse = text[irandom(28)]
alarm[1] = 1