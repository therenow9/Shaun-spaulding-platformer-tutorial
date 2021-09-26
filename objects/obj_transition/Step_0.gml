/// @description 

if (mode!=TRANS_MODE.OFF)
{
	if (mode==TRANS_MODE.INTRO)
		{
			percent=max(0,percent-max((percent/10),0.005));
			// EASY WAY=percent=max(0,percent-0.05);
		}// fade 1 to 0
		else
		{
			percent=min(1.2,percent+max(((1.2-percent)/10),0.005));//1.2 black bars over lap makes black screen
			//EASY WAY=percent=min(1,percent+0.05);
		}//fade 0 to 1
		
	if (percent==1.2) or (percent==0)//transition control
	{
		switch (mode)
		{
			case TRANS_MODE.INTRO:
			{
			mode=TRANS_MODE.OFF;
			break;
			}
			case TRANS_MODE.NEXT:
			{
			mode=TRANS_MODE.INTRO;	
			room_goto_next();
			break;
			}
			case TRANS_MODE.GOTO:
			{
			mode=TRANS_MODE.INTRO;
			room_goto(target);//go to specified room
			break;
			}
			case TRANS_MODE.RESTART://restarts game
			{
			game_restart();
			break;
			}
			
		}
	}
}