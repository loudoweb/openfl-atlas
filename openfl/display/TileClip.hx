package openfl.display;

import lime.app.Event;
import openfl.display.TilesetEx;
import openfl.display.Tile;

/**
 * Animated tile for Tilemap
 * @author Loudo (Ludovic Bas)
 * @author Philippe / http://philippe.elsass.me
 */
class TileClip extends Tile
{
	public var onComplete:Event<TileClip->Void>;

	public var currentFrame(get, set):Int;
	public var totalFrames(get, null):Int;
	public var frames:Array<Int>;
	public var fps:Int;
	public var loop:Bool;

	var time:Float;
	var prevFrame:Int;
	var animated:Bool;

	public function new(tile:String, tilesetEx:TilesetEx, fps = 12, loop = true)
	{
		
		this.loop = loop;
		this.animated = false;
		
		this.frames = tilesetEx.getAnim(tile);
		
		super(frames[0]);
		
		this.fps = fps;
		
		this.time = 0;
		this.prevFrame = -1;

		this.onComplete = new Event<TileClip->Void>();
	}

	public function update(elapsed:Float)
	{
		if(!animated) return;

		time += elapsed;
		var newFrame = currentFrame;
		if (newFrame == prevFrame) return;
		var looping = newFrame < prevFrame;
		prevFrame = newFrame;
		if (looping)
		{
			if (!loop) 
			{
				animated = false;
				currentFrame = totalFrames - 1;
			}
			else id = frames[newFrame];
			onComplete.dispatch(this);
		}
		else id = frames[newFrame];
	}

	public function play() 
	{ 
		if (!animated) 
		{
			animated = true;
			if (currentFrame == totalFrames - 1)
			{
				currentFrame = 0;
				prevFrame = -1;
			}
		}
	}
	public function stop() { animated = false; }

	public function destroy():Void
	{
		onComplete.removeAll();
		frames = null;
	}

	function get_currentFrame():Int 
	{
		var frame:Int = Math.floor((time / 1000) * fps);
		return frame % frames.length;
	}
	function set_currentFrame(value:Int):Int 
	{
		if (value >= totalFrames) value = totalFrames - 1;
		time = Math.floor(1000 * value / fps) + 1;
		id = frames[value];
		return value;
	}

	inline function get_totalFrames():Int
	{
		return frames.length;
	}
}