/*
    Author: ianbanks from <https://foxhound.international/sqf-snippets/export-arma-3-to-terrain-builder>

    Description:
    Dot product of a matrix.

    Parameter(s);
    1: MATRIX
    2: MATRIX

    Return:
    ARRAY

    Example:
    [_matrix1, _matrix2] call SCAR_E2TB_fnc_matrixVectorMultiply
*/

params ["_matrix", "_v"];

_matrix params ["_x", "_y", "_z"];

[
    _x vectorDotProduct _v,
    _y vectorDotProduct _v,
    _z vectorDotProduct _v
]
