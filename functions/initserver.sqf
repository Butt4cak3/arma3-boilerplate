// Schutz gegen fehlerhafte Ausführung
if (!isServer) exitWith {};

{
	nul = _x execVM "functions\initunit.sqf";
} foreach (allUnits);
