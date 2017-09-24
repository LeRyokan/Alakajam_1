package utils;
import flixel.input.keyboard.FlxKey;

class Tweaking
{
	// De la forme
	// public static inline var varName 								: varType = varValue;
	
	/////////////////////////////////////////////////////////////////////////////////////////////// Player
	public static inline var playerLife							:Int = 6;
	public static inline var playerMoney						:Int = 100;
	
	/////////////////////////////////////////////////////////////////////////////////////////////// Enemy
	public static inline var life_lvl1							: Int = 10;
	public static inline var life_lvl2							: Int = 30;
	public static inline var life_lvl3							: Int = 45;
	
	
	public static inline var nbWave_lvl1					: Int = 10;
	public static inline var nbWave_lvl2					: Int = 15;
	public static inline var nbWave_lvl3					: Int = 25;
	
	public static inline var tower_radius					: Int = 32;
	/////////////////////////////////////////////////////////////////////////////////////////////// Inputs (ça va bouger de fichier)
	
	// AZERTY
	//public static inline var moveUp										: FlxKey = FlxKey.Z;
	//public static inline var moveLeft									: FlxKey = FlxKey.Q;
	//public static inline var moveDown									: FlxKey = FlxKey.S;
	//public static inline var moveRight									: FlxKey = FlxKey.D;	
	//
	//// QWERTY
	////public static inline var moveUp										: FlxKey = FlxKey.W;
	////public static inline var moveLeft									: FlxKey = FlxKey.A;
	////public static inline var moveDown									: FlxKey = FlxKey.S;
	////public static inline var moveRight									: FlxKey = FlxKey.D;
	//
	//public static inline var shootUp									: FlxKey = FlxKey.UP;
	//public static inline var shootLeft									: FlxKey = FlxKey.LEFT;
	//public static inline var shootDown									: FlxKey = FlxKey.DOWN;
	//public static inline var shootRight									: FlxKey = FlxKey.RIGHT;	
}