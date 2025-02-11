// SolidGames

_unit addBackpack "B_Carryall_Base";

// Weapons with attachments:

_unit addItem "rhsusf_mag_17Rnd_9x19_JHP";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "mkk_hlc_muzzle_Evo9";

removeBackpack _unit;

// Uniform with items:
_unit forceAddUniform "U_C_FormalSuit_01_black_F";

// Vest with items:
_unit addVest "KoraKulon_Tarzan_B";
for '_i' from 1 to 5 do { _unit addItemToVest 'rhsusf_mag_17Rnd_9x19_FMJ';};

// Backpack with items:
_unit addBackpack "asip_b_02_cb";
_unit addGoggles "G_Spectacles";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";