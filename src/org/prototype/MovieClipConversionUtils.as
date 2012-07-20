/**
 * Created with IntelliJ IDEA.
 * User: fred
 * Date: 20/07/12
 * Time: 00:38
 * To change this template use File | Settings | File Templates.
 */
package org.prototype {
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Matrix;
	import flash.utils.getTimer;

	import starling.display.MovieClip;
	import starling.textures.Texture;

	public class MovieClipConversionUtils {
		public static const MOVIECLIP_FPS : int = 32;

		public function MovieClipConversionUtils () {
			// should not be called
		}

		/**
		 * Returns size information about a flash movieclip
		 * @param animation Animation to inspect
		 * @return Animation size information
		 * @see IAnimationBound
		 */
		public static function getMaxSize (animation : flash.display.MovieClip) : IAnimationBound {
			var startTime : Number = getTimer ();
			var animationLength : int = animation.totalFrames;

			var maxWidth : int = 0
					, maxHeight : int = 0
					, xDelta : int = 0
					, yDelta : int = 0;

			for (var i : int = 0; i < animationLength; i++) {

				animation.gotoAndStop (i);
				updateAnimationChildsFrames (animation, i);
				maxWidth = Math.max (maxWidth, animation.width);
				maxHeight = Math.max (maxHeight, animation.height);
				xDelta = Math.min (xDelta, animation.x);
				yDelta = Math.min (yDelta, animation.y);
			}

			var duration : Number = getTimer () - startTime;
			trace ("MovieClipConversionUtils::getMaxSize() duration : " + (duration) + "ms");
			return new AnimationBoundImpl (
					maxWidth
					, maxHeight
					, xDelta
					, yDelta
			);
		}

		/**
		 * Generate a bitmap data for a movieclip frame
		 * @param animation Source Movieclip
		 * @param frameIndex frame index (from 0 to animation.totalFrames)
		 * @param animationBound Animation bound information
		 * @return Bitmap data
		 */
		public static function generateBitmapForFrame (animation : flash.display.MovieClip, animationBound : IAnimationBound, frameIndex : uint) : BitmapData {

			var bitmapData : BitmapData = new BitmapData (animationBound.maxWidth
					, animationBound.maxHeight, true, 0);
			var translationMatrix : Matrix = new Matrix ();
			translationMatrix.translate (animation.x - animationBound.xDelta
					, animation.y - animationBound.yDelta);

			animation.gotoAndStop(frameIndex);
			updateAnimationChildsFrames (animation, frameIndex);
			bitmapData.draw (animation, translationMatrix);
			return bitmapData;
		}

		private static function updateAnimationChildsFrames (container : DisplayObjectContainer, frameIndex : uint) : void {
			for (var childIndex : uint = 0; childIndex < container.numChildren; childIndex++) {
				var child : DisplayObject = container.getChildAt (childIndex);
				if (child is flash.display.MovieClip) {
					flash.display.MovieClip (child).gotoAndStop (frameIndex % flash.display.MovieClip (child).totalFrames);
				}

				if (child is DisplayObjectContainer) {
					updateAnimationChildsFrames(child as DisplayObjectContainer, frameIndex);
				}
			}
		}

		/**
		 * Generate a starling textures vector for all the movieclip frames
		 * @param animation Source movieclip
		 * @param animationBound Animation bound information
		 * @return
		 */
		public static function generateTexturesFromMovieClip (animation : flash.display.MovieClip, animationBound : IAnimationBound)
				: Vector.<Texture> {
			var startTime : Number = getTimer ();

			var textures : Vector.<Texture> = new Vector.<Texture> ();
			var bitmapData : BitmapData;
			for (var i : uint = 0; i < animation.totalFrames; i++) {
				bitmapData = generateBitmapForFrame (
						animation
						, animationBound
						, i
				);
				textures.push (Texture.fromBitmapData(bitmapData));
//				bitmapData.dispose();
			}

			var duration : Number = getTimer () - startTime;
			trace ("MovieClipConversionUtils::generateBitmapFromMovieClip() duration : " + (duration) + "ms");
			return textures;
		}

		public static function generateStarlingMovieClip (textures : Vector.<Texture>)
		 : MovieClip {
			return new MovieClip(textures, MOVIECLIP_FPS);
		}
	}
}

import org.prototype.IAnimationBound;

class AnimationBoundImpl implements IAnimationBound {

	public function AnimationBoundImpl (maxWidth : int, maxHeight : int, xDelta : int, yDelta : int) {
		_maxWidth = maxWidth;
		_maxHeight = maxHeight;
		_xDelta = xDelta;
		_yDelta = yDelta;
	}

	public function get maxWidth () : int {
		return _maxWidth;
	}

	public function get maxHeight () : int {
		return _maxHeight;
	}

	public function get xDelta () : int {
		return _xDelta;
	}

	public function get yDelta () : int {
		return _yDelta;
	}

	public function toString () : String {
		return "AnimationBoundImpl{_maxWidth=" + String (_maxWidth) + ",_maxHeight=" + String (_maxHeight) + ",_xDelta=" + String (_xDelta) + ",_yDelta=" + String (_yDelta) + "}";
	}

	private var _maxWidth : int;
	private var _maxHeight : int;
	private var _xDelta : int;
	private var _yDelta : int;

}