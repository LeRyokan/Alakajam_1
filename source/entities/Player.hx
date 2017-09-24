package entities;

import entities.towers.Tower;
import enums.Element;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint;
import utils.Tweaking;
/**
 * ...
 * @author ElRyoGrande
 */
class Player extends FlxSprite 
{
	//public static var instance(default, null): Player;
	
	public var _life :Int;
	public var _money :Int;
	public var _equipedTowerType:Element;
	public var _costMap: Map<Element,Int>;
	public var _currentCost : Int;
	public var _level :Int;
	
	public override function new(X:Float, Y:Float,life:Int,money:Int,level:Int) 
	{
		super(X,Y);
		//instance = this;
		_life = life;
		//_life = Tweaking.playerLife;
		_money = money;
		//_money = Tweaking.playerMoney;
		_level = level;
		//_level = 1;
		
		_costMap = new Map<Element,Int>();
		_costMap.set(Element.fire, 15);
		_costMap.set(Element.earth, 20);
		_costMap.set(Element.water, 10);
		
		//Changer
		_equipedTowerType = Element.water;
		_currentCost = _costMap.get(_equipedTowerType);
		
	}
	
	
	private function DeathBall()
	{
		
	}
	
	public function looseLife()
	{
		_life -= 1;
	}
	
	public function getMoney():Int
	{
		return _money;
	}
	
	
	public function spendMoney(value:Int)
	{
		_money -= value;
	}
	
	public function addMoney(value:Int)
	{
		_money += value;
	}
	
	public function swapTowerEquiped(elementType:Element)
	{
		_equipedTowerType = elementType;
		_currentCost = _costMap.get(_equipedTowerType);
		

		
		
	}
	
	
	
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}