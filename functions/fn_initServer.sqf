private "_script";

if (isServer) then
{
	[] call LK_fnc_initSpawn;

	{
		if (!isPlayer _x) then
		{
			_x call LK_fnc_initUnit;
		}
	} foreach (allUnits);
};
