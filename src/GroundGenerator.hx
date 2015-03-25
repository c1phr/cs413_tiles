import starling.display.Sprite;

class GroundGenerator
{
	public var ground:Array<Array<Ground>>;
	public function new(map: Map)
	{
		for (x in 0...2000)
		{
			for (y in 0...2000)
			{
				ground[x][y] = new Ground(x*64, y*64);
			}
		}
	}
}