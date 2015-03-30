import starling.display.Sprite;
import starling.display.Image;

class Platform extends Sprite
{
	public var texture:Image;
	public function new(x:Int, y:Int)
	{
		super();
		texture = new Image(Root.assets.getTexture('platform1'));		
		this.x = x;
		this.y = y;
		this.addChild(texture);
	}
}