#include "macros.hpp"
CLIENT_ONLY;

// Credits: PabstMirror
waitUntil { !(isNil "BIS_fnc_init") };
sleep 10;

[] spawn
{
    waitUntil { player == player };
    waitUntil { time > 2 };

    _msg = (getPos player) call BIS_fnc_locationDescription;
    _msg = _msg + format ["<br/>%1/%2/%3", (date select 0), (date select 1), (date select 2)];
    _msg = _msg + format ["<br/>%1", ([dayTime, "HH:MM"] call BIS_fnc_timeToString)];

    [
        _msg,
        [safezoneX + safezoneW - 0.8, 0.50],
        [safezoneY + safezoneH - 0.8, 0.7],
        5,
        0.5
    ] spawn BIS_fnc_dynamicText;

};
