package entities.enemies;

import enums.Element;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.util.FlxFSM;
import flixel.effects.FlxFlicker;
import flixel.math.FlxPoint;
import flixel.math.FlxVelocity;
import flixel.system.FlxSound;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxPath;
class Enemy extends FlxSprite
 {
	public var _life:Int = 20;
    public var speed:Float = 20;
    public var etype(default, null):Int;
	
	//MULTIPLE ELEMENT
	public var _element:Element;
	public var _elements:Array<Element>;
	
	private var _brain:FSM;
	
	
	private var _idleTmr:Float;
	private var _moveDir:Float;
	public var seesPlayer:Bool = false;
	public var playerPos(default, null):FlxPoint;
	public var _id : Int;
	public var _loot : Int;
	
	public var _path : Array<FlxPoint>;
	
	
	//SOUND
	public var _hitSound:FlxSound;
	public var _dieSound:FlxSound;
	
	
	
	public var deadCount :Int = 0;

     public function new(X:Float = 0, Y:Float = 0, EType:Int, EType2:Int=0, ID:Int, Path:Array<FlxPoint>)
     {
         super(X, Y);
         etype = EType;
		 _loot = etype * 10;
         _id = ID;
		 _elements = new Array<Element>();
		 	
		//SOUND SETUP
		_hitSound = FlxG.sound.load("assets/sounds/Hit_Hurt.wav", 1, false);
		_dieSound = FlxG.sound.load("assets/sounds/Put_Tower.wav", 1, false);
		 
		 switch (EType) 
		 {
			 case 1:
				//_element = Element.fire;
				_elements.push(Element.fire);
			 case 2:
				//_element = Element.water;
				_elements.push(Element.water);
			 case 3:
				//_element = Element.earth;
				_elements.push(Element.earth);
			 default:
				
		 }
		 
		  switch (EType2) 
		 {
			 case 1:
				_elements.push(Element.wind);
			 case 2:
				_elements.push(Element.frost);
			 case 3:
				_elements.push(Element.electricity);
			 default:
				
		 }
		 
		 loadGraphic("assets/images/enemy-" + etype + ".png", true, 16, 16);
        
		 animation.add("hit", [8,0], 30, false, false, false );
		 animation.add("die", [0,2], 30, false, false, false );
         animation.add("idlemove", [0, 1, 2, 3 ,4 ,5 ,6 ,7], 6,true);
        
         drag.x = drag.y = 10;
		 
		 /*A REVOIR VU QU'ON A CHANGER LES SPRITES*/
         width = 8;
         height = 14;
         offset.x = 4;
         offset.y = 2;
		 
		 
		//_brain = new FSM(chase);
		//_idleTmr = 0;
		//playerPos = new FlxPoint(60, 250);
		
		this.path = new FlxPath();
		_path = Path;
		this.path.start(_path,33);
		
		
		animation.play("idlemove", false, false, 0);
     }
	 
	  override public function update(elapsed:Float):Void
	{
		//if (_life <= 0)
		//{
			//this.kill();
			//
		//}
		
		
		//_brain.update();
		super.update(elapsed);
	}

     override public function draw():Void
     {

        super.draw();
		//
		//if (this.path != null && !this.path.finished)
		//{
			//this.drawDebug();
		//}
     }
	 
	 public function getHit(value:Int):Bool
	 {
		var getKill = false;
		if (_life - value > 0)
		{
			animation.play("hit", false, false, 0);
			_hitSound.play(false,0);
			_life -= value;
			FlxFlicker.flicker(this, 1, 0.04, true, true);
			
		}
		else
		{
			animation.play("die", false, false, 0);
			_dieSound.play(false,0);
			this.alive = false;
			this.exists = false;
			getKill = true;
		}
		
		return getKill;
	 }
	
	public function checkResistance(elementHit:Element):Bool
	{
		var canHit:Bool = false;
		for (element in _elements)
		{
			switch (element) 
			{
			case fire:
				if (elementHit == Element.water || elementHit == Element.electricity)
				{
					canHit = true;
				}
			case water:
				if (elementHit == Element.earth || elementHit == Element.wind )
				{
					canHit = true;
				}
			case earth:
				if (elementHit == Element.fire || elementHit == Element.frost)
				{
					canHit = true;
				}
			case wind:
				if (elementHit == Element.electricity)
				{
					canHit = true;
				}
			case electricity:
				if (elementHit == Element.frost)
					{
						canHit = true;
					}
			case frost:
				if (elementHit == Element.wind)
					{
						canHit = true;
					}
			default:
				
			}
		}
		
		
		
		return canHit;
	}
	 
	public function idle():Void
	{
       _brain.activeState = chase;

	}
	
	public function dead():Void
	{
     //  _brain.activeState = chase;
	var r =  FlxG.random.int(0, 10);
		if (deadCount == 0)
		{
			velocity.y -= r;
			deadCount++;
		}
	}

	//public function setPath(path:FlxPath)
	//{
		//_path = path;
	//}
	//
	
	public function chase():Void
	{
		
		//FlxVelocity.moveTowardsPoint(this, playerPos, Std.int(speed));
		//FlxVelocity.moveTowardsPoint(this, new FlxPoint(600,470), Std.int(speed));
		//if(!this.path.active)
		//{
			//this.path.start(_path);
		//}
	}
	
	public function getHitt():Void
	{
		//animation.stop();
		
		_brain.activeState = chase;
		
		
	}
 }