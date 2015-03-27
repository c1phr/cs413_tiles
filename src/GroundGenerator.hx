import starling.display.Sprite;

class GroundGenerator
{
	public var ground:Array<Array<Ground>>;
	public function new()
	{
		
	}

	public function generate()
	{		
		ground = [for(x in 0...200) [for (y in 0...200) new Ground(0,0)]];
		// Generate ground tiles
		for (x in 0...200)
		{
			for (y in 0...200)
			{
				// if uncommented, the whole world will be grass tiles.
				//ground[x][y] = new Ground(x*64, y*64);
			}
		}		
	}
}