/**
 * Weist einer Einheit ihr Loadout zu
 */

// Ich bin mir ziemlich sicher, was dieses Script tut. Es ruft jedes
// Loadout-Script auf, egal welche Einheit aktuell initialisiert wird. Im
// jeweiligen Script wird gepr�ft, ob es sich tats�chlich um die Einheit
// handelt, die ausgestattet werden soll. Falls ja, wird ihr Loadout geladen
// und die restlichen Loadouts durch den Aufruf von exitWith �bersprungen.

private ["_script"];
//_script = [] execVM "scripts\loadout\loadout.sqf";
//waitUntil { scriptDone _script };