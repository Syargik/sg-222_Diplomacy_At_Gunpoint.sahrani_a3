_unit = _this select 0;
_faction = _this select 1;
_loadout = _this select 2;

_item_processor = {
	removeAllItems _this;
	removeAllWeapons _this;
	removeAllItemsWithMagazines _this;
	removeAllAssignedItems _this;
	removeUniform _this;
	removeBackpack _this;
	removeHeadgear _this;
	removeVest _this;
	removeGoggles _this;
};

if (!isServer) exitWith {};

_unit call _item_processor;

_svn = format ["SerP_equipment_codes_%1_%2",_faction, _loadout];
if (isNil _svn) then
{
	missionNamespace setVariable [_svn, 
		compile preprocessFileLineNumbers format ["Equipment\%1\%2.sqf", _faction, _loadout]];
};

[_unit] call (missionNamespace getVariable [_svn, {}]);

missionNamespace setVariable ["OPFORvests", [
    "CUP_Vest_RUS_6B45_Sh117_Green",
    "CUP_Vest_RUS_6B45_Sh117_Nut_Green"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["OPFORheadgears", [
	"rhs_6b7_1m_ess",
	"rhs_6b7_1m_ess_bala",
	"rhs_6b7_1m_olive",
	"rhs_6b7_1m_bala2_olive"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["OPFORbackpacks", [
	"rhs_rk_sht_30_olive",
	"B_FieldPack_oli"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["BLUFORuniforms", [
	"LOP_U_RACS_Fatigue_01",
	"LOP_U_RACS_Fatigue_01_slv"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["BLUFORheadgears", [
	"LOP_H_6B27M_ess_RACS",
	"LOP_H_6B27M_RACS"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["MARINEuniforms", [
	"FROG_USMC_KyleGloves_6_w",
	"FROG_USMC_Base_4_w",
	"FROG_USMC_KyleGloves_2_w",
	"FROG_USMC_KyleGloves_4_w"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["MARINEheadgears", [
	"MICH2000_Coverall_USMC_Preset_4_1",
	"rhsusf_mich_helmet_marpatwd_alt_headset"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["MARINEbackpacks", [
	"B_AssaultPack_Kerry",
	"B_AssaultPack_rgr"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["MARINEvests", [
	"tfa_cpc_weaponsbelt_rngr_US1",
	"tfa_cpc_Fastbelt_rngr_US1"
] call BIS_fnc_selectRandom];

missionNamespace setVariable ["MARINEgoogles", [
	"G_Bandanna_khk",
	"G_Bandanna_Skull1"
] call BIS_fnc_selectRandom];