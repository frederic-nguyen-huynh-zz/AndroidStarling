/**
 * Created with IntelliJ IDEA.
 * User: fred
 * Date: 19/07/12
 * Time: 19:08
 * To change this template use File | Settings | File Templates.
 */
package org.prototype {

	import ice.wordox.gfx.JellyBirthAnimation;

	import starling.core.Starling;

	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class AndroidMainClass extends Sprite {

		public function AndroidMainClass () {
			/*
			 var jellyAnimation : JellyBirthAnimation = new JellyBirthAnimation ();
			 var animationBounds : IAnimationBound = MovieClipConversionUtils.getMaxSize (jellyAnimation);
			 var textures : Vector.<Texture> = MovieClipConversionUtils.generateTexturesFromMovieClip (jellyAnimation, animationBounds);

			 var jellyStarlingMovieclip : MovieClip;
			 */
			var animation : JellyAnimation;

			var playersColors : Vector.<int> = new Vector.<int> ();
			playersColors.push(0);
			playersColors.push(1);
			playersColors.push(2);
			playersColors.push(3);


			for (var colIndex : uint = 0; colIndex < 10; colIndex++) {
				for (var rowIndex : uint = 0; rowIndex < 9; rowIndex++) {
					animation = new JellyAnimation (JellyBirthAnimation, playersColors);
					animation.playerSeatId = 0;
					animation.x = colIndex * 60;
					animation.y = rowIndex * 60;
					animation.play ();
					animation.loop = true;
					addChild (animation);
					Starling.juggler.add (animation);
				}
			}



		}

	}
}
