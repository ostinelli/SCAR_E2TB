/*
    Author: _SCAR

    Description:
    Exports all provided entities to the clipboard, in LBT format.
    There's probably still a gimbal lock that can occasionally be seen. Hopefully you won't.

    Parameter(s);
    0: ARRAY of ENTITIES

    Return:
    true

    Example:
    [_entities] call SCAR_E2TB_fnc_copyLbtStringToClipboard

    Thank you:
    @Lappihuan @zgmrvn @mikero @W4lly63
    @ianbanks @Ice @cring0 @Adanteh @HorribleGoat @T_D
    ...and all the other folks involved in the discussions in Discord's Arma3 #terrain_makers channel
    in those memorable days of October 18th and 19th 2017.


    LICENSE IS MIT. keep this header if you use it elsewhere.
*/

#define DECIMALS 8

params ["_entities"];

// inits
private _lb      = toString [13, 10];
private _exports = [format["objects%1", _lb]];

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
        //  name
        private _modelName = (_modelInfo splitString ".") select 0;

        // position
        private _pos  = getPosATL _x;
        private _posX = ((_pos select 0) + 200000); // TB eastern offset
        private _posY = (_pos select 1);
        private _posZ = (_pos select 2);

        // pos
        private _up    = vectorUp _x;
        private _dir   = vectorDir _x;
        private _aside = _dir vectorCrossProduct _up;

        // decomp
        _up params ["_upX", "_upY", "_upZ"];
        _dir params ["_dirX", "_dirY", "_dirZ"];
        _aside params ["_asideX", "_asideY", "_asideZ"];

        // build line with COLUMN format
        private _entry = format["%1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 0 %13%14",
            _asideX toFixed DECIMALS, _asideZ toFixed DECIMALS, _asideY toFixed DECIMALS,
            _upX toFixed DECIMALS, _upZ toFixed DECIMALS, _upY toFixed DECIMALS,
            _dirX toFixed DECIMALS, _dirZ toFixed DECIMALS, _dirY toFixed DECIMALS,
            _posX toFixed DECIMALS, _posZ toFixed DECIMALS, _posY toFixed DECIMALS,
            _modelName, _lb
        ];

        // push
        _exports pushBack _entry;
	};
} forEach _entities;

// join
_exports pushBack (format ["end objects%1",_lb]);

// copy
copyToClipboard (_exports joinString "");

// return
true
