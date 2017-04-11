package 
{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.display.LoaderInfo;

	import flash.events.*;
	import flash.net.URLRequest;
	//import com.mindjolt.api.as3.MindJoltAPI;
	import mochi.*;
	public dynamic class the_game extends MovieClip {;
	public var splash_screen:splash;
	public var play_screen:the_game_itself;
	public var game_over_screen:game_over;
	public var how_to_play_screen:how_to_play;

	//public var kongregate:*;
	public var final_score:int;
	public function the_game()
	{
		//MochiAd.showPreGameAd({clip:root, id:"f489e6cd19aeeda5", res:"700x525",ad_finished:this.adFinished});
		//mochi.MochiServices.connect("f489e6cd19aeeda5",root);
	adFinished();
	}
	/*public function sound_off()
	{
	music_channel.stop();
	}*/
	public function adFinished():void
	{

		var game_background:bg = new bg();
		addChild(game_background);
		show_splash();

	}
	public function ad_is_finished()
	{
		var game_background:bg = new bg();
		addChild(game_background);
		show_splash();
	}
	public function show_splash()
	{
		splash_screen = new splash(this);
		if (how_to_play_screen)
		{
			removeChild(how_to_play_screen);
			how_to_play_screen = null;
		}
		addChild(splash_screen);
	}
	public function show_how_to_play()
	{
		how_to_play_screen = new how_to_play(this);
		removeChild(splash_screen);
		splash_screen = null;
		addChild(how_to_play_screen);
	}
	public function show_game_over(sc)
	{
		game_over_screen = new game_over(this,sc);
		removeChild(play_screen);
		play_screen = null;
		addChild(game_over_screen);

	}
	public function play_the_game()
	{

		if (splash_screen)
		{
			removeChild(splash_screen);
			splash_screen = null;
		}
		if (how_to_play_screen)
		{
			removeChild(how_to_play_screen);
			how_to_play_screen = null;
		}
		if (game_over_screen)
		{
			removeChild(game_over_screen);
			game_over_screen = null;
		}
		play_screen = new the_game_itself(this);
		addChild(play_screen);
	}
}
}