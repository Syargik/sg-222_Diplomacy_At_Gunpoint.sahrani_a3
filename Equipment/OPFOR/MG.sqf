_headgear = missionNamespace getVariable "OPFORheadgears";
_backpack = missionNamespace getVariable "OPFORbackpacks";

// SolidGames

_unit addBackpack "B_Carryall_Base";

// Weapons with attachments:

_unit addItem "rhs_100Rnd_762x54mmR_7N13";
_unit addWeapon "mkk_VTN_PKMN";
_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
_unit addPrimaryWeaponItem "mkk_VTN_MUZZLE_FLASHSUPRESSOR_PKM2";

removeBackpack _unit;

// Uniform with items:
_unit forceAddUniform "LOP_U_SLA_Fatigue_01";

// Vest with items:
_unit addVest "JCA_MCRP_V_CarrierRigKBT_01_combat_olive_F";
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_100Rnd_762x54mmR_7N13';};

// Backpack with items:
_unit addBackpack _backpack;
_unit addItemToBackpack 'rhs_100Rnd_762x54mmR_7N13';
_unit addHeadgear _headgear;

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";