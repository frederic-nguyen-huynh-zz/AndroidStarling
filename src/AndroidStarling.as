package {

	import flash.display.Sprite;

	import org.prototype.AndroidMainClass;

	import starling.core.Starling;

	[SWF(frameRate="32", height="600", width="800")]
	public class AndroidStarling extends Sprite {

		public function AndroidStarling () {

			_starlingInstance = new Starling(AndroidMainClass, stage);
			_starlingInstance.showStats = true;
			_starlingInstance.start();
		}

		private var _starlingInstance : Starling;
	}
}
