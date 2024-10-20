
DGWM_MessageName = "[DG Water Mission]:";

diag_log format["%1 Initialized", DGWM_MessageName];

if (!isServer) exitWith {};

// CONFIG PART. EDIT AS YOU LIKE!

// Generic
DGWM_DebugMode			= false; // Only for creator. Leave it on false
DGWM_SleepTime			= 30;
DGWM_MinAmountPlayers	= 0; // Amount of players required to start the missions spawning. Set to 0 (default) to have no wait time for players

// Timers
DGWM_TMin				= 2;	// Minimum time in minutes to spawn a new mission 
DGWM_TMax				= 10;	// Maximum time in minutes to spawn a new mission 

// Mission setup
DGWM_MaxMissions		= 3; // Maximum amount of active missions at the same time.
DGWM_TimeOut			= 30; // Mission Time out time in minutes
DGWM_PlayerSearchRadius	= 1500; // Amount of meters to search for nearby players. If no players are nearby, the mission can time out.
DGWM_MinRange			= 2000; // Minimum amount of meters between active missions. Does not apply when static missions are being used.
DGWM_PatrolAtSea		= true; // Let the spawned ships patrol around a radius
DGWM_PatrolRadius		= 125; // Radius in which the AI will patrol.
DGWM_UseStaticLocations	= false; // If set to true, static spawn positions from below will be used. If set to false, the script will use dynamic mission locations
DGWM_StaticLocations 	= 	[ // Define your static positions here. 
								[15257.1,16606.4,0],
								[15073.7,16749.7,0],
								[15412.8,16290,0]
							]; 
DGWM_CompletionMode		= 2; // 0 = All AI needs to be killed | 1 = Player inside DGWM_CompletionRange. 2 = Both (default)
DGWM_CompletionRange	= 75; // Amount of meters a player needs to be away from the loot crate in order to complete the mission.
DGWM_LootCounts 		=	[20,4,4,3,3,15]; // Maximum number of items to be filled inside the loot crates. Array in this range -> weapons | optics | vests | backpack | headgear | items 			
DGWM_LootPoptabsMin 	= 1000;
DGWM_LootPoptabsMax 	= 20000;		
		
// Marker setup
DGWM_MarkerType			= "c_ship";
DGWM_MarkerColor		= "ColorRed";
DGWM_MarkerText			= ["Pirates", "Corrupt Fishermen", "Drug Smugglers", "Illegal Divers", "Treasure Hunters"];
DGWM_MarkerSize			= 1; // Size of the icon and text. Range from [0-1]. For example, 0.6 will make it 60%
DGWM_CountAliveAI		= true; // Add a counter next to the marker how much AI is still alive.

// Prop setup
DGWM_UseProp			= true; // Spawn a random prop (building) at the marker. 
DGWM_PropList			=	[
								"CUP_Winter_obj_Wreck_Ship_1",
								"Land_Boat_06_wreck_F",
								"Land_Boat_04_wreck_F",
								"Land_UWreck_FishingBoat_F",
								"Land_Wreck_Traw2_F",
								"Land_Wreck_Traw_F",
								"Land_Wreck_Plane_Transport_01_F",
								"Land_UWreck_MV22_F",
								"Land_Wreck_C130J_EP1_ruins"
							];

// Boats setup
DGWM_BigBoats			= 	[0, 1]; // [minimum, maximum] amount of big boats that will be patrolling the area
DGWM_BigBoatCrewPer		=	25; // Percentage of seats needed to be filled with AI. Differs per vehicle. Will be rounded up.
DGWM_SmallBoats			= 	[1, 3]; // [minimum, maximum] amount of small boats that will be patrolling the area
DGWM_SmallBoatCrewPer	=	75; // Percentage of seats needed to be filled with AI. Differs per vehicle. Will be rounded up.
DGWM_BigBoatTypes		=	[
								"CUP_B_RHIB_HIL",
								"CUP_B_RHIB2Turret_HIL",
								"B_Boat_Armed_01_minigun_F",
								"CUP_O_LCVP_SLA",
								"rhsusf_mkvsoc",
								"CUP_C_Fishing_Boat_Chernarus",
								"O_Boat_Armed_01_hmg_F"
							];
DGWM_SmallBoatTypes		=	[
								"B_G_Boat_Transport_01_F",
								"CUP_B_HIL_Boat_Transport_01_F",
								"CUP_B_Zodiac_USMC",
								"CUP_O_PBX_RU",
								"I_C_Boat_Transport_02_F",
								"C_Boat_Civil_01_F",
								"C_Boat_Transport_02_F",
								"Exile_Boat_WaterScooter"
							];

// AI Setup
DGWM_EnableDivers		= true; // Apart from the ships, also spawn divers around the crate position.
DGWM_DiverCount			= [1, 5]; // [minimum, maximum] amount of divers a random number between these values will be used.
DGWM_DiverUnderwaterGun	= true; // If set to true, divers will be spawned with SDAR.
DGWM_AIMoney			= 100; // Maximum amount of poptabs on the unit
DGWM_MaxInventoryItems	= 5; // Maximum amount of inventory items.

DGWM_AIWeapons			=	[
								"arifle_Katiba_F",
								"arifle_Katiba_C_F",
								"arifle_Katiba_GL_F",
								"arifle_MXC_F",
								"arifle_MX_F",
								"arifle_MX_GL_F",
								"arifle_MXM_F",
								"arifle_SDAR_F",
								"arifle_TRG21_F",
								"arifle_TRG20_F",
								"arifle_TRG21_GL_F",
								"arifle_Mk20_F",
								"arifle_Mk20C_F",
								"arifle_Mk20_GL_F",
								"arifle_Mk20_plain_F",
								"arifle_Mk20C_plain_F",
								"arifle_Mk20_GL_plain_F",
								"srifle_EBR_F",
								"srifle_GM6_F",
								"srifle_LRR_F",
								"srifle_DMR_01_F",
								// "CUP_srifle_M107_Desert",
								// "CUP_srifle_M107_Pristine",
								// "CUP_srifle_M107_Snow",
								// "CUP_srifle_M107_Woodland",
								"MMG_02_sand_F",
								"MMG_02_black_F",
								"MMG_02_camo_F",
								"MMG_01_hex_F",
								"MMG_01_tan_F",
								"srifle_DMR_05_blk_F",
								"srifle_DMR_05_hex_F",
								"srifle_DMR_05_tan_F"
							];
