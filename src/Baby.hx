import starling.display.Sprite;
import starling.display.Image;
import starling.events.Event;
import starling.core.Starling;

class Baby extends Sprite{

	public var me: Image;
	public var saved: Bool; // is this baby found or not?
	
	public function new(xPos: Int, yPos: Int, tex: String){
		super();
		me = new Image(Root.assets.getTexture(tex));
		// should update this to use tile positions, ex me.x = xPos * GRID_WIDTH;
		me.x = xPos;
		me.y = yPos;
		me.smoothing = "none";
		saved = false;
	}
	
}