// Legendary Autosplitter
// Version 0.802
// by blairmadison11

state("Legendary") {
	bool isLoading: 0x1C36DC0;
	bool isPlayerControl: 0x1B7D56C;
	bool isOutOfMenu: 0x1C5FE24;
	int checkpoint: 0x1C4329C;
}

init {
	version = modules.First().FileVersionInfo.FileVersion;
	print(version);
}

start {
	return current.checkpoint == 334 && !old.isPlayerControl && current.isPlayerControl && current.isOutOfMenu;
}

split {
	return old.checkpoint != current.checkpoint && current.isOutOfMenu;
}

isLoading {
	return current.isLoading;
}

reset {
	return old.checkpoint != 334 && current.checkpoint == 334 && !current.isOutOfMenu;
}

exit {
	timer.IsGameTimePaused = true;
}
