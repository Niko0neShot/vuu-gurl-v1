import('grafex.effects.shaders.ColorSwap');

import('grafex.system.statesystem.MusicBeatState');



var danceLeft:Bool = false;

var logoBl:FlxSprite;
var gfDance:FlxSprite;
var titleText:FlxSprite;

var swagShader:ColorSwap = null;

//var 

function onCreate() {
	swagShader = new ColorSwap(); // idk
        this.switchTime = 1;
}

function onIntroStart() {

	swagShader = new ColorSwap();

	logoBl = new FlxSprite().loadGraphic(Paths.image('logoBumpin'));
	logoBl.x = 30;
	logoBl.y = 150;
	logoBl.antialiasing = false;
	logoBl.scale.x = 1.5;
	logoBl.scale.y = 1.5;
	logoBl.updateHitbox();
	this.add(logoBl);
	logoBl.shader = swagShader.shader;

	gfDance = new FlxSprite().loadGraphic(Paths.image('gfDanceTitle'));
	gfDance.scale.x = 1.5;
	gfDance.scale.y = 1.5;
	gfDance.x = 410;
	gfDance.y = 50;
	gfDance.antialiasing = ClientPrefs.globalAntialiasing;
	this.add(gfDance);
	gfDance.shader = swagShader.shader;

	titleText = new FlxSprite(200, 680);
	titleText.scale.x = 0.5;
	titleText.scale.y = 0.5;
	titleText.frames = Paths.getSparrowAtlas('titleEnter');
	titleText.animation.addByPrefix('idle', "ENTER IDLE", 24);
	titleText.animation.addByPrefix('press', ClientPrefs.flashing ? "ENTER PRESSED" : "ENTER FREEZE", 24);
	titleText.antialiasing = ClientPrefs.globalAntialiasing;
	titleText.animation.play('idle');
	titleText.updateHitbox();
	this.add(titleText);
}


function onUpdate(elapsed) {
	if (FlxG.sound.music != null)
		Conductor.songPosition = FlxG.sound.music.time;

	FlxG.camera.zoom = FlxMath.lerp(1, FlxG.camera.zoom, 0.99);

	if(swagShader != null)
	{
		if(this.controls.UI_LEFT) swagShader.hue -= elapsed * 0.1;
		if(this.controls.UI_RIGHT) swagShader.hue += elapsed * 0.1;
	}
}


function onBeatHit(curBeat) {

	if(curBeat % 2 == 0)
		FlxG.camera.zoom += 0.01;

	if(logoBl != null)
		logoBl.animation.play('bump', true);

	if(gfDance != null) {
		danceLeft = !danceLeft;
		if (danceLeft)
			gfDance.animation.play('danceRight');
		else
			gfDance.animation.play('danceLeft');
	}
}

function onSkipIntro(skipped) {
	if (!skipped)
	{
		FlxG.camera.flash(0xFFFFFFFF, 4);
	}
}

function onPressedEnter() {
        if(titleText != null) titleText.animation.play('press');
	FlxG.camera.flash(ClientPrefs.flashing ? 0xFFFFFFFF : 0x4CFFFFFF, 1);
	FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
}

function onCoolTextBeat(sickBeats) {
	switch (sickBeats)
	{
		case 1:
			FlxG.sound.playMusic(Paths.music('TitleScreen'), 0);
			FlxG.sound.music.fadeIn(4, 0, 0.7);
		case 2:
			this.createCoolText(['FNF Beatdrop Team']);
		case 4:
			this.addMoreText('presents');
		case 5:
			this.deleteCoolText();
		case 6:
			this.createCoolText(['Spin-off mod', 'Something something'], -40);
		case 7:
			this.deleteCoolText();
		case 8:
			this.addMoreText('Woman... Drool...', -40);
		case 9:
			this.deleteCoolText();
		case 10:
			this.createCoolText([this.curWacky[0]]);
		case 12:
			this.addMoreText(this.curWacky[1]);
		case 13:
			this.deleteCoolText();
			this.createCoolText(['Powered by', 'Grafex Engine'], -40);
		case 14:
			this.addMoreText('Vuu Gurl');
			this.addMoreText('Demo');
		case 15:
			this.skipIntro();
	}


}