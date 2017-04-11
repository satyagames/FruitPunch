package {
	import flash.display.Sprite;
	import flash.text.TextField;
	public class scoreclip extends Sprite {
		public function scoreclip() {

		}
		public function update_score(sc,pr,lv,bm,tm,ls) {
			var scorestring:String;
			scorestring = sc.toString();
			while (scorestring.length<6) {
				scorestring = "0"+scorestring;
			}
			scoretext.text = scorestring;
			if (tm<0) {
				tm=0;
			}
			infotext.text = "LEVEL: "+lv+"\n\nSINGLES: "+pr+"\nOne-crate removes left\n\nSHAKES: "+bm+"\nShakes left\n\nTIME: "+tm+"\nMake a move before ends\nor it's game over!\n\n<CLICK> on a crate or\n<CLICK> on SHAKE\n\nLAST SCORE:\n"+ls;
		}
	}
}