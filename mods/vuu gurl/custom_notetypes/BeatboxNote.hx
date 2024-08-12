var singAnimations:Array<String> = ['singLEFT', 'singDOWN', 'singUP', 'singRIGHT'];

function goodNoteHit(index, data, type, issus, id) {
    if(type == 'BeatboxNote') {
        var animToPlay = singAnimations[data] + '-beat';
        this.boyfriend.playAnim(animToPlay, true);
        this.boyfriend.holdTimer = 0;
    }
}

function opponentNoteHit(index, data, type, issus, id) {
    if(type == 'BeatboxNote') {
        var animToPlay = singAnimations[data] + '-beat';
        this.dad.playAnim(animToPlay, true);
        this.dad.holdTimer = 0;
    }
}