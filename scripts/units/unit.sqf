private ["_script"];
_script = [] execVM "scripts\loadouts\loadout.sqf";
waitUntil { scriptDone _script };
