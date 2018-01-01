/*
    Authors: ianbanks, _SCAR

    Description:
    Gets the rotation angles of the model converted according to the TB matrix.

    Parameter(s);
    0: OBJECT
    1: STRING: model name

    Return:
    ARRAY [_rotX, _rotY, _rotZ]

    Example:
    [_object, "t_ficusb1s_f"] call SCAR_E2TB_fnc_getAngles
*/

params ["_obj", "_modelName"];

// init
private ["_rotX", "_rotY", "_rotZ"];

if (_modelName in SCAR_E2TB_slopeModels) then {
    // these objects have been build to stay on ground and follow slope, so ignore rotations except Z
    _rotX = 0;
    _rotY = 0;
    _rotZ = getDirVisual _obj;
} else {
    // compute TB angles
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

// return
[_rotX, _rotY, _rotZ]
