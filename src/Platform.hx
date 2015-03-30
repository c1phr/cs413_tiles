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
		var num = Std.random(10);
		if (num == 1) {
			platformTextures = ["platform2"];
		}
		else if (num == 2 || num == 3) {
			platformTextures = ["platform4"];
		}
		else if (num == 4) {
			platformTextures = ["platform1"];
		}
		else {
			platformTextures = ["platform3"];
		}
		texture = new Image(Root.assets.getTexture(platformTextures[textureIndex - 1]));
		texture.smoothing = "none";
		this.x = x;
		this.y = y;
		this.addChild(texture);
	}
}