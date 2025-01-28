[] execVM "scripts\cams.sqf";

player createDiaryRecord ["diary", ["Форма сторон", loadFile "A3A_BRIEFING\briefing_UNIFORMS.html"]];

if (!isDedicated) then {	
	waitUntil {!(isNull player)};
	player addEventHandler ["inventoryOpened","_nul=execVM 'script.sqf'"];
};

if (hasInterface) then {
    if (side player == east) then {
        waitUntil {sleep 1800; a3a_var_started};
        [player,"Опознать тело",
        "a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forcerespawn_ca.paa",
        "a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forcerespawn_ca.paa",
        "((_this distance target1) < 3) && !target1k && !(alive target1)",
        "((_this distance target1) < 3) && (alive _this)",
        {},
        {},
        {cutText ["Посол США опознан!", "PLAIN"];target1k = true; publicvariable "target1k";},
        {},
        [],
        10,0,true,false] call BIS_fnc_holdActionAdd;
    };
};

if (hasInterface) then {
    waitUntil {sleep 2700; a3a_var_started};
    if (player == target1) then {
        private _markerName = "evacZone";
        while { target1ZoneEntered == false } do {
            if ((player distance getMarkerPos _markerName) < 50) then {
                target1ZoneEntered = true;
                publicVariable "target1ZoneEntered";
            };
            sleep 1;
        };
    };
};

if (hasInterface) then {
    if (side player == west) then {
        waitUntil {sleep 2700; a3a_var_started};
        private _markerName = "evacZone";
        private _actionAdded = false;    
        while { target1ZoneEntered == false } do {
            if ((player distance getMarkerPos _markerName) < 50 && !_actionAdded) then {
                _actionAdded = true;
                [player, "Эвакуировать",
                "a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forcerespawn_ca.paa",
                "a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forcerespawn_ca.paa",
                "((_this distance target1) < 3) && !target1k && !(alive target1)",
                "((_this distance target1) < 3) && (alive _this)",
                {},
                {},
                {cutText ["Тело посла эвакуировано!", "PLAIN"]; target1ZoneEntered = true; publicvariable "target1ZoneEntered";},
                {},
                [],
                5, 0, true, false] call BIS_fnc_holdActionAdd;
            };
            sleep 1;
        };
    };
};
