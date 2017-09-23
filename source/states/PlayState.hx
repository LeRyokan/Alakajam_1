package states;

import entities.Coin;
import entities.enemies.Enemy;
import entities.Player;
import entities.enemies.FireEnemy;
import entities.towers.Tower;
import enums.Element;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.util.FlxArrayUtil;
import flixel.util.FlxTimer;
//import enums.ItemType;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import haxe.macro.Type;
//import hud.PlayerHud;
//import structs.Item;

/**
 * ...
 * @author ElRyoGrande
 */
class PlayState extends FlxState 
{
	//WORLD SETTINGS
	public static var TILE_WIDTH:Int = 16;
	public static var TILE_HEIGHT:Int = 16;
	//public static var LEVEL_WIDTH:Int = 50;
	//public static var LEVEL_HEIGHT:Int = 50;

	public var maps:FlxTilemap;
	public var _player:Player;
	public var enemy:Enemy;
	public var floor:FlxObject;
	
	
	//TIMER ET SPAWNER ET ENEMY
	public var _spawnTimer:FlxTimer;
	public var _enemyCount:Int=0;
	public var _enemies:FlxTypedGroup<FireEnemy>;
	public var  enemySpawn:Array<FlxPoint>;
	
	public var _exits 	: FlxTypedGroup<FlxSprite>;
	public var _towers 	: FlxTypedGroup<Tower>;
	
	public var grip :FlxSprite;
	
	
	//UI
	public var info:FlxText;
	public var lifeInfo:FlxText;
	
	//HUD
	//DOIT PEUT ETRE DISPARAITRE (ON A DEJA LES INFOS DANS LE PLAYER)
	//public var _playerHud:PlayerHud;
	
	
	
	
	
	//SYSTEM ATTACK
	public var attacks:FlxTypedGroup<FlxSprite>;
	
	
	override public function create():Void 
	{
		//TIMER
		_spawnTimer = new FlxTimer();
		_spawnTimer.start(5,goSpawn,10);
		//_spawnTimer.loops = 10;
		
		
		_exits = new FlxTypedGroup<FlxSprite>();
		_enemies = new FlxTypedGroup<FireEnemy>();
		_towers = new FlxTypedGroup<Tower>();
		
		//UTILE POUR LE DEBUG
		FlxG.mouse.visible = true;
		bgColor = 0xffaaaaaa;
		
		//GENERATION
		maps = GenerateLevel();
		
		FlxG.worldBounds.width = TILE_WIDTH * maps.widthInTiles;
		FlxG.worldBounds.height = TILE_HEIGHT * maps.heightInTiles;
		
		
		trace("LOAD");

	
		_player = new Player(0, 0);
		add(_player);
		add(maps);

		
		//CAMERA SECTION
		camera.focusOn(new FlxPoint(TILE_WIDTH * maps.widthInTiles/2,  TILE_HEIGHT * maps.heightInTiles/2));
		
	
		
		//HUD
		//_playerHud = new PlayerHud(player);
		//add(player.playerHud);
		
		
		
		
		//TEST UI //FONCTIONNEL A REFORMATER
		
		info = new FlxText(180,32,0);
		//info.scrollFactor.set(0, 0); 
		info.borderColor = 0xff000000;
		info.borderStyle = SHADOW;
		info.text = "Money :" + _player._money;// Std.string(_player._money);
		
		lifeInfo = new FlxText(180,48,0);
		//info.scrollFactor.set(0, 0); 
		lifeInfo.borderColor = 0xff000000;
		lifeInfo.borderStyle = SHADOW;
		lifeInfo.text = "Life :" + _player._life;// Std.string(_player._money);
		
		
		add(info);
		add(lifeInfo);
		super.create();
	
	}
	
	override public function update(elapsed:Float):Void 
	{
		//SPAWNER CREATION
		
		//spawner();
		
		
		
		//COLLISION SECTION
		//FlxG.collide(_player, maps);
		FlxG.collide(_enemies, maps);
		
		for (t in _towers)
		{
			if(FlxG.overlap(t, _enemies,onOverlaping))
			{
				trace(t._elementType + " VOIS !");
				t.brainChange("attack");
				t._isInRange = true;
				t._target = _enemies.getFirstExisting();
				t._target.getHit(10);
			}
			else
			{
				t.brainChange("idle");
				t._isInRange = false;
			}		
		}
		//FlxG.overlap(
		
		
		if (FlxG.keys.anyJustPressed([FlxKey.ONE]))
		{
			_player.swapTowerEquiped(Element.fire);
		}
		
		if (FlxG.keys.anyJustPressed([FlxKey.TWO]))
		{
			_player.swapTowerEquiped(Element.water);
		}
		
		if (FlxG.keys.anyJustPressed([FlxKey.THREE]))
		{
			_player.swapTowerEquiped(Element.earth);
		}
		
		if (FlxG.keys.anyPressed([FlxKey.SHIFT]))
		{
			if (FlxG.keys.anyJustPressed([FlxKey.M]))
			{
				_player.getMoney(20);
			}
		}
		
		
		
		if (FlxG.mouse.justPressed)
		{
			trace("CLICK");
			var mousePos = FlxG.mouse.getWorldPosition(camera);
			//var mousePos = FlxG.mouse.getPositionInCameraView(camera);
			var tile =  maps.getTileIndexByCoords(mousePos);
			trace("Mouse world pos : " + mousePos);
			trace("Tile index : " + tile );
			trace("Tile info : " + maps.getTileByIndex(tile));
			
			
			
			if(maps.getTileByIndex(tile) == 0)
			{
				trace("YOU CAN'T BUILD HERE");
				
			}
			else
			{
				if (_player._money - _player._currentCost >= 0)
				{
					var midPoint = maps.getTileCoordsByIndex(tile, false);
					_player.spendMoney(_player._currentCost);
					towerSpawner(midPoint);
					
				
				
				}
				else
				{
					trace("YOU NEED MONEY");
				}
				
				
			
			}
		
			
		}
		
		if (FlxG.keys.anyJustPressed([FlxKey.R]))
		{
			FlxG.resetState();
		}
		
		
		if (info.text != Std.string(_player._money))
		{
			info.text = "Money :" + _player._money;
		}
		
		super.update(elapsed);
		
	}
	
