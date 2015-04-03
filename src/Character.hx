import starling.display.*;
import starling.events.Event;
import starling.text.TextField;
import starling.events.KeyboardEvent;
import starling.events.EnterFrameEvent;
import starling.animation.*;
import flash.geom.Rectangle;
import starling.core.Starling;
import haxe.Timer;


class Character extends Sprite {
	
	// character animation
	private var animateLeft:MovieClip;
	private var animateRight:MovieClip;
	private var jumpLeft:Image;
	private var jumpRight:Image;
	private var playerLeft: Image;
	private var playerRight: Image;
	private var dead: Image;
	public var me: Image; // 'me' will change between statics
	private var game: Game;
	
	public function new(g: Game, initX:Float, initY:Float){
	    super();
		game = g;
		me = new Image(Root.assets.getTexture('lizardani1'));
		me.smoothing = "none";
	    me.x = initX;
	    me.y = initY;
	    game.currentSprite.addChild(me);
	}
	
	private function removeStatic()
	{
		// for animation
		removeChild(playerLeft);
		removeChild(playerRight);
	}
	
	public function addAnimation(dir: String) {
		var temp;
		if (dir == "jump") {
			temp.x = me.x;
			temp.y = me.y;
			addChild(
			
		}
	}
	
	public function aniInit(){
		// initialize animations
		var frameRate = 4;
		animateLeft = new MovieClip(Root.assets.getTextures("lizardani"), frameRate);
		animateRight = new MovieClip(Root.assets.getTextures("lizard_left_"), frameRate);
		playerRight = new Image(Root.assets.getTexture("lizard"));
		playerLeft = new Image(Root.assets.getTexture("lizard_left_1"));
		jumpRight = new Image(Root.assets.getTexture("lizard_jump_right"));
		jumpLeft = new Image(Root.assets.getTexture("lizard_jump_left"));
		playerLeft.smoothing = "none";
		playerRight.smoothing = "none";
		jumpLeft.smoothing = "none";
		jumpRight.smoothing = "none";
	}
}