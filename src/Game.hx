import starling.display.Sprite;
import starling.display.Image;
import starling.events.Event;


class Game extends Sprite{

  	public var currentSprite:Sprite;
  	public var character:Image;
  	public var windowx:Float;
  	public var windoxy:Float;
  	public var groundGen:GroundGenerator;
  	public var map:Map2;

	public function new(currentSprite:Sprite){
		super();
		this.currentSprite = currentSprite;
		//start();
	}

	public function start(){		
		groundGen = new GroundGenerator();
		groundGen.generate();
		map = new Map2();

		for (x in 0...50)
		{
			for (y in 0...50)
			{				
				var xpos:Int = x + Math.floor(windowx/32);
				var ypos:Int = y + Math.floor(windoxy/32);
				map.addChild(groundGen.ground[xpos][ypos]);
			}
		}
		currentSprite.addChild(map);
	    character = new Image(Root.assets.getTexture('character'));
	    character.x = 0;
	    character.y = 0;
	    currentSprite.addChild(character);

	}
}