/**
 * Created with IntelliJ IDEA.
 * User: fred
 * Date: 20/07/12
 * Time: 19:44
 * To change this template use File | Settings | File Templates.
 */
package org.prototype {
	import flash.display.MovieClip;

	import starling.display.MovieClip;
	import starling.textures.Texture;

	public class JellyAnimation extends starling.display.MovieClip {

		public function JellyAnimation (animationClass : Class, playersColor : Vector.<int>) {
			_animationClass = animationClass;
			_playersColors = playersColor;

			if (_texturesByPlayersSeatId == null) {
				initializeTextures ();
			}
			super (_texturesByPlayersSeatId[0], MovieClipConversionUtils.MOVIECLIP_FPS);
		}

		public function set playerSeatId (playerSeatId : int) : void {
			var textures : Vector.<Texture> = _texturesByPlayersSeatId[playerSeatId];
			while (this.numFrames > 1) {
				this.removeFrameAt (0);
			}
			textures = _texturesByPlayersSeatId[playerSeatId];
			for (var textureIndex : uint = 0; textureIndex < textures.length; textureIndex++) {
				this.addFrame(textures[textureIndex]);
			}
		}

		private function initializeTextures () : void {
			_texturesByPlayersSeatId = new Vector.<Vector.<Texture>> ();

			var jellyAnimation : flash.display.MovieClip = new _animationClass ();
			var animationBounds : IAnimationBound = MovieClipConversionUtils.getMaxSize (jellyAnimation);

			for (var i : uint = 0; i < _playersColors.length; i++) {
				_texturesByPlayersSeatId.push(MovieClipConversionUtils.generateTexturesFromMovieClip (jellyAnimation, animationBounds));
			}
		}

		private var _playersColors : Vector.<int>;
		private var _animationClass : Class;

		private static var _texturesByPlayersSeatId : Vector.<Vector.<Texture>>;
	}
}
