import starling.display.Sprite;
import starling.display.Image;

class Item extends Sprite
{
	private var texture:Image;
	public function new(currentRoot:Sprite, tex:String, x:Int, y:Int)
	{
		super();
		this.x = x;
		this.y = y;
		this.texture = new Image(Root.assets.getTexture(tex));
		this.addChild(texture);
		currentRoot.addChild(this);
	}

	// Remove the item from the world
	public function pickup()
	{
		this.removeChild(this.texture);
		this.removeFromParent(true);		
	}
}