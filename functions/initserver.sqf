private "_script";

if (isServer) then
{
	_script = execVM "functions\initspawn.sqf";
	waitUntil { scriptDone _script };

	{
		if (!isPlayer _x) then
		{
			nul = _x execVM "functions\initunit.sqf";
		}
	} foreach (allUnits);
};
