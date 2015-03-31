import starling.display.Sprite;
import starling.display.Image;
import starling.events.Event;
import starling.text.TextField;
import starling.events.KeyboardEvent;
import starling.events.EnterFrameEvent;
import flash.geom.Rectangle;
import Math.*;

import starling.core.Starling;
class Game extends Sprite{

  	public var currentSprite:Sprite;
  	public var character:Image;
  	  	
  	public var map:GameMap;
	public var tiles:Tilemap; 

	// static inline effectively marks these as "constants"
  	public static inline var gravityCoefficient:Int = 6;
  	public static inline var movementCoefficient:Float = 10;
	
	private var platforms : Array<Image>; // array of in-game platforms
	private var babies : Array<Baby>; // array of babies	
	private var items: List<Item>;
	private var levelGen:LevelGen;
	
	//Images
  	public var objectArrow:Image;
  	public var ground:Image;
  	public var door:Image;
  	public var key:Image;

  	//Current coords for characters
  	var charX:Float = 30;
  	var charY:Float = 560;
  	var charXPos:Int = 0;
  	var charYPos:Int = 0;  	
  	var groundBounds:Rectangle;
  	var deltaX:Float = 0;
  	var deltaY:Float = 0;
  	var jumpLock:Bool = false;

  	//Global variables for height and width
	var sWidth:Int = Starling.current.stage.stageWidth;
	var sHeight:Int = Starling.current.stage.stageHeight;

	public function new(currentSprite:Sprite){
		super();
		this.currentSprite = currentSprite;
		babies = new Array();
		this.items = new List<Item>();		
	}

	public function start() {	
		
		var tiles = new Tilemap(Root.assets, "map1");
		currentSprite.addChild(tiles);
		tiles.y = 32;


		
		map = new GameMap();
		map.x = -getSectorOffset(1, true);
		
		var groundFloor = new Ground(getSectorOffset(1, true), Starling.current.stage.stageHeight - 64);
		map.addChild(groundFloor);
		
		currentSprite.addChild(map);		
		groundBounds = groundFloor.getBounds(currentSprite);
	    character = new Image(Root.assets.getTexture('lizard'));
		character.smoothing = "none";
	    character.x = charX;
	    character.y = charY;
	    currentSprite.addChild(character);
	    
		//addBaby(300, 550, "baby1");
		
		createMenu();
	    //this.items.add(new Item(this.currentSprite, "dummy-item", 50, 50));

	    Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
	    Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		currentSprite.addEventListener(EnterFrameEvent.ENTER_FRAME, frameUpdate);

	}

	private function frameUpdate(event:EnterFrameEvent){
		
		var sWidth = Starling.current.stage.stageWidth;
		var sHeight = Starling.current.stage.stageHeight;		
		var characterBounds:Rectangle = character.bounds;		
		var platformTopCollision:Bool = false;
		var platformBottomCollision:Bool = false;

		// Check for collisions with platforms
		for (platform in levelGen.platforms)
		{
			// Get the platform bounds in the coordinate-space of the currentSprite
			var platformRect = platform.texture.getBounds(currentSprite);
			if (characterBounds.intersects(platformRect))
			{									
				if (character.y <= platformRect.top)
				{									
					platformTopCollision = true; // Character collided with the top of a platform
				}
				if (character.y + character.height >= platformRect.bottom)
				{									
					platformBottomCollision = true; // Character collided with the bottom of a platform
				}
				break; // If we collided with a platform, we don't need to keep looking
			}
		}
		// If the character isn't on the ground, handle other collisions
		if (!characterBounds.intersects(groundBounds))
		{
				if (deltaY < 0 && !platformBottomCollision) // Jumping up
				{									
					deltaY += 1;					
				}				
				else if (!platformTopCollision) // Falling down
				{					
					character.y += gravityCoefficient;					
				}
				else if (platformTopCollision) // We landed on a platform
				{
					deltaY = 0;
					jumpLock = false; // On a platform, unlock jumping
				}								
				if (platformBottomCollision) // We hit our head on the bottom of a platform
				{					
					deltaY = 0;
					character.y += gravityCoefficient;
				}
		}	

		else if (jumpLock && deltaY == 0) // Fell down and hit the ground, unlock jumping
		{			
			jumpLock = false;			
		}		
		if(character.x >= 0 && character.x <= (sWidth - character.width)){
      		character.x += deltaX;
		}
		else if(character.x <= 0){
			character.x = 0;
		}	
		// else if(character.x >= (sWidth-character.width)){
		// 	character.x = (sWidth-character.width);
		// }
		if(character.y >= 0){
      		character.y += deltaY;
		}	
		if(character.y >= 635){
			character.y -= 80;
		}

		if(character.x >= (sWidth-character.width)){
			map.x -= sWidth;
			character.x = 0;
			levelGen.destroy();
		}
		if(character.y >= sHeight){
			map.y -= sHeight;
			character.y -= sHeight;
		}
		else if(character.y < 0){
			map.y += sHeight;
			character.y += sHeight;			
		}

	}

