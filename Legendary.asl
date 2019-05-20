// Legendary Autosplitter
// by blairmadison11

// VERSION 0.00000000000000001
// FOR ALPHA TESTING

state("Legendary") {
	bool isLoading: 0x1C36DC0;
	bool isPlayerControl: 0x1B7D56C;
	int map: 0x1C4329C;
}

init {
	version = modules.First().FileVersionInfo.FileVersion;
	print(version);
}

start {
	return current.map == 334 && !old.isPlayerControl && current.isPlayerControl;
}

split {
	return old.map != current.map;
}

isLoading {
	return current.isLoading;
}

reset {
	return old.map != 334 && current.map == 334;
}

exit {
	timer.IsGameTimePaused = true;
}
