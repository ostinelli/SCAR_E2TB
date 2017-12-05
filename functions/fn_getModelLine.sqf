/*
    Authors: _SCAR, ianbanks

    Description:
    Create the export line for the provided model.

    Parameter(s):
    OBJECT

    Return:
    STRING

    Example:
    _object call SCAR_E2TB_fnc_getModelLine

    Thank you:
    @Lappihuan @zgmrvn @mikero @W4lly63
    @ianbanks @Ice @cring0 @Adanteh @HorribleGoat @T_D
    ...and all the other folks involved in the discussions in Discord's Arma3 #terrain_makers channel
    in those memorable days of October 18th and 19th 2017.


    LICENSE IS MIT. keep this header if you use it elsewhere.
*/

private _obj = _this;

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
    // init
    private ["_rotX", "_rotY", "_rotZ"];

    // position
    private _pos  = getPosATL _obj;
    _pos params ["_posX", "_posY", "_posZ"];
    _posX = _posX + 200000; // TB eastern offset

    // compute angles
    private _slopeModels = call SCAR_E2TB_fnc_slopeModels;
    if (_modelName in _slopeModels) then {
        // these objects behave differently in EDEN and in TB, so we need to approximate and just set these objects on the ground
        _rotX = 0;
        _rotY = 0;
        _rotZ = getDirVisual _obj;
        _posZ = 0;
    } else {
        private _up    = vectorUp _obj;
        private _dir   = vectorDir _obj;
        private _aside = _dir vectorCrossProduct _up;

        // from <https://foxhound.international/sqf-snippets/export-arma-3-to-terrain-builder>
        if (abs (_up select 1) < 0.999999) then {
            _rotX = -asin (_up select 1);

            private _signCosX = if (cos _rotX < 0) then { -1 } else { 1 };

            _rotY = ((_up select 0) * _signCosX) atan2 ((_up select 2) * _signCosX);
            _rotZ = (-(_aside select 1) * _signCosX) atan2 ((_dir select 1) * _signCosX);
        } else {
            _rotZ = 0;

            if (_up select 1 < 0) then {
                _rotX = 90;
                _rotY = (_dir select 0) atan2 (_dir select 2);
            } else {
                _rotX = -90;
                _rotY = (-(_dir select 0)) atan2 (-(_dir select 2));
            };
        };
    };

    // scale
    private _scale = _obj getVariable ["xCamScaleVal", objNull];                                    // XCam
    if (_scale isEqualTo objNull) then { _scale = _obj getVariable ["Sp_var_scale", objNull]; };    // Surface Painter
    if (_scale isEqualTo objNull) then { _scale = _obj getVariable ["MB_ObjVar_Scale", objNull]; }; // Map Builder
    if (_scale isEqualTo objNull) then { _scale = 1; };
    if ((typeName _scale) == "STRING") then { _scale = parseNumber(_scale); };

    // build line
    private _values = [_posX, _posY, _rotZ, _rotX, _rotY, _scale, _posZ] apply { _x toFixed DECIMALS };

    _line = ([str _modelName] + _values) joinString ";";
};

// return
_line
