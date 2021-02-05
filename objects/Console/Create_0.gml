/// @desc Initialize

paused = true; // Pauses Game
input = "";
inputLog = ds_list_create();

cursorIcon = "|"; //  Cursor Icon
cursor = cursorIcon;
delay = 20; // Cursor Blink Frequency
alarm[0] = delay; // Cursor Blink Trigger

keyboard_string = ""; // Clears Console if previous opened