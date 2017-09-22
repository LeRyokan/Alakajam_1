package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.math.FlxRect;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
//import flixel.math;

@:bitmap("assets/levels.png") class GfxSource extends BitmapData {}

typedef Cell = {
	var coll		: Bool;
	var blockSight	: Bool;
}

class PlayState extends FlxState
{
	
	public var _player 	: Player;
	public var enemyCount : Int;
	
	private var _map:FlxOgmoLoader;
	//private var _foreground:FlxOgmoLoader;
	private var _mWalls:FlxTilemap;
	private var _mForeground:FlxTilemap;
	
	private var _grpCoins:FlxTypedGroup<Coin>;
	private var _grpEnemies:FlxTypedGroup<Enemy>;
	
	override public function create():Void
	{
		enemyCount = 0;
		
		_map = new FlxOgmoLoader(AssetPaths.Lvl1__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "Background");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);
		
		//ESSAYER DE CHARGER DIFFERENT LAYER AVEC OGMO
		_map = new FlxOgmoLoader(AssetPaths.Lvl1__oel);
		_mForeground = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "Foreground");
		_mForeground.follow();
		_mForeground.setTileProperties(6, FlxObject.ANY);
		_mForeground.setTileProperties(43, FlxObject.ANY);
		_mForeground.setTileProperties(14, FlxObject.ANY);
		_mForeground.setTileProperties(15, FlxObject.ANY);
		_mForeground.setTileProperties(51, FlxObject.ANY);
		_mForeground.setTileProperties(52, FlxObject.ANY);
		add(_mForeground);
		
		
		_grpCoins = new FlxTypedGroup<Coin>();
		add(_grpCoins);
		
		_grpEnemies = new FlxTypedGroup<Enemy>();
		add(_grpEnemies);
		
		_player = new Player();
		_map.loadEntities(placeEntities, "Entities");
		add(_player);

		
		super.create();
		FlxG.camera.follow(_player, TOPDOWN, 1);
		
	}

	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "Player")
		{
			_player.x = x;
			_player.y = y;
		}
		else if (entityName == "Coin")
		{
			//Permet de centrer le sprite sur la case x+4, y+4
			_grpCoins.add(new Coin(x + 4, y + 4));
		}
		else if (entityName == "Enemy")
		{
			_grpEnemies.add(new Enemy(x + 4, y + 4, Std.parseInt(entityData.get("etype")), enemyCount));
			enemyCount++;
		}
	}
	
	private function playerTouchCoin(P:Player, C:Coin):Void
	{	
		if (P.alive && P.exists && C.alive && C.exists)
		{
			C.kill();
		}
	}
	
	private function checkEnemyVision(e:Enemy):Void
	{
		FlxG.watch.addQuick("distance enemy  " +  e._id + ": " , FlxMath.distanceBetween(_player, e));
		
		if (_mWalls.ray(e.getMidpoint(), _player.getMidpoint()) && _mForeground.ray(e.getMidpoint(), _player.getMidpoint()) && FlxMath.distanceBetween(_player,e)< 75)
		{
			e.seesPlayer = true;
			e.playerPos.copyFrom(_player.getMidpoint());
			FlxG.watch.add(e, "seesPlayer");
			
		}
		else
			e.seesPlayer = false;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
		FlxG.collide(_player, _mForeground);
		FlxG.overlap(_player, _grpCoins, playerTouchCoin);
		FlxG.collide(_grpEnemies, _mWalls);
		FlxG.collide(_grpEnemies, _mForeground);
		_grpEnemies.forEachAlive(checkEnemyVision);
	}
}
