function onBeatHit(b) {
	FlxG.camera.zoom += 0.015;
	FlxTween.tween(FlxG.camera, {zoom: 1}, 0.2);
} //Thats all

function onUpdate(elapsed) {

	FlxG.camera.followLerp = FlxMath.bound(elapsed * 9 * (FlxG.updateFramerate / 60), 0, 1);
}



