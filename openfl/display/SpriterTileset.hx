package openfl.display;
import haxe.xml.Access;
import openfl.geom.Rectangle;

/**
 * This is a custom Sparrow atlas parser with lite xml attributes and full path for tile name (with extension).
 * SubTexture = Sub, width = w, height = h, frameWidth = frameW, frameHeight = frameH
 * You can find a TexturePacker exporter here https://github.com/loudoweb/SpriterHaxeEngine/tree/master/texturePackerExporter/spriterhaxeengine
 * @author loudo
 */
class SpriterTileset extends TilesetEx
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
		for (texture in x.nodes.Sub)
		{
			var name = texture.att.name;
			var rect = new Rectangle(
				Std.parseFloat(texture.att.x), Std.parseFloat(texture.att.y),
				Std.parseFloat(texture.att.w), Std.parseFloat(texture.att.h));
			
			var size = if (texture.has.fX) // trimmed
					new Rectangle(
						-Std.parseInt(texture.att.fX), -Std.parseInt(texture.att.fY),
						Std.parseInt(texture.att.fW), Std.parseInt(texture.att.fH));
				else 
					new Rectangle(0, 0, rect.width, rect.height);
			
			var id = addRect(rect);
			defs.set(name, id);
			sizes[id] = size;
		}
	}
	
}