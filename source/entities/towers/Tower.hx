package entities.towers;

import entities.enemies.Enemy;
import entities.enemies.Enemy;
import enums.Element;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.util.FlxFSM;
import flixel.addons.util.FlxFSM.FlxFSMState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;

/**
 * ...
 * @author ElRyoGrande
 */
class Tower extends FlxSprite 
{
	
	public var _elementType : Element;
	public var _damage		: Int;
	public var _isAttacking : Bool = false;
	public var _attackCooldown : Int;
	public var _brain		: FSM;
	public var _flxBrain	:FlxFSM<FlxSprite>;
	
	private var _lvl		: Int;
	public var _cost		: Int;
	private var _skinName 	: String;
	
	
	private var _radius		: Int;
	public var _isInRange 	:Bool = false;
	public var _target 		:Enemy;
	
	
	
	
	public var enemies :FlxTypedGroup<Enemy>;
	
	
	//SOUND
	public var _putTowerSound:FlxSound;
	
	public function new(?X:Float=0, ?Y:Float=0,elementType:Element) 
	{
		super(X, Y);
		
		//_elementType = ElementType;
		enemies = new FlxTypedGroup<Enemy>();
		_elementType = elementType;
		
		//SOUND SETUP
		_putTowerSound = FlxG.sound.load("assets/sounds/Powerup.wav", 1, false);
		
		switch (elementType) 
		{
			case Element.fire:
				_skinName = "fire";
				_cost = 10;
				_damage = 10;
			case Element.earth:
				_skinName = "earth";
				_cost = 20;
				_damage = 20;
			case Element.water:
				_skinName = "water";
				_cost = 15;
				_damage = 15;
			default:
				
		}
		
		loadGraphic("assets/images/tower_" + _skinName+".png", false, 16, 16);
		width = 48;
		height = 48;
		//offset.set(X - 8, Y - 8);
		offset.x -= 16;
		offset.y -= 16;
		
		_brain = new FSM(idle);
		_flxBrain = new FlxFSM<FlxSprite>(this);
		_putTowerSound.play(false, 0);
		
	}
	
	 override public function update(elapsed:Float):Void
	{
		_flxBrain.update(elapsed);
		_brain.update();
		super.update(elapsed);
		
	}
	
	override public function destroy():Void 
	{
		_flxBrain.destroy();
		_flxBrain = null;
		super.destroy();
	}
	
	
	
	
	override public function draw():Void
    {
	  super.draw();
	}
	
	//public function brainChange(state:String)
	//{
		//if (state == "attack")
		//{
			//_brain.activeState = attack;
		//}
		//else
		//{
			//_brain.activeState = idle;
		//}
		//
	//}
	
	public function idle():Void
	{
		
	}
	
	public function canAttack():Bool
	{
		
		var canAttack:Bool = false;
		if (!_isAttacking)
		{
			var timer:FlxTimer = new FlxTimer();
			_isAttacking = true;
			canAttack = true;
			timer.start(1, onTimer, 1);
		}
		
		return canAttack;
		
		
	}	
	
	private function onTimer(timer:FlxTimer):Void
	{
		_isAttacking = false;
	}
	
}



class Conditions
	{
		//public static function jump(Owner:FlxSprite):Bool
		//{
			//return (FlxG.keys.justPressed.UP && Owner.isTouching(FlxObject.DOWN));
		//}
		//
		//public static function grounded(Owner:FlxSprite):Bool
		//{
			//return Owner.isTouching(FlxObject.DOWN);
		//}
		//
		//public static function groundSlam(Owner:FlxSprite):Bool
		//{
			//return FlxG.keys.justPressed.DOWN && !Owner.isTouching(FlxObject.DOWN);
		//}
		//
		//public static function animationFinished(Owner:FlxSprite):Bool
		//{
			//return Owner.animation.finished;
		//}
	}
	
	
	class Idle extends FlxFSMState<FlxSprite>
	{
		//override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
		//{
			//owner.animation.play("standing");
		//}
		//
		//override public function update(elapsed:Float, owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
		//{
			//owner.acceleration.x = 0;
			//if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT)
			//{
				//owner.facing = FlxG.keys.pressed.LEFT ? FlxObject.LEFT : FlxObject.RIGHT;
				//owner.animation.play("walking");
				//owner.acceleration.x = FlxG.keys.pressed.LEFT ? -300 : 300;
			//}
			//else
			//{
				//owner.animation.play("standing");
				//owner.velocity.x *= 0.9;
			//}
		//}
	}
	
	class Attack extends FlxFSMState<FlxSprite>
	{
		//override public function enter(owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
		//{
			//owner.animation.play("jumping");
			//owner.velocity.y = -200;
		//}
		//
		//override public function update(elapsed:Float, owner:FlxSprite, fsm:FlxFSM<FlxSprite>):Void 
		//{
			//owner.acceleration.x = 0;
			//if (FlxG.keys.pressed.LEFT || FlxG.keys.pressed.RIGHT)
			//{
				//owner.acceleration.x = FlxG.keys.pressed.LEFT ? -300 : 300;
			//}
		//}
	}
