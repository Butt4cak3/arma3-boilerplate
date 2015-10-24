// Schutz gegen fehlerhafte Ausführung
if (!local player) exitWith {};

player addEventHandler["respawn", { player execVM "functions\initunit.sqf" }];
