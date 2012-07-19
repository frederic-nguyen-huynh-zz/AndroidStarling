/**
 * Created with IntelliJ IDEA.
 * User: fred
 * Date: 19/07/12
 * Time: 19:08
 * To change this template use File | Settings | File Templates.
 */
package org.prototype {

	import flash.display.MovieClip;

	import ice.wordox.gfx.JellyBirthAnimation;

	import ice.wordox.gfx.JellyBreathingAnimation;

	import org.prototype.IAnimationBound;
	import org.prototype.MovieClipConvertionUtils;

	import starling.display.Sprite;
	import starling.text.TextField;

	public class AndroidMainClass extends Sprite {

		public function AndroidMainClass () {

			var textField : TextField = new TextField (300, 30, "Hello World");
			addChild (textField);

			var jellyAnimation : MovieClip = new JellyBirthAnimation();
			var animationBounds : IAnimationBound = MovieClipConvertionUtils.getMaxSize (jellyAnimation);
			trace(animationBounds);
		}

	}
}
