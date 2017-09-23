package entities.enemies;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.util.FlxFSM;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;
class FireEnemy extends FlxSprite
 {
	public var _life:Int = 10;
    public var speed:Float = 20;
    public var etype(default, null):Int;
	private var _brain:FSM;
	
	
	private var _idleTmr:Float;
	private var _moveDir:Float;
	public var seesPlayer:Bool = false;
	public var playerPos(default, null):FlxPoint;
	public var _id : Int;

     public function new(X:Float = 0, Y:Float = 0, EType:Int, ID:Int )
     {
         super(X, Y);
         etype = EType;
         _id = ID;
		 loadGraphic("assets/images/enemy-" + etype + ".png", true, 16, 16);
         //setFacingFlip(FlxObject.LEFT, false, false);
         //setFacingFlip(FlxObject.RIGHT, true, false);
         //animation.add("d", [0, 1, 0, 2], 6, false);
         //animation.add("lr", [3, 4, 3, 5], 6, false);
         //animation.add("u", [6, 7, 6, 8], 6, false);
         drag.x = drag.y = 10;
         width = 8;
         height = 14;
         offset.x = 4;
         offset.y = 2;
		 
		 
		_brain = new FSM(chase);
		_idleTmr = 0;
		playerPos = new FlxPoint(60, 150);
		 
     }
	 
	  override public function update(elapsed:Float):Void
	{
		if (_life <= 0)
		{
			this.kill();
		}
		
		
		_brain.update();
		super.update(elapsed);
	}

     override public function draw():Void
     {
         //if ((velocity.x != 0 || velocity.y != 0 ) && touching == FlxObject.NONE)
         //{
             ////if (Math.abs(velocity.x) > Math.abs(velocity.y))
             ////{
                 //if (velocity.x < 0)
                     //facing = FlxObject.LEFT;
                 //else
                     //facing = FlxObject.RIGHT;
             //}
             //else
             //{
                 //if (velocity.y < 0)
                     //facing = FlxObject.UP;
                 //else
                     //facing = FlxObject.DOWN;
             //}

             //switch (facing)
             //{
                 //case FlxObject.LEFT, FlxObject.RIGHT:
                     //animation.play("lr");
//
                 //case FlxObject.UP:
                     //animation.play("u");
//
                 //case FlxObject.DOWN:
                     //animation.play("d");
             //}
         //}
         super.draw();
     }
	 
	 public function getHit(value:Int)
	 {
		_life -= value;
	 }
	 
	 public function idle():Void
	{
       _brain.activeState = chase;

	}

	public function chase():Void
	{
		
		FlxVelocity.moveTowardsPoint(this, playerPos, Std.int(speed));
		//FlxVelocity.moveTowardsPoint(this, new FlxPoint(600,470), Std.int(speed));
		
	}
 }