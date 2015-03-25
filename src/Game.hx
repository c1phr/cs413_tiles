import starling.display.*;
import starling.display.Image;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.core.Starling;

class Game extends Sprite{

	private var map : Array<Array<UInt>>;
	private var quad : Quad;
	private var objects : Array<Image>; // array of in-game objects (ground...)
	private var babies : Array<Image>; // array of babies
	public inline static var GRID_SIZE = 64; // the size of each square on the grid
	
	
	public function new(){
		super();
		var row: UInt = Starling.current.stage.stageWidth;		
		var col: UInt = Starling.current.stage.stageHeight;
		quad = new Quad(row, col, 0x000000);
		
		addChild(quad);
		
		createGrid(quad);
		createMap();
		
	}
public function createGrid(quad:Quad)
	{
		//grid creation
		trace("start grid creation");
		var h = 0;
		while(h <= quad.height)
		{
			var q = new Quad(quad.width,2.5,0xffff00);
			q.y = h;
			addChild(q);
			h += GRID_SIZE;
		}
		var r = 0;
		while(r <= quad.width)
		{
			var q = new Quad(2.5,quad.height,0xffff00);
			q.x = r;
			addChild(q);
			r += GRID_SIZE;
		}
		trace("end grid creation");
	}

	
	private function createMap() {
		trace("start createmap");
		map = new Array<Array<UInt>>();

		//map to store all objects on overworld
		for(i in 0...Std.int(quad.width/GRID_SIZE))
		{
			map[i] = new Array();
			map[i] = [for(j in 0...Std.int(quad.height/GRID_SIZE)) 0];
		}
	}
	
	public function goodSpot(xPos:Float,yPos:Float) : Bool {
		//check if position on grid is okay to move to
		return xPos >= quad.x &&
		yPos >= quad.y &&
		xPos < quad.x + quad.width &&
		yPos < quad.y + quad.height &&
		map[Std.int(xPos/GRID_SIZE)][Std.int(yPos/GRID_SIZE)] == 0;
	}
	
	public function addObject(xPos: UInt, yPos: UInt, texture: String) {
		// for adding platforms and other stuff you can't interact with
		var obj = new Image(Root.assets.getTexture(texture));
		obj.x = xPos * GRID_SIZE;
		obj.y = yPos * GRID_SIZE;
		map[xPos][yPos] = 1; // add collision detection
		objects.push(obj);
		addChild(obj);
	}
}