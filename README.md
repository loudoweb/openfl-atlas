# openfl-atlas
atlas importer for Tilemap (openfl >=4.0.2)

Now use Haxe 4!

Code based fairly inspired by [tilelayer by elsassph](https://github.com/elsassph/openfl-tilelayer)

### Atlas format supported

* SparrowTileset : (sparrow and starling format)
* SpriterTileset : (custom format for Spriter based on Sparrow that you can install for TexturePacker from here: https://github.com/loudoweb/SpriterHaxeEngine/tree/master/texturePackerExporter/spriterhaxeengine)

### Feature

* get tile id from atlas. e.g: `new Tile(tilesetEx.getImageID('knight'))`
* use TileClip to animate your tiles. e.g : `new TileClip('knight_', tilesetEx)` and then use `update()` each frame

### TODO

* SpriterJSONTileset : (official format for Spriter in json)
* ask for one or make a pull request

