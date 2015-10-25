private "_script";

if (local player) then {
	_script = player execVM "functions\initunit.sqf";
	waitUntil { scriptDone _script };

	player addEventHandler["respawn", { player execVM "functions\initunit.sqf" }];
};
