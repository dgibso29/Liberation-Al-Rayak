// by Xeno
//#define __DEBUG__
#define THIS_FILE "fn_getwreck.sqf"
#include "..\x_setup.sqf"

//params ["_rep_station", "_types"];
params ["_rep_station"];
__TRACE_1("","_this")
//private _no = nearestObjects [_rep_station, _types, 10, false];
private _no = nearestObjects [_rep_station, ["Air", "Car", "Tank", "Ship"], 10, false];
__TRACE_1("","_no")
if (_no isEqualTo []) exitWith {objNull};
if (damage (_no # 0) < 1) exitWith {objNull};
if (!isNil {(_no # 0) getVariable "d_isspecialvec"}) exitWith {(_no # 0)};
objNull
