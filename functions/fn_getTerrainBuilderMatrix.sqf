/*
    Author: ianbanks from <https://foxhound.international/sqf-snippets/export-arma-3-to-terrain-builder>

    Description:
    Converts a rotation matrix to TB's.

    Parameter(s);
    1: SCALAR  - X rotation.
    2: SCALAR  - Y rotation.
    3: SCALAR  - Z rotation.

    Return:
    ARRAY

    Example:
    [_x, _y, _z] call SCAR_E2TB_fnc_getTerrainBuilderMatrix
*/

params ["_x", "_y", "_z"];

// return
[
    [cos _y * cos _z - sin _x * sin _y * sin _z, cos _z * sin _x * sin _y + cos _y * sin _z, cos _x * sin _y],
    [-cos _x * sin _z, cos _x * cos _z, -sin _x],
    [-cos _z * sin _y - cos _y * sin _x * sin _z, cos _y * cos _z * sin _x - sin _y * sin _z, cos _x * cos _y]
]