	private function createMenu()
	{

		door = new Image(Root.assets.getTexture('door'));
		door.x = getSectorOffset(1, true) + 64;
		door.y = (sWidth - (32*11));

		key = new Image(Root.assets.getTexture('key_red'));
		key.x = getSectorOffset(1, true) + (sWidth - (key.width * 10 ));
		key.y = (sWidth - (64*3));
		key.scaleX += 1;
		key.scaleY += 1;

		this.objectArrow = new Image(Root.assets.getTexture('white-arrow'));
		this.objectArrow.x = getSectorOffset(1, true) + (sWidth - this.objectArrow.width);
		this.objectArrow.y = getSectorYCenter(0, this.objectArrow.height - 100);

		var objectArrowText:TextField = new TextField(150, 64, "Level 1", "PNoir", 16, 0x000000);
		objectArrowText.x = getSectorOffset(1, true) + (sWidth - objectArrowText.width);
		objectArrowText.y = getSectorYCenter(0, objectArrowText.height - 100);

		map.addChild(objectArrow);
		map.addChild(objectArrowText);
		map.addChild(door);
		map.addChild(key);

		levelGen = new LevelGen();
		levelGen.generate(Levels.Level0, currentSprite);
		ObjectiveMenuText();
	}

	private function ObjectiveMenuText(){
		var objectiveHeader:TextField = new TextField(200, 100, "Game Objectives:", "PNoir", 30, 0x000000);
		objectiveHeader.x = getSectorXCenter(1, objectiveHeader.width);
		objectiveHeader.y = 10;

		var objectiveOne:TextField = new TextField(400, 100, "- Move with W, A, S, D. Use spacebar to jump!", "PNoir", 20, 0x000000);
		objectiveOne.x = getSectorXCenter(1, objectiveOne.width);
		objectiveOne.y = 110;

		var objectiveTwo:TextField = new TextField(400, 100, "- Collect the keys to open the door and to advance to the next level.", "PNoir", 20, 0x000000);
		objectiveTwo.x = getSectorXCenter(1, objectiveTwo.width);
		objectiveTwo.y =210;
		map.addChild(objectiveHeader);
		map.addChild(objectiveOne);
		map.addChild(objectiveTwo);
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
			return (sectorNum * sWidth);
		}
		return (sectorNum * sHeight);
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
		if(keycode == 32 && !jumpLock){
			jumpLock = true;	
			deltaY = -movementCoefficient * 1.5;
		}
		else if(keycode == 65){
			deltaX = -movementCoefficient;
		}
		else if(keycode == 68){
			deltaX = movementCoefficient;
		}
	}

	private function keyUp(event:KeyboardEvent)
	{
		var keycode = event.keyCode;
		if(keycode == 65 || keycode == 68){
			deltaX = 0;
		}		
	}
	
	
	public function addBaby(xPos: Int, yPos: Int, texture: String) {
		// for adding babies. Need the x and y coordinates and a texture name
		var b = new Baby(xPos, yPos, texture);
		babies.push(b); // add to the baby array
		currentSprite.addChild(b.me);
	}
	
	public function addPlatform(xPos: UInt, yPos: UInt, texture: String) {
		// for adding platforms and other stuff you can't interact with
		var obj = new Image(Root.assets.getTexture(texture));
		obj.x = xPos;
		obj.y = yPos;
		//collisionMap[xPos][yPos] = 1; // add collision detection
		platforms.push(obj);
		addChild(obj);
	}
}
