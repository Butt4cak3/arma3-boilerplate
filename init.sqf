// Ermitteln, ob es sich um eine Join in Progress Initialisierung handelt
if (!isServer && isNull player) then {
	isJIP = true;
	waitUntil { !isNull player };
} else {
	isJIP = false;
};

waitUntil { !isNil "bis_fnc_init" };

// Debugging (de)aktivieren
debug = false;

private "_script";

_script = [] execVM "functions\initmain.sqf";
waitUntil { scriptDone _script };

if (isServer) then {
	// Initialisierungsscript f�r den Server aufrufen
	_script = [] execVM "functions\initserver.sqf";
	waitUntil { scriptDone _script };
};

if (!isDedicated) then {
	// Initialisierungsscript f�r Clients aufrufen
	_script = [] execVM "functions\initclient.sqf";
	waitUntil { scriptDone _script };
};

// Diverse Einstellungen

// Die Dokumentation zu createCenter ist f�r mich nichtsaussagend :(
CenterE = createCenter east;
// Legt fest, ob Team A mit Team B verb�ndet (1) oder verfeindet (0) ist, oder
// etwas dazwischen (?!)
EAST setFriend [WEST, 0];
// Sollte das hier CenterW hei�en?
CenterE = createCenter west;
WEST setFriend [EAST, 0];
// ?!
noPop = true;
enableSaving [false, false];
setTerrainGrid 50;
setViewDistance 8000;
