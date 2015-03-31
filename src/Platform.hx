import starling.display.Sprite;
import starling.display.Image;
import Math.*;

class Platform extends Sprite
{
	public var texture:Image;
	private var platformTextures:Array<String>;
	public function new(x:Int, y:Int, textureIndex:Int)
	{
		super();
		platformTextures = ["platform1", "platform2", "platform3", "platform4"];

		texture = new Image(Root.assets.getTexture(platformTextures[textureIndex - 1]));
		texture.smoothing = "none";
		this.x = x;
		this.y = y;
		this.addChild(texture);
	}
}