class ctrlMenuStrip;
class display3DEN
{
    class Controls
    {
        class MenuStrip: ctrlMenuStrip
        {
            class Items
            {
                class MissionExport {
                    items[] += {"MissionTerrainBuilderLbt"};
                };

                class MissionTerrainBuilderLbt {
                    text   = "$STR_SCAR_E2TB_3DEN_MenuBar";
                    data   = "MissionExportTerrainBuilderLbt";
                    action = "[] spawn SCAR_E2TB_fnc_exportFrom3DEN;";
                };
            };
        };
    };
};

class Cfg3DEN {
    class Notifications {
        class SCAR_E2TB_exportDone {
            text = "$STR_SCAR_E2TB_CopiedToClipboard";
            isWarning = 0;
        };
    };
};
