/**
 * Created with IntelliJ IDEA.
 * User: fred
 * Date: 20/07/12
 * Time: 19:44
 * To change this template use File | Settings | File Templates.
 */
package org.prototype {
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	import starling.display.MovieClip;
	import starling.textures.Texture;

	public class JellyAnimation extends starling.display.MovieClip {

		public function JellyAnimation (animationClass : Class, playersColor : Vector.<int>) {
			_animationClass = animationClass;
			_overlaySprite = new Sprite();

			if (_texturesByPlayersSeatId == null) {
				initializeTextures (playersColor);
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

		private function initializeTextures (playersColor : Vector.<int>) : void {
			_texturesByPlayersSeatId = new Vector.<Vector.<Texture>> ();

			var jellyAnimation : flash.display.MovieClip = new _animationClass ();
			try {
				jellyAnimation ["overlayClip"].addChild(_overlaySprite);
			} catch (error : Error) {
				return;
			}
			var animationBounds : IAnimationBound = MovieClipConversionUtils.getMaxSize (jellyAnimation);


			for (var i : uint = 0; i < playersColor.length; i++) {
				updateOverlayColor (playersColor[i]);
				_texturesByPlayersSeatId.push(MovieClipConversionUtils.generateTexturesFromMovieClip (jellyAnimation, animationBounds));
			}
		}

		private function updateOverlayColor (color : uint) : Graphics {
			var graphics : Graphics = _overlaySprite.graphics;
			graphics.clear ();
			graphics.beginFill (color);
			graphics.moveTo (-1, -15);
			graphics.lineTo (-1, _LETTER_SIZE + 30);
			graphics.lineTo (_LETTER_SIZE + 2, _LETTER_SIZE + 30);
			graphics.lineTo (_LETTER_SIZE + 2, -15);
			graphics.endFill ();
			return graphics;
		}

		private var _animationClass : Class;
		private var _overlaySprite : Sprite;

		private static var _texturesByPlayersSeatId : Vector.<Vector.<Texture>>;
		private static const _LETTER_SIZE : int = 45;
	}
}
