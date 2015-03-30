import starling.display.Sprite;
import starling.display.Image;

class LevelGen
{
	public var platforms:List<Platform>;
	public function new(level:Array<Array<Int>>, currentSprite:Sprite)
	{
		platforms = new List<Platform>();
		for (yPlat in 0...10)
		{			
			for (xPlat in 0...10)
			{				
				if (level[yPlat][xPlat] == 1)
				{
					var newPlat = new Platform(xPlat * 64, yPlat * 64);
					platforms.add(newPlat);
					currentSprite.addChild(newPlat);					
				}
			}	
		}
	}
}