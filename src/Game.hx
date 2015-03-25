import starling.display.Sprite;
import starling.display.Image;
import starling.events.Event;


class Game extends Sprite{

  	public var currentSprite:Sprite;
  	public var character:Image;

	public function new(currentSprite:Sprite){
		super();
		this.currentSprite = currentSprite;
		start();
	}

	public function start(){
	    character = new Image(Root.assets.getTexture('character'));
	    character.x = 0;
	    character.y = 0;
	    currentSprite.addChild(character);

	    character.addEventListener("KEYBOARDEVENT.KEY_DOWN", subFunc);

	}
}