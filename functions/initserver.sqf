// Schutz gegen fehlerhafte Ausf�hrung
if (!isServer) exitWith {};

{
	nul = _x execVM "functions\initunit.sqf";
} foreach (allUnits);