DGWM_AIWeaponOptics		=	[
								"bipod_01_F_snd",
								"bipod_02_F_blk",
								"optic_LRPS",
								"optic_LRPS_tna_F",
								"optic_LRPS_ghex_F",
								"optic_Nightstalker",
								"optic_DMS",
								"RPG32_F",
								"optic_tws",
								"optic_tws_mg",
								"optic_AMS","optic_AMS_khk","optic_AMS_snd",
								"optic_DMS",
								"optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan",
								"optic_LRPS",
								"optic_Nightstalker",
								"optic_NVS",
								"optic_SOS",
								"optic_tws"
							];
DGWM_AIVests			=	[
								"V_Press_F",
								"V_Rangemaster_belt",
								"V_TacVest_blk",
								"V_TacVest_blk_POLICE",
								"V_TacVest_brn",
								"V_TacVest_camo",
								"V_TacVest_khk",
								"V_TacVest_oli",
								"V_TacVestCamo_khk",
								"V_TacVestIR_blk",
								"V_I_G_resistanceLeader_F",
								"V_BandollierB_blk",
								"V_BandollierB_cbr",
								"V_BandollierB_khk",
								"V_BandollierB_oli",
								"V_BandollierB_rgr",
								"V_Chestrig_blk",
								"V_Chestrig_khk",
								"V_Chestrig_oli",
								"V_Chestrig_rgr",
								"V_HarnessO_brn",
								"V_HarnessO_gry",
								"V_HarnessOGL_brn",
								"V_HarnessOGL_gry",
								"V_HarnessOSpec_brn",
								"V_HarnessOSpec_gry",
								"V_PlateCarrier1_blk",
								"V_PlateCarrier1_rgr",
								"V_PlateCarrier2_rgr",
								"V_PlateCarrier3_rgr",
								"V_PlateCarrierGL_blk",
								"V_PlateCarrierGL_mtp",
								"V_PlateCarrierGL_rgr",
								"V_PlateCarrierH_CTRG",
								"V_PlateCarrierIA1_dgtl",
								"V_PlateCarrierIA2_dgtl",
								"V_PlateCarrierIAGL_dgtl",
								"V_PlateCarrierIAGL_oli",
								"V_PlateCarrierL_CTRG",
								"V_PlateCarrierSpec_blk",
								"V_PlateCarrierSpec_mtp"
							];
DGWM_Backpacks			=	[
								"B_Carryall_ocamo",
								"B_Carryall_oucamo",
								"B_Carryall_mcamo",
								"B_Carryall_oli",
								"B_Carryall_khk",
								"B_Carryall_cbr"
							];
DGWM_Headgear 			=	[
								"H_Cap_blk",
								"H_Cap_blk_Raven",
								"H_Cap_blu",
								"H_Cap_brn_SPECOPS",
								"H_Cap_grn",
								"H_Cap_headphones",
								"H_Cap_khaki_specops_UK",
								"H_Cap_oli",
								"H_Cap_press",
								"H_Cap_red",
								"H_Cap_tan",
								"H_Cap_tan_specops_US",
								"H_Watchcap_blk",
								"H_Watchcap_camo",
								"H_Watchcap_khk",
								"H_Watchcap_sgg",
								"H_MilCap_blue",
								"H_MilCap_dgtl",
								"H_MilCap_mcamo",
								"H_MilCap_ocamo",
								"H_MilCap_oucamo",
								"H_MilCap_rucamo",
								"H_Bandanna_camo",
								"H_Bandanna_cbr",
								"H_Bandanna_gry",
								"H_Bandanna_khk",
								"H_Bandanna_khk_hs",
								"H_Bandanna_mcamo",
								"H_Bandanna_sgg",
								"H_Bandanna_surfer",
								"H_Booniehat_dgtl",
								"H_Booniehat_dirty",
								"H_Booniehat_grn",
								"H_Booniehat_indp",
								"H_Booniehat_khk",
								"H_Booniehat_khk_hs",
								"H_Booniehat_mcamo",
								"H_Booniehat_tan",
								"H_Hat_blue",
								"H_Hat_brown",
								"H_Hat_camo",
								"H_Hat_checker",
								"H_Hat_grey",
								"H_Hat_tan",
								"H_StrawHat",
								"H_StrawHat_dark",
								"H_Beret_02",
								"H_Beret_blk",
								"H_Beret_blk_POLICE",
								"H_Beret_brn_SF",
								"H_Beret_Colonel",
								"H_Beret_grn",
								"H_Beret_grn_SF",
								"H_Beret_ocamo",
								"H_Beret_red",
								"H_Shemag_khk",
								"H_Shemag_olive",
								"H_Shemag_olive_hs",
								"H_Shemag_tan",
								"H_ShemagOpen_khk",
								"H_ShemagOpen_tan",
								"H_TurbanO_blk",
								"H_CrewHelmetHeli_B",
								"H_CrewHelmetHeli_I",
								"H_CrewHelmetHeli_O",
								"H_HelmetCrew_I",
								"H_HelmetCrew_B",
								"H_HelmetCrew_O",
								"H_PilotHelmetHeli_B",
								"H_PilotHelmetHeli_I",
								"H_PilotHelmetHeli_O"	
							];
DGWM_Helmets 			=	[
								"H_HelmetB",
								"H_HelmetB_black",
								"H_HelmetB_camo",
								"H_HelmetB_desert",
								"H_HelmetB_grass",
								"H_HelmetB_light",
								"H_HelmetB_light_black",
								"H_HelmetB_light_desert",
								"H_HelmetB_light_grass",
								"H_HelmetB_light_sand",
								"H_HelmetB_light_snakeskin",
								"H_HelmetB_paint",
								"H_HelmetB_plain_blk",
								"H_HelmetB_sand",
								"H_HelmetB_snakeskin",
								"H_HelmetCrew_B",
								"H_HelmetCrew_I",
								"H_HelmetCrew_O",
								"H_HelmetIA",
								"H_HelmetIA_camo",
								"H_HelmetIA_net",
								"H_HelmetLeaderO_ocamo",
								"H_HelmetLeaderO_oucamo",
								"H_HelmetO_ocamo",
								"H_HelmetO_oucamo",
								"H_HelmetSpecB",
								"H_HelmetSpecB_blk",
								"H_HelmetSpecB_paint1",
								"H_HelmetSpecB_paint2",
								"H_HelmetSpecO_blk",
								"H_HelmetSpecO_ocamo",
								"H_CrewHelmetHeli_B",
								"H_CrewHelmetHeli_I",
								"H_CrewHelmetHeli_O",
								"H_HelmetCrew_I",
								"H_HelmetCrew_B",
								"H_HelmetCrew_O",
								"H_PilotHelmetHeli_B",
								"H_PilotHelmetHeli_I",
								"H_PilotHelmetHeli_O",
								"H_Helmet_Skate",
								"H_HelmetB_TI_tna_F",
								"H_HelmetB_tna_F",
								"H_HelmetB_Enh_tna_F",
								"H_HelmetB_Light_tna_F",
								"H_HelmetSpecO_ghex_F",
								"H_HelmetLeaderO_ghex_F",
								"H_HelmetO_ghex_F",
								"H_HelmetCrew_O_ghex_F"			
							];
