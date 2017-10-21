/*
    Author: _SCAR

    Description:
    Export all map entities to clipboard.
    You need to put the SCAR_E2TB_Module on the map to access the action that runs this script.

    Return:
    true

    Example:
    [] spawn SCAR_E2TB_fnc_exportFromMission
*/

// get entities
private _entities = allMissionObjects "All";

// copy to clip
[_entities] call SCAR_E2TB_fnc_copyObjectsStringToClipboard;

// message
private _null = [(localize "STR_SCAR_E2TB_CopiedToClipboard"), "SCAR_E2TB", true, false] call BIS_fnc_guiMessage;

// return
true
