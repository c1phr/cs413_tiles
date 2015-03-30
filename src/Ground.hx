import starling.display.Sprite;
import starling.display.Image;

class Ground extends Sprite
{
	public function new(x:Int, y:Int)
	{
		super();
		for (x in 0...11)
		{
			var texture = new Image(Root.assets.getTexture("grass"));
			texture.y = this.y;
			texture.x = 64 * x;
			this.addChild(texture);
		}		
		this.x = x;
		this.y = y;
	}
}