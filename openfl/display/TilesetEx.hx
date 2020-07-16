package openfl.display;
import openfl.geom.Rectangle;
using StringTools;

/**
 * ...
 * @author loudo
 */
class TilesetEx extends Tileset
{
	var defs:Map<String, Int>;
	var sizes:Array<Rectangle>;
	
	var anims:Map<String,Array<Int>>;
	
	public function new(bitmapData:BitmapData) 
	{
		super(bitmapData);
		defs = new Map<String, Int>();
		sizes = [];
		anims = new Map < String, Array<Int> > ();
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
	
	public function getAnim(name:String):Array<Int>
	{
		
		if (anims.exists(name))
			return anims.get(name);
			
		var indices = new Array<Int>();
		var keys = new Array<String>();
		
		for (key in defs.keys())
		{
			if (key.startsWith(name)) 
				keys.push(key);
		}
		keys.sort(function(x:String, y:String):Int{
			if(Std.parseInt(x.split(name)[1]) < Std.parseInt(y.split(name)[1]))
			{
				return -1;
			}else{
				return 1;
			}
		});
		for(key in keys)
		{
			indices.push(defs.get(key));
		}
		anims.set(name, indices);
		return indices;
	}
}