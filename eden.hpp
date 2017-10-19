class ctrlMenuStrip;
class display3DEN
{
    class Controls
    {
        class MenuStrip: ctrlMenuStrip
        {
            class Items
            {
                class Tools
                {
                    items[] += {"scar_E2TB_ExportTool"}; // += must be used; you want to expand the array, not override it!
                };
                class scar_E2TB_ExportTool
                {
                    text    = $STR_SCAR_E2TB_EdenMenu;
                    picture = "\scar_e2tb\gfx\logo.paa";
                    action  = "[] call scar_E2TB_fnc_exportFrom3DEN;";
                };
            };
        };
    };
};

class Cfg3DEN {
    class Notifications {
        class SCAR_E2TB_exportDone {
            text = $STR_SCAR_E2TB_CopiedToClipboard;
            isWarning = 0;
        };
    };
};
