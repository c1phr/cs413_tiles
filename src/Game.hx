import starling.display.Sprite;
import starling.display.Image;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.events.EnterFrameEvent;

import starling.core.Starling;
class Game extends Sprite{

  	public var currentSprite:Sprite;
  	public var character:Image;
  	public var windowx:Float;
  	public var windoxy:Float;
  	public var groundGen:GroundGenerator;
  	public var map:GameMap;
	
	private var objects : Array<Image>; // array of in-game objects (ground...)
	private var babies : Array<Baby>; // array of babies
	
  	public var playGameArrow:Image;

  	//Current coords for characters
  	var charX:Float = 10;
  	var charY:Float = 10;

	public function new(currentSprite:Sprite){
		super();
		this.currentSprite = currentSprite;
	}

	public function start(){		
		groundGen = new GroundGenerator();
		groundGen.generate();
		map = new GameMap();

		for (x in 0...50)
		{
			for (y in 0...50)
			{				
				var xpos:Int = x + Math.floor(windowx/32);
				var ypos:Int = y + Math.floor(windoxy/32);
				map.addChild(groundGen.ground[xpos][ypos]);
			}
		}

		map.x = getSectorOffset(1, true);
		currentSprite.addChild(map);
	    character = new Image(Root.assets.getTexture('character'));
	    character.x = charX;
	    character.y = charY;
	    currentSprite.addChild(character);
	    createMenu();

	    Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		currentSprite.addEventListener(EnterFrameEvent.ENTER_FRAME, frameUpdate);

	}

	private function frameUpdate(event:EnterFrameEvent){
		var sWidth = Starling.current.stage.stageWidth;
		var sHeight = Starling.current.stage.stageHeight;
		if(character.x >= sWidth){			
			map.x -= sWidth;
			character.x = 0;
			if (getSectorX() == 1 && getSectorY() == 0)
			{
				createMenu();
			}
			else
			{
				destroyMenu();
			}
		}
		else if(character.x < 0 ){
			map.x += sWidth;
			character.x += sWidth;
			if (getSectorX() == 1 && getSectorY() == 0)
			{
				createMenu();
			}
			else
			{
				destroyMenu();
			}
		}

		if(character.y >= sHeight){
			map.y -= sHeight;
			character.y -= sHeight;
			if (getSectorX() == 1 && getSectorY() == 0)
			{
				createMenu();
			}
			else
			{
				destroyMenu();
			}
		}
		else if(character.y < 0){
			map.y += sHeight;
			character.y += sHeight;
			if (getSectorX() == 1 && getSectorY() == 0)
			{
				createMenu();
			}
			else
			{
				destroyMenu();
			}
		}


	}

	private function createMenu()
	{
		var sWidth:Int = Starling.current.stage.stageWidth;
		var sHeight:Int = Starling.current.stage.stageHeight;
		this.playGameArrow = new Image(Root.assets.getTexture('white-arrow'));
		this.playGameArrow.x = sWidth - playGameArrow.width;
		this.playGameArrow.y = Std.int(sHeight/2);
		currentSprite.addChild(playGameArrow);
	}

	private function destroyMenu()
	{
		currentSprite.removeChild(this.playGameArrow);
		playGameArrow = null;
	}

	private function getSectorOffset(sectorNum:Int, horz:Bool):Int
	{
		var sWidth:Int = Starling.current.stage.stageWidth;
		var sHeight:Int = Starling.current.stage.stageHeight;
		if (horz)
		{
			return -(sectorNum * sWidth);
		}
		return -(sectorNum * sHeight);
	}

	private function getSectorX():Int
	{		
		return Std.int(-(map.x) / Starling.current.stage.stageWidth);			
	}

	private function getSectorY():Int
	{		
		return Std.int(-(map.y) / Starling.current.stage.stageHeight);
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
	
	
	public function addObject(xPos: UInt, yPos: UInt, texture: String) {
		// for adding platforms and other stuff you can't interact with
		var obj = new Image(Root.assets.getTexture(texture));
		obj.x = xPos;
		obj.y = yPos;
		//collisionMap[xPos][yPos] = 1; // add collision detection
		objects.push(obj);
		addChild(obj);
	}
}
