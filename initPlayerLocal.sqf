[] execVM "scripts\cams.sqf";

player createDiaryRecord ["diary", ["Форма сторон", loadFile "A3A_BRIEFING\briefing_UNIFORMS.html"]];

if (!isDedicated) then {	
	waitUntil {!(isNull player)};
	player addEventHandler ["inventoryOpened","_nul=execVM 'script.sqf'"];
};

if (hasInterface) then {
    if (side player == east) then {
        waitUntil {sleep 300; a3a_var_started};
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
    waitUntil {sleep 1; a3a_var_started};

    if (player == target1) then {
        private _evacZones = ["evacZone", "evacZone2", "evacZone3"];
        private _zoneEntered = false;

        while {!_zoneEntered} do {
            {
                if ((player distance getMarkerPos _x) < 50) then {
                    _zoneEntered = true;
                    target1ZoneEntered = true;
                    publicVariable "target1ZoneEntered";
                };
            } forEach _evacZones;
            sleep 1;
        };
    };
};


if (hasInterface) then {
    if (side player == west) then {
        waitUntil {sleep 1; a3a_var_started};
        private _markerNames = ["evacZone1", "evacZone2", "evacZone3"];
        private _actionID = -1;
        
        while { target1ZoneEntered == false } do {
            private _inZone = false;
            {
                if ((player distance getMarkerPos _x) < 40) exitWith {
                    _inZone = true;
                };
            } forEach _markerNames;
            
            if (_inZone) then {
                if (_actionID == -1) then {
                    _actionID = [player, "Эвакуировать",
                    "a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forcerespawn_ca.paa",
                    "a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forcerespawn_ca.paa",
                    "((_this distance target1) < 3) && !target1k && !(alive target1)",
                    "((_this distance target1) < 3) && (alive _this)",
                    {},
                    {},
                    {
                        cutText ["Тело посла эвакуировано!", "PLAIN"];
                        target1ZoneEntered = true;
                        publicVariable "target1ZoneEntered";
                    },
                    {},
                    [],
                    5, 0, true, false] call BIS_fnc_holdActionAdd;
                };
            } else {
                if (_actionID != -1) then {
                    [player, _actionID] call BIS_fnc_holdActionRemove;
                    _actionID = -1;
                };
            };
            
            sleep 1;
        };
    };
};