import starling.display.Sprite;
import starling.display.Image;

class Ground extends Sprite
{
	public function new(x:Int, y:Int)
	{
		super();
		var texture = new Image(Root.assets.getTexture("grass"));
		this.x = x;
		this.y = y;
	}
}