/**
 * Lädt das Script einer Einheit im Ordner scripts\units\
 */

private ["_script"];

waitUntil { local player; };

diag_log format["Initializing %1", player];

_script = [] execVM format["scripts\units\%1.sqf", player];
if (!isNil "_script") then {
	waitUntil { scriptDone _script };
	player addEventHandler ["respawn", {[] execVM format["scripts\units\%1.sqf", player]}];
};
