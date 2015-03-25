import starling.display.Sprite;
import starling.display.Image;
import starling.events.Event;
import starling.text.TextField;
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

  	//Global variables for height and width
	var sWidth:Int = Starling.current.stage.stageWidth;
	var sHeight:Int = Starling.current.stage.stageHeight;

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
		var objectiveHeader:TextField = new TextField(200, 100, "Game Objectives:", "Arial", 30, 0x000000);
		objectiveHeader.x = getSectorXCenter(2, objectiveHeader.width);
		objectiveHeader.y = getSectorYCenter(0, objectiveHeader.height * 2);
		map.addChild(objectiveHeader);


	    Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		currentSprite.addEventListener(EnterFrameEvent.ENTER_FRAME, frameUpdate);

	}

	private function frameUpdate(event:EnterFrameEvent){
		if(character.x >= sWidth){			
			map.x -= sWidth;
			character.x = 0;
			// If in sector (1,0), display the menu
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
			// If in sector (1,0), display the menu
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
			// If in sector (1,0), display the menu
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
			// If in sector (1,0), display the menu
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

		this.playGameArrow = new Image(Root.assets.getTexture('white-arrow'));
		this.playGameArrow.x = sWidth - playGameArrow.width;
		this.playGameArrow.y = Std.int(sHeight/2);
		currentSprite.addChild(playGameArrow);
	}

	private function ObjectiveMenuText(method:String){
		var objectiveText:TextField = new TextField(100, 20, "Hello World", "Arial", 12, 0x000000);
		if(method == "Destroy"){
			currentSprite.removeChild(objectiveText);
			objectiveText = null;
		}
		else{
    		objectiveText.x = Std.int(sWidth /2);
    		objectiveText.y = Std.int(sHeight / 2);
    		currentSprite.addChild(objectiveText);
		}


	}

	private function destroyMenu()
	{
		currentSprite.removeChild(this.playGameArrow);
		playGameArrow = null;
	}

	// Sector helpers: Full game world starts at sector (0,0) in the top left corner
	// Each chunk of the map that fits on the screen at once is called a "sector"
	// Bottom right sector is (4,4), going beyond 4 or into negative numbers is 
	// Outside the boundaries of the world

	// Get the pixel offset of a sector in order to move the map
	private function getSectorOffset(sectorNum:Int, horz:Bool):Int
	{
		if (horz)
		{
			return -(sectorNum * sWidth);
		}
		return -(sectorNum * sHeight);
	}


	// Return the x sector the player is in
	private function getSectorX():Int
	{		
		return Std.int(-(map.x) / Starling.current.stage.stageWidth);			
	}

	// Return the y sector the player is in
	private function getSectorY():Int
	{		
		return Std.int(-(map.y) / Starling.current.stage.stageHeight);
	}

	private function getSectorXCenter(sector: Int, objectWidth:Float):Int
	{
		return Std.int((sWidth * sector) + (sWidth/2) - (objectWidth/2));
	}

	private function getSectorYCenter(sector: Int, objectHeight:Float):Int
	{
		return Std.int((sWidth * sector) + (sWidth/2) - objectHeight);
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
