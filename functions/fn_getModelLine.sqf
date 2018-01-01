/*
    Author: _SCAR

    Description:
    Create the export line for the provided model.

    Parameter(s);
    0: OBJECT
    1: BOOLEAN - true for absolute positioning, false for relative.

    Return:
    STRING

    Example:
    [_object, false] call SCAR_E2TB_fnc_getModelLine

    Thank you:
    @ianbanks @Ice @cring0 @Adanteh @HorribleGoat @T_D
    @Lappihuan @zgmrvn @mikero @W4lly63
    ...and all the other folks involved in the discussions in Discord's Arma3 #terrain_makers channel
    in those memorable days of October 18th and 19th 2017.


    LICENSE IS MIT. keep this header if you use it elsewhere.
*/

params ["_obj", "_isAbsolute"];

#define DECIMALS 8

// model
private _line     = objNull;
private _modelP3d = (getModelInfo _obj) select 0;
if (isNil "_modelP3d") exitWith { _line; };

// model name
private _modelName = toLower((_modelP3d splitString ".") select 0);

if (
    !(_obj isKindOf "Logic") &&
    !(_obj IsKindOf "Man") &&
    !(isObjectHidden _obj) &&
    !(_modelName in SCAR_E2TB_ignoreModels)
) then {

    // get scale
    private _scale = _obj call SCAR_E2TB_fnc_getScale;
    // get angles
    ([_obj, _modelName] call SCAR_E2TB_fnc_getAngles) params ["_rotX", "_rotY", "_rotZ"];
    // get position
    ([_obj, _modelName, _isAbsolute, _scale, _rotX, _rotY, _rotZ] call SCAR_E2TB_fnc_getPos) params ["_posX", "_posY", "_posZ"];

    // build line
    private _values = [_posX, _posY, _rotZ, _rotX, _rotY, _scale, _posZ] apply { _x toFixed DECIMALS };

    _line = ([str _modelName] + _values) joinString ";";
};

// return
_line
