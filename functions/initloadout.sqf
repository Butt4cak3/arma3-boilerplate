/**
 * L�dt alle Loadout-Scripts
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
	
	// Wof�r ist dieser Block? Definiert er den Scope der darin enhaltenen
	// Variablen? Oder sorgt er daf�r, dass die Endlosschleife asynchron im
	// Hintergrund weiterlaufen kann ohne die Ausf�hrung zu blockieren?
	// Generell verstehe ich diese Schleife nicht so richtig. Wodurch �ndert
	// sich "player" und wieso l�uft sie unendlich weiter?
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
			// Gegen Einbr�che der Performance, w�hrend die Schleife im
			// Leerlauf ist?
			sleep 1;
		};
	};
};