	public function onOverlaping(obj1:FlxObject, obj2:FlxObject)
	{
		trace("ON A HIT : " + obj2.ID );
	
	}
	
	private function goSpawn(Timer:FlxTimer):Void
	{
		spawner();
	}
	
	//public function getItem(item:Item, player:Hero):Void
	//{	
		//info.text = "RAMASSER";
		//info.setPosition(item.x, item.y);
		//info.visible = true;
		//
		//if (FlxG.keys.anyJustPressed([FlxKey.G]))
		//{
			//item.kill();
			//player.inventory.addItemToInventory(item);
		//}
	//}
	
	public function spawner()
	{
		var fireEnemy = new FireEnemy(enemySpawn[0].x, enemySpawn[0].y, 1, _enemyCount);
		_enemies.add(fireEnemy);
		add(_enemies);
		_enemyCount++;
	}
	
	
	public function towerSpawner(midPoint:FlxPoint)
	{
		var spawn = new Tower(midPoint.x-16, midPoint.y-16,_player._equipedTowerType);
		_towers.add(spawn);
		add(_towers);
	}
	//ALGO GENERATION MAP
	
	public function GenerateLevel():FlxTilemap
	{
	//	var mapTable = [FlxColor.WHITE, FlxColor.BLACK, FlxColor.BLUE, FlxColor.RED, FlxColor.GREEN];
		var mapTable = [FlxColor.WHITE, FlxColor.BLACK];
		var mps = new FlxTilemap();
		//itemGroup = new FlxTypedGroup<Item>();
	

		//var mapCSV = FlxStringUtil.imageToCSV("assets/data/mapo.png",false,1,mapTable);
		//trace(mps.toString());
		var mapTilePath:String = "assets/data/tileset.png";
		//mps.loadMapFromCSV(mapCSV, mapTilePath, 16, 16);
		//mps.loadMapFromGraphic("assets/data/level.png", false, 1, [FlxColor.WHITE, FlxColor.BLACK,FlxColor.BLUE, FlxColor.RED,FlxColor.GREEN], mapTilePath, 16, 16, OFF, 0, 1, 1);
		mps.loadMapFromGraphic("assets/data/level3.png", false, 1, [FlxColor.WHITE, FlxColor.BLACK,FlxColor.RED,FlxColor.GREEN], mapTilePath, 16, 16, OFF, 0, 1, 1);
		trace("LVL WIDTH : " + mps.widthInTiles);
		trace("LVL HEIGHT : " + mps.heightInTiles);
		mps.setTileProperties(0, FlxObject.NONE);
		mps.setTileProperties(1, FlxObject.ANY);
		
		
		enemySpawn = mps.getTileCoords(2, false);
		trace("NOMBRE DE SPAWN : " + enemySpawn.length); 
		spawner();
		
		//Chargement de la position de départ du joueur
		//var playerPos:Array<FlxPoint> = mps.getTileCoords(2, false);
		//_player = new Player(playerPos[0].x, playerPos[0].y);
		
		
		//Chargement de la position des objets et instanciation des objets
		//var itemPos:Array<FlxPoint> = mps.getTileCoords(3, false);
		//for (i in itemPos)
		//{
			////UNE ERREUR DANS LES ITEMPOS
			//
			//
			//if (i == itemPos[2])
			//{
				//items = new Item(i.x, i.y, ItemType.consumable, "potion");
			//}
			//else
			//{
				//items = new Item(i.x, i.y, ItemType.weapon, "axeC64");
		//
			//}
			//
				//itemGroup.add(items);
			//
		//}
		//add(itemGroup);
		//
		
		
		
		
		
		
		//Remove de la case propre au joueur
		//var playerTiles:Array<Int> = mps.getTileInstances(2);
		//var playerTile:Int = playerTiles[0];
		//mps.setTileByIndex(playerTile, -1, true);
		
		////FAIRE UN FOR QUI DETRUIIIIIT TOUUUUUT
		//var itemTiles:Array<Int> = mps.getTileInstances(3);
		////var itemTile:Int = itemTiles[0];
		////mps.setTileByIndex(itemTile, -1, true);
		//mps.setTileByIndex(itemTiles[0], -1, true);
		//mps.setTileByIndex(itemTiles[1], -1, true);
		//mps.setTileByIndex(itemTiles[2], -1, true);
		
		
		
		//mps.setTileProperties(1, FlxObject.ANY);
		//trace(mps.totalTiles);
		return mps;
	}
	
	
}