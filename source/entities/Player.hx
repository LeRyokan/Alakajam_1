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

	public var _life :Int;
	public var _money :Int = 50;
	public var _equipedTowerType:Element;
	public var _costMap: Map<Element,Int>;
	public var _currentCost : Int;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
		_life = Tweaking.playerLife;
		//_equipedTowerType = "fire";
		//_towerPossibilities = new Array<Tower>();
		//_towerPossibilities = new FlxTypedGroup<Tower>();
		//_towerPossibilities.add(new Tower(0, 0, Element.fire));
		//_towerPossibilities.add(new Tower(0, 0, Element.water));
		//_towerPossibilities.add(new Tower(0, 0, Element.earth));
		//_currentTowerEquiped = new Tower(0, 0, Element.fire);
		//
		
		//_currentTowerEquiped = _towerPossibilities.members[0];
		//trace(_currentTowerEquiped._elementType);
		
		
		_costMap = new Map<Element,Int>();
		_costMap.set(Element.fire, 10);
		_costMap.set(Element.earth, 20);
		_costMap.set(Element.water, 15);
		
		_equipedTowerType = Element.fire;
		_currentCost = _costMap.get(_equipedTowerType);
		
	}
	
	
	private function DeathBall()
	{
		
	}
	
	public function looseLife()
	{
		_life -= 1;
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