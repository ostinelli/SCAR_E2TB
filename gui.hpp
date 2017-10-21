class RscPicture;
class RscText;
class RscProgress;

class SCAR_E2TB_ProgressBar
{
    show = 0;
    movingEnable = 0;
    idd = -1;
	onLoad = "uiNamespace setVariable [""SCAR_E2TB_ProgressBar_Display"", (_this select 0)];";
	onUnload = "uiNamespace setVariable [""SCAR_E2TB_ProgressBar_Display"", nil];";

    class ControlsBackground {

        class SCAR_E2TB_Select_Mainback: RscPicture
        {

            idc = -1;
            x = 0.2 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.02 * safezoneH;
            moving = 0;
            text = "#(argb,8,8,3)color(0,0,0,0.7)";
        };
    };

    class Controls
    {
        class SCAR_E2TB_ProgressBar_Text: RscText
        {
            idc = 34516;
            text = "";
            style = 0x02;  // center
            x = 0.2 * safezoneW + safezoneX;
            y = 0.268 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.04 * safezoneH;
        };
        class SCAR_E2TB_ProgressBar_Bar: RscProgress
        {
            idc = 34517;
            text = "";
            x = 0.2 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.6 * safezoneW;
            h = 0.02 * safezoneH;
            colorFrame[] = {0, 0, 0, 1};
        };
    };
};
