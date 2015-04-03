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
		assets.enqueue("assets/assets.xml", "assets/assets.png");
		assets.enqueue("assets/Stitch.fnt", "assets/PixelNoir.fnt");
    	
		assets.loadQueue(function onProgress(ratio:Float) {
			if (ratio == 1) {
				// fade the loading screen, start game
				Starling.juggler.tween(startup.loadingBitmap, 1.0, {
					transition:Transitions.EASE_OUT, delay:0, alpha: 0, onComplete: function() {
						startup.removeChild(startup.loadingBitmap);
						var game = new Game(rootSprite);
						game.start();
					}

				});
			}
		});
	}
}
