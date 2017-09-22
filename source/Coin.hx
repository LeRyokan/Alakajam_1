package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * ...
 * @author ElRyoGrande
 */
class Coin extends FlxSprite 
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.coin__png, false, 8, 8);
	}
	
	override public function kill():Void
	{
		alive = false;
		FlxTween.tween(this, { alpha: 0, y: y - 16 }, .33, { ease: FlxEase.circOut, onComplete: finishKill });
	}

	private function finishKill(_):Void
	{
		exists = false;
	}	
	
}