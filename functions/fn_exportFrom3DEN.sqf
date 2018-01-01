/*
    Author: _SCAR

    Description:
    Export all 3DEN entities to clipboard.

    Parameter(s):
    0: BOOLEAN - true for absolute positioning, false for relative.

    Return:
    true

    Example:
    [false] call SCAR_E2TB_fnc_exportFrom3DEN
*/

params ["_isAbsolute"];

// get entities
private _entities = all3DENEntities select 0;

// disable input
disableUserInput true;

// copy to clip
[_entities, _isAbsolute] call SCAR_E2TB_fnc_exportToClipboard;

// enable input
disableUserInput false;

// message
disableSerialization;
["SCAR_E2TB_exportDone", 5] call BIS_fnc_3DENNotification;

// return
true
