// Schutz gegen fehlerhafte Ausf�hrung
if (!local player) exitWith {};

player addEventHandler["respawn", { player execVM "functions\initunit.sqf" }];
