#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if neko
import neko.vm.Deque;
import neko.vm.Thread;
#elseif cpp
import cpp.vm.Deque;
import cpp.vm.Thread;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	private static var loaded = 0;
	private static var loading = 0;
	private static var workerIncomingQueue = new Deque<Dynamic> ();
	private static var workerResult = new Deque<Dynamic> ();
	private static var workerThread:Thread;
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		
		
		
		
		
		
		
		
		Font.registerFont (__ASSET__assets_fonts_alagard_ttf);
		Font.registerFont (__ASSET__assets_fonts_chrici___ttf);
		Font.registerFont (__ASSET__assets_fonts_enchanted_land_otf);
		Font.registerFont (__ASSET__assets_fonts_frogotype_ttf);
		Font.registerFont (__ASSET__assets_fonts_gothicpixels_ttf);
		Font.registerFont (__ASSET__assets_fonts_pixelig_cursief_ttf);
		Font.registerFont (__ASSET__assets_fonts_vera_ttf);
		Font.registerFont (__ASSET__assets_fonts_verab_ttf);
		Font.registerFont (__ASSET__assets_fonts_verai_ttf);
		Font.registerFont (__ASSET__assets_fonts_veraz_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Font.registerFont (__ASSET__flixel_fonts_nokiafc22_ttf);
		Font.registerFont (__ASSET__flixel_fonts_monsterrat_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tooltip_arrow.png", __ASSET__flixel_flixel_ui_img_tooltip_arrow_png);
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), BitmapData);
			
		} else {
			
			return BitmapData.load (path.get (id));
			
		}
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), ByteArray);
			
		} else {
			
			return ByteArray.readFile (path.get (id));
			
		}
		
	}
	
	
	public override function getFont (id:String):Font {
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return new Font (path.get (id));
			
		}
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, true);
			
		}
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
			
		}
		
	}
	
	
	public override function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		__load (getBitmapData, id, handler);
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		__load (getBytes, id, handler);
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		__load (getFont, id, handler);
		
	}
	
	
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		__load (getMusic, id, handler);
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		__load (getSound, id, handler);
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
	}
	
	
	private static function __doWork ():Void {
		
		while (true) {
			
			var message = workerIncomingQueue.pop (true);
			
			if (message == "WORK") {
				
				var getMethod = workerIncomingQueue.pop (true);
				var id = workerIncomingQueue.pop (true);
				var handler = workerIncomingQueue.pop (true);
				
				var data = getMethod (id);
				workerResult.add ("RESULT");
				workerResult.add (data);
				workerResult.add (handler);
				
			} else if (message == "EXIT") {
				
				break;
				
			}
			
		}
		
	}
	
	
	private inline function __load<T> (getMethod:String->T, id:String, handler:T->Void):Void {
		
		workerIncomingQueue.add ("WORK");
		workerIncomingQueue.add (getMethod);
		workerIncomingQueue.add (id);
		workerIncomingQueue.add (handler);
		
		loading++;
		
	}
	
	
	public static function __poll ():Void {
		
		if (loading > loaded) {
			
			if (workerThread == null) {
				
				workerThread = Thread.create (__doWork);
				
			}
			
			var message = workerResult.pop (false);
			
			while (message == "RESULT") {
				
				loaded++;
				
				var data = workerResult.pop (true);
				var handler = workerResult.pop (true);
				
				if (handler != null) {
					
					handler (data);
					
				}
				
				message = workerResult.pop (false);
				
			}
			
		} else {
			
			if (workerThread != null) {
				
				workerIncomingQueue.add ("EXIT");
				workerThread = null;
				
			}
			
		}
		
	}
	
	
}


#if (windows || mac || linux)


@:sound("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.ogg") @:keep #if display private #end class __ASSET__flixel_sounds_beep_ogg extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.ogg") @:keep #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends flash.media.Sound {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") @:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") @:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") @:keep #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") @:keep #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/box.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_down.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_left.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_right.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_up.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_thin.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_toggle.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/check_box.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/check_mark.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome_flat.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome_inset.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome_light.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/dropdown_mark.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/finger_big.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/finger_small.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/hilight.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/invis.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/minus_mark.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/plus_mark.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/radio.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/radio_dot.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/swatch.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/tab.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/tab_back.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/tooltip_arrow.png") @:keep #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/xml/defaults.xml") @:keep #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends flash.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/xml/default_loading_screen.xml") @:keep #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends flash.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/xml/default_popup.xml") @:keep #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends flash.utils.ByteArray {}



@:keep class __ASSET__assets_fonts_alagard_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/alagard.ttf"; fontName = "Alagard"; }}
@:keep class __ASSET__assets_fonts_chrici___ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/CHRICI__.TTF"; fontName = "Christmas Card  II"; }}
@:keep class __ASSET__assets_fonts_enchanted_land_otf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/Enchanted Land.otf"; fontName = "Enchanted Land"; }}
@:keep class __ASSET__assets_fonts_frogotype_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/Frogotype.ttf"; fontName = "Frogotype Regular"; }}
@:keep class __ASSET__assets_fonts_gothicpixels_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/GothicPixels.ttf"; fontName = "GothicPixels"; }}
@:keep class __ASSET__assets_fonts_pixelig_cursief_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/Pixelig Cursief.ttf"; fontName = "Pixelig Cursief Regular"; }}
@:keep class __ASSET__assets_fonts_vera_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/vera.ttf"; fontName = "Bitstream Vera Sans"; }}
@:keep class __ASSET__assets_fonts_verab_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/verab.ttf"; fontName = "Bitstream Vera Sans Bold"; }}
@:keep class __ASSET__assets_fonts_verai_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/verai.ttf"; fontName = "Bitstream Vera Sans Oblique"; }}
@:keep class __ASSET__assets_fonts_veraz_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/veraz.ttf"; fontName = "Bitstream Vera Sans Bold Oblique"; }}


#else


class __ASSET__assets_fonts_alagard_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/alagard.ttf"; fontName = "Alagard";  }}
class __ASSET__assets_fonts_chrici___ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/CHRICI__.TTF"; fontName = "Christmas Card  II";  }}
class __ASSET__assets_fonts_enchanted_land_otf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/Enchanted Land.otf"; fontName = "Enchanted Land";  }}
class __ASSET__assets_fonts_frogotype_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/Frogotype.ttf"; fontName = "Frogotype Regular";  }}
class __ASSET__assets_fonts_gothicpixels_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/GothicPixels.ttf"; fontName = "GothicPixels";  }}
class __ASSET__assets_fonts_pixelig_cursief_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/Pixelig Cursief.ttf"; fontName = "Pixelig Cursief Regular";  }}
class __ASSET__assets_fonts_vera_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/vera.ttf"; fontName = "Bitstream Vera Sans";  }}
class __ASSET__assets_fonts_verab_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/verab.ttf"; fontName = "Bitstream Vera Sans Bold";  }}
class __ASSET__assets_fonts_verai_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/verai.ttf"; fontName = "Bitstream Vera Sans Oblique";  }}
class __ASSET__assets_fonts_veraz_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "assets/fonts/veraz.ttf"; fontName = "Bitstream Vera Sans Bold Oblique";  }}
class __ASSET__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "flixel/fonts/nokiafc22.ttf"; fontName = "Nokia Cellphone FC Small";  }}
class __ASSET__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "flixel/fonts/monsterrat.ttf"; fontName = "Monsterrat";  }}


#end


#else


