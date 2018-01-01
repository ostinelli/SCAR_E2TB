/*
    Authors: ianbanks, _SCAR

    Description:
    Gets the position of the model in TB.

    Parameter(s);
    0: OBJECT
    1: STRING  -  model name
    2: BOOLEAN - true for absolute positioning, false for relative.
    3: SCALAR  - the object's scale.
    4: SCALAR  - X rotation according to TB's matrix.
    5: SCALAR  - Y rotation according to TB's matrix.
    6: SCALAR  - Z rotation according to TB's matrix.

    Return:
    ARRAY [_posX, _posY, _posZ]

    Example:
    [_object, "t_ficusb1s_f", false, 0.87, _rotX, _rotY, _rotZ] call SCAR_E2TB_fnc_getPos
*/

params ["_obj", "_modelName", "_isAbsolute", "_scale", "_rotX", "_rotY", "_rotZ"];

private _pos = if (_isAbsolute) then {
    // absolute

    private _posATL = getPosATL _obj;

    if (_modelName in SCAR_E2TB_slopeModels) then {
        // force object on ground if slope model
        ATLtoASL [_posATL select 0, _posATL select 1, 0];

    } else {
        // from <https://foxhound.international/sqf-snippets/export-arma-3-to-terrain-builder>
        private _posWorld                   = getPosWorld _obj;
        private _terrainBuilderMatrix       = [_rotX, _rotY, _rotZ] call SCAR_E2TB_fnc_getTerrainBuilderMatrix;
        private _terrainBuilderGround       = [_terrainBuilderMatrix, boundingCenter _obj] call SCAR_E2TB_fnc_matrixVectorMultiply;
        private _terrainBuilderScaledGround = _terrainBuilderGround vectorMultiply _scale;
        private _terrainBuilderPosition     = _posWorld vectorDiff [0, 0, _terrainBuilderScaledGround select 2];

        _terrainBuilderPosition
    };
} else {
    // relative

    if (_modelName in SCAR_E2TB_slopeModels) then {
        // force object on ground if slope model
        [_posATL select 0, _posATL select 1, 0];
    } else {
        _posATL
    };
};

// extract
_pos params ["_posX", "_posY", "_posZ"];

// offset
_posX = _posX + 200000; // TB eastern offset

// return
[_posX, _posY, _posZ]