DGWM_HeadgearList = DGWM_Headgear + DGWM_Helmets;

DGWM_AIItems 			=	[
								"Exile_Item_InstaDoc",
								"Exile_Item_BBQSandwich",
								"Exile_Item_BeefParts",
								"Exile_Item_Catfood",
								"Exile_Item_Cheathas",
								"Exile_Item_ChristmasTinner",
								"Exile_Item_Dogfood",
								"Exile_Item_EMRE",
								"Exile_Item_GloriousKnakworst",
								"Exile_Item_InstantCoffee",
								"Exile_Item_MacasCheese",
								"Exile_Item_Moobar",
								"Exile_Item_Noodles",
								"Exile_Item_Raisins",
								"Exile_Item_SausageGravy",
								"Exile_Item_SeedAstics",
								"Exile_Item_Surstromming"
							];

//This defines the skin list, some skins are disabled by default to permit players to have high visibility uniforms distinct from those of the AI.
DGWM_SkinList 			=	[
								"Exile_Uniform_Woodland",
								"U_BG_Guerilla1_1",
								"U_BG_Guerilla2_1",
								"U_BG_Guerilla2_2",
								"U_BG_Guerilla2_3",
								"U_BG_Guerilla3_1",
								"U_BG_Guerrilla_6_1",
								"U_BG_leader",
								"U_B_CTRG_1",
								"U_B_CTRG_2",
								"U_B_CTRG_3",
								"U_B_CombatUniform_mcam",
								"U_B_CombatUniform_mcam_tshirt",
								"U_B_CombatUniform_mcam_vest",
								"U_B_CombatUniform_mcam_worn",
								"U_B_HeliPilotCoveralls",
								"U_B_PilotCoveralls",
								"U_B_SpecopsUniform_sgg",
								"U_B_Wetsuit",
								"U_B_survival_uniform",
								"U_C_HunterBody_grn",
								"U_C_Journalist",
								"U_C_Poloshirt_blue",
								"U_C_Poloshirt_burgundy",
								"U_C_Poloshirt_salmon",
								"U_C_Poloshirt_stripped",
								"U_C_Poloshirt_tricolour",
								"U_C_Poor_1",
								"U_C_Poor_2",
								"U_C_Poor_shorts_1",
								"U_C_Scientist",
								"U_Competitor",
								"U_IG_Guerilla1_1",
								"U_IG_Guerilla2_1",
								"U_IG_Guerilla2_2",
								"U_IG_Guerilla2_3",
								"U_IG_Guerilla3_1",
								"U_IG_Guerilla3_2",
								"U_IG_leader",
								"U_I_CombatUniform",
								"U_I_CombatUniform_shortsleeve",
								"U_I_CombatUniform_tshirt",
								"U_I_G_Story_Protagonist_F",
								"U_I_G_resistanceLeader_F",
								"U_I_HeliPilotCoveralls",
								"U_I_OfficerUniform",
								"U_I_Wetsuit",
								"U_I_pilotCoveralls",
								"U_NikosAgedBody",
								"U_NikosBody",
								"U_O_CombatUniform_ocamo",
								"U_O_CombatUniform_oucamo",
								"U_O_OfficerUniform_ocamo",
								"U_O_PilotCoveralls",
								"U_O_SpecopsUniform_blk",
								"U_O_SpecopsUniform_ocamo",
								"U_O_Wetsuit",
								"U_OrestesBody",
								"U_Rangemaster",
								"U_B_FullGhillie_ard",
								"U_B_FullGhillie_lsh",
								"U_B_FullGhillie_sard",
								"U_B_GhillieSuit",
								"U_I_FullGhillie_ard",
								"U_I_FullGhillie_lsh",
								"U_I_FullGhillie_sard",
								"U_I_GhillieSuit",
								"U_O_FullGhillie_ard",
								"U_O_FullGhillie_lsh",
								"U_O_FullGhillie_sard",
								"U_O_GhillieSuit"
							];

/*Exile Toasts Notification Settings*/
DGWM_ExileToasts_Title_Size		= 23;						// Size for Client Exile Toasts  mission titles.
DGWM_ExileToasts_Title_Font		= "puristaMedium";			// Font for Client Exile Toasts  mission titles.
DGWM_ExileToasts_Message_Color	= "#FFFFFF";				// Exile Toasts color for "ExileToast" client notification type.
DGWM_ExileToasts_Message_Size	= 19;						// Exile Toasts size for "ExileToast" client notification type.
DGWM_ExileToasts_Message_Font	= "PuristaLight";			// Exile Toasts font for "ExileToast" client notification type.
/*Exile Toasts Notification Settings*/

if(DGWM_DebugMode) then 
{
	diag_log format['%1 Running in Debug mode!',DGWM_MessageName];
	//DGWM_UseStaticLocations = true;
	DGWM_TMin				= 0.1;	// 6 seconds
	DGWM_TMax				= 0.5;	// 30 seconds
	//DGWM_TimeOut			= 1;
	//DGWM_PlayerSearchRadius	= 500; // 150 meter
	//DGWM_BigBoats			= [0, 1];
};

DGWM_MissionQueue = []; //To count how much missions have active
if (DGWM_MinAmountPlayers > 0) then
{
	diag_log format ["%1 Waiting for %2 players to be online.",DGWM_MessageName, DGWM_MinAmountPlayers];
	waitUntil { uiSleep 5; count( playableUnits ) > ( DGWM_MinAmountPlayers - 1 ) };
};
diag_log format ["%1 %2 players reached. Initializing main loop of missions",DGWM_MessageName, DGWM_MinAmountPlayers];

// Sleep until first spawn
_initialWaitTime =  (DGWM_TMin * 60) + random((DGWM_TMax *60) - (DGWM_TMin *60));
diag_log format["%1 Waiting %2 seconds before first mission spawn", DGWM_MessageName, _initialWaitTime];
uiSleep _initialWaitTime; // Wait until the random counter started

_middle = worldSize / 2;
_center = [_middle,_middle,0];

