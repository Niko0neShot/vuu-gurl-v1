import grafex.system.notes.StrumNote;
import grafex.system.notes.Note;
import grafex.system.statesystem.MusicBeatState;
import grafex.states.options.OptionsMenu;
import grafex.util.Highscore;
import Sys;

var scoreAlphaTween = null;
public static var initalHealth:Float = 50;
final notesYArray = [];



var options = {
	angledCamera: false,
	angledCameraMult: 1,

	camZoomByPos: false,

	workLikePsych: false,
	cameraMoveOffset: 10,
	useCustomPause: false
}

var coolCamAngle:Float = 0;

function onCreate() {
	//classicHealthBar = true;

	var file = Paths.getTextFromFile('data/PlayStateModuleOptions.json');
	if (file != null) options = Json.parse(file);

	if (options.workLikePsych) camZooming = false;
}

var memoryUpdatePos:Array<Any> = [];
var memoryUpdateScale:Array<Any> = [];
var memoryDoScale:Array<Any> = [];

function onCreatePost() {
	if (options.cameraMoveOffset != null) cameraMoveOffset = options.cameraMoveOffset;

	/*healthBarGroup.remove(healthBarBG, true);
	healthBarGroup.add(healthBarBG);
	healthBarWN.barHeight += 1;*/

	showCombo = false;
	showComboNum = false;
	showRating = true;
	comboGroup.cameras = [camHUD];

	FlxG.sound.cache(FlxG.sound.music._sound);
	FlxG.camera.bgColor = FlxColor.BLACK;

	/*var paralaxedSprite:ParallaxSprite = new ParallaxSprite(200, 300, Paths.image('logo'));
	paralaxedSprite.fixate(0, 0, 2, 2, 1, 1, 'vertical');
	//paralaxedSprite.scale.set(.7, .7);
	add(paralaxedSprite);*/

	memoryUpdatePos[1] = iconP1.updatePosition;
	memoryUpdateScale[1] = iconP1.updateScale;
	memoryDoScale[1] = iconP1.doScale;
	memoryUpdatePos[2] = iconP2.updatePosition;
	memoryUpdateScale[2] = iconP2.updateScale;
	memoryDoScale[2] = iconP2.doScale;
}

function setClassicIcons(classic:Bool = false) {
	
	if (classic) {
		strumLineNotes.forEach(function(strum:StrumNote) { strum.x -= 40; });
		for (icon in iconGroup.members) {
			icon.updatePosition = function (elapsed) {
				icon.isPlayer ?
					icon.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(displayedHealth * 2 / maxHealth, 0, 100, 100, 0) * 0.01)) + (150 * icon.scale.x - 150) / 2 - 26
				 : 
					icon.x = healthBar.x + (healthBar.width * (FlxMath.remapToRange(displayedHealth * 2 / maxHealth, 0, 100, 100, 0) * 0.01)) - (150 * icon.scale.x) / 2 - 26 * 2;
					icon.updateHitbox();
				icon.origin.y = 15;
			}
			icon.updateScale = function (a, b) {
				var stuff = FlxMath.lerp(icon.customScale, icon.scale.x, .85);
				icon.scale.set(stuff, stuff);
				icon.updateHitbox();
			}
			//icon.updateAnim = function () { }
			icon.doScale = function () {
				icon.scale.set(icon.customScale * 1.3, icon.customScale * 1.3);
				icon.updateHitbox();
			}
		}
	} else {
		strumLineNotes.forEach(function(strum:StrumNote) { strum.x += 40; });
		for (icon in iconGroup.members) {
			icon.updatePosition = memoryUpdatePos[icon.isPlayer ? 1 : 2];
			icon.updateScale = memoryUpdateScale[icon.isPlayer ? 1 : 2];
			icon.doScale = memoryDoScale[icon.isPlayer ? 1 : 2];
		}
	}
	reloadHealthBarColors();
}


function onUpdate(elapsed) {

	if(FlxG.keys.justPressed.FIVE) {
		classicHealthBar = !classicHealthBar;
		setClassicIcons(classicHealthBar);
	}

	if(FlxG.keys.justPressed.SIX) options.useCustomPause = !options.useCustomPause;

	if(FlxG.keys.justPressed.F5) FlxG.resetState(); 
}

function onUpdatePost(elapsed) {
	if (options.angledCamera) {
		coolCamAngle = FlxMath.lerp(0, coolCamAngle, FlxMath.bound(1 - (elapsed * 5 * playbackRate / camZoomingDecay * cameraSpeed), 0, 1));
		camGame.angle = FlxMath.lerp(coolCamAngle, camGame.angle, FlxMath.bound(1 - (elapsed * 3.125 * playbackRate / camZoomingDecay * cameraSpeed), 0, 1));
	}

	if (camFocus != null && options.camZoomByPos) {
		var curCharacter = switch (camFocus) {
			case 'bf': boyfriend;
			case 'gf': gf != null ? gf : boyfriend;
			default: dad;
		}

		var camStuff = defaultCamZoom;
		if (curCharacter.animation.curAnim.name.indexOf('singLEFT') != -1 || curCharacter.animation.curAnim.name.indexOf('singRIGHT') != -1) camStuff = defaultCamZoom * 1.05;
		else if (curCharacter.animation.curAnim.name.indexOf('singDOWN') != -1) camStuff = defaultCamZoom * 1.1;
		else camStuff = defaultCamZoom;

		var lerpStuff = Utils.boundTo(1 - (elapsed * 3.125 * camZoomingDecay * playbackRate), 0, 1);
		camGame.zoom = FlxMath.lerp(camStuff, camGame.zoom, lerpStuff);
	}
}

function onMoveCamera(c) if (options?.cameraMoveOffset) cameraMoveOffset = options.cameraMoveOffset;

function onTriggerCamMovement(focusedChar, strumId) {
	if (options.angledCamera) {
		coolCamAngle = options.angledCameraMult * switch (strumId) {
			case 0: -2.5;
			case 1: -.5;
			case 2: 1;
			case 3: 2.5;
		}
	}
}

function opponentNoteHit(note, data, type, sus, id) {
 if (options.workLikePsych) camZooming = true;
}

function onPause() {
 if (!options.useCustomPause) return Function_Continue;
 
 FlxG.camera.followLerp = 0;
 paused = true;
 persistentUpdate = false;
 if(FlxG.sound.music != null) {
  FlxG.sound.music.pause();
  vocals.pause();
  vocals2.pause();
 }
 FlxTween.globalManager.forEach(function(tween:FlxTween) tween.active = false);
 FlxTimer.globalManager.forEach(function(timer:FlxTimer) timer.active = false);
 FlxG.sound.pause();
 MusicBeatState.openScriptedSubState('CustomPauseSubState');

 return Function_Stop;
}



