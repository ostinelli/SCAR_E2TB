/*
    Author: _SCAR

    Description:
    Export all 3DEN entities to clipboard, in LBT format.

    Return:
    true

    Example:
    [] call SCAR_E2TB_fnc_exportFrom3DEN
*/

// get entities
private _entities = all3DENEntities select 0;

// copy to clip
[_entities] call scar_E2TB_fnc_copyLbtStringToClipboard;

// message
["scar_E2TB_exportDone", 5] call BIS_fnc_3DENNotification;

// return
true
