import starling.display.Sprite;
import starling.display.Image;

class LevelGen
{
	public var platforms:List<Platform>;
	public function new()
	{
		platforms = new List<Platform>();
	}
	public function generate(level:Array<Array<Int>>, currentSprite:Sprite)
	{
		platforms = new List<Platform>();
		for (yPlat in 0...10)
		{			
			for (xPlat in 0...10)
			{				
				if (level[yPlat][xPlat] > 0)
				{
					var newPlat = new Platform(xPlat * 64, yPlat * 64, level[yPlat][xPlat]);
					platforms.add(newPlat);
					currentSprite.addChild(newPlat);					
				}
			}	
		}
	}

	public function destroy()
	{
		for (platform in platforms)
		{
			platform.removeFromParent();			
		}
		platforms.clear();
	}
}