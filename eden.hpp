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
                    items[] += {"E2TBMissionTerrainBuilder"};
                };

                class E2TBMissionTerrainBuilder {
                    text   = "$STR_SCAR_E2TB_3DEN_MenuBar";
                    data   = "E2TBMissionTerrainBuilder";
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
