/**
 * Created with IntelliJ IDEA.
 * User: fred
 * Date: 20/07/12
 * Time: 00:38
 * To change this template use File | Settings | File Templates.
 */
package org.prototype {
	import flash.display.MovieClip;

	public class MovieClipConvertionUtils {

		public function MovieClipConvertionUtils () {
			// should not be called
		}

		/**
		 * Returns size information about a flash movieclip
		 * @param animation Animation to inspect
		 * @return Animation size information
		 * @see IAnimationBound
		 */
		public static function getMaxSize (animation : MovieClip) : IAnimationBound {
			var animationLength : int = animation.totalFrames;

			var maxWidth : int, maxHeight : int, xDelta : int, yDelta : int;
			for (var i : int = 0; i < animationLength; i++) {
				animation.gotoAndStop (i);
				maxWidth = Math.max (maxWidth, animation.width);
				maxHeight = Math.max (maxHeight, animation.height);
				xDelta = Math.min (xDelta, animation.x);
				yDelta = Math.min (yDelta, animation.y);
			}

			return new AnimationBoundImpl (
					maxWidth
					, maxHeight
					, xDelta
					, yDelta
			);
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