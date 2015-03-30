import starling.display.Sprite;
import starling.display.Image;

class Platform extends Sprite
{
	public var texture:Image;
	private var platformTextures:Array<String>;
	public function new(x:Int, y:Int, textureIndex:Int)
	{
		super();
		platformTextures = ["platform1"];
		texture = new Image(Root.assets.getTexture(platformTextures[textureIndex-1]));		
		this.x = x;
		this.y = y;
		this.addChild(texture);
	}
}