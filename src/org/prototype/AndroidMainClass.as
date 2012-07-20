/**
 * Created with IntelliJ IDEA.
 * User: fred
 * Date: 19/07/12
 * Time: 19:08
 * To change this template use File | Settings | File Templates.
 */
package org.prototype {

	import flash.utils.getTimer;

	import ice.wordox.gfx.JellyBirthAnimation;

	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;

	public class AndroidMainClass extends Sprite {

		public function AndroidMainClass () {

			addEventListener (TouchEvent.TOUCH, onClick);

			var animation : JellyAnimation;
			var playersColors : Vector.<int> = new Vector.<int> ();
			playersColors.push (0xDD2222);
			playersColors.push (0x22DD22);
			playersColors.push (0x2222DD);
			playersColors.push (0x228888);

			var firstCreationEnd : int;

			for (var colIndex : uint = 0; colIndex < 10; colIndex++) {
				for (var rowIndex : uint = 0; rowIndex < 10; rowIndex++) {
					if (colIndex == 0 && rowIndex == 0) {
						var startCreation : int = getTimer ();
						trace ("Start creation at " + startCreation);
					}

					animation = new JellyAnimation (JellyBirthAnimation, playersColors);

					if (colIndex == 0 && rowIndex == 0) {
						firstCreationEnd = getTimer ();
						trace ("First creation duration " + (firstCreationEnd - startCreation) + "ms");
					}
					animation.playerSeatId = Math.random () * 4;
					animation.x = colIndex * 50;
					animation.y = rowIndex * 50;
					animation.play ();
					animation.loop = true;
					addChild (animation);
					Starling.juggler.add (animation);
					_jelliesAnimations.push (animation);
				}
			}

			trace ("All creations duration " + (getTimer () - firstCreationEnd) + "ms");
		}

		private function onClick (event : Event) : void {
			for (var animIndex : uint = 0; animIndex < _jelliesAnimations.length; animIndex++) {
				_jelliesAnimations[animIndex].playerSeatId = Math.random () * 4;
			}
		}

		private const _jelliesAnimations : Vector.<JellyAnimation>
				= new Vector.<JellyAnimation> ();

	}
}
