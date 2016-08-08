package openfl.display;
import openfl.geom.Rectangle;

/**
 * ...
 * @author loudo
 */
class TilesetEx extends Tileset
{
	var defs:Map<String, Int>;
	var sizes:Array<Rectangle>;
	
	public function new(bitmapData:BitmapData) 
	{
		super(bitmapData);
		defs = new Map<String, Int>();
		sizes = [];
	}
	public function getImageID(name:String):Int
	{
		if (defs.exists(name))
		{
			return defs.get(name);
		}
		return -1;
	}
	public function getSize(id:Int):Rectangle
	{
		if (id < sizes.length)
			return sizes[id];
		else 
			return null;
	}
}