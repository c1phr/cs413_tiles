import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.core.Starling;
import starling.text.*;
import starling.animation.Transitions;

class Root extends Sprite {

	public static var assets:AssetManager;
  	public var rootSprite:Sprite;

	public function new() {
		rootSprite = this;
		super();
	}
	
	public function start(startup:Startup) {
		assets = new AssetManager();
		assets.enqueue("assets/PixelNoir.fnt", "assets/PixelNoir.png");
    	assets.enqueue("assets/lizard.png", "assets/baby1.png");
		assets.enqueue("assets/grass.png");
		assets.enqueue("assets/white-arrow.png");
		assets.enqueue("assets/platform1.png", "assets/platform2.png", "assets/platform3.png", "assets/platform4.png");
		assets.enqueue("assets/spikes.png");
		assets.enqueue("assets/door.png");
		assets.enqueue("assets/key_red.gif");
		assets.enqueue("assets/blanksky.png", "assets/treemiddle.png", "assets/treemiddle2.png", "assets/treemiddle3.png");
		
		assets.loadQueue(function onProgress(ratio:Float) {
			if (ratio == 1) {
				// fade the loading screen, start game
				Starling.juggler.tween(startup.loadingBitmap, 1.0, {
					transition:Transitions.EASE_OUT, delay:0, alpha: 0, onComplete: function() {
						startup.removeChild(startup.loadingBitmap);
						TextField.registerBitmapFont(new BitmapFont(assets.getTexture("PixelNoir.png"),
											assets.getXml("PixelNoir.fnt")),"PNoir");
						var game = new Game(rootSprite);
						game.start();
					}

				});
			}
		});
	}
}
