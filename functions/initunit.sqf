/**
 * Lädt Klassenloadout und Unit-Script einer Einheit
 */

private "_script";

_script = _this execVM format["scripts\loadouts\classes\%1.sqf", typeof _this];
if (!isNil "_script") then {
	waitUntil { scriptDone _script };
};

_script = _this execVM format["scripts\units\%1.sqf", _this];
if (!isNil "_script") then {
	waitUntil { scriptDone _script };
};
