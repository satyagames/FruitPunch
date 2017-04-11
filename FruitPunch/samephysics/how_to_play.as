package {
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
    import flash.net.URLRequest;
	public class how_to_play extends Sprite {
		public var main_class:the_game;
		public function how_to_play(passed_class:the_game) {
			main_class = passed_class;
			//play_button.addEventListener(MouseEvent.CLICK, on_play_button_clicked);
			back_button.addEventListener(MouseEvent.CLICK, on_back_button_clicked);
			facebook_btn.addEventListener(MouseEvent.CLICK, facebook_btn_clicked);
			gplus_btn.addEventListener(MouseEvent.CLICK, gplus_btn_clicked);

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
		public function on_play_button_clicked(event:MouseEvent) {
			main_class.play_the_game();
		}
		public function on_back_button_clicked(event:MouseEvent) {
			main_class.show_splash();
		}
	}
}