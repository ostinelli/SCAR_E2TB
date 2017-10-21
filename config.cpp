class CfgPatches
{
    class SCAR_E2TB
    {
        name = "Eden to Terrain Builder Exporter";
        author = "_SCAR";
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.0;
        requiredAddons[] = {
            "3den"
        };
        fileName = "scar_e2tb.pbo";
    };
};

class CfgFactionClasses
{
    class NO_CATEGORY;
    class SCAR_E2TB_Category: NO_CATEGORY
    {
        displayName = "E2TB";
    };
};

class CfgVehicles
{
    #include "modules.hpp"
};

#include "functions.hpp"
#include "gui.hpp"
#include "eden.hpp"
