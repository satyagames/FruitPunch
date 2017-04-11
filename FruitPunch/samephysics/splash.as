package {
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
    import flash.net.URLRequest;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	public class splash extends Sprite {
		public var main_class:the_game;
		public var music:the_music = new the_music();
		public var music_channel:SoundChannel;
		public function splash(passed_class:the_game) {
			main_class = passed_class;
			play_button.addEventListener(MouseEvent.CLICK, on_play_button_clicked);
			how_to_button.addEventListener(MouseEvent.CLICK, on_how_to_button_clicked);
			emanuele_button.addEventListener(MouseEvent.CLICK, on_emanuele_button_clicked);
			triqui_button.addEventListener(MouseEvent.CLICK, on_triqui_button_clicked);
			facebook_btn.addEventListener(MouseEvent.CLICK, facebook_btn_clicked);
			gplus_btn.addEventListener(MouseEvent.CLICK, gplus_btn_clicked);
			y8logo.addEventListener(MouseEvent.CLICK, y8logo_btn_clicked);
			//soundoffbutton.addEventListener(MouseEvent.CLICK, on_soundoff_button_clicked);
		}
		public function y8logo_btn_clicked(event:MouseEvent) {
			var url:String = "http://www.7k7k.com";
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
		public function on_play_button_clicked(event:MouseEvent) {
			music_channel = music.play(0,1000);
			main_class.play_the_game();
			
		}
		public function on_how_to_button_clicked(event:MouseEvent) {
			main_class.show_how_to_play();
		}
		/*public function on_soundoff_button_clicked(event:MouseEvent) {
			main_class.sound_off();
		}*/
		public function on_emanuele_button_clicked(event:MouseEvent) {
			var url:String = "http://www.zopy.in";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
		public function on_triqui_button_clicked(event:MouseEvent) {
			var url:String = "http://www.zopy.in";
			var request:URLRequest = new URLRequest(url);
			navigateToURL(request, '_blank');
		}
	}
}