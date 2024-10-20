class CfgPatches {
	class a3_dg_waterMission {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};
class CfgFunctions {
	class DGWaterMission {
		tag = "DGWaterMission";
		class Main {
			file = "\x\addons\a3_dg_waterMission\init";
			class init {
				postInit = 1;
			};
		};
		class compileFunctions {
			file = "x\addons\a3_dg_waterMission\functions";
			class selectMagazine {};
		};
	};
};
