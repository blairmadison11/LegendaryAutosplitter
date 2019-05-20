// Legendary Autosplitter
// by blairmadison11

// VERSION 0.00000000000000001
// FOR ALPHA TESTING

state("Legendary") {
	bool isLoading: 0x1C36DC0;
	bool isPlayerControl: 0x1B7D56C;
	int checkpoint: 0x1C4329C;
}

init {
	version = modules.First().FileVersionInfo.FileVersion;
	print(version);
}

start {
	return current.checkpoint == 334 && !old.isPlayerControl && current.isPlayerControl;
}

split {
	return old.checkpoint != current.checkpoint;
}

isLoading {
	return current.isLoading;
}

reset {
	return old.checkpoint != 334 && current.checkpoint == 334;
}

exit {
	timer.IsGameTimePaused = true;
}
