_vest = missionNamespace getVariable "OPFORvests";
_headgear = missionNamespace getVariable "OPFORheadgears";
_backpack = missionNamespace getVariable "OPFORbackpacks";

// SolidGames

_unit addBackpack "B_Carryall_Base";

// Weapons with attachments:

_unit addItem "rhs_10Rnd_762x54mmR_7N14";
_unit addWeapon "rhs_weap_svdp";
_unit addPrimaryWeaponItem "rhs_acc_pso1m2";

_unit addWeapon "ACE_pdu4";

removeBackpack _unit;

// Uniform with items:
_unit forceAddUniform "LOP_U_SLA_Fatigue_01";
_unit addItemToUniform 'ACE_MapTools';

// Vest with items:
_unit addVest _vest;
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rgd5';};
for '_i' from 1 to 2 do { _unit addItemToVest 'rhs_mag_rdg2_white';};
for '_i' from 1 to 5 do { _unit addItemToVest 'rhs_10Rnd_762x54mmR_7N14';};
for '_i' from 1 to 2 do { _unit addItemToVest 'mkk_10Rnd_762x54mmR_t46';};

// Backpack with items:
_unit addBackpack _backpack;
_unit addHeadgear _headgear;

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";