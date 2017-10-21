/*
    Authors: _SCAR, ianbanks

    Description:
    Exports all provided entities to the clipboard.

    Parameter(s);
    0: ARRAY of ENTITIES

    Return:
    true

    Example:
    [_entities] call SCAR_E2TB_fnc_exportToClipboard
*/

params ["_entities"];

// progress bar IDc
private _textId = 34516;
private _barId  = 34517;

// init
disableSerialization;

// create dialog
createDialog "SCAR_E2TB_ProgressBar";

// get controls
private _display = uiNamespace getVariable "SCAR_E2TB_ProgressBar_Display";
private _bar     = _display displayCtrl _barId;
private _barText = _display displayCtrl _textId;

// inits
private _tot   = count _entities;
private _i     = 0;
private _lines = [];

// loop objects
{
    // progress bar
    _i = _i + 1;
    _barText ctrlSetText format [(localize "STR_SCAR_E2TB_Exporting"), _i, _tot];
    _bar progressSetPosition (_i / _tot);

    // get line
    private _line = _x call SCAR_E2TB_fnc_getModelLine;
    if !(_line isEqualTo objNull) then {
        _lines pushBack _line;
    };
} forEach _entities;

// join & copy
private _outStr = _lines joinString (toString [13, 10]);
copyToClipboard _outStr;

// close dialog
closeDialog 1;

// return
true
