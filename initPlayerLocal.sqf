[] execVM "scripts\cams.sqf";

player createDiaryRecord ["diary", ["Форма сторон", loadFile "A3A_BRIEFING\briefing_UNIFORMS.html"]];

if (!isDedicated) then {	
	waitUntil {!(isNull player)};
	player addEventHandler ["inventoryOpened","_nul=execVM 'script.sqf'"];
};

if (hasInterface) then {
    if (side player == east) then {
        [player,"Опознать тело",
        "a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forcerespawn_ca.paa",
        "a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forcerespawn_ca.paa",
        "((_this distance target1) < 3) && !target1k && !(alive target1) && (mkk_platform_missionTime >= 300)",
        "((_this distance target1) < 3) && (alive _this) && (mkk_platform_missionTime >= 300)",
        {},
        {},
        {cutText ["Посол США опознан!", "PLAIN"];target1k = true; publicvariable "target1k";},
        {},
        [],
        10,0,true,false] call BIS_fnc_holdActionAdd;
    };
};

if (hasInterface && (player == target1)) then {
     [
        doorManager,
        "Открыть дверь",
        "\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_start_ca.paa",
        "\a3\missions_f_oldman\data\img\holdactions\holdAction_follow_start_ca.paa",
        "(_this distance _target < 2) && (mkk_platform_missionTime >= 20) && (((embassy getVariable['bis_disabled_Door_6', 0])) == 1)",
        "(_caller distance _target < 2) && (mkk_platform_missionTime >= 20) && (((embassy getVariable['bis_disabled_Door_6', 0])) == 1)",
        {},
        {},
        {
           embassy setVariable ['bis_disabled_Door_6', 0, true];
           [embassy, ["Door_6_sound_source", 1]] remoteExec ["animateSource", 0];
        },
        {},
        [],
        3,
        0,
        true,
        false
    ] call BIS_fnc_holdActionAdd;
};