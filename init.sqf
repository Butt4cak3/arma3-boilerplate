// Ermitteln, ob es sich um eine Join in Progress Initialisierung handelt
if (!isServer && isNull player) then {
	isJIP = true;
} else {
	isJIP = false;
};

// Stimmt die folgende Aussage so?
// Warten, bis Server und Client initialisiert sind
S_INIT = false;
C_INIT = false;

if (isServer) then {
	S_INIT = true;
} else {
	C_INIT = true;
	if (isNull player) then {
		[] spawn {
			waitUntil { !isNull player };
			S_INIT = true;
		}
	} else {
		S_INIT = true;
	};
	// Ist der Inhalt dieses Blocks verkürzbar?
	/*
	C_INIT = true;
	if (isNull player) then {
		waitUntil { !isNull player };
	};
	S_INIT = true;
	*/
};

waitUntil { S_INIT };
waitUntil { !isNil "bis_fnc_init" };

// Debugging (de)aktivieren
debug = false;

private ["_script"];
_script = [] execVM "functions\initmain.sqf";
waitUntil { scriptDone _script };

// Bedeutet diese Syntax, dass das Script als Funktion "gespeichert" wird,
// damit man es nur ein mal laden muss? Wieso müssen gerade diese Scripts auf
// diese Weise geladen werden?
spawnFunction = compile preprocessFileLineNumbers "functions\initspawn.sqf";
call spawnFunction;
loadoutFunction = compile preprocessFileLineNumbers "functions\initloadout.sqf";
call loadoutFunction;

if (isServer) {
	// Initialisierungsscript für den Server aufrufen
	_script = [] execVM "functions\initserver.sqf";
	waitUntil { scriptDone _script };
} else {
	// Initialisierungsscript für den Client aufrufen
	_script = [] execVM "functions\initclient.sqf";
	waitUntil { scriptDone _script };
};

// Diverse Einstellungen

// Die Dokumentation zu createCenter ist für mich nichtsaussagend :(
CenterE = createCenter east;
// Legt fest, ob Team A mit Team B verbündet (1) oder verfeindet (0) ist, oder
// etwas dazwischen (?!)
EAST setFriend [WEST, 0]
// Sollte das hier CenterW heißen?
CenterE = createCenter west;
WEST setFriend [EAST, 0];
// ?!
noPop = true;
enableSaving [false, false];
setTerrainGrid 50;
setViewDistance 8000;
