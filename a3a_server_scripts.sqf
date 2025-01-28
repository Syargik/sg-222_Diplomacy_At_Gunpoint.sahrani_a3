CrititalLosesWest = 9; // потери для синих
CrititalLosesEast = 7; // потери для красных

missionNamespace setVariable ["a3a_endMissionTime", 7200, true]; // 7200 - время в секундах

[] spawn {
	target1k = false;
	publicvariable "target1k";
	target1ZoneEntered = false;
	publicVariable "target1ZoneEntered";
	waitUntil {sleep 10; a3a_var_started};
	while {isNil "srv_triggerFinished"} do { 
	sleep 10;
			
		if ((east countside playableUnits) < CrititalLosesEast) then {
			srv_triggerFinished = true;
			["КАС разгромили ДРС! Победа Атаки", west] call a3a_fnc_endMission; // Победа WEST
		};
		
		if ((west countside playableUnits) < CrititalLosesWest) then {
			srv_triggerFinished = true;
			["ДРС разгромили КАС! Победа обороны", east] call a3a_fnc_endMission; // Победа EAST
		};
		
		if (mkk_platform_missionTime >= a3a_endMissionTime) then { 
			srv_triggerFinished = true;
			["ДРС удержала под контролем посольство!", east] call a3a_fnc_endMission; // Победа по окончанию таймера
		};

		if (missionNamespace getVariable ["target1k", false]) then {
            srv_triggerFinished = true;
            ["Посол США опознан!", east] call a3a_fnc_endMission;
        };

		if (missionNamespace getVariable ["target1ZoneEntered", true]) then {
            srv_triggerFinished = true;
            ["Посол США был эвакуирован!", west] call a3a_fnc_endMission;
        };

    };
};