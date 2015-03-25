import starling.display.*;
import starling.display.Image;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.core.Starling;
class Game extends Sprite{

  	public var currentSprite:Sprite;
  	public var character:Image;

  	//Current coords for characters
  	var charX:Float = 10;
  	var charY:Float = 10;

	public function new(currentSprite:Sprite){
		super();
		this.currentSprite = currentSprite;
		
		var row: UInt;		
		var col: UInt;
		quad = new Quad(
			row = Starling.current.stage.stageWidth, 
			col = Starling.current.stage.stageHeight 
		);
		
		quad.alpha = 0;
		addChild(quad);

		createGrid(quad);
		
		//start();
	}

	public function start(){
	    character = new Image(Root.assets.getTexture('character'));
	    character.x = charX;
	    character.y = charY;
	    currentSprite.addChild(character);

	    Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
	}

	private function keyDown(event:KeyboardEvent){
		var keycode = event.keyCode;
		if(keycode == 83){
			character.y += 60;
		}
		else if(keycode == 87){
			character.y -=60;
		}
		else if(keycode == 65){
			character.x -= 60;
		}
		else if(keycode == 68){
			character.x += 60;
		}
	}
}