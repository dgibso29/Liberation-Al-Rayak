
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_suiciderLoop

Description:
    Search for soldier around and when found, activate the suicider.

Parameters:
    _suicider - Suicider created. [Object]

Returns:

Examples:
    (begin example)
        [_suicider] call btc_fnc_ied_suiciderLoop;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

[{
    params ["_suicider"];

    if (alive _suicider && !isNull _suicider) then {
        if !((_suicider nearEntities [btc_player_type, 25]) isEqualTo []) exitWith {
            _suicider call btc_fnc_ied_suicider_active;
        };
        _this call btc_fnc_ied_suiciderLoop;
    };
}, _this, 5] call CBA_fnc_waitAndExecute;
