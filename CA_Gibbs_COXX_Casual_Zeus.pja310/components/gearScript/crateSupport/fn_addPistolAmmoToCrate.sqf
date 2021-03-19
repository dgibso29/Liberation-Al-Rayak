#include "..\macros.hpp"

params ["_side", "_crateName", "_loadout", "_amount"];

if !(CRATE_VAR_EXISTS(_side,_crateName)) exitWith
{
    DEBUG_FORMAT2_LOG("[GEARSCRIPT-2]: Unable to modify crate %1 for side %2: it hasn't been created (yet).",_crateName,_side)
};


_crateArray = CRATE_VAR_DYNAMIC(_side,_crateName);
_loadoutVariants = LOADOUT_VAR_DYNAMIC(_side,_loadout);

if (_loadoutVariants isEqualTo []) exitWith
{
    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Unable to add item from loadout '%1' into crate %2 for side %3: the loadout doesn't exist.",_loadout,_crateName,_side)
};


_baseVariant = _loadoutVariants select 0;

if !(typeName _baseVariant == "ARRAY" and {count _baseVariant > 0 and {typeName (_baseVariant select 0) == "ARRAY"}}) exitWith
{
    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Unable to add item from loadout '%1' into crate %2 for side %3: the loadout doesn't have a base variant.",_loadout,_crateName,_side)
};


_pistolArray = _baseVariant select 2;

if !(typeName _pistolArray == "ARRAY" and {count _pistolArray > 4 and {typeName (_pistolArray select 4) == "ARRAY"}}) exitWith
{
    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Unable to add pistol ammo from loadout '%1' into crate %2 for side %3: the base variant doesn't have a pistol.",_loadout,_crateName,_side)
};


_pistolAmmo = _pistolArray select 4;

if !(typeName _pistolAmmo == "ARRAY" and {count _pistolAmmo > 0 and {typeName (_pistolAmmo select 0) == "STRING"}}) exitWith
{
    DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Unable to add pistol ammo from loadout '%1' into crate %2 for side %3: the pistol isn't loaded.",_loadout,_crateName,_side)
};


_itemEntry = [_pistolAmmo select 0, _amount];

DEBUG_FORMAT3_LOG("[GEARSCRIPT-2]: Adding %1 to crate type %2 for side %3.",_itemEntry,_crateName,_side)

_crateArray pushBack _itemEntry;
