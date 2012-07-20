package {

	import flash.display.Sprite;

	import org.prototype.AndroidMainClass;
	import org.prototype.BasicMainClass;

	import starling.core.Starling;

	[SWF(frameRate="60", height="600", width="800", backgroundColor="#CCDDFF")]
	public class AndroidStarling extends Sprite {

		public function AndroidStarling () {
			_starlingInstance = new Starling (AndroidMainClass, stage);
			_starlingInstance.showStats = true;

			_starlingInstance.start ();

		}

		private var _starlingInstance : Starling;
	}
}
