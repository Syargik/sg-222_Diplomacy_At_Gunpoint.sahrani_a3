	CreateCam1 = {
        if !(isNil "cam") then {
            cam cameraEffect ["terminate", "back"];
            camDestroy cam;
        };
        cam = "camera" camCreate [0, 0, 0];
        cam cameraEffect ["internal", "Back", "uavrtt"];
        cam attachTo [media1, [0, 0, 0.3]]; // media1 - назавние переменной объекта, к которому будет прикреплена камера
        hint str "Камера 1";
        cam camSetFov 0.5; // FOV камеры
        cam camSetTarget [10589.173, 9184.359, 5.918]; // Позиция x,y,z куда будет смотреть камера
        cam camCommit 0;
        "uavrtt" setPiPEffect [0]; // 0 - обычный режим, 1 - ПНВ, 2 - теплак
        showUAVFeed true;
        display setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];
    };

    CreateCam2 = {
        if !(isNil "cam") then {
            cam cameraEffect ["terminate", "back"];
            camDestroy cam;
        };
        cam = "camera" camCreate [0, 0, 0];
        cam cameraEffect ["internal", "Back", "uavrtt"];
        cam attachTo [media2, [0, 0, 0]];
        hint str "Камера 2";
        cam camSetFov 0.5;
        cam camSetTarget [10566.053, 9304.753, 8.206];
        cam camCommit 0;
        "uavrtt" setPiPEffect [0];
        showUAVFeed true;
        display setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];
    };

    CreateCam3 = {
        if !(isNil "cam") then {
            cam cameraEffect ["terminate", "back"];
            camDestroy cam;
        };
        cam = "camera" camCreate [0, 0, 0];
        cam cameraEffect ["internal", "Back", "uavrtt"];
        cam attachTo [media3, [0, 0, 0.3]];
        hint str "Камера 3";
        cam camSetFov 0.5;
        cam camSetTarget [10761.937, 9342.09, 4.039];
        cam camCommit 0;
        "uavrtt" setPiPEffect [0];
        showUAVFeed true;
        display setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];
    };

	CreateCam4 = {
        if !(isNil "cam") then {
            cam cameraEffect ["terminate", "back"];
            camDestroy cam;
        };
        cam = "camera" camCreate [0, 0, 0];
        cam cameraEffect ["internal", "Back", "uavrtt"];
        cam attachTo [media4, [0, 0, 0.3]];
        hint str "Камера 4";
        cam camSetFov 0.5;
        cam camSetTarget [10802.877, 9174.883, 7.219];
        cam camCommit 0;
        "uavrtt" setPiPEffect [0];
        showUAVFeed true;
        display setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];
    };

    display addAction
    [
        "Включить экран",
        {
            params ["_caller", "_actionId", "_arguments"];
            [[], CreateCam1] remoteExec ["call", [0, -2] select isDedicated];
            display setVariable ["ON", true, true];
			display setVariable ["CAM2AVAILABLE", true, true];
        },
        nil,
        1.5,
        true,
        true,
        "",
        "!(display getVariable ['ON', false])", // _target, _this, _originalTarget
        50,
        false,
        "",
        ""
    ];

    display addAction
    [
        "Переключить камеру",
        {
            params ["_caller", "_actionId", "_arguments"];
            [[], CreateCam2] remoteExec ["call", [0, -2] select isDedicated];
			display setVariable ["CAM2AVAILABLE", nil, true];
			display setVariable ["CAM3AVAILABLE", true, true];
        },
        nil,
        1.5,
        true,
        true,
        "",
        "(display getVariable ['CAM2AVAILABLE', false])", // _target, _this, _originalTarget
        50,
        false,
        "",
        ""
    ];

    display addAction
    [
        "Переключить камеру",
        {
            params ["_caller", "_actionId", "_arguments"];
            [[], CreateCam3] remoteExec ["call", [0, -2] select isDedicated];
			display setVariable ["CAM3AVAILABLE", nil, true];
			display setVariable ["CAM4AVAILABLE", true, true];
        },
        nil,
        1.5,
        true,
        true,
        "",
        "(display getVariable ['CAM3AVAILABLE', false])", // _target, _this, _originalTarget
        50,
        false,
        "",
        ""
    ];

	display addAction
    [
        "Переключить камеру",
        {
            params ["_caller", "_actionId", "_arguments"];
            [[], CreateCam4] remoteExec ["call", [0, -2] select isDedicated];
			display setVariable ["CAM4AVAILABLE", nil, true];
			display setVariable ["CAM1AVAILABLE", true, true];
        },
        nil,
        1.5,
        true,
        true,
        "",
        "(display getVariable ['CAM4AVAILABLE', false])", // _target, _this, _originalTarget
        50,
        false,
        "",
        ""
    ];

	display addAction
    [
        "Переключить камеру",
        {
            params ["_caller", "_actionId", "_arguments"];
            [[], CreateCam1] remoteExec ["call", [0, -2] select isDedicated];
			display setVariable ["CAM1AVAILABLE", nil, true];
			display setVariable ["CAM2AVAILABLE", true, true];
        },
        nil,
        1.5,
        true,
        true,
        "",
        "(display getVariable ['CAM1AVAILABLE', false])", // _target, _this, _originalTarget
        50,
        false,
        "",
        ""
    ];