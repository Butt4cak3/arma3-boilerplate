private "_script";

if (local player) then
{
	player spawn LK_fnc_initUnit;

	player addEventHandler["respawn", { player spawn LK_fnc_initUnit; }];
};
