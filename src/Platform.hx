import starling.display.Sprite;
import starling.display.Image;
import Math.*;

class Platform extends Sprite
{
	public var texture:Image;
	public var spikesTexture:Image;
	public var hasSpikes:Bool;
	private var platformTextures:Array<String>;
	public function new(x:Int, y:Int, textureIndex:Int, ?spikes:Bool)
	{
		super();
		platformTextures = ["platform1", "platform2", "platform3", "platform4"];

		texture = new Image(Root.assets.getTexture(platformTextures[textureIndex - 1]));
		if (spikes)
		{
			spikesTexture = new Image(Root.assets.getTexture("spikes"));
			spikesTexture.smoothing = "none";
			spikesTexture.x = texture.x;
			spikesTexture.y = texture.y - texture.height*2;
			this.addChild(spikesTexture);
			hasSpikes = true;
		}
		texture.smoothing = "none";
		this.x = x;
		this.y = y;
		this.addChild(texture);
	}	
}