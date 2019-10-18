///@description Check the sum of possible moves that we can use to match gems. If it goes to 0, AHM will be activated
make_gems_fallen()
#region Variable settings
var rows = global.board_rows;
var skin;
var list_of_cubes = 0;
for(i=0;i<=rows-1;i++)
	{
		for(j=0;j<=7;j++)
		{
			if gems_fallen[i,j] != noone //&& instance_exists(gems_fallen[i,j])
			{
				if gems_fallen[i,j].amHype list_of_cubes++
				gemboard[i,j] = gems_fallen[i,j].skinnum
			}
			else
			{
				gemboard[i,j] = -1
			}
		}
	}
summoves2 = list_of_cubes //+ future_summoves
#endregion

#region SHAPE DRAWING
//1 O - O
//    Θ

//2   Θ
//  O - O  

//3 O
//  - Θ
//  Ο

//4   Ο
//  Θ -
//    Ο

//5 Ο
//  Ο
//  - Θ

//6  Ο
//   Ο
// Θ -

//7  - Θ
//   Ο
//   O

//8 Θ - 
//    Ο
//    O

//9 - O O 
//  Θ

//10 Θ 
//  - O O

//11     Θ
//  O O -

//12 O O -
//       Θ

//13 Θ
//   -
//   Ο
//   Ο

//14 O
//   O
//   -
//   Θ

//15 O Ο - Θ

//16 Θ - Ο Ο
#endregion

#region THE BIG SEX
for(i=0;i<=7;i++)
    {
    for(j=0;j<=7;j++)
        {   
            //1
            if (i >=1) && (j >= 1 && j <= board_xsize-2)
            {
            //first check if the two other gems are the same (and not coal/void)
            if gemboard[i-1,j-1] = gemboard[i-1,j+1] && (gemboard[i-1,j-1] >= 0 && gemboard[i-1,j-1] <=6)
                {
                    skin = gemboard[i-1,j-1]
                    if gemboard[i-1,j] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i-1,j].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i //the i position of the bot gem to use
										j_gemtouse[summoves2] = j // the j position of the bot gem to use
										dir_gemtouse[summoves2] = "up" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"
										summoves2++
                                    }
                            }
                        }
                }
            }
            //2
            if (i <=rows-2) && (j >= 1 && j <= board_xsize-2)
            {
            //first check if the two other gems are the same (and not coal/void)
            if gemboard[i+1,j-1] = gemboard[i+1,j+1] && (gemboard[i+1,j-1] >= 0 && gemboard[i+1,j-1] <=6)
                {
                    skin = gemboard[i+1,j-1]
                    if gemboard[i+1,j] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i+1,j].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {                                     
										i_gemtouse[summoves2] = i //the i position of the bot gem to use
										j_gemtouse[summoves2] = j // the j position of the bot gem to use
										dir_gemtouse[summoves2] = "down" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"
										summoves2++
									}
                            }
                        }
                }
            }
            //3
            if (i >=1 && i <=rows-2) && (j >= 1)
            {
            //first check if the two other gems are the same (and not coal/void)
            if gemboard[i-1,j-1] = gemboard[i+1,j-1] && (gemboard[i-1,j-1] >= 0 && gemboard[i-1,j-1] <=6)
                {
                    skin = gemboard[i-1,j-1]
                    if gemboard[i,j-1] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i,j-1].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    { 
										i_gemtouse[summoves2] = i //the i position of the bot gem to use
										j_gemtouse[summoves2] = j // the j position of the bot gem to use
										dir_gemtouse[summoves2] = "left" //dir of the gem to make a match by moving it. "right", "left", "up" or "down"
										summoves2++
                                    }
                            }
                        }
                }
            }
            //4
            if (i >=1 && i <=rows-2) && (j <= board_xsize-2)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i-1,j+1]
            if skin = gemboard[i+1,j+1] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i,j+1] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i,j+1].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {        
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "right"
										summoves2++
                                    }
                            }
                        }
                }
            }
            //5
            if (i >=2) && (j >= 1)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i-1,j-1]
            if skin = gemboard[i-2,j-1] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i,j-1] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i,j-1].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "left"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //6
            if (i >=2) && (j <= board_xsize-2)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i-1,j+1]
            if skin = gemboard[i-2,j+1] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i,j+1] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i,j+1].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "right"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //7
            if (i <=rows-3) && (j >= 1)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i+1,j-1]
            if skin = gemboard[i+2,j-1] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i,j-1] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i,j-1].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "left"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //8
            if (i <=rows-3) && (j <= board_xsize-2)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i+1,j+1]
            if skin = gemboard[i+2,j+1] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i,j+1] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i,j+1].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "right"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //9
            if (i >=1) && (j <= board_xsize-3)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i-1,j+1]
            if skin = gemboard[i-1,j+2] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i-1,j] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i-1,j].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "up"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //10
            if (i <=rows-2) && (j <= board_xsize-3)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i+1,j+1]
            if skin = gemboard[i+1,j+2] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i+1,j] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i+1,j].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "down"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //11
            if (i <=rows-2) && (j >= 2)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i+1,j-1]
            if skin = gemboard[i+1,j-2] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i+1,j] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i+1,j].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "down"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //12
            if (i >= 1) && (j >= 2)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i-1,j-1]
            if skin = gemboard[i-1,j-2] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i-1,j] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i-1,j].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "up"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //13
            if (i <= rows-4) && board_ysize > 3
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i+2,j]
            if skin = gemboard[i+3,j] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i+1,j] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i+1,j].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "down"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //14
            if (i >= 3)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i-2,j]
            if skin = gemboard[i-3,j] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i-1,j] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i-1,j].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "up"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //15
            if (j >= 3)
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i,j-2]
            if skin = gemboard[i,j-3] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i,j-1] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i,j-1].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "left"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            //16
            if (j <= board_xsize-4) && board_xsize > 3
            {
            //first check if the two other gems are the same (and not coal/void)
            skin = gemboard[i,j+2]
            if skin = gemboard[i,j+3] && (skin >= 0 && skin <=6)
                {                    
                    if gemboard[i,j+1] != -1 //now check if the clickable gem is also not void
                        {
                            if gems_fallen[i,j+1].amLocked = 0 //and if its not void, check if its locked
                            {
                                if gemboard[i,j] = skin && gems_fallen[i,j].amLocked = 0//all good? last thing to do is check if Θ is same and not locked
                                    {
										i_gemtouse[summoves2] = i 
										j_gemtouse[summoves2] = j 
										dir_gemtouse[summoves2] = "right"
                                        summoves2++
                                    }
                            }
                        }
                }
            }
            
        }
    }
#endregion
