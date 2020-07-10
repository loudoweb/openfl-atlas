package openfl.display;
import haxe.xml.Access;
import openfl.geom.Rectangle;

/**
 * ...
 * @author loudo
 */
class SparrowTileset extends TilesetEx
{

	/**
	 * 
	 * @param	img texture atlas
	 * @param	xml
	 */
	public function new(img:BitmapData, xml:String) 
	{
		super(img);
		
		var x = new Access( Xml.parse(xml).firstElement() );
		for (texture in x.nodes.SubTexture)
		{
			var name = texture.att.name;
			var rect = new Rectangle(
				Std.parseFloat(texture.att.x), Std.parseFloat(texture.att.y),
				Std.parseFloat(texture.att.width), Std.parseFloat(texture.att.height));
			
			var size = if (texture.has.frameX) // trimmed
					new Rectangle(
						Std.parseInt(texture.att.frameX), Std.parseInt(texture.att.frameY),
						Std.parseInt(texture.att.frameWidth), Std.parseInt(texture.att.frameHeight));
				else 
					new Rectangle(0, 0, rect.width, rect.height);
			
			var id = addRect(rect);
			defs.set(name, id);
			sizes[id] = size;
		}
	}
	
}