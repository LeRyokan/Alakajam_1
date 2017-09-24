package states;

import entities.Coin;
import entities.enemies.Enemy;
import entities.Player;
import entities.enemies.Enemy;
import entities.towers.Tower;
import enums.Element;
import flixel.addons.display.shapes.FlxShapeCircle;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.system.FlxSound;
import flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling;
import flixel.util.FlxArrayUtil;
import flixel.util.FlxTimer;
import utils.Tweaking;

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
	
	
	public var _currentLevel:Int;
	
	//TIMER ET SPAWNER ET ENEMY
	public var _spawnTimer:FlxTimer;
	public var _enemyCount:Int = 0;
	public var _enemyMaxCount:Int ;
	public var _enemies:FlxTypedGroup<Enemy>;
	public var enemySpawn:Array<FlxPoint>;
	public var pathPoints:Array<FlxPoint>;
	
	
	public var _exits 	: FlxSprite;
	public var _towers 	: FlxTypedGroup<Tower>;
	
	
	//SETUP PLAYER A L'ARRACHE
	public var playerMoney :Int;
	public var playerLife  :Int;
	
	//UI
	public var info:FlxText;
	public var lifeInfo:FlxText;
	
	public var waterUI :FlxSprite;
	public var fireUI :FlxSprite;
	public var earthUI :FlxSprite;
	
	//HUD
	//DOIT PEUT ETRE DISPARAITRE (ON A DEJA LES INFOS DANS LE PLAYER)
	//public var _playerHud:PlayerHud;
	
	
	//SOUND
	public var _gameMusic:FlxSound;
	public var _alreadyATowerHere : FlxSound;
	
	
	//SYSTEM ATTACK
	public var attacks:FlxTypedGroup<FlxSprite>;
	
	public var focusAttack:Int;
	
	public override function new(level:Int,money:Int,life:Int)
	{
		super();
		_currentLevel = level;
		playerMoney = money;
		trace("LIFE : " + life);
		playerLife = life;
	}
	
	override public function create():Void 
	{
		//FlxG.plugins.add(new FlxMouseEventManager());
		
		
		//SOUND
		_gameMusic = FlxG.sound.load("assets/music/mainMusics.wav", 1, true);
		_alreadyATowerHere = FlxG.sound.load("assets/sounds/nope.wav", 1, false);
		
		//INSTANCIATION
		_enemies = new FlxTypedGroup<Enemy>();
		_towers = new FlxTypedGroup<Tower>();
		
		//DONNES AFFICHAGE BASIC
		FlxG.mouse.visible = true;
		bgColor = 0xffaaaaaa;
		
		//MAP GENERATION
	//	maps = new FlxTilemap();
		//maps = GenerateLevel();
		switch (_currentLevel)
		{
			case 1 :
				maps = GenerateLevel(1);
				_enemyMaxCount = 10;
				
			case 2 :
				maps = GenerateLevel(2);
				_enemyMaxCount = 100;
				
			case 3 :
				maps = GenerateLevel(3);
				_enemyMaxCount = 150;
				
		}		
		
		
		FlxG.worldBounds.width = TILE_WIDTH * maps.widthInTiles;
		FlxG.worldBounds.height = TILE_HEIGHT * maps.heightInTiles;
		
		

	
		_player = new Player(0, 0, playerLife,playerMoney,_currentLevel);
		
	
		add(_player);
		add(maps);

		
		//CAMERA SECTION
		camera.focusOn(new FlxPoint(TILE_WIDTH * maps.widthInTiles/2,  TILE_HEIGHT * maps.heightInTiles/2));
		
	
		
		//HUD
		//WATER SELECTIONNER PAR DEFAUT
		
		waterUI = new FlxSprite(324, 32);
		waterUI.loadGraphic("assets/images/water_ui.png", true, 24, 24, false);
		waterUI.animation.add("notselected",[0],30,true,false,false);
		waterUI.animation.add("selected", [1], 30, true, false, false);
		waterUI.animation.play("selected");
		add(waterUI);
		
		
		fireUI = new FlxSprite(324, 56);
		fireUI.loadGraphic("assets/images/fire_ui.png", true, 24, 24, false);
		fireUI.animation.add("notselected",[0],30,true,false,false);
		fireUI.animation.add("selected",[1],30,true,false,false);
		add(fireUI);
		
		
		
		earthUI = new FlxSprite(324, 80);
		earthUI.loadGraphic("assets/images/earth_ui.png", true, 24, 24, false);
		earthUI.animation.add("notselected",[0],30,true,false,false);
		earthUI.animation.add("selected",[1],30,true,false,false);
		add(earthUI);
		
		
		//TEST UI //FONCTIONNEL A REFORMATER
		info = new FlxText(250,32,0);
		//info.scrollFactor.set(0, 0); 
		info.borderColor = 0xff000000;
		info.borderStyle = SHADOW;
		info.text = "Money : " + _player._money;
		
		lifeInfo = new FlxText(250,48,0);
		//info.scrollFactor.set(0, 0); 
		lifeInfo.borderColor = 0xff000000;
		lifeInfo.borderStyle = SHADOW;
		lifeInfo.text = "Life : " + _player._life;
		
		add(info);
		add(lifeInfo);
		
		//PATHFINDING CREATION
		pathPoints = maps.findPath(FlxPoint.get(enemySpawn[0].x + 8 , enemySpawn[0].y +8 ),	FlxPoint.get(_exits.x +8 , _exits.y + 8 ));
		
		////TIMER
		//_spawnTimer = new FlxTimer();
		//_spawnTimer.start(2,goSpawn,5);	
		WaveSpawn();
		super.create();
	
	//A DECOMMENTER POUR LE RENDU
		_gameMusic.play();
		
	}
	
	
	
	override public function update(elapsed:Float):Void 
	{
		//CONDITION DE VICTOIRE LA PLUS POURRI DU MONDE
		if (_enemyCount == _enemies.countDead() && _enemyCount == _enemyMaxCount)
		{
			//trace("WIN :  " + _enemyCount);
			var timez = new FlxTimer();
			timez.start(3, SwitchState, 1);
			
		}
		
		//VA BOUGER POUR LE RENDU
		//if (FlxG.keys.anyJustPressed([FlxKey.ENTER]))
		//{
			//_spawnTimer.start(2,goSpawn,5);
		//}
		
		
		//COLLISION SECTION
		FlxG.collide(_enemies, maps);
		
		
		for (t in _towers)
		{
			if(FlxG.overlap(t, _enemies,onEnemyOverlapTower))
			{
				t._isInRange = true;
			}
			else
			{
				t._isInRange = false;
			}		
		}
		
		FlxG.overlap(_enemies, _exits, onExit);
		
	
		
		//INPUT SECTION
				
		if (FlxG.keys.anyJustPressed([FlxKey.ONE]))
		{
			_player.swapTowerEquiped(Element.water);
			playerUpdateUI(Element.water);
		}
		
		if (FlxG.keys.anyJustPressed([FlxKey.TWO]))
		{
			_player.swapTowerEquiped(Element.fire);
			playerUpdateUI(Element.fire);
		}
		
		if (FlxG.keys.anyJustPressed([FlxKey.THREE]))
		{
			_player.swapTowerEquiped(Element.earth);
			playerUpdateUI(Element.earth);
		}
		
		//if (FlxG.keys.anyPressed([FlxKey.SHIFT]))
		//{
			//if (FlxG.keys.anyJustPressed([FlxKey.M]))
			//{
				//_player.addMoney(20);
			//}
		//}
		//
		if (FlxG.keys.anyJustPressed([FlxKey.R]))
		{
			FlxG.switchState(new PlayState (1,Tweaking.playerMoney,Tweaking.playerLife));
		}
		
		//MECHANIQUE PRINCIPALE DU JOUEUR
		if (FlxG.mouse.justPressed)
		{
			//trace("CLICK");
			var mousePos = FlxG.mouse.getWorldPosition(camera);
			var tile =  maps.getTileIndexByCoords(mousePos);
			//trace("Mouse world pos : " + mousePos);
			//trace("Tile index : " + tile );
			//trace("Tile info : " + maps.getTileByIndex(tile));
			
			if(maps.getTileByIndex(tile) == 0 || maps.getTileByIndex(tile) == 4 || maps.getTileByIndex(tile) == 5)
			{
				trace("YOU CAN'T BUILD HERE");
			}
			else
			{
				if (_player._money - _player._currentCost >= 0)
				{
					var midPoint = maps.getTileCoordsByIndex(tile, false);
					
					if (towerSpawner(midPoint))
					{
						_player.spendMoney(_player._currentCost);
					}
					
				}
				else
				{
					trace("YOU NEED MONEY");
				}
			}	
		}
		
		//if(
		
		
		//UI UPDATE SECTION
		if (info.text != Std.string(_player._money))
		{
			info.text = "Money :" + _player._money;
		}
		
		if (lifeInfo.text != Std.string(_player._life))
		{
			lifeInfo.text = "Life :" + _player._life;
		}
		
		
		super.update(elapsed);
		
	}
	
	//SPAWNING SECTION
	
	public function WaveSpawn()
	{
		//TIMER
		_spawnTimer = new FlxTimer();
		//var floatEn:Int = _enemyMaxCount % 5;
		trace(_enemyMaxCount / 5);
		_spawnTimer.start(7, onWaveSpawn, Std.int(_enemyMaxCount / 5));		
	}
	
	public function onWaveSpawn(Timer:FlxTimer):Void
	{
		var _tim = new FlxTimer();
		_tim.start(2,goSpawn,5);	
	}
	
	private function goSpawn(Timer:FlxTimer):Void
	{
		//ajouter de la vie en fonction du temps
		spawner();
	}
	
	public function spawner()
	{
		var enemyType = FlxG.random.int(1, 3);
		var Enemy = new Enemy(enemySpawn[0].x, enemySpawn[0].y, enemyType,0, _enemyCount,pathPoints);
		
		
		_enemies.add(Enemy);
		add(_enemies);
		_enemyCount++;
	}
	
	private function SwitchState(Timer:FlxTimer):Void
	{
		//ajouter de la vie en fonction du temps
		FlxG.switchState(new WinState(_currentLevel,_player._money,_player._life));
	}
	
	public function onEnemyOverlapTower(t:Tower, obj2:Enemy)
	{
		//trace("ON A HIT : " + obj2._id);
		
		if (t.canAttack(obj2) && obj2.alive)
				{
					//CHECK RESISTANCE
					if (obj2.checkResistance(t._elementType))
					{
					
						var killed = obj2.getHit(t._damage);
						if (killed)
						{
							//récupérer le prix sur l'enemy
							_player.addMoney(obj2._loot);
							killed = false;
						
						}
					}
				}
		
	
	}
	
	public function onTowerOverlapTower(t:Tower, t:Tower)
	{
		trace("ON A UN POTE");
	}
	
	public function playerUpdateUI(elem:Element)
	{
		switch (elem) 
		{
			case Element.water:
				waterUI.animation.play("selected");
				fireUI.animation.play("notselected");
				earthUI.animation.play("notselected");
			case Element.fire:
				fireUI.animation.play("selected");
				waterUI.animation.play("notselected");
				earthUI.animation.play("notselected");
			case Element.earth:
				earthUI.animation.play("selected");
				fireUI.animation.play("notselected");
				waterUI.animation.play("notselected");
			default:
				
		}
	}
	
	
	//GERE LA SORTIE DES MONSTRE DE L'ECRAN ET LA FIN DE JEU
	public function onExit(obj1:FlxObject, obj2:FlxObject)
	{
		//Un ennemi atteint la sortie -1 vie
		obj1.kill();
		_player.looseLife();
		
		if (_player._life <= 0)
		{
			FlxG.switchState(new LooseState());
		}
	
	}
	
	
	
	
	
	public function towerSpawner(midPoint:FlxPoint):Bool
	{
		//var canPutHere:Bool = false;
		var currentElement:Element = _player._equipedTowerType;
		if (_towers.length > 0)
		{
			for (t in _towers)
			{
				//trace("TOWER : " + t.x + "," + t.y);
				//trace("Distance : " + (t.y - (midPoint.y - 16)));
				if (t.x == midPoint.x-16 && t.y == midPoint.y-16)
				{
					trace("IL Y A DEJA UNE TOUR ICI");
					_alreadyATowerHere.play(false,0);
					return false;
				}
				
				
				if ( (t.y - (midPoint.y - 16) == -16  && t.x == (midPoint.x - 16)) ||
				(t.x - (midPoint.x - 16) == -16  && t.y == (midPoint.y - 16)) )
				{
					//t.color = FlxColor.RED; 
					//trace("TOUR COTE A COTE");
					////CALCUL DU RESULTAT DU MATCH ET TRANSFORMATION
					//trace(t._elementType.getIndex() + _player._equipedTowerType.getIndex());
					
					//A L'ARRACHE
					var t1 = _player._equipedTowerType.getIndex();
					var t2 = t._elementType.getIndex();
					//trace("VALUE : " + v);
					//if(v == 0 2 6)
					if (t1 == 0 && t2 == 1 ||t2 == 0 && t1 == 1)
					{
						
						//var spawn = new Tower(midPoint.x-16, midPoint.y-16,_player._equipedTowerType);
						//var spawn = new Tower(midPoint.x-16, midPoint.y-16,Element.electricity);
						//_towers.add(spawn);
						_player._equipedTowerType = Element.wind;
						
					}
					else if (t1 == 1 && t2 == 2 ||t2 == 1 && t1 == 2)
					{
						_player._equipedTowerType = Element.electricity;
					}
					else if (t1 == 2 && t2 == 0 ||t2 == 0 && t1 == 2)
					{
						_player._equipedTowerType = Element.frost;
					}
					
					
					
				}
				
			
			}
		}
		
		
		var spawn = new Tower(midPoint.x-16, midPoint.y-16,_player._equipedTowerType);
		_towers.add(spawn);
		//add(_towers);
		
		add(spawn._hitSprite);
		add(spawn._radiusGUI);
		add(_towers);
		
		_player._equipedTowerType = currentElement;
		return true;
	}
	//ALGO GENERATION MAP
	
	public function GenerateLevel(level:Int):FlxTilemap
	{
	//	var mapTable = [FlxColor.WHITE, FlxColor.BLACK, FlxColor.BLUE, FlxColor.RED, FlxColor.GREEN];
		var mapTable = [FlxColor.WHITE, FlxColor.BLACK];
		var mps = new FlxTilemap();
		//itemGroup = new FlxTypedGroup<Item>();
	

		//var mapCSV = FlxStringUtil.imageToCSV("assets/data/mapo.png",false,1,mapTable);
		//trace(mps.toString());
		var mapTilePath:String = "assets/data/tileASE.png";
		//mps.loadMapFromCSV(mapCSV, mapTilePath, 16, 16);
		//mps.loadMapFromGraphic("assets/data/level.png", false, 1, [FlxColor.WHITE, FlxColor.BLACK,FlxColor.BLUE, FlxColor.RED,FlxColor.GREEN], mapTilePath, 16, 16, OFF, 0, 1, 1);
		//mps.loadMapFromGraphic("assets/data/level4.png", false, 1, [FlxColor.WHITE, FlxColor.BLACK,FlxColor.RED,FlxColor.GREEN,FlxColor.PINK], mapTilePath, 16, 16, OFF, 0, 1, 1);
		var filename:String = "assets/data/level" + level + ".png";
		mps.loadMapFromGraphic(filename, false, 1, [FlxColor.WHITE, FlxColor.BLACK,FlxColor.RED,FlxColor.GREEN,FlxColor.PINK,FlxColor.MAGENTA], mapTilePath, 16, 16, OFF, 0, 1, 1);
		trace("LVL WIDTH : " + mps.widthInTiles);
		trace("LVL HEIGHT : " + mps.heightInTiles);
		mps.setTileProperties(0, FlxObject.NONE);
		mps.setTileProperties(1, FlxObject.ANY);
		mps.setTileProperties(2, FlxObject.NONE);
		mps.setTileProperties(3, FlxObject.NONE);
		mps.setTileProperties(4, FlxObject.ANY);
		mps.setTileProperties(5, FlxObject.NONE);
		
		enemySpawn = mps.getTileCoords(2, false);
		trace("NOMBRE DE SPAWN : " + enemySpawn.length); 
		//spawner();
		
		var exit = mps.getTileCoords(3, false);
		_exits = new FlxSprite(exit[0].x, exit[0].y);
		_exits.width = 16;
		_exits.height = 16;
		//_exits.allowCollisions = true;
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