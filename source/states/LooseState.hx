package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import states.PlayState;
import ui.HUD;


class LooseState extends FlxState
{
	public var _titleImage : FlxSprite;
	public var _credit : FlxText;
	public var _moreCredit : FlxText;
	public var _startDisplay : FlxText;
	public var _alphaModifier : Float;
	
	public var _looseSound :FlxSound;
	
	override public function create():Void
	{
		//SOUND
		_looseSound = FlxG.sound.load("assets/music/loose3.wav");
		
		bgColor = 0x00000000;
		
		super.create();
		
		_alphaModifier = 0;
		
		//_titleImage = new FlxSprite(0, 0);
		//_titleImage.loadGraphic(AssetPaths.Flixoul__png, false, 64,64);
		//_titleImage.screenCenter();
		//add(_titleImage);
		
		_startDisplay = new FlxText(0, 0, 0, "YOU LOOSE ! :(", 18, true);
		_startDisplay.screenCenter();
		add(_startDisplay);
		
		_credit = new FlxText(0, 0, 0, "Click to return to main menu", 8, true);
		_credit.screenCenter();
		_credit.y += 100;
		add(_credit);
		
		//_moreCredit = new FlxText(0, 0, 0, "Twitter : @LucasTixier", 8, true);
		//_moreCredit.screenCenter();
		//_moreCredit.y = _credit.y + 100;
		//add(_moreCredit);
		_looseSound.play(false, 0);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		//blink();
		
		if (FlxG.mouse.justPressed)
		{
        // The left mouse button has just been pressed
		
			//Lance le jeu
			FlxG.switchState(new MenuState());	
		}
		
		
	}
	//Fonction fait blinker le titre en modifiant son alpha
	public function blink()
	{
		var currentAlpha : Float;
	
		if (_startDisplay.alpha == 1 )
		{
			_alphaModifier = -0.02;
		}
		if (_startDisplay.alpha == 0)
		{
			_alphaModifier = 0.02;
		}
		
		currentAlpha = _startDisplay.alpha;
		_startDisplay.alpha = currentAlpha + _alphaModifier;
	}
}
