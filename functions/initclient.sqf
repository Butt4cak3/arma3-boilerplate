// Schutz gegen fehlerhafte Ausführung
if (!local player) exitWith {};

private["_script"];

_script = player execVM "functions\initunit.sqf";
waitUntil { scriptDone _script };
player addEventHandler["respawn", { player execVM "functions\initunit.sqf" }];
