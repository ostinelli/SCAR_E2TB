/*
    Authors: _SCAR, ianbanks

    Description:
    Exports all provided entities to the clipboard.

    Parameter(s);
    0: ARRAY of ENTITIES

    Return:
    true

    Example:
    [_entities] call SCAR_E2TB_fnc_copyObjectsStringToClipboard

    Thank you:
    @Lappihuan @zgmrvn @mikero @W4lly63
    @ianbanks @Ice @cring0 @Adanteh @HorribleGoat @T_D
    ...and all the other folks involved in the discussions in Discord's Arma3 #terrain_makers channel
    in those memorable days of October 18th and 19th 2017.


    LICENSE IS MIT. keep this header if you use it elsewhere.
*/

params ["_entities"];

#define DECIMALS 8

// inits
private _entries = [];

// loop objects
{
    // model
    private _modelInfo = (getModelInfo _x) select 0;

    if (
        !(_x isKindOf "Logic") &&
        !(_x IsKindOf "Man") &&
        !(isObjectHidden _x) &&
        !(isNil "_modelInfo")
    ) then {
        // init
        private ["_rotX", "_rotY", "_rotZ"];

        //  name
        private _modelName = (_modelInfo splitString ".") select 0;

        // position
        private _pos  = getPosATL _x;
        _pos params ["_posX", "_posY", "_posZ"];
        _posX = _posX + 200000; // TB eastern offset

        // compute angles
        private _up    = vectorUp _x;
        private _dir   = vectorDir _x;
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

        // scale
        private _scale = _x getVariable ["xCamScaleVal", objNull];                                    // XCam
        if (_scale isEqualTo objNull) then { _scale = _x getVariable ["Sp_var_scale", objNull]; };    // Surface Painter
        if (_scale isEqualTo objNull) then { _scale = _x getVariable ["MB_ObjVar_Scale", objNull]; }; // Map Builder
        if (_scale isEqualTo objNull) then { _scale = 1; };
        if ((typeName _scale) == "STRING") then { _scale = parseNumber(_scale); };

        // build line
        private _values = [_posX, _posY, _rotZ, _rotX, _rotY, _scale, _posZ] apply { _x toFixed DECIMALS };
        private _entry = ([str _modelName] + _values) joinString ";";

        // push
        _entries pushBack _entry;
    };
} forEach _entities;

// join & copy
private _outStr = _entries joinString (toString [13, 10]);
copyToClipboard _outStr;

// return
true
