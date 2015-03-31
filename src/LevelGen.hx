import starling.display.Sprite;
import starling.display.Image;

// This class generates the arrangement of platforms based on the level array that's passed in
class LevelGen
{
	public var platforms:List<Platform>;
	private var newPlat:Platform;

	public function new()
	{
		platforms = new List<Platform>();
	}

	public function generate(level:Array<Array<Int>>, currentSprite:Sprite)
	{
		if (!platforms.isEmpty())
		{
			throw "Old level must be destroyed before generating a new one";
			return;
		}
		for (yPlat in 0...10)
		{			
			for (xPlat in 0...10)
			{				
				if (level[yPlat][xPlat] > 0)
				{
					if (level[yPlat][xPlat] > 4)
					{
						newPlat = new Platform(xPlat * 64, (yPlat * 64)+32, level[yPlat][xPlat]-4, true);
					}
					else
					{
						newPlat = new Platform(xPlat * 64, (yPlat * 64)+32, level[yPlat][xPlat]);
					}					
					platforms.add(newPlat);
					currentSprite.addChild(newPlat);					
				}
			}	
		}
	}
	// Destroy removes all platforms and readies the level generator to build a new map
	public function destroy()
	{
		for (platform in platforms)
		{
			platform.removeFromParent();			
		}
		platforms.clear();
	}
}