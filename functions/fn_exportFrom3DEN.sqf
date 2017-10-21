/*
    Author: _SCAR

    Description:
    Export all 3DEN entities to clipboard.

    Return:
    true

    Example:
    [] call SCAR_E2TB_fnc_exportFrom3DEN
*/

// get entities
private _entities = all3DENEntities select 0;

// copy to clip
[_entities] call SCAR_E2TB_fnc_copyObjectsStringToClipboard;

// message
disableSerialization;
["SCAR_E2TB_exportDone", 5] call BIS_fnc_3DENNotification;

// return
true