package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_alagard_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_chrici___ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_enchanted_land_otf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_frogotype_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_gothicpixels_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_pixelig_cursief_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_vera_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_verab_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_verai_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_veraz_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/data/level1.png", "assets/data/level1.png");
		type.set ("assets/data/level1.png", AssetType.IMAGE);
		path.set ("assets/data/level2.png", "assets/data/level2.png");
		type.set ("assets/data/level2.png", AssetType.IMAGE);
		path.set ("assets/data/level3.png", "assets/data/level3.png");
		type.set ("assets/data/level3.png", AssetType.IMAGE);
		path.set ("assets/data/level4.png", "assets/data/level4.png");
		type.set ("assets/data/level4.png", AssetType.IMAGE);
		path.set ("assets/data/tileASE.ase", "assets/data/tileASE.ase");
		type.set ("assets/data/tileASE.ase", AssetType.BINARY);
		path.set ("assets/data/tileASE.png", "assets/data/tileASE.png");
		type.set ("assets/data/tileASE.png", AssetType.IMAGE);
		path.set ("assets/fonts/alagard.ttf", "assets/fonts/alagard.ttf");
		type.set ("assets/fonts/alagard.ttf", AssetType.FONT);
		path.set ("assets/fonts/CHRICI__.TTF", "assets/fonts/CHRICI__.TTF");
		type.set ("assets/fonts/CHRICI__.TTF", AssetType.FONT);
		path.set ("assets/fonts/Enchanted Land.otf", "assets/fonts/Enchanted Land.otf");
		type.set ("assets/fonts/Enchanted Land.otf", AssetType.FONT);
		path.set ("assets/fonts/Frogotype.ttf", "assets/fonts/Frogotype.ttf");
		type.set ("assets/fonts/Frogotype.ttf", AssetType.FONT);
		path.set ("assets/fonts/GothicPixels.ttf", "assets/fonts/GothicPixels.ttf");
		type.set ("assets/fonts/GothicPixels.ttf", AssetType.FONT);
		path.set ("assets/fonts/Pixelig Cursief.ttf", "assets/fonts/Pixelig Cursief.ttf");
		type.set ("assets/fonts/Pixelig Cursief.ttf", AssetType.FONT);
		path.set ("assets/fonts/vera.ttf", "assets/fonts/vera.ttf");
		type.set ("assets/fonts/vera.ttf", AssetType.FONT);
		path.set ("assets/fonts/verab.ttf", "assets/fonts/verab.ttf");
		type.set ("assets/fonts/verab.ttf", AssetType.FONT);
		path.set ("assets/fonts/verai.ttf", "assets/fonts/verai.ttf");
		type.set ("assets/fonts/verai.ttf", AssetType.FONT);
		path.set ("assets/fonts/veraz.ttf", "assets/fonts/veraz.ttf");
		type.set ("assets/fonts/veraz.ttf", AssetType.FONT);
		path.set ("assets/gfx/other/icon_party.png", "assets/gfx/other/icon_party.png");
		type.set ("assets/gfx/other/icon_party.png", AssetType.IMAGE);
		path.set ("assets/gfx/other/portrait_mane.png", "assets/gfx/other/portrait_mane.png");
		type.set ("assets/gfx/other/portrait_mane.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/blue.png", "assets/gfx/ui/buttons/blue.png");
		type.set ("assets/gfx/ui/buttons/blue.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/blue_back.png", "assets/gfx/ui/buttons/blue_back.png");
		type.set ("assets/gfx/ui/buttons/blue_back.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/blue_back_over.png", "assets/gfx/ui/buttons/blue_back_over.png");
		type.set ("assets/gfx/ui/buttons/blue_back_over.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/blue_over.png", "assets/gfx/ui/buttons/blue_over.png");
		type.set ("assets/gfx/ui/buttons/blue_over.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_blue.png", "assets/gfx/ui/buttons/button_blue.png");
		type.set ("assets/gfx/ui/buttons/button_blue.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_blue_scale_0.png", "assets/gfx/ui/buttons/button_blue_scale_0.png");
		type.set ("assets/gfx/ui/buttons/button_blue_scale_0.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_blue_scale_1.png", "assets/gfx/ui/buttons/button_blue_scale_1.png");
		type.set ("assets/gfx/ui/buttons/button_blue_scale_1.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_blue_scale_2.png", "assets/gfx/ui/buttons/button_blue_scale_2.png");
		type.set ("assets/gfx/ui/buttons/button_blue_scale_2.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_blue_scale_all.png", "assets/gfx/ui/buttons/button_blue_scale_all.png");
		type.set ("assets/gfx/ui/buttons/button_blue_scale_all.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_blue_scale_all2.png", "assets/gfx/ui/buttons/button_blue_scale_all2.png");
		type.set ("assets/gfx/ui/buttons/button_blue_scale_all2.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_blue_toggle.png", "assets/gfx/ui/buttons/button_blue_toggle.png");
		type.set ("assets/gfx/ui/buttons/button_blue_toggle.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_confirmation_black.png", "assets/gfx/ui/buttons/button_confirmation_black.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_black.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_confirmation_over.png", "assets/gfx/ui/buttons/button_confirmation_over.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_over.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_confirmation_red_over.png", "assets/gfx/ui/buttons/button_confirmation_red_over.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_red_over.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_confirmation_red_up.png", "assets/gfx/ui/buttons/button_confirmation_red_up.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_red_up.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_confirmation_up.png", "assets/gfx/ui/buttons/button_confirmation_up.png");
		type.set ("assets/gfx/ui/buttons/button_confirmation_up.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_gold.png", "assets/gfx/ui/buttons/button_gold.png");
		type.set ("assets/gfx/ui/buttons/button_gold.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_gold_up.png", "assets/gfx/ui/buttons/button_gold_up.png");
		type.set ("assets/gfx/ui/buttons/button_gold_up.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_grey.png", "assets/gfx/ui/buttons/button_grey.png");
		type.set ("assets/gfx/ui/buttons/button_grey.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/button_red.png", "assets/gfx/ui/buttons/button_red.png");
		type.set ("assets/gfx/ui/buttons/button_red.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/gold.png", "assets/gfx/ui/buttons/gold.png");
		type.set ("assets/gfx/ui/buttons/gold.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/gold_over.png", "assets/gfx/ui/buttons/gold_over.png");
		type.set ("assets/gfx/ui/buttons/gold_over.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/grey.png", "assets/gfx/ui/buttons/grey.png");
		type.set ("assets/gfx/ui/buttons/grey.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/grey_over.png", "assets/gfx/ui/buttons/grey_over.png");
		type.set ("assets/gfx/ui/buttons/grey_over.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/master_button_blue.png", "assets/gfx/ui/buttons/master_button_blue.png");
		type.set ("assets/gfx/ui/buttons/master_button_blue.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/red.png", "assets/gfx/ui/buttons/red.png");
		type.set ("assets/gfx/ui/buttons/red.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/red_over.png", "assets/gfx/ui/buttons/red_over.png");
		type.set ("assets/gfx/ui/buttons/red_over.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/tab_grey.png", "assets/gfx/ui/buttons/tab_grey.png");
		type.set ("assets/gfx/ui/buttons/tab_grey.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/tab_grey_back.png", "assets/gfx/ui/buttons/tab_grey_back.png");
		type.set ("assets/gfx/ui/buttons/tab_grey_back.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/tab_grey_back_over.png", "assets/gfx/ui/buttons/tab_grey_back_over.png");
		type.set ("assets/gfx/ui/buttons/tab_grey_back_over.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/buttons/tab_grey_over.png", "assets/gfx/ui/buttons/tab_grey_over.png");
		type.set ("assets/gfx/ui/buttons/tab_grey_over.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/chrome/dark_grey.png", "assets/gfx/ui/chrome/dark_grey.png");
		type.set ("assets/gfx/ui/chrome/dark_grey.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/chrome/dark_grey_flat_top.png", "assets/gfx/ui/chrome/dark_grey_flat_top.png");
		type.set ("assets/gfx/ui/chrome/dark_grey_flat_top.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/chrome/dark_grey_inset.png", "assets/gfx/ui/chrome/dark_grey_inset.png");
		type.set ("assets/gfx/ui/chrome/dark_grey_inset.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/chrome/dark_grey_texture.png", "assets/gfx/ui/chrome/dark_grey_texture.png");
		type.set ("assets/gfx/ui/chrome/dark_grey_texture.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/misc/check_big.png", "assets/gfx/ui/misc/check_big.png");
		type.set ("assets/gfx/ui/misc/check_big.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/misc/check_box_big.png", "assets/gfx/ui/misc/check_box_big.png");
		type.set ("assets/gfx/ui/misc/check_box_big.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/misc/check_box_small.png", "assets/gfx/ui/misc/check_box_small.png");
		type.set ("assets/gfx/ui/misc/check_box_small.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/misc/check_small.png", "assets/gfx/ui/misc/check_small.png");
		type.set ("assets/gfx/ui/misc/check_small.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/misc/flag_blank.png", "assets/gfx/ui/misc/flag_blank.png");
		type.set ("assets/gfx/ui/misc/flag_blank.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/misc/health_bar.png", "assets/gfx/ui/misc/health_bar.png");
		type.set ("assets/gfx/ui/misc/health_bar.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/misc/mana_bar.png", "assets/gfx/ui/misc/mana_bar.png");
		type.set ("assets/gfx/ui/misc/mana_bar.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/misc/radio.png", "assets/gfx/ui/misc/radio.png");
		type.set ("assets/gfx/ui/misc/radio.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/misc/radio_dot.png", "assets/gfx/ui/misc/radio_dot.png");
		type.set ("assets/gfx/ui/misc/radio_dot.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/saveslot.png", "assets/gfx/ui/saveslot.png");
		type.set ("assets/gfx/ui/saveslot.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/saveslot_shadow.png", "assets/gfx/ui/saveslot_shadow.png");
		type.set ("assets/gfx/ui/saveslot_shadow.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/save_menu_overlay.png", "assets/gfx/ui/save_menu_overlay.png");
		type.set ("assets/gfx/ui/save_menu_overlay.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/title_back.png", "assets/gfx/ui/title_back.png");
		type.set ("assets/gfx/ui/title_back.png", AssetType.IMAGE);
		path.set ("assets/gfx/ui/title_back2.png", "assets/gfx/ui/title_back2.png");
		type.set ("assets/gfx/ui/title_back2.png", AssetType.IMAGE);
		path.set ("assets/images/ASE/DeathBall.ase", "assets/images/ASE/DeathBall.ase");
		type.set ("assets/images/ASE/DeathBall.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/earth_enemy.ase", "assets/images/ASE/earth_enemy.ase");
		type.set ("assets/images/ASE/earth_enemy.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/Elements.ase", "assets/images/ASE/Elements.ase");
		type.set ("assets/images/ASE/Elements.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/enemy-Sheet.ase", "assets/images/ASE/enemy-Sheet.ase");
		type.set ("assets/images/ASE/enemy-Sheet.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/enemy.ase", "assets/images/ASE/enemy.ase");
		type.set ("assets/images/ASE/enemy.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/HIT.ase", "assets/images/ASE/HIT.ase");
		type.set ("assets/images/ASE/HIT.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/SIXNITY.ase", "assets/images/ASE/SIXNITY.ase");
		type.set ("assets/images/ASE/SIXNITY.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/TitleScreen.ase", "assets/images/ASE/TitleScreen.ase");
		type.set ("assets/images/ASE/TitleScreen.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/Tower.ase", "assets/images/ASE/Tower.ase");
		type.set ("assets/images/ASE/Tower.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/tower_earth.ase", "assets/images/ASE/tower_earth.ase");
		type.set ("assets/images/ASE/tower_earth.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/tower_earth.png", "assets/images/ASE/tower_earth.png");
		type.set ("assets/images/ASE/tower_earth.png", AssetType.IMAGE);
		path.set ("assets/images/ASE/tower_electricity.ase", "assets/images/ASE/tower_electricity.ase");
		type.set ("assets/images/ASE/tower_electricity.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/tower_frost.ase", "assets/images/ASE/tower_frost.ase");
		type.set ("assets/images/ASE/tower_frost.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/tower_water.ase", "assets/images/ASE/tower_water.ase");
		type.set ("assets/images/ASE/tower_water.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/tower_water.png", "assets/images/ASE/tower_water.png");
		type.set ("assets/images/ASE/tower_water.png", AssetType.IMAGE);
		path.set ("assets/images/ASE/tower_wind.ase", "assets/images/ASE/tower_wind.ase");
		type.set ("assets/images/ASE/tower_wind.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/Trinity.ase", "assets/images/ASE/Trinity.ase");
		type.set ("assets/images/ASE/Trinity.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/TrinityElements.ase", "assets/images/ASE/TrinityElements.ase");
		type.set ("assets/images/ASE/TrinityElements.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/UI.ase", "assets/images/ASE/UI.ase");
		type.set ("assets/images/ASE/UI.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/water_enemy.ase", "assets/images/ASE/water_enemy.ase");
		type.set ("assets/images/ASE/water_enemy.ase", AssetType.BINARY);
		path.set ("assets/images/ASE/Zombie.ase", "assets/images/ASE/Zombie.ase");
		type.set ("assets/images/ASE/Zombie.ase", AssetType.BINARY);
		path.set ("assets/images/bullet.png", "assets/images/bullet.png");
		type.set ("assets/images/bullet.png", AssetType.IMAGE);
		path.set ("assets/images/earth_ui.png", "assets/images/earth_ui.png");
		type.set ("assets/images/earth_ui.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-1.png", "assets/images/enemy-1.png");
		type.set ("assets/images/enemy-1.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-2.png", "assets/images/enemy-2.png");
		type.set ("assets/images/enemy-2.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-3.png", "assets/images/enemy-3.png");
		type.set ("assets/images/enemy-3.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-7.png", "assets/images/enemy-7.png");
		type.set ("assets/images/enemy-7.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-8.png", "assets/images/enemy-8.png");
		type.set ("assets/images/enemy-8.png", AssetType.IMAGE);
		path.set ("assets/images/enemy-9.png", "assets/images/enemy-9.png");
		type.set ("assets/images/enemy-9.png", AssetType.IMAGE);
		path.set ("assets/images/fire_ui.png", "assets/images/fire_ui.png");
		type.set ("assets/images/fire_ui.png", AssetType.IMAGE);
		path.set ("assets/images/Flixoul.png", "assets/images/Flixoul.png");
		type.set ("assets/images/Flixoul.png", AssetType.IMAGE);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/map.png", "assets/images/map.png");
		type.set ("assets/images/map.png", AssetType.IMAGE);
		path.set ("assets/images/SIXNITY.png", "assets/images/SIXNITY.png");
		type.set ("assets/images/SIXNITY.png", AssetType.IMAGE);
		path.set ("assets/images/tiles1.png", "assets/images/tiles1.png");
		type.set ("assets/images/tiles1.png", AssetType.IMAGE);
		path.set ("assets/images/TitleScreen.png", "assets/images/TitleScreen.png");
		type.set ("assets/images/TitleScreen.png", AssetType.IMAGE);
		path.set ("assets/images/tizles.png", "assets/images/tizles.png");
		type.set ("assets/images/tizles.png", AssetType.IMAGE);
		path.set ("assets/images/tower.png", "assets/images/tower.png");
		type.set ("assets/images/tower.png", AssetType.IMAGE);
		path.set ("assets/images/tower_earth.png", "assets/images/tower_earth.png");
		type.set ("assets/images/tower_earth.png", AssetType.IMAGE);
		path.set ("assets/images/tower_electricity.png", "assets/images/tower_electricity.png");
		type.set ("assets/images/tower_electricity.png", AssetType.IMAGE);
		path.set ("assets/images/tower_fire.png", "assets/images/tower_fire.png");
		type.set ("assets/images/tower_fire.png", AssetType.IMAGE);
		path.set ("assets/images/tower_frost.png", "assets/images/tower_frost.png");
		type.set ("assets/images/tower_frost.png", AssetType.IMAGE);
		path.set ("assets/images/tower_water.png", "assets/images/tower_water.png");
		type.set ("assets/images/tower_water.png", AssetType.IMAGE);
		path.set ("assets/images/tower_wind.png", "assets/images/tower_wind.png");
		type.set ("assets/images/tower_wind.png", AssetType.IMAGE);
		path.set ("assets/images/Trinity.png", "assets/images/Trinity.png");
		type.set ("assets/images/Trinity.png", AssetType.IMAGE);
		path.set ("assets/images/water_ui.png", "assets/images/water_ui.png");
		type.set ("assets/images/water_ui.png", AssetType.IMAGE);
		path.set ("assets/locales/en-US/fontss.xml", "assets/locales/en-US/fontss.xml");
		type.set ("assets/locales/en-US/fontss.xml", AssetType.TEXT);
		path.set ("assets/locales/en-US/uius.csv", "assets/locales/en-US/uius.csv");
		type.set ("assets/locales/en-US/uius.csv", AssetType.TEXT);
		path.set ("assets/locales/index.xml", "assets/locales/index.xml");
		type.set ("assets/locales/index.xml", AssetType.TEXT);
		path.set ("assets/locales/nb-NO/fonts.xml", "assets/locales/nb-NO/fonts.xml");
		type.set ("assets/locales/nb-NO/fonts.xml", AssetType.TEXT);
		path.set ("assets/locales/nb-NO/ui.csv", "assets/locales/nb-NO/ui.csv");
		type.set ("assets/locales/nb-NO/ui.csv", AssetType.TEXT);
		path.set ("assets/locales/_flags/cs-CZ.png", "assets/locales/_flags/cs-CZ.png");
		type.set ("assets/locales/_flags/cs-CZ.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/de-DE.png", "assets/locales/_flags/de-DE.png");
		type.set ("assets/locales/_flags/de-DE.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/en-CA.png", "assets/locales/_flags/en-CA.png");
		type.set ("assets/locales/_flags/en-CA.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/en-GB.png", "assets/locales/_flags/en-GB.png");
		type.set ("assets/locales/_flags/en-GB.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/en-US.png", "assets/locales/_flags/en-US.png");
		type.set ("assets/locales/_flags/en-US.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/es-ES.png", "assets/locales/_flags/es-ES.png");
		type.set ("assets/locales/_flags/es-ES.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/fr-FR.png", "assets/locales/_flags/fr-FR.png");
		type.set ("assets/locales/_flags/fr-FR.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/it-IT.png", "assets/locales/_flags/it-IT.png");
		type.set ("assets/locales/_flags/it-IT.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/ja-JP.png", "assets/locales/_flags/ja-JP.png");
		type.set ("assets/locales/_flags/ja-JP.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/ko-KR.png", "assets/locales/_flags/ko-KR.png");
		type.set ("assets/locales/_flags/ko-KR.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/nb-NO.png", "assets/locales/_flags/nb-NO.png");
		type.set ("assets/locales/_flags/nb-NO.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/pl-PL.png", "assets/locales/_flags/pl-PL.png");
		type.set ("assets/locales/_flags/pl-PL.png", AssetType.IMAGE);
		path.set ("assets/locales/_flags/yo-DA.png", "assets/locales/_flags/yo-DA.png");
		type.set ("assets/locales/_flags/yo-DA.png", AssetType.IMAGE);
		path.set ("assets/music/end.ceol", "assets/music/end.ceol");
		type.set ("assets/music/end.ceol", AssetType.TEXT);
		path.set ("assets/music/loose.ceol", "assets/music/loose.ceol");
		type.set ("assets/music/loose.ceol", AssetType.TEXT);
		path.set ("assets/music/loose3.ceol", "assets/music/loose3.ceol");
		type.set ("assets/music/loose3.ceol", AssetType.TEXT);
		path.set ("assets/music/loose3.wav", "assets/music/loose3.wav");
		type.set ("assets/music/loose3.wav", AssetType.SOUND);
		path.set ("assets/music/mainMusic.ceol", "assets/music/mainMusic.ceol");
		type.set ("assets/music/mainMusic.ceol", AssetType.TEXT);
		path.set ("assets/music/mainMusic.wav", "assets/music/mainMusic.wav");
		type.set ("assets/music/mainMusic.wav", AssetType.SOUND);
		path.set ("assets/music/mainMusics.wav", "assets/music/mainMusics.wav");
		type.set ("assets/music/mainMusics.wav", AssetType.SOUND);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/music/track.ceol", "assets/music/track.ceol");
		type.set ("assets/music/track.ceol", AssetType.TEXT);
		path.set ("assets/music/tracki.wav", "assets/music/tracki.wav");
		type.set ("assets/music/tracki.wav", AssetType.SOUND);
		path.set ("assets/music/win.ceol", "assets/music/win.ceol");
		type.set ("assets/music/win.ceol", AssetType.TEXT);
		path.set ("assets/music/win.wav", "assets/music/win.wav");
		type.set ("assets/music/win.wav", AssetType.SOUND);
		path.set ("assets/sounds/Disparition.bfxrsound", "assets/sounds/Disparition.bfxrsound");
		type.set ("assets/sounds/Disparition.bfxrsound", AssetType.TEXT);
		path.set ("assets/sounds/Disparition.wav", "assets/sounds/Disparition.wav");
		type.set ("assets/sounds/Disparition.wav", AssetType.SOUND);
		path.set ("assets/sounds/Hit_Hurt.bfxrsound", "assets/sounds/Hit_Hurt.bfxrsound");
		type.set ("assets/sounds/Hit_Hurt.bfxrsound", AssetType.TEXT);
		path.set ("assets/sounds/Hit_Hurt.wav", "assets/sounds/Hit_Hurt.wav");
		type.set ("assets/sounds/Hit_Hurt.wav", AssetType.SOUND);
		path.set ("assets/sounds/loose2.ceol", "assets/sounds/loose2.ceol");
		type.set ("assets/sounds/loose2.ceol", AssetType.TEXT);
		path.set ("assets/sounds/nope.wav", "assets/sounds/nope.wav");
		type.set ("assets/sounds/nope.wav", AssetType.SOUND);
		path.set ("assets/sounds/Powerup.bfxrsound", "assets/sounds/Powerup.bfxrsound");
		type.set ("assets/sounds/Powerup.bfxrsound", AssetType.TEXT);
		path.set ("assets/sounds/Powerup.wav", "assets/sounds/Powerup.wav");
		type.set ("assets/sounds/Powerup.wav", AssetType.SOUND);
		path.set ("assets/sounds/Put_Tower.bfxrsound", "assets/sounds/Put_Tower.bfxrsound");
		type.set ("assets/sounds/Put_Tower.bfxrsound", AssetType.TEXT);
		path.set ("assets/sounds/Put_Tower.wav", "assets/sounds/Put_Tower.wav");
		type.set ("assets/sounds/Put_Tower.wav", AssetType.SOUND);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/tiled/example.tmx", "assets/tiled/example.tmx");
		type.set ("assets/tiled/example.tmx", AssetType.TEXT);
		path.set ("assets/tiled/mainLevel.tmx", "assets/tiled/mainLevel.tmx");
		type.set ("assets/tiled/mainLevel.tmx", AssetType.TEXT);
		path.set ("assets/tiled/maps.tmx", "assets/tiled/maps.tmx");
		type.set ("assets/tiled/maps.tmx", AssetType.TEXT);
		path.set ("assets/tiled/tileset.png", "assets/tiled/tileset.png");
		type.set ("assets/tiled/tileset.png", AssetType.IMAGE);
		path.set ("assets/tiled/tileset.tsx", "assets/tiled/tileset.tsx");
		type.set ("assets/tiled/tileset.tsx", AssetType.TEXT);
		path.set ("assets/xml/Menu.xml", "assets/xml/Menu.xml");
		type.set ("assets/xml/Menu.xml", AssetType.TEXT);
		path.set ("assets/xml/_ui_globals.xml", "assets/xml/_ui_globals.xml");
		type.set ("assets/xml/_ui_globals.xml", AssetType.TEXT);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/img/tooltip_arrow.png", __ASSET__flixel_flixel_ui_img_tooltip_arrow_png);
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/level1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/level2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/level3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/level4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tileASE.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/data/tileASE.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/fonts/alagard.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/CHRICI__.TTF";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/Enchanted Land.otf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/Frogotype.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/GothicPixels.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/Pixelig Cursief.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/vera.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/verab.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/verai.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/fonts/veraz.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "assets/gfx/other/icon_party.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/other/portrait_mane.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/blue.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/blue_back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/blue_back_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/blue_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_blue.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_blue_scale_0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_blue_scale_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_blue_scale_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_blue_scale_all.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_blue_scale_all2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_blue_toggle.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_confirmation_black.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_confirmation_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_confirmation_red_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_confirmation_red_up.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_confirmation_up.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_gold.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_gold_up.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_grey.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/button_red.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/gold.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/gold_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/grey.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/grey_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/master_button_blue.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/red.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/red_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/tab_grey.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/tab_grey_back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/tab_grey_back_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/buttons/tab_grey_over.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/chrome/dark_grey.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/chrome/dark_grey_flat_top.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/chrome/dark_grey_inset.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/chrome/dark_grey_texture.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/misc/check_big.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/misc/check_box_big.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/misc/check_box_small.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/misc/check_small.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/misc/flag_blank.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/misc/health_bar.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/misc/mana_bar.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/misc/radio.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/misc/radio_dot.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/saveslot.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/saveslot_shadow.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/save_menu_overlay.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/title_back.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/gfx/ui/title_back2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ASE/DeathBall.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/earth_enemy.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/Elements.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/enemy-Sheet.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/enemy.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/HIT.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/SIXNITY.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/TitleScreen.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/Tower.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/tower_earth.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/tower_earth.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ASE/tower_electricity.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/tower_frost.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/tower_water.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/tower_water.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/ASE/tower_wind.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/Trinity.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/TrinityElements.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/UI.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/water_enemy.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/ASE/Zombie.ase";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/bullet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/earth_ui.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-7.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-8.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/enemy-9.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/fire_ui.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Flixoul.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/map.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/SIXNITY.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tiles1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TitleScreen.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tizles.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tower.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tower_earth.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tower_electricity.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tower_fire.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tower_frost.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tower_water.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tower_wind.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Trinity.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/water_ui.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/en-US/fontss.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/locales/en-US/uius.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/locales/index.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/locales/nb-NO/fonts.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/locales/nb-NO/ui.csv";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/locales/_flags/cs-CZ.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/de-DE.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/en-CA.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/en-GB.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/en-US.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/es-ES.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/fr-FR.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/it-IT.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/ja-JP.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/ko-KR.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/nb-NO.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/pl-PL.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/locales/_flags/yo-DA.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/music/end.ceol";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/loose.ceol";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/loose3.ceol";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/loose3.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/music/mainMusic.ceol";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/mainMusic.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/music/mainMusics.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/track.ceol";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/tracki.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/music/win.ceol";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/win.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Disparition.bfxrsound";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Disparition.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Hit_Hurt.bfxrsound";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Hit_Hurt.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/loose2.ceol";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/nope.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Powerup.bfxrsound";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Powerup.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Put_Tower.bfxrsound";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Put_Tower.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/tiled/example.tmx";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/tiled/mainLevel.tmx";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/tiled/maps.tmx";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/tiled/tileset.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/tiled/tileset.tsx";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/xml/Menu.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/xml/_ui_globals.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_down.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_left.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_right.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_arrow_up.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_thin.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/button_toggle.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_box.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/check_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_flat.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_inset.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/chrome_light.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/dropdown_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_big.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/finger_small.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/hilight.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/invis.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/minus_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/plus_mark.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/radio_dot.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/swatch.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tab_back.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/img/tooltip_arrow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/flixel-ui/xml/defaults.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_loading_screen.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "flixel/flixel-ui/xml/default_popup.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("assets/fonts/alagard.ttf", __ASSET__assets_fonts_alagard_ttf);
		type.set ("assets/fonts/alagard.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/CHRICI__.TTF", __ASSET__assets_fonts_chrici___ttf);
		type.set ("assets/fonts/CHRICI__.TTF", AssetType.FONT);
		
		className.set ("assets/fonts/Enchanted Land.otf", __ASSET__assets_fonts_enchanted_land_otf);
		type.set ("assets/fonts/Enchanted Land.otf", AssetType.FONT);
		
		className.set ("assets/fonts/Frogotype.ttf", __ASSET__assets_fonts_frogotype_ttf);
		type.set ("assets/fonts/Frogotype.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/GothicPixels.ttf", __ASSET__assets_fonts_gothicpixels_ttf);
		type.set ("assets/fonts/GothicPixels.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/Pixelig Cursief.ttf", __ASSET__assets_fonts_pixelig_cursief_ttf);
		type.set ("assets/fonts/Pixelig Cursief.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/vera.ttf", __ASSET__assets_fonts_vera_ttf);
		type.set ("assets/fonts/vera.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/verab.ttf", __ASSET__assets_fonts_verab_ttf);
		type.set ("assets/fonts/verab.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/verai.ttf", __ASSET__assets_fonts_verai_ttf);
		type.set ("assets/fonts/verai.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/veraz.ttf", __ASSET__assets_fonts_veraz_ttf);
		type.set ("assets/fonts/veraz.ttf", AssetType.FONT);
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/box.png", __ASSET__flixel_flixel_ui_img_box_png);
		type.set ("flixel/flixel-ui/img/box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button.png", __ASSET__flixel_flixel_ui_img_button_png);
		type.set ("flixel/flixel-ui/img/button.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_down.png", __ASSET__flixel_flixel_ui_img_button_arrow_down_png);
		type.set ("flixel/flixel-ui/img/button_arrow_down.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_left.png", __ASSET__flixel_flixel_ui_img_button_arrow_left_png);
		type.set ("flixel/flixel-ui/img/button_arrow_left.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_right.png", __ASSET__flixel_flixel_ui_img_button_arrow_right_png);
		type.set ("flixel/flixel-ui/img/button_arrow_right.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_arrow_up.png", __ASSET__flixel_flixel_ui_img_button_arrow_up_png);
		type.set ("flixel/flixel-ui/img/button_arrow_up.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_thin.png", __ASSET__flixel_flixel_ui_img_button_thin_png);
		type.set ("flixel/flixel-ui/img/button_thin.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/button_toggle.png", __ASSET__flixel_flixel_ui_img_button_toggle_png);
		type.set ("flixel/flixel-ui/img/button_toggle.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_box.png", __ASSET__flixel_flixel_ui_img_check_box_png);
		type.set ("flixel/flixel-ui/img/check_box.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/check_mark.png", __ASSET__flixel_flixel_ui_img_check_mark_png);
		type.set ("flixel/flixel-ui/img/check_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome.png", __ASSET__flixel_flixel_ui_img_chrome_png);
		type.set ("flixel/flixel-ui/img/chrome.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_flat.png", __ASSET__flixel_flixel_ui_img_chrome_flat_png);
		type.set ("flixel/flixel-ui/img/chrome_flat.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_inset.png", __ASSET__flixel_flixel_ui_img_chrome_inset_png);
		type.set ("flixel/flixel-ui/img/chrome_inset.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/chrome_light.png", __ASSET__flixel_flixel_ui_img_chrome_light_png);
		type.set ("flixel/flixel-ui/img/chrome_light.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/dropdown_mark.png", __ASSET__flixel_flixel_ui_img_dropdown_mark_png);
		type.set ("flixel/flixel-ui/img/dropdown_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_big.png", __ASSET__flixel_flixel_ui_img_finger_big_png);
		type.set ("flixel/flixel-ui/img/finger_big.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/finger_small.png", __ASSET__flixel_flixel_ui_img_finger_small_png);
		type.set ("flixel/flixel-ui/img/finger_small.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/hilight.png", __ASSET__flixel_flixel_ui_img_hilight_png);
		type.set ("flixel/flixel-ui/img/hilight.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/invis.png", __ASSET__flixel_flixel_ui_img_invis_png);
		type.set ("flixel/flixel-ui/img/invis.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/minus_mark.png", __ASSET__flixel_flixel_ui_img_minus_mark_png);
		type.set ("flixel/flixel-ui/img/minus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/plus_mark.png", __ASSET__flixel_flixel_ui_img_plus_mark_png);
		type.set ("flixel/flixel-ui/img/plus_mark.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio.png", __ASSET__flixel_flixel_ui_img_radio_png);
		type.set ("flixel/flixel-ui/img/radio.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/radio_dot.png", __ASSET__flixel_flixel_ui_img_radio_dot_png);
		type.set ("flixel/flixel-ui/img/radio_dot.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/swatch.png", __ASSET__flixel_flixel_ui_img_swatch_png);
		type.set ("flixel/flixel-ui/img/swatch.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab.png", __ASSET__flixel_flixel_ui_img_tab_png);
		type.set ("flixel/flixel-ui/img/tab.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tab_back.png", __ASSET__flixel_flixel_ui_img_tab_back_png);
		type.set ("flixel/flixel-ui/img/tab_back.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/img/tooltip_arrow.png", __ASSET__flixel_flixel_ui_img_tooltip_arrow_png);
		type.set ("flixel/flixel-ui/img/tooltip_arrow.png", AssetType.IMAGE);
		
		className.set ("flixel/flixel-ui/xml/defaults.xml", __ASSET__flixel_flixel_ui_xml_defaults_xml);
		type.set ("flixel/flixel-ui/xml/defaults.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_loading_screen.xml", __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml);
		type.set ("flixel/flixel-ui/xml/default_loading_screen.xml", AssetType.TEXT);
		
		className.set ("flixel/flixel-ui/xml/default_popup.xml", __ASSET__flixel_flixel_ui_xml_default_popup_xml);
		type.set ("flixel/flixel-ui/xml/default_popup.xml", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash



































































































































































@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends null { }


#elseif html5








@:keep #if display private #end class __ASSET__assets_fonts_alagard_ttf extends lime.text.Font { public function new () { super (); name = "Alagard"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_chrici___ttf extends lime.text.Font { public function new () { super (); name = "Christmas Card  II"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_enchanted_land_otf extends lime.text.Font { public function new () { super (); name = "Enchanted Land"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_frogotype_ttf extends lime.text.Font { public function new () { super (); name = "Frogotype Regular"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_gothicpixels_ttf extends lime.text.Font { public function new () { super (); name = "GothicPixels"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_pixelig_cursief_ttf extends lime.text.Font { public function new () { super (); name = "Pixelig Cursief Regular"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_vera_ttf extends lime.text.Font { public function new () { super (); name = "Bitstream Vera Sans"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_verab_ttf extends lime.text.Font { public function new () { super (); name = "Bitstream Vera Sans Bold"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_verai_ttf extends lime.text.Font { public function new () { super (); name = "Bitstream Vera Sans Oblique"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_veraz_ttf extends lime.text.Font { public function new () { super (); name = "Bitstream Vera Sans Bold Oblique"; } } 



















































































































































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 


































#else

@:keep #if display private #end class __ASSET__assets_fonts_alagard_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/alagard.ttf"; name = "Alagard"; super (); }}
@:keep #if display private #end class __ASSET__assets_fonts_chrici___ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/CHRICI__.TTF"; name = "Christmas Card  II"; super (); }}
@:keep #if display private #end class __ASSET__assets_fonts_enchanted_land_otf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/Enchanted Land.otf"; name = "Enchanted Land"; super (); }}
@:keep #if display private #end class __ASSET__assets_fonts_frogotype_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/Frogotype.ttf"; name = "Frogotype Regular"; super (); }}
@:keep #if display private #end class __ASSET__assets_fonts_gothicpixels_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/GothicPixels.ttf"; name = "GothicPixels"; super (); }}
@:keep #if display private #end class __ASSET__assets_fonts_pixelig_cursief_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/Pixelig Cursief.ttf"; name = "Pixelig Cursief Regular"; super (); }}
@:keep #if display private #end class __ASSET__assets_fonts_vera_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/vera.ttf"; name = "Bitstream Vera Sans"; super (); }}
@:keep #if display private #end class __ASSET__assets_fonts_verab_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/verab.ttf"; name = "Bitstream Vera Sans Bold"; super (); }}
@:keep #if display private #end class __ASSET__assets_fonts_verai_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/verai.ttf"; name = "Bitstream Vera Sans Oblique"; super (); }}
@:keep #if display private #end class __ASSET__assets_fonts_veraz_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/veraz.ttf"; name = "Bitstream Vera Sans Bold Oblique"; super (); }}


#if (windows || mac || linux || cpp)


@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,3,0/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_down.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_down_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_left.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_left_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_right.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_right_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_arrow_up.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_arrow_up_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_thin.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_thin_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/button_toggle.png") #if display private #end class __ASSET__flixel_flixel_ui_img_button_toggle_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/check_box.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_box_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/check_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_check_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome_flat.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_flat_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome_inset.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_inset_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/chrome_light.png") #if display private #end class __ASSET__flixel_flixel_ui_img_chrome_light_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/dropdown_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_dropdown_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/finger_big.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_big_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/finger_small.png") #if display private #end class __ASSET__flixel_flixel_ui_img_finger_small_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/hilight.png") #if display private #end class __ASSET__flixel_flixel_ui_img_hilight_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/invis.png") #if display private #end class __ASSET__flixel_flixel_ui_img_invis_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/minus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_minus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/plus_mark.png") #if display private #end class __ASSET__flixel_flixel_ui_img_plus_mark_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/radio.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/radio_dot.png") #if display private #end class __ASSET__flixel_flixel_ui_img_radio_dot_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/swatch.png") #if display private #end class __ASSET__flixel_flixel_ui_img_swatch_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/tab.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/tab_back.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tab_back_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/images/tooltip_arrow.png") #if display private #end class __ASSET__flixel_flixel_ui_img_tooltip_arrow_png extends lime.graphics.Image {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/xml/defaults.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_defaults_xml extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/xml/default_loading_screen.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_loading_screen_xml extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel-ui/2,2,0/assets/xml/default_popup.xml") #if display private #end class __ASSET__flixel_flixel_ui_xml_default_popup_xml extends lime.utils.ByteArray {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_alagard_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/alagard.ttf"; name = "Alagard"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_chrici___ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/CHRICI__.TTF"; name = "Christmas Card  II"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_enchanted_land_otf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/Enchanted Land.otf"; name = "Enchanted Land"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_frogotype_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/Frogotype.ttf"; name = "Frogotype Regular"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_gothicpixels_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/GothicPixels.ttf"; name = "GothicPixels"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_pixelig_cursief_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/Pixelig Cursief.ttf"; name = "Pixelig Cursief Regular"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_vera_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/vera.ttf"; name = "Bitstream Vera Sans"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_verab_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/verab.ttf"; name = "Bitstream Vera Sans Bold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_verai_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/verai.ttf"; name = "Bitstream Vera Sans Oblique"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_veraz_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "assets/fonts/veraz.ttf"; name = "Bitstream Vera Sans Bold Oblique"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end


#end