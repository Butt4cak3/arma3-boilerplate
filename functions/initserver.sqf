// Schutz gegen fehlerhafte Ausführung
if (!isServer) exitWith {};

{
	if (!isPlayer _x) {
		nul = _x execVM "functions\initunit.sqf";
	}
} foreach (allUnits);
