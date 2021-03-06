import starling.display.*;
import starling.events.Event;
import starling.text.TextField;
import starling.events.KeyboardEvent;
import starling.events.EnterFrameEvent;
import flash.media.Sound;
import starling.animation.*;
import flash.geom.Rectangle;
import starling.core.Starling;
import haxe.Timer;

typedef CharacterInformation = { lives : Int, time : Int, livesText : TextField, timeText : TextField }

class Game extends Sprite{

  	public var currentSprite:Sprite;

  	public static var jumpSound:Sound;

  	public var map:GameMap;
	public var tiles:Tilemap; 
		
	private var items: List<Item>; // use this for keys?
	private var levelGen:LevelGen;
	
	//Images
  	private var objectArrow:Image;
  	private var ground:Image;
  	private var door:Image;
  	private var key:Image;
  	private var baby:Image;
	
  	//initial variables for character
	public var character:Character;
	// first starting point
	var initX:Float = 30;
	var initY:Float = 540;
	
	var currentLevel: Int;
  	var charXPos:Int = 0;
  	var charYPos:Int = 0;  	
	var deltaX:Float = 0;
  	var deltaY:Float = 0;

  	var title: TextField ;
	private var characterInfo : CharacterInformation;
	private var hasKey:Bool;

	// static inline effectively marks these as "constants"
  	public static inline var gravityCoefficient:Int = 6;
  	public static inline var movementCoefficient:Float = 10;
	
  	var groundBounds:Rectangle;

  	var jumpLock:Bool = false;
  	var thisLevel = 0;
  	var counter = 0;

	var key0X: Float;
	var key0Y: Float;
	var invX: Float;
	var invY: Float;
	
  	var levelTransition:Bool = false;
	var groundFloor:Ground;

	private var count:Int = 0;
	private var times:Int = 0;

	//create timer
	var timer = new haxe.Timer(1000);
	var timestamp: Float;
	
  	//Global variables for height and width
	var sWidth:Int = Starling.current.stage.stageWidth;
	var sHeight:Int = Starling.current.stage.stageHeight;

	public function new(currentSprite:Sprite){
		super();
		this.currentSprite = currentSprite;
		this.items = new List<Item>();		
	}

	public function start() {
		jumpSound = Root.assets.getSound("jump");

		var tiles = new Tilemap(Root.assets, "map1");
		currentSprite.addChild(tiles);
		tiles.y = 32;

		// map2 = same map with hole in the right edge
		// map3 = same map with hole in the left edge

		map = new GameMap();
		map.x = -getSectorOffset(1, true);
		currentSprite.addChild(map);

		initializeChar();

		//spawn the ground and level 0
		createGroundLevels();
		//levelCredits();
		level0();

		// create inventory
		initializeInv();

		//run timer

		Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		currentSprite.addEventListener(EnterFrameEvent.ENTER_FRAME, frameUpdate);
		Starling.current.stage.addEventListener(EnterFrameEvent.ENTER_FRAME, time);
	}

	private function createGroundLevels() {
	    groundFloor = new Ground(getSectorOffset(1, true), Starling.current.stage.stageHeight - 64);
	    map.addChild(groundFloor);
	    groundBounds = groundFloor.getBounds(currentSprite);

	    //scaffold for seven levels.
	    for (x in 2...8) {
	        groundFloor = new Ground(getSectorOffset(x, true), Starling.current.stage.stageHeight - 64);
	        map.addChild(groundFloor);
	    }
	}

	private function frameUpdate(event:EnterFrameEvent) {

	    var sWidth = Starling.current.stage.stageWidth;
	    var sHeight = Starling.current.stage.stageHeight;
	    var characterBounds: Rectangle = character.me.bounds;
	    var platformTopCollision: Bool = false;
	    var platformBottomCollision: Bool = false;


	    // Check for collisions with platforms
	    for (platform in levelGen.platforms) {
	        //Check babybounds to see if player has won
	        var babyBounds: Rectangle = baby.bounds;
	        if (characterBounds.intersects(babyBounds)) {
	            currentSprite.removeChild(baby);
	            timer.stop();
	            winGame();
	        }
	        // Get the platform bounds in the coordinate-space of the currentSprite
	        var platformRect = platform.texture.getBounds(currentSprite);
	        if (characterBounds.intersects(platformRect) && !levelTransition) {
	            if (character.me.y <= platformRect.top) {
	                platformTopCollision = true; // Character collided with the top of a platform
	                if (platform.hasSpikes) {
	                    loseLife(); // character has collided with spikes
	                }
	            }
	            if (character.me.y + character.height >= platformRect.bottom) {
	                platformBottomCollision = true; // Character collided with the bottom of a platform
	            }
	            break; // If we collided with a platform, we don't need to keep looking
	        }
	    }
	    // If the character isn't on the ground, handle other collisions
	    if (!characterBounds.intersects(groundBounds)) {
	        if (deltaY < 0 && !platformBottomCollision) // Jumping up
	        {
	            deltaY += 1;
	        } else if (!platformTopCollision) // Falling down
	        {
	            character.me.y += gravityCoefficient;
	        } else if (platformTopCollision) // We landed on a platform
	        {
	            deltaY = 0;
	            jumpLock = false; // On a platform, unlock jumping
	        }
	        if (platformBottomCollision) // We hit our head on the bottom of a platform
	        {
	            deltaY = 0;
	            character.me.y += gravityCoefficient;
	        }
	    } else if (jumpLock && deltaY == 0) // Fell down and hit the ground, unlock jumping
	    {
	        jumpLock = false;
	    }
	    if (character.me.x >= 0 && character.me.x <= (sWidth - character.width)) {
	        character.me.x += deltaX;
	    } else if (character.me.x <= 0) {
	        character.me.x = 0;
	    }

	    if (character.me.y >= 0) {
	        character.me.y += deltaY;
	    }

	    if (character.me.y >= 635) {
	        character.me.y -= 80;
	    }

	    if (character.me.x >= (sWidth - character.width)) {
	        // can't go right
	        character.me.x = sWidth - character.me.width;
	    }
	    if (character.me.y >= sHeight) {
	        map.y -= sHeight;
	        character.me.y -= sHeight;
	    }

	    if (hasKey == false && characterBounds.intersects(key.getBounds(currentSprite))) {
	        // character picks up key
	        key.removeFromParent();
	        currentSprite.addChild(key);
	        key.x = invX;
	        key.y = invY;
	        hasKey = true;
	    }

	private function levelCredits() {
	    //Generate the objective text
	    var objectiveHeader: TextField = new TextField(200, 100, "Game Objectives:", "PixelNoir", 50, 0x000000);
	    objectiveHeader.x = getSectorXCenter(2, objectiveHeader.width);
	    objectiveHeader.y = 10;

	    var objectiveOne: TextField = new TextField(400, 100, "- Move with W, A, S, D. Use spacebar to jump!", "PixelNoir", 40, 0x000000);
	    objectiveOne.x = getSectorXCenter(2, objectiveOne.width);
	    objectiveOne.y = 90;

	    var objectiveTwo: TextField = new TextField(500, 100, "- Collect the keys to open the door and to advance to the next level.", "PixelNoir", 40, 0x000000);
	    objectiveTwo.x = getSectorXCenter(2, objectiveTwo.width);
	    objectiveTwo.y = 160;
	    var objectiveThree: TextField = new TextField(400, 100, "- Press spacebar on the door in order to open it with the key.", "PixelNoir", 40, 0x000000);
	    objectiveThree.x = getSectorXCenter(2, objectiveThree.width);
	    objectiveThree.y = 250;
	    map.addChild(objectiveHeader);
	    map.addChild(objectiveOne);
	    map.addChild(objectiveTwo);
	    map.addChild(objectiveThree);
	}
	
	private function level0()
	{
		currentLevel = 0;
		//add in the first door/key
		door = new Image(Root.assets.getTexture('door'));
		door.x = getSectorOffset(1, true) + 64;
		door.y = (sWidth - (32*11));

		key = new Image(Root.assets.getTexture('key_red'));
		key0X = getSectorOffset(1, true) + (sWidth - (key.width * 10 ));
		key0Y = (sWidth - (64*3));
		key.x = key0X - 85;
		key.y = key0Y;
		key.scaleX += 1;
		key.scaleY += 1;
		map.addChild(door);
		map.addChild(key);

		//Generate the level 0
		levelGen = new LevelGen();
		levelGen.generate(Levels.Level0, currentSprite);
		
		// title
		title = new TextField(400, 120, "Find Carlos", "Stitch", 120, 0x000000);
		title.x = getSectorXCenter(1, title.width);
		title.y = 50;
		map.addChild(title);

		baby = new Image(Root.assets.getTexture("baby1"));
		currentSprite.addChild(baby);
		baby.x = 11320;
		baby.y = 320;
	}

	private function level1()
	{
		character.me.x = 0;
		door.removeFromParent();	
		title.removeFromParent();
		//add in the door/key
		door = new Image(Root.assets.getTexture('door'));
		door.x = getSectorOffset(1, true) + 64;
		door.y = (sWidth - (32*11));

		key = new Image(Root.assets.getTexture('key_red'));
		key0X = getSectorOffset(1, true) + (sWidth - (key.width * 10 ));
		key0Y = (sWidth - (64*3))- 390;
		key.x = key0X - 25;
		key.y = key0Y ;
		key.scaleX += 1;
		key.scaleY += 1;

		map.addChild(door);
		map.addChild(key);

		levelGen.generate(Levels.Level1, currentSprite);	
	}

	private function level2()
	{
		character.me.x = 0;
		//add in the door/key
		door.removeFromParent();
		door = new Image(Root.assets.getTexture('door'));
		//door.x = getSectorOffset(3, true);
		//door.y = (sWidth - (32*11));
		door.x = 192;
		door.y = 32;
		key = new Image(Root.assets.getTexture('key_red'));
		key0X = getSectorOffset(2, true) + (sWidth - (key.width * 10 ));
		key0Y = (sWidth - (64*3));
		key.x = 545;
		key.y = 190;
		key.scaleX += 1;
		key.scaleY += 1;

		currentSprite.addChild(door);
		currentSprite.addChild(key);
		character.me.removeFromParent();
		currentSprite.addChild(character.me);

		levelGen.generate(Levels.Level2, currentSprite);	
	}

	private function level3()
	{
		character.me.x = 0;
		door.removeFromParent();
		//add in the door/key
		door = new Image(Root.assets.getTexture('door'));
		door.x = getSectorOffset(3, true) + 64 + 128;
		door.y = (sWidth - (32*11)) - 256;

		key = new Image(Root.assets.getTexture('key_red'));
		key0X = getSectorOffset(3, true) + (sWidth - (key.width * 10 ));
		key0Y = (sWidth - (64*3));
		key.x = key0X - 25;
		key.y = key0Y - 255;
		key.scaleX += 1;
		key.scaleY += 1;

		map.addChild(door);
		map.addChild(key);

		baby.x = 275;
		baby.y = 392;

		levelGen.generate(Levels.Level3, currentSprite);	
	}

	private function nextLevel()
	{		
		currentLevel++;
		levelGen.destroy();
		//Set the character forward one level.
		character.me.x = getSectorOffset((currentLevel+1), true);
		character.me.y = initY;
		switch(currentLevel){
			case 1:
				level1();							
			case 2:
				level2();
			case 3: 
				level3();
		}
	}

	private function resetLevel()
	{		
		levelGen.destroy();
		switch(currentLevel){
			case 1:
				level1();							
			case 2:
				level2();
			case 3: 
				level3();
		}
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

	    if (keycode == 32 && !jumpLock) {
	        character.addAnimation("jump");
	        jumpSound.play();
	        if (character.me.bounds.intersects(door.getBounds(currentSprite))) {
	            if (hasKey) {
	                hasKey = false;
	                key.removeFromParent();
	                nextLevel();
	            }
	        } else {
	            jumpLock = true;
	            deltaY = -movementCoefficient * 1.5;
	        }

	    } else if (keycode == 65) {
	        character.addAnimation("left");
	        deltaX = -movementCoefficient;
	    } else if (keycode == 68) {
	        character.addAnimation("right");
	        deltaX = movementCoefficient;
	    }
	}

	private function keyUp(event:KeyboardEvent)
	{
		var keycode = event.keyCode;
		if(keycode == 65 || keycode == 68){
			deltaX = 0;
		}
		if (keycode == 32){
			character.removeAnimation();
		}		
	}
	
	public function loseLife() {
		if (characterInfo.lives > 1) {
			// reset character
			resetGame("death");
		}
		else {
			// game over
			var gameOver = new Image(Root.assets.getTexture("gameover"));
			currentSprite.addChild(gameOver);
			Starling.juggler.tween(gameOver, 1.0, {
					transition:Transitions.EASE_OUT, delay:1, alpha: 0, onComplete: function() {
					resetGame("fail");
					gameOver.removeFromParent();
				}
			});
		}
	}
	
	public function resetGame(reason: String) {
		// pass "fail" for game over, "death" otherwise
		hasKey = false;
		if (reason == "fail") {
			// go back to main screen
			character.me.x = initX;
			character.me.y = initY;
			characterInfo.lives = 3;
			characterInfo.livesText.text = "Lives: " + Std.string(characterInfo.lives);
			characterInfo.timeText.text = "Time: " + 0;
			currentSprite.addChild(baby);
			baby.x = 1320;
			baby.y = 320;
			count = 0;
		}
		else {
			// back to beginning of THIS screen
			key.removeFromParent();
			resetLevel();
			character.me.x = getSectorOffset((currentLevel+2), true);
			character.me.y = initY;
			characterInfo.lives--;
			characterInfo.livesText.text = "Lives: " + Std.string(characterInfo.lives);
		}
		
		
	}
	
	public function initializeChar() {
		// initialize lives
		characterInfo = { lives : 3, time : 0, livesText : new TextField(110, 50, "Lives: " + 3, "PixelNoir", 40), timeText : new TextField(110, 50, "Time: " + 0, "PixelNoir", 40) };
		characterInfo.livesText.x = sWidth - characterInfo.livesText.width;
		characterInfo.timeText.x = sWidth - (characterInfo.timeText.width*2);
		currentSprite.addChild(characterInfo.livesText);
		currentSprite.addChild(characterInfo.timeText);

		// initialize sprite
	    character = new Character(this, initX, initY);
	}
	
	public function initializeInv() {
		var keyBox = new Quad(50, 50, 0xFFFFFF);
		keyBox.x = sWidth - keyBox.width - 5;
		keyBox.y = sHeight - keyBox.height - 5;
		// invY and invX are used to put the key in the inventory.
		invY = keyBox.y + (keyBox.height / 2) - 5;
		invX = keyBox.x + (keyBox.width / 2) - 5;
		currentSprite.addChild(keyBox);
	}

	public function winGame(){
		var win = new Image(Root.assets.getTexture("win"));
		currentSprite.addChild(win);
	}

	public function time(){
		times++;
		if(times == 60){
			count++;
			characterInfo.time = count;
			characterInfo.timeText.text = "Timer: " + Std.string(characterInfo.time);
			times = 0;
		}
	}
}
