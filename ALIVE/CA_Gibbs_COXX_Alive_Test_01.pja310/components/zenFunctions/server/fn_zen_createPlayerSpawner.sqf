#include "macros.hpp"

params ["_position", ["_side", west]];

_spawner = [_position, _side] call f_fnc_createPlayerSpawner;
[_spawner] call f_fnc_addObjectsToAllZeuses;
