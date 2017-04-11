package {
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import flash.display.LoaderInfo;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	public class banner extends MovieClip {
		var ban:int=Math.floor(Math.random()*5)+1;
		var domain:String;
		public function banner(url) {
			domain=url.split("/")[2];
			//if (domain.indexOf("girlgames.com")>-1) {
			//ban = 5;
			//}
			x=56;
			y=401;
			gotoAndStop(ban);
			bannerbutton.addEventListener(MouseEvent.CLICK, bannerbutton_clicked);
		}
		public function bannerbutton_clicked(event:MouseEvent) {
			var url:String="http://www.gamesalsa.com/samephysic_redirect.php?id="+ban;
			if (ban==5) {
				url="http://www.rottentomatogames.com/";
			}
			//if (domain.indexOf("girlgames.com")>-1) {
			//url = "http://www.girlgames.com/";
			//}
			var request:URLRequest=new URLRequest(url);
			navigateToURL(request, '_blank');
		}
	}
}