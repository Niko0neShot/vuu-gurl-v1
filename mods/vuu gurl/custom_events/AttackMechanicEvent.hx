var pressSpaceSprite:FlxSprite = new FlxSprite();
var canAttack:Bool = false;

function onCreatePost() {
    pressSpaceSprite.frames = Paths.getSparrowAtlas('mechanics/attack_warn');
    pressSpaceSprite.cameras = [this.camHUD];
    pressSpaceSprite.scrollFactor.set();
    pressSpaceSprite.scale.set(0.7, 0.7);
    pressSpaceSprite.updateHitbox();
    pressSpaceSprite.antialiasing = ClientPrefs.globalAntialiasing;
    pressSpaceSprite.x = 930 - (pressSpaceSprite.width / 2) + 30;

    if(game.classicHealthBar) pressSpaceSprite.x *= 0.95;

    pressSpaceSprite.animation.addByPrefix('face', 'press space to attack0', 24, true);
    pressSpaceSprite.animation.addByPrefix('pressed', 'press space to attack end', 12, false);
    pressSpaceSprite.animation.play('face', true);
    pressSpaceSprite.y += 170;

    if(ClientPrefs.downScroll) pressSpaceSprite.y = FlxG.height - pressSpaceSprite.height - 170;
    pressSpaceSprite.alpha = 0;
    pressSpaceSprite.offset.set(100, 0);

    add(pressSpaceSprite);

}

function onUpdate(elapsed) {
	if (FlxG.keys.justPressed.SPACE && canAttack) {
		canAttack = false;
		pressSpaceSprite.animation.play('pressed', true);
		pressSpaceSprite.offset.set(150, 50);
		game.health += .75;
		pressSpaceSprite.animation.finishCallback = function(name) { 
			pressSpaceSprite.alpha = 0;
			pressSpaceSprite.animation.finishCallback = null;
		}
	}
}



function onEvent(name, val1, val2, val3) {

    if(name == 'AttackMechanicEvent' && (val1 == 'start' || val1 == '')) {
        canAttack = false;
        pressSpaceSprite.alpha = 0;
        pressSpaceSprite.offset.set(100, 0);
        pressSpaceSprite.animation.play('face', true);
        game.modchartTweens.set('pressSpaceInTween', FlxTween.tween(pressSpaceSprite, {alpha: 1}, .5, {ease: FlxEase.quadInOut}));
        game.modchartTimers.set('pressSpaceInTimer', new FlxTimer().start(.4, function(tmr:FlxTimer) {	canAttack = true;	}) );
    }
    else if(name == 'AttackMechanicEvent' && val1 == 'end' && canAttack) {
        canAttack = false;
        game.modchartTweens.set('pressSpaceOutTween', FlxTween.tween(pressSpaceSprite, {alpha: 0}, 1, {ease: FlxEase.quadInOut}));
    }
}