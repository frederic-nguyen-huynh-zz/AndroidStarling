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
	import starling.text.TextField;
	import starling.textures.Texture;

	public class AndroidMainClass extends Sprite {

		public function AndroidMainClass () {

			var jellyAnimation : JellyBirthAnimation = new JellyBirthAnimation ();

			var animationBounds : IAnimationBound = MovieClipConversionUtils.getMaxSize (jellyAnimation);
			var textures : Vector.<Texture> = MovieClipConversionUtils.generateTexturesFromMovieClip (jellyAnimation, animationBounds);

			var jellyStarlingMovieclip : MovieClip;
			for (var colIndex : uint = 0; colIndex < 15; colIndex++) {
				for (var rowIndex : uint = 0; rowIndex < 20; rowIndex++) {
					jellyStarlingMovieclip = MovieClipConversionUtils.generateStarlingMovieClip (textures);
					jellyStarlingMovieclip.x = colIndex * 50;
					jellyStarlingMovieclip.y = rowIndex * 50;
					jellyStarlingMovieclip.play ();
					jellyStarlingMovieclip.loop = true;
					addChild (jellyStarlingMovieclip);
					Starling.juggler.add (jellyStarlingMovieclip);
				}
			}

			trace (animationBounds);
		}

	}
}
