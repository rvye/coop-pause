watchchatpause()
{

    level endon("end_game");
	self endon("disconnect");
    for(;;)
    {

    	level waittill("say", message, player);

    	if (message == "p")
    	{
    
    		self EnableInvulnerability();
    		self iprintln("Game Paused ");
    		self.ignoreme = 1;
    		self freezeControls(true);
    		level.gamestate = createServerFontString("hudsmall" , 31);
    		level.gamestate setPoint("CENTER", "TOP", "CENTER", 190);
    		level.gamestate setText("Game Paused");
    		level waittill("say", message1, player);
    		chatPauseFix(message1);
   		}
   		wait 0.05; 
	}
}

chatPauseFix(m)
{
	if(m == "u")
    {
    	self iprintln("Game UnPaused ");
    	self freezeControls(false);
    	level.gamestate destroy();
    	self DisableInvulnerability();
    	self.ignoreme = 0;
    }
    else
    {
    	level waittill("say", chat, player);
    	chatPauseFix(chat);
    }
}