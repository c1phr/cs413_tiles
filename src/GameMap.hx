import starling.display.Sprite;

class GameMap extends Sprite{	
	public var groundGen: GroundGenerator;
	public function new(){
		super();

		var groundGen = new GroundGenerator();
		groundGen.generate();
		
		for (x in 0...50)
		{
			for (y in 0...50)
			{	// this would create grass tiles for all the tiles.
				//this.addChild(groundGen.ground[x][y]);
				
			}
		}
	}
}