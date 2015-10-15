/**
 * Lädt alle Loadout-Scripts
 * 
 * Aufruf des Scripts:
 * loadoutFunction = compile preprocessFileLineNumbers "functions\initloadout.sqf";
 * call spawnFunction;
 */

if (!isMultiplayer) exitWith {};

private ["_script"];

if (isServer) then {
	_script = [] execVM "scripts\apply_loadout.sqf";
	waitUntil { scriptDone _script };
};

if (!isDedicated) then {
	// Von einem logischen Standpunkt machen die folgenden Zeilen absolut
	// keinen Sinn :D
	if (player != player) then {
		waitUntil { player == player };
	};
	
	waitUntil { local player };
	
	// Wofür ist dieser Block? Definiert er den Scope der darin enhaltenen
	// Variablen? Oder sorgt er dafür, dass die Endlosschleife asynchron im
	// Hintergrund weiterlaufen kann ohne die Ausführung zu blockieren?
	// Generell verstehe ich diese Schleife nicht so richtig. Wodurch ändert
	// sich "player" und wieso läuft sie unendlich weiter?
	[] spawn {
		_lastcorps = player;
		_script = [] execVM "scripts\apply_loadout.sqf";
		waitUntil { scriptDone _script };
		while { true } do {
			if (player != _lastcorps) then {
				_script = [] execVM "scripts\apply_loadout.sqf";
				waitUntil { scriptDone _script };
				_lastcorps = player;
			};
			// Gegen Einbrüche der Performance, während die Schleife im
			// Leerlauf ist?
			sleep 1;
		};
	};
};
