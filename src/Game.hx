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
  	  	
  	public var map:GameMap;
	
  	public var gravityCoefficient:Int = 10;
	
	private var objects : Array<Image>; // array of in-game objects (ground...)
	private var babies : Array<Baby>; // array of babies	
	private var items: List<Item>;
	
  	public var objectArrow:Image;

  	//Current coords for characters
  	var charX:Float = 10;
  	var charY:Float = 10;

  	//Global variables for height and width
	var sWidth:Int = Starling.current.stage.stageWidth;
	var sHeight:Int = Starling.current.stage.stageHeight;

	public function new(currentSprite:Sprite){
		super();
		this.currentSprite = currentSprite;
		this.items = new List<Item>();
	}

	public function start() {
		var tiles = new Tilemap(Root.assets, "map1");
		currentSprite.addChild(tiles);
		
		map = new GameMap();
		map.x = -getSectorOffset(1, true);
		
		// test
		map.groundGen.collMap[5][5] = 1;
		
		currentSprite.addChild(map);
		
		character = new Image(Root.assets.getTexture('character'));
	    character.x = charX;
	    character.y = charY;
	    currentSprite.addChild(character);
	    
		createMenu();
	    ObjectiveMenuText();	    
	    //this.items.add(new Item(this.currentSprite, "dummy-item", 50, 50));
		
	    Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		currentSprite.addEventListener(EnterFrameEvent.ENTER_FRAME, frameUpdate);
	}

	private function frameUpdate(event:EnterFrameEvent){
		var sWidth = Starling.current.stage.stageWidth;
		var sHeight = Starling.current.stage.stageHeight;
		character.y += gravityCoefficient;
		if(character.x >= sWidth){			
			map.x -= sWidth;
			character.x = 0;
		}
		else if(character.x < 0 ){
			map.x += sWidth;
			character.x += sWidth;
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
		var sWidth:Int = Starling.current.stage.stageWidth;
		var sHeight:Int = Starling.current.stage.stageHeight;
		this.objectArrow = new Image(Root.assets.getTexture('white-arrow'));
		this.objectArrow.x = getSectorOffset(1, true) + (sWidth - this.objectArrow.width);
		this.objectArrow.y = getSectorYCenter(0, this.objectArrow.height);

		var objectArrowText:TextField = new TextField(150, 64, "Objectives", "Arial", 16, 0x000000);
		objectArrowText.x = getSectorOffset(1, true) + (sWidth - objectArrowText.width);
		objectArrowText.y = getSectorYCenter(0, objectArrowText.height);

		map.addChild(objectArrow);
		map.addChild(objectArrowText);
	}

	private function ObjectiveMenuText(){
		var objectiveHeader:TextField = new TextField(200, 100, "Game Objectives:", "Arial", 30, 0x000000);
		objectiveHeader.x = getSectorXCenter(2, objectiveHeader.width);
		objectiveHeader.y = getSectorYCenter(0, objectiveHeader.height * 2);

		var objectiveOne:TextField = new TextField(400, 100, "- Search for the Baby Lizards", "Arial", 20, 0x000000);
		objectiveOne.x = getSectorXCenter(2, objectiveOne.width);
		objectiveOne.y = getSectorYCenter(0, objectiveOne.height);

		var objectiveTwo:TextField = new TextField(400, 100, "- Collect items from each Lizard", "Arial", 20, 0x000000);
		objectiveTwo.x = getSectorXCenter(2, objectiveTwo.width);
		objectiveTwo.y = getSectorYCenter(0, objectiveTwo.height - 100);

		var objectiveThree:TextField = new TextField(400, 100, "- Use the items to solve the mystery (Click item to use it)", "Arial", 20, 0x000000);
		objectiveThree.x = getSectorXCenter(2, objectiveThree.width);
		objectiveThree.y = getSectorYCenter(0, objectiveThree.height - 200);
		map.addChild(objectiveHeader);
		map.addChild(objectiveOne);
		map.addChild(objectiveTwo);
		map.addChild(objectiveThree);
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
	/*
	public function goodSpot(xPos:Float,yPos:Float) : Bool {
		//check if position on grid is okay to move to
		return xPos >= quad.x &&
		yPos >= quad.y &&
		xPos < quad.x + quad.width &&
		yPos < quad.y + quad.height &&
		map[Std.int(xPos/GRID_SIZE)][Std.int(yPos/GRID_SIZE)] == 0;
	} */
	
	public function addObject(xPos: UInt, yPos: UInt, texture: String) {
		// for adding platforms and other stuff you can't interact with
		var obj = new Image(Root.assets.getTexture(texture));
		obj.x = xPos;
		obj.y = yPos;
		map.groundGen.collMap[xPos][yPos] = 1; // add collision detection
		objects.push(obj);
		addChild(obj);
	}
}
