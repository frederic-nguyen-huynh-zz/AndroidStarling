/**
 * Created with IntelliJ IDEA.
 * User: fred
 * Date: 20/07/12
 * Time: 19:37
 * To change this template use File | Settings | File Templates.
 */
package org.prototype {
	import flash.display.Sprite;

	import ice.wordox.gfx.JellyBirthAnimation;

	public class BasicMainClass extends Sprite {
		public function BasicMainClass () {
			var jellyAnimation : JellyBirthAnimation;

			for (var colIndex : uint = 0; colIndex < 15; colIndex++) {
				for (var rowIndex : uint = 0; rowIndex < 20; rowIndex++) {
					jellyAnimation = new JellyBirthAnimation ();
					jellyAnimation.x = colIndex * 50;
					jellyAnimation.y = rowIndex * 50;
					jellyAnimation.play ();
					jellyAnimation.loop = true;
					addChild (jellyAnimation);
				}
			}

		}
	}
}