_reInitialize = true; // Only initialize this when _reInitialize is true

while {true} do // Main Loop
{
	// if(DGWM_DebugMode) then
	// {
		// _players = allPlayers - (entities "HeadlessClient_F");
		// {	
			// _x allowDamage false; // God mode
		// } foreach _players;
	// };
	if(_reInitialize) then
	{	
		_reInitialize = false;
		_missionPos = nil;
		_isStatic = false;
		
		if(DGWM_UseStaticLocations) then
		{
			_attempt = 1;
			while {true} do
			{
				diag_log format["%1 Attempting to find static position [attempt = %2]", DGWM_MessageName, _attempt];
				if (_attempt >= DGWM_MaxMissions) exitWith {
					diag_log format["%1 Unable to find valid static position after % 2 attempts! Skipping mission spawn!", DGWM_MessageName, _attempt];
					_missionPos = nil;
				};
				_missionPos = selectRandom DGWM_StaticLocations;
				if (isNil "_missionPos") exitWith
				{
					diag_log format["%1 No more static mission locations available! Spawning dynamic mission instead", DGWM_MessageName];
					
					_missionPos = [
						_center, // center of search area
						2, // min distance to search 
						_middle, // max distance to search
						0, // distance to nearest object
						2, // water mode [2 = water only]
						25, // max gradient
						0  // shoreMode [0 = anywhere]
					] call BIS_fnc_findSafePos;
					
					//_missionPos = [nil, ["ground"]] call BIS_fnc_randomPos; // Select random water position instead!
					_isStatic = false;
				};
				_valid = true;
				{
					_pos = _x select 0;
					if(_pos isEqualTo _missionPos) exitWith 
					{
						_valid = false;
					};
				} forEach DGWM_MissionQueue;
				if (_valid) exitWith {
					_isStatic = true;
					diag_log format["%1 Found valid static position @ %2!", DGWM_MessageName, _missionPos];
					DGWM_StaticLocations deleteAt (DGWM_StaticLocations find _missionPos);
				};
				_missionPos = nil;
				_attempt = _attempt + 1;
			};
		} 
		else
		{
			_attempt = 1;
			diag_log format["%1 Attempting to find dynamic position [attempt = %2]", DGWM_MessageName, _attempt];
			//_missionPos = [nil, ["ground"]] call BIS_fnc_randomPos;

			_missionPos = [
				_center, // center of search area
				2, // min distance to search 
				_middle, // max distance to search
				0, // distance to nearest object
				2, // water mode [2 = water only]
				25, // max gradient
				0  // shoreMode [0 = anywhere]
			] call BIS_fnc_findSafePos;
		};
		
		if !(isNil "_missionPos") then
		{
			_markerText = selectRandom DGWM_MarkerText;
			_lootCrate = createVehicle ["Exile_Container_SupplyBox", _missionPos, [], 0, "CAN_COLLIDE"]; // We will also use this crate as variable counter!!!
			_lootCrate setPosATL [_missionPos select 0, _missionPos select 1, 4];
			_lootCrate allowDamage false;
			_lootCrate setVariable ["ExileIsPersistent", false];
			_missionMarker = createMarker [format ["%1_%2_%3", "_waterMission", _missionPos select 0, _missionPos select 1], _missionPos];
			_missionMarker setMarkerType DGWM_MarkerType;
			_missionMarker setMarkerSize [DGWM_MarkerSize, DGWM_MarkerSize];
			_missionMarker setMarkerColor DGWM_MarkerColor;
			_missionMarker setMarkerText _markerText;
			_mission = [_missionPos, _isStatic, _missionMarker, _lootCrate, _markerText];
			DGWM_MissionQueue pushBack _mission;
			_mission spawn
			{
				params ["_missionPos", "_isStatic", "_missionMarker", "_lootCrate", "_markerText"];
				["UAV_05"] remoteExec ["playSound",0];
				_startMsg = format ["%1 were spotted off the coast, intercept them @ %2",_markerText, mapGridPosition _missionPos];
				_startMsg remoteExecCall ["systemChat",-2];
				[
					"toastRequest",
					[
						"InfoEmpty",
						[
							format
							[
								"<t color='#ffff00' size='%1' font='%2'>%3</t><br/><t color='%4' size='%5' font='%6'>%7</t>",
								DGWM_ExileToasts_Title_Size,
								DGWM_ExileToasts_Title_Font,
								_markerText,
								DGWM_ExileToasts_Message_Color,
								DGWM_ExileToasts_Message_Size,
								DGWM_ExileToasts_Message_Font,
								_startMsg
							]
						]
					]
				] call ExileServer_system_network_send_broadcast;
				diag_log format["%1 Spawning mission [static = %2] @ %3", DGWM_MessageName, _isStatic, _missionPos];
				
				_missionTimer = 0;
				while {_missionTimer < (DGWM_TimeOut * 60)} do {
					_nearbyPlayers = allPlayers select {(_x distance _missionPos) < DGWM_PlayerSearchRadius};   //_missionPos nearEntities ["Exile_Unit_Player", DGWM_PlayerSearchRadius]; //nearestObjects [_missionPos, ["Exile_Unit_Player"], DGWM_PlayerSearchRadius];
					if ((count _nearbyPlayers) > 0) exitWith {
						_missionTimer = 0;
						diag_log format["%1 Mission %2 => Nearby player(s)! Time-out disabled", DGWM_MessageName, _this];
					};
					_missionTimer = _missionTimer + 1;
					uiSleep 1;
				};
				_timeOutMsg = format["The %1 packed everything and moved to another region", _markerText];
				if (_missionTimer > 0) exitWith // Timed Out
				{
					[
						"toastRequest",
						[
							"ErrorEmpty",
							[
								format
								[
									"<t color='#ff0000' size='%1' font='%2'>%3</t><br/><t color='%4' size='%5' font='%6'>%7</t>",
									DGWM_ExileToasts_Title_Size,
									DGWM_ExileToasts_Title_Font,
									_markerText,
									DGWM_ExileToasts_Message_Color,
									DGWM_ExileToasts_Message_Size,
									DGWM_ExileToasts_Message_Font,
									_timeOutMsg
								]
							]
						]
					] call ExileServer_system_network_send_broadcast;
					diag_log format["%1 Mission %2 => Timed Out (%3 seconds)! Cleaning up stuff now.", DGWM_MessageName, _this, _missionTimer];
					DGWM_MissionQueue deleteAt (DGWM_MissionQueue find _this);
					if (_isStatic) then
					{
						DGWM_StaticLocations pushBack _missionPos;
					};
					deleteMarker _missionMarker;
					deleteVehicle _lootCrate;
				};
				
				// Player is nearby, now spawn AI!
				_totalAICounter = 0;
				
				if (DGWM_UseProp) then
				{
					_propClass = selectRandom DGWM_PropList;
					_propPos = [_missionPos,0,20,0,2,20,0] call BIS_fnc_findSafePos;
					_wreck = createVehicle [_propClass, _propPos, [], 0, "CAN_COLLIDE"];
					_wreck allowDamage false;
					_wreck setPosATL [_propPos select 0, _propPos select 1, 0];
					_wreck setVariable ["ExileIsPersistent", false];
					diag_log format["%1 Mission %2 => Placed a [%3] @ %4", DGWM_MessageName, _this, _propClass, getPosATL _wreck];
				};
				
				_bigBoatMin = DGWM_BigBoats select 0;
				_bigBoatMax = DGWM_BigBoats select 1;
				_bigBoatAmount = round((_bigBoatMin) + random((_bigBoatMax) - (_bigBoatMin)));
				if(_bigBoatAmount > 0) then
				{
					diag_log format["%1 Mission %2 => Placing %3 'big' ships", DGWM_MessageName, _this, _bigBoatAmount];
					// Spawn big boat(s).
					for "_i" from 1 to _bigBoatAmount do 
					{ 
						_bigBoatClass = selectRandom DGWM_BigBoatTypes;
						_bigBoatPos = [_missionPos,25,250,0,2,20,0] call BIS_fnc_findSafePos;
						_bigBoat = createVehicle [_bigBoatClass, _bigBoatPos, [], 0, "CAN_COLLIDE"];
						_bigBoat allowDamage true;
						
						diag_log format["%1 Mission %2 => Created a[%3] @ %4", DGWM_MessageName, _this, _bigBoatClass, _bigBoatPos];
						_bigBoatSeats = count(fullCrew [_bigBoat, "", true]);
						_bigBoatCalc = (1 / 100 * DGWM_BigBoatCrewPer);
						_bigBoatMult = _bigBoatCalc * _bigBoatSeats;
						_bigBoatFill = round(_bigBoatMult);
						diag_log format["%1 Mission %2 => (%3) _bigBoatSeats= %4 | _bigBoatCalc= %5 | _bigBoatMult= %6", DGWM_MessageName, _this, _bigBoat, _bigBoatSeats, _bigBoatCalc, _bigBoatMult];
						if (_bigBoatFill < 1) then
						{
							_bigBoatFill = 1;
						};
						diag_log format["%1 Mission %2 => (%3) We will be adding %4 units to this %5", DGWM_MessageName, _this, _bigBoat, _bigBoatFill, _bigBoatClass];
						_bigBoatGroup = createGroup east;
						_bigBoatGroup setVariable ["_lootCrate", _lootCrate];
						for "_i" from 1 to _bigBoatFill do 
						{
							_unit = _bigBoatGroup createUnit ["O_A_soldier_F", _bigBoatPos, [], 0, "FORM"];
							_money = ceil(random(DGWM_AIMoney));
							_totalAICounter = _totalAICounter +1;
							_unit moveInAny _bigBoat; // Add unit to the ship
							_unit addMPEventHandler ["MPKILLED",  
							{
								_this spawn
								{
									params ["_unit", "_killer", "_instigator"];
									_group = group _unit;
									_lootCrate = _group getVariable "_lootCrate";
									if (isNil "_lootCrate") exitWith {};
									_count = _lootCrate getVariable "_bigBoatGroupCount";
									if (!isNil "_count") then
									{
										_count = _count - 1;
										_lootCrate setVariable ["_bigBoatGroupCount", _count];
									};
									if (isNull _killer || {isNull _instigator}) exitWith {};
									["FD_CP_Clear_F"] remoteExec ["playSound",_instigator];
									if (_instigator isKindOf "Exile_Unit_Player") then
									{
										_msg = format[
											"%1 killed %2 (AI) with %3 at %4 meters!",
											name _instigator, 
											name _unit, 
											getText(configFile >> "CfgWeapons" >> currentWeapon _instigator >> "displayName"), 
											_unit distance _instigator
										];
										[_msg] remoteExec["systemChat",-2];
									};
								};
							}];
							removeAllWeapons _unit;
							removeBackpack _unit;
							removeVest _unit;
							removeHeadgear _unit;
							removeGoggles _unit;
							_unit addVest selectRandom DGWM_AIVests;
							_unit addBackpackGlobal selectRandom DGWM_Backpacks; // Add random backpack
							_unitWeapon = selectRandom DGWM_AIWeapons;
							_ammo = _unitWeapon call DGWaterMission_fnc_selectMagazine;
							for "_i" from 1 to 3 do 
							{ 
								_unit addMagazineGlobal _ammo;
							};
							_unit addWeaponGlobal _unitWeapon;
							_unit addPrimaryWeaponItem selectRandom DGWM_AIWeaponOptics;
							_unit setVariable ["ExileMoney",_money ,true]; // Add some money
							_unit forceAddUniform selectRandom DGWM_SkinList;
							_unit addHeadgear selectRandom DGWM_HeadgearList;
							_unit setCombatMode "RED";
							for "_i" from 1 to DGWM_MaxInventoryItems do
							{
								_invItem = (selectRandom DGWM_AIItems);
								if(DGWM_DebugMode) then
								{
									diag_log format["%1 Added a %2 to unit %3!", DGWM_MessageName, _invItem, _unit];
								};
								_unit addItem _invItem;
							};
						};
						
						_bigBoatGroup setCombatMode "YELLOW";
						_bigBoatGroup setBehaviour "COMBAT";
						
						if (DGWM_PatrolAtSea) then
						{
							_bigBoatGroup setBehaviour "SAFE";
							_prevPos = _bigBoatPos;
							for "_i" from 0 to (2 + (floor (random 3))) do
							{
								private ["_wp", "_newPos"];
								_newPos = [_prevPos, 50, DGWM_PatrolRadius, 1, 2, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
								_prevPos = _newPos;
								
								_wp = _bigBoatGroup addWaypoint [_newPos, 0];
								_wp setWaypointType "MOVE";
								_wp setWaypointCompletionRadius 20;

								//Set the group's speed and formation at the first waypoint.
								if (_i == 0) then
								{
									_wp setWaypointSpeed "LIMITED";
									_wp setWaypointFormation "STAG COLUMN";
								};
							};
							
							//Cycle back to the first position.
							private ["_wp"];
							_wp = _bigBoatGroup addWaypoint [_bigBoatPos, 0];
							_wp setWaypointType "CYCLE";
							_wp setWaypointCompletionRadius 20;
						};
						
						_count = _lootCrate getVariable "_bigBoatGroupCount";
						if (!isNil "_count") then
						{
							_count = _count + count(units _bigBoatGroup);
							_lootCrate setVariable ["_bigBoatGroupCount", _count];
						} else
						{
							_lootCrate setVariable ["_bigBoatGroupCount", count(units _bigBoatGroup)];
						};
					};
				};
				
				_smallBoatMin = DGWM_SmallBoats select 0;
				_smallBoatMax = DGWM_SmallBoats select 1;
				_smallBoatAmount = round((_smallBoatMin) + random((_smallBoatMax) - (_smallBoatMin)));
				if(_smallBoatAmount > 0) then
				{
					diag_log format["%1 Mission %2 => Placing %3 'small' ships", DGWM_MessageName, _this, _smallBoatAmount];
					// Spawn small boat(s).
					for "_i" from 1 to _smallBoatAmount do 
					{ 
						_smallBoatClass = selectRandom DGWM_SmallBoatTypes;
						_smallBoatPos = [_missionPos,5,50,0,2,20,0] call BIS_fnc_findSafePos;
						_smallBoat = createVehicle [_smallBoatClass, _smallBoatPos, [], 0, "CAN_COLLIDE"];
						_smallBoat allowDamage true;
						
						diag_log format["%1 Mission %2 => Created a[%3] @ %4", DGWM_MessageName, _this, _smallBoatClass, _smallBoatPos];
						_smallBoatSeats = count(fullCrew [_smallBoat, "", true]);
						_smallBoatCalc = (1 / 100 * DGWM_SmallBoatCrewPer);
						_smallBoatMult = _smallBoatCalc * _smallBoatSeats;
						_smallBoatFill = round(_smallBoatMult);
						diag_log format["%1 Mission %2 => (%3) _smallBoatSeats= %4 | _smallBoatCalc= %5 | _smallBoatMult= %6", DGWM_MessageName, _this, _smallBoat, _smallBoatSeats, _smallBoatCalc, _smallBoatMult];
						if (_smallBoatFill < 1) then
						{
							_smallBoatFill = 1;
						};
						diag_log format["%1 Mission %2 => (%3) We will be adding %4 units to this %5", DGWM_MessageName, _this, _smallBoat, _smallBoatFill, _smallBoatClass];
						_smallBoatGroup = createGroup east;
						_smallBoatGroup setVariable ["_lootCrate", _lootCrate];
						for "_i" from 1 to _smallBoatFill do 
						{
							_money = ceil(random(DGWM_AIMoney));
							_unit = _smallBoatGroup createUnit ["O_A_soldier_F", _smallBoatPos, [], 0, "FORM"];
							_totalAICounter = _totalAICounter +1;
							_unit moveInAny _smallBoat; // Add unit to the ship
							_unit addMPEventHandler ["MPKILLED",  
							{
								_this spawn
								{
									params ["_unit", "_killer", "_instigator"];
									_group = group _unit;
									_lootCrate = _group getVariable "_lootCrate";
									if (isNil "_lootCrate") exitWith {};
									_count = _lootCrate getVariable "_smallBoatGroupCount";
									if (!isNil "_count") then
									{
										_count = _count - 1;
										_lootCrate setVariable ["_smallBoatGroupCount", _count];
									};
									if (isNull _killer || {isNull _instigator}) exitWith {};
									["FD_CP_Clear_F"] remoteExec ["playSound",_instigator];
									if (_instigator isKindOf "Exile_Unit_Player") then
									{
										_msg = format[
											"%1 killed %2 (AI) with %3 at %4 meters!",
											name _instigator, 
											name _unit, 
											getText(configFile >> "CfgWeapons" >> currentWeapon _instigator >> "displayName"), 
											_unit distance _instigator
										];
										[_msg] remoteExec["systemChat",-2];
									};
								};
							}];
							removeAllWeapons _unit;
							removeBackpack _unit;
							removeVest _unit;
							removeHeadgear _unit;
							removeGoggles _unit;
							_unit addVest selectRandom DGWM_AIVests;
							_unit addBackpackGlobal selectRandom DGWM_Backpacks; // Add random backpack
							_unitWeapon = selectRandom DGWM_AIWeapons;
							_ammo = _unitWeapon call DGWaterMission_fnc_selectMagazine;
							for "_i" from 1 to 3 do 
							{ 
								_unit addMagazineGlobal _ammo;
							};
							_unit addWeaponGlobal _unitWeapon;
							_unit addPrimaryWeaponItem selectRandom DGWM_AIWeaponOptics;
							_unit setVariable ["ExileMoney",_money ,true]; // Add some money
							_unit forceAddUniform selectRandom DGWM_SkinList;
							_unit addHeadgear selectRandom DGWM_HeadgearList;
							_unit setCombatMode "RED";
							for "_i" from 1 to DGWM_MaxInventoryItems do
							{
								_invItem = (selectRandom DGWM_AIItems);
								if(DGWM_DebugMode) then
								{
									diag_log format["%1 Added a %2 to unit %3!", DGWM_MessageName, _invItem, _unit];
								};
								_unit addItem _invItem;
							};
						};
						
						_smallBoatGroup setCombatMode "RED";
						_smallBoatGroup setBehaviour "COMBAT";
						//{_x disableAI "AUTOTARGET"; _x disableAI "TARGET";} forEach units _smallBoatGroup;
						//[_smallBoatGroup, _smallBoatPos, DGWM_PatrolRadius] call BIS_fnc_taskPatrol;
						
						
						if (DGWM_PatrolAtSea) then
						{
							_smallBoatGroup setBehaviour "SAFE";
							_prevPos = _smallBoatPos;
							for "_i" from 0 to (2 + (floor (random 3))) do
							{
								private ["_wp", "_newPos"];
								_newPos = [_prevPos, 50, DGWM_PatrolRadius, 1, 2, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
								_prevPos = _newPos;
								
								_wp = _smallBoatGroup addWaypoint [_newPos, 0];
								_wp setWaypointType "MOVE";
								_wp setWaypointCompletionRadius 20;

								//Set the group's speed and formation at the first waypoint.
								if (_i == 0) then
								{
									_wp setWaypointSpeed "LIMITED";
									_wp setWaypointFormation "STAG COLUMN";
								};
							};
							
							//Cycle back to the first position.
							private ["_wp"];
							_wp = _smallBoatGroup addWaypoint [_smallBoatPos, 0];
							_wp setWaypointType "CYCLE";
							_wp setWaypointCompletionRadius 20;
						};
						
						_count = _lootCrate getVariable "_smallBoatGroupCount";
						if (!isNil "_count") then
						{
							_count = _count + count(units _smallBoatGroup);
							_lootCrate setVariable ["_smallBoatGroupCount", _count];
						} else
						{
							_lootCrate setVariable ["_smallBoatGroupCount", count(units _smallBoatGroup)];
						};
					};
				};
	
				// Static Divers setup
				if (DGWM_EnableDivers) then
				{
					_diverMin = DGWM_DiverCount select 0;
					_diverMax = DGWM_DiverCount select 1;
					_diverCount = round((_diverMin) + random((_diverMax) - (_diverMin)));
					_diversGroup = createGroup east;
					_diversGroup setVariable ["_lootCrate", _lootCrate];
					for "_i" from 1 to _diverCount do 
					{
						_money = ceil(random(DGWM_AIMoney));
						_diverPos = [_missionPos,0,60,0,2,20,0] call BIS_fnc_findSafePos;
						_unit = _diversGroup createUnit ["O_A_soldier_F", _diverPos, [], 0, "FORM"];
						_totalAICounter = _totalAICounter +1;
						_unitWeapon = selectRandom DGWM_AIWeapons;
						_ammo = _unitWeapon call DGWaterMission_fnc_selectMagazine;
						_diverAmmo = "hlc_30rnd_556x45_S";
						if (DGWM_DiverUnderwaterGun) then
						{
							_ammo = "hlc_30rnd_556x45_EPR";
							_unitWeapon = "arifle_SDAR_F";
						};
						removeAllWeapons _unit;
						removeBackpack _unit;
						removeVest _unit;
						removeHeadgear _unit;
						removeGoggles _unit;
						_unit addVest selectRandom ["V_RebreatherIA", "V_RebreatherIR", "V_RebreatherB", "Exile_Vest_Rebreather_AAF", "Exile_Vest_Rebreather_CSAT", "Exile_Vest_Rebreather_NATO"];
						_unit addBackpackGlobal selectRandom ["CUP_B_HikingPack_Civ", "CUP_O_RUS_Patrol_bag_Summer", "B_RadioBag_01_black_F", "TAC_BP_Butt_B"];				
						_unit addPrimaryWeaponItem selectRandom DGWM_AIWeaponOptics;
						_unit setVariable ["ExileMoney",_money ,true]; // Add some money
						_unit forceAddUniform selectRandom ["U_I_Wetsuit", "U_O_Wetsuit", "U_B_Wetsuit"];
						_unit addGoggles selectRandom ["G_I_Diving", "G_O_Diving", "G_B_Diving"];
						for "_i" from 1 to 2 do 
						{ 
							_unit addMagazineGlobal _diverAmmo;
						};
						for "_i" from 1 to 2 do 
						{ 
							_unit addMagazineGlobal _ammo;
						};
						_unit addWeaponGlobal _unitWeapon;
						_unit setCombatMode "RED";
						for "_i" from 1 to DGWM_MaxInventoryItems do
						{
							_invItem = (selectRandom DGWM_AIItems);
							if(DGWM_DebugMode) then
							{
								diag_log format["%1 Added a %2 to unit %3!", DGWM_MessageName, _invItem, _unit];
							};
							_unit addItem _invItem;
						};
						_unit addMPEventHandler ["MPKILLED",  
						{
							_this spawn
							{
								params ["_unit", "_killer", "_instigator"];
								_group = group _unit;
								_lootCrate = _group getVariable "_lootCrate";
								if (isNil "_lootCrate") exitWith {};
								_count = _lootCrate getVariable "_diverGroupCount";
								if (!isNil "_count") then
								{
									_count = _count - 1;
									_lootCrate setVariable ["_diverGroupCount", _count];
								};
								if (isNull _killer || {isNull _instigator}) exitWith {};
								["FD_CP_Clear_F"] remoteExec ["playSound",_instigator];
								if (_instigator isKindOf "Exile_Unit_Player") then
								{
									_msg = format[
										"%1 killed %2 (AI) with %3 at %4 meters!",
										name _instigator, 
										name _unit, 
										getText(configFile >> "CfgWeapons" >> currentWeapon _instigator >> "displayName"), 
										_unit distance _instigator
									];
									[_msg] remoteExec["systemChat",-2];
								};
							};
						}];
					};
					_diversGroup setCombatMode "RED";
					_diversGroup setBehaviour "COMBAT";
					
					_prevPos = _missionPos;
					for "_i" from 0 to (2 + (floor (random 3))) do
					{
						private ["_wp", "_newPos"];
						_newPos = [_prevPos, 50, (round(DGWM_PatrolRadius / 2)), 1, 1, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;
						_prevPos = _newPos;
						
						_wp = _diversGroup addWaypoint [_newPos, 0];
						_wp setWaypointType "MOVE";
						_wp setWaypointCompletionRadius 20;

						//Set the group's speed and formation at the first waypoint.
						if (_i == 0) then
						{
							_wp setWaypointSpeed "LIMITED";
							_wp setWaypointFormation "STAG COLUMN";
						};
					};
					
					//Cycle back to the first position.
					private ["_wp"];
					_wp = _diversGroup addWaypoint [_prevPos, 0];
					_wp setWaypointType "CYCLE";
					_wp setWaypointCompletionRadius 20;
					
					_count = _lootCrate getVariable "_diverGroupCount";
					if (!isNil "_count") then
					{
						_count = _count + count(units _diversGroup);
						_lootCrate setVariable ["_diverGroupCount", _count];
					} else
					{
						_lootCrate setVariable ["_diverGroupCount", count(units _diversGroup)];
					};
				};
	
				//WaitUntil {(count _totalAICounter) < 1};
				
				while {true} do
				{
					_newCount = 0;
					_bigShipGroupCount = _lootCrate getVariable "_bigBoatGroupCount";
					if !(isNil "_bigShipGroupCount") then
					{
						_newCount = _newCount + _bigShipGroupCount;
					};
					_smallBoatGroupCount = _lootCrate getVariable "_smallBoatGroupCount";
					if !(isNil "_smallBoatGroupCount") then
					{
						_newCount = _newCount + _smallBoatGroupCount;
					};
					_diverGroupCount = _lootCrate getVariable "_diverGroupCount";
					if !(isNil "_diverGroupCount") then
					{
						_newCount = _newCount + _diverGroupCount;
					};
					if (DGWM_CountAliveAI) then
					{
						_missionMarker setMarkerText format["%1 (%2 Units remaining)", _markerText, _newCount];
					};
					uiSleep 5;
					
					_finished = false;
					if (DGWM_CompletionMode == 0) then // AI needs to be killed
					{
						if (_newCount < 1) exitWith
						{
							_finished = true;
							diag_log format["%1 Mission %2 => No more AI remaining!", DGWM_MessageName, _this];
						};
					};
					if (DGWM_CompletionMode == 1) then // Player nearby
					{
						_nearbyPlayers = allPlayers select {(_x distance (position _lootCrate)) < DGWM_CompletionRange}; 
						if ((count _nearbyPlayers) > 0) exitWith {
							_finished = true;
							diag_log format["%1 Mission %2 => Player nearby crate! Completed!", DGWM_MessageName, _this];
						};
					};
					if (DGWM_CompletionMode == 2) then // Both of above
					{
						if (_newCount < 1) exitWith
						{
							_finished = true;
							diag_log format["%1 Mission %2 => No more AI remaining!", DGWM_MessageName, _this];
						};
						_nearbyPlayers = allPlayers select {(_x distance (position _lootCrate)) < DGWM_CompletionRange}; 
						if ((count _nearbyPlayers) > 0) exitWith {
							_finished = true;
							diag_log format["%1 Mission %2 => Player nearby crate! Completed!", DGWM_MessageName, _this];
						};
					};
					
					if (_finished) exitWith {};
				};
				["UAV_03"] remoteExec ["playSound",0];
				_endMsg = format["Convicts successfully defeated the %1", _markerText];
				[
					"toastRequest",
					[
						"SuccessEmpty",
						[
							format
							[
									"<t color='#0080ff' size='%1' font='%2'>%3</t><br/><t color='%4' size='%5' font='%6'>%7</t>",
									DGWM_ExileToasts_Title_Size,
									DGWM_ExileToasts_Title_Font,
									_markerText,
									DGWM_ExileToasts_Message_Color,
									DGWM_ExileToasts_Message_Size,
									DGWM_ExileToasts_Message_Font,
									_endMsg
							]
						]
					]
				] call ExileServer_system_network_send_broadcast;
				diag_log format["%1 Mission %2 => Completed! Waiting for the player to collect the loot", DGWM_MessageName, _this];
				DGWM_MissionQueue deleteAt (DGWM_MissionQueue find _this);
				_missionMarker setMarkerText "Loot";
				_missionMarker setMarkerColor "ColorBlack";
				_missionMarker setMarkerType "mil_dot";
				_lootCratePos = position _lootCrate;
				_missionMarker setMarkerPos _lootCratePos;
				
				// Fill loot crate
				_crateMoney = ceil((DGWM_LootPoptabsMin) + random((DGWM_LootPoptabsMax) - (DGWM_LootPoptabsMin)));
				_lootCrate setVariable ["ExileMoney",_crateMoney ,true];
				{ // weapons | optics | vests | backpack | headgear | items 			
					if (_forEachIndex == 0) then { // DGWM_AIWeapons
						for "_i" from 1 to _x do
						{
							_weapon = DGWM_AIWeapons call BIS_fnc_selectRandom;
							_ammo = _weapon call DGWaterMission_fnc_selectMagazine;
							if (_weapon isEqualType "") then
							{
								_weapon = [_weapon,1];
							};
							_lootCrate addWeaponCargoGlobal _weapon;
							if !(_ammo in ["Exile_Magazine_Swing","Exile_Magazine_Boing","Exile_Magazine_Swoosh"]) then
							{
								_lootCrate addItemCargoGlobal [_ammo, 2];
							};
						};
					};
					if (_forEachIndex == 1) then { // DGWM_AIWeaponOptics
						for "_i" from 1 to _x do
						{
							_optic = DGWM_AIWeaponOptics call BIS_fnc_selectRandom;
							if (_optic isEqualType "") then
							{
								_optic = [_optic,1];
							};
							_lootCrate addItemCargoGlobal _optic;
						};
					};
					if (_forEachIndex == 2) then { // DGWM_AIVests
						for "_i" from 1 to _x do
						{
							_vest = DGWM_AIVests call BIS_fnc_selectRandom;
							if (_vest isEqualType "") then
							{
								_vest = [_vest,1];
							};
							_lootCrate addItemCargoGlobal _vest;
						};
					};
					if (_forEachIndex == 3) then { // DGWM_Backpacks
						for "_i" from 1 to _x do
						{
							_bp = DGWM_Backpacks call BIS_fnc_selectRandom;
							if (_bp isEqualType "") then
							{
								_bp = [_bp,1];
							};
							_lootCrate addItemCargoGlobal _bp;
						};
					};
					if (_forEachIndex == 4) then { // DGWM_HeadgearList
						for "_i" from 1 to _x do
						{
							_headg = DGWM_HeadgearList call BIS_fnc_selectRandom;
							if (_headg isEqualType "") then
							{
								_headg = [_headg,1];
							};
							_lootCrate addItemCargoGlobal _headg;
						};
					};
					if (_forEachIndex == 5) then { // DGWM_AIItems
						for "_i" from 1 to _x do
						{
							_medical = DGWM_AIItems call BIS_fnc_selectRandom;
							if (_medical isEqualType "") then
							{
								_medical = [_medical,1];
							};
							_lootCrate addItemCargoGlobal _medical;
						};
					};
				} forEach DGWM_LootCounts;
				
				WaitUntil {((position _lootCrate) distance _lootCratePos) > 10};
				diag_log format["%1 Mission %2 => A player collected the loot [_lootCratePos=%3] [_containerPos=%4]. Deleting marker and leftovers now.", DGWM_MessageName, _this, _lootCratePos, position _lootCrate];
				if (_isStatic) then
				{
					DGWM_StaticLocations pushBack _missionPos;
				};
				deleteMarker _missionMarker;
				_missionPos = nil;
			};
		};
	};

	_count = count DGWM_MissionQueue;
	if(_count < DGWM_MaxMissions) then
	{
		// Sleep until next spawn
		_nextWaitTime = (DGWM_TMin * 60) + random((DGWM_TMax *60) - (DGWM_TMin *60));
		diag_log format["%1 Waiting %2 seconds before next spawn. (Mission queue count = %3)", DGWM_MessageName, _nextWaitTime, _count];
		uiSleep _nextWaitTime; // Wait until the random counter started
		_reInitialize = true;
	};
	uiSleep 2;
};