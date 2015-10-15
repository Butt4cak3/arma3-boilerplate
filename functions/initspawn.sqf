/**
 * Lädt alle Spawn-Scripts
 * 
 * Aufruf des Scripts:
 * spawnFunction = compile preprocessFileLineNumbers "functions\initspawn.sqf";
 * call spawnFunction;
 */

if (!isMultiplayer) exitWith {};

private ["_script"];

if (isServer) then {
	// Objekte
	_script = [] execVM "scripts\spawn_objects.sqf";
	waitUntil { scriptDone _script };
	
	// Fahrzeuge
	_script = [] execVM "scripts\spawn_vehicles.sqf";
	waitUntil { scriptDone _script };
	
	// Einheiten
	_script = [] execVM "scripts\spawn_units.sqf";
	waitUntil { scriptDone _script };
};
