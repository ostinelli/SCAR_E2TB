/*
    Author: _SCAR

    Description:
    Add actions to current player, if in SP.

    Return:
    true

    Example:
    [] call SCAR_E2TB_fnc_initModule
*/

private _activated = param [2, true, [true]];

if (_activated) then {
    if (hasInterface && !isMultiplayer) then {
        // wait
        waitUntil {!isNull player};
        // add action
        player addAction [
            format ["<t color='#2f8600'>%1</t>", (localize "STR_SCAR_E2TB_CopyToClipboard")],
            {
                [] spawn SCAR_E2TB_fnc_exportFromMission;
            },
            nil,  // arguments
            1,    // priority
            false // showWindow
        ];
    };
};

// return
true
