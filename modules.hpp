class Logic;
class Module_F: Logic
{
    class AttributesBase
    {
        class Edit;
        class Combo;
        class Checkbox;
    };
};

class SCAR_E2TB_Module: Module_F
{
    // defines
    displayName = $STR_SCAR_E2TB_Module;
    category    = "SCAR_E2TB_Category";

    // init
    scope              = 2;
    isGlobal           = 1;
    isTriggerActivated = 0;
    isDisposable       = 0;
    function           = "SCAR_E2TB_fnc_initModule";
 	functionPriority   = 1;
};
