private "_script";

if (local player) then
{
	player call LK_fnc_initUnit;

	player addEventHandler["respawn", { player call LK_fnc_initUnit; }];
};
