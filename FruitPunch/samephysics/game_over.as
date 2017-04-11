package 
{
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
    import flash.net.URLRequest;
	import mochi.*;
	public class game_over extends Sprite
	{
		/*var score_var:scoreclip = new scoreclip();*/
		public var main_class:the_game;
		//public var score_c:scoreclip;
		public function game_over(passed_class:the_game,sc:int)
		{
			//score_c = new scoreclip();
			//score_c
			//addChild(score_c);
			/*addChild(score_var);
			score_var.update_score(score,jolly,level,number_of_shakes,time_left,last_score);*/
			main_class = passed_class;
			play_again_button.addEventListener(MouseEvent.CLICK, play_again_button_clicked);
			score_mc.addEventListener(MouseEvent.CLICK, score_button_clicked);
			facebook_btn.addEventListener(MouseEvent.CLICK, facebook_btn_clicked);
			gplus_btn.addEventListener(MouseEvent.CLICK, gplus_btn_clicked);
			l1_btn.addEventListener(MouseEvent.CLICK, l1_btn_clicked);
			triqui_button.addEventListener(MouseEvent.CLICK, on_triqui_button_clicked);
			zopy_logo.addEventListener(MouseEvent.CLICK, zopy_logo_btn_clicked);
			function score_button_clicked(event:MouseEvent)
			{
				mochi.MochiScores.showLeaderboard({boardID: "2f0fbd917f45579f",score:sc});
			}
		}
		public function zopy_logo_btn_clicked(event:MouseEvent) {
			var url:String = "http://zopy.in";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function on_triqui_button_clicked(event:MouseEvent) {
			var url:String = "http://www.zopy.in";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function facebook_btn_clicked(event:MouseEvent) {
			var url:String = "https://www.facebook.com/sharer/sharer.php?u=http://zopy.in";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function gplus_btn_clicked(event:MouseEvent) {
			var url:String = "https://plus.google.com/share?url=http://zopy.in";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function l1_btn_clicked(event:MouseEvent) {
			var url:String = "http://playcoolonlinegames.com";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function play_again_button_clicked(event:MouseEvent)
		{
			mochi.MochiScores.closeLeaderboard();
			main_class.play_the_game();
		}

	}
}