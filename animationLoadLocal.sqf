params ["_camValues", "_timelineEnriched", "_keysEnriched"];

_camValues params [
    "_cinemaBorders", 
    "_camFocus",
    "_camFov",
    "_hudEnabled",
    "_visionMode"
];

_timeline params [
    "_interpMode", 
    "_length", 
    "_isLooping",
    "_isPaused",
    "_getPlayRate",
    "_getPosition",
    "_isReverse"
];


private _camera = "Camera_F" createVehicleLocal [0,0,0];
private _timeline = "Timeline_F" createVehicleLocal [0,0,0];
private _curve = "Curve_F" createVehicleLocal [0,0,0];

[_camera, _cinemaBorders] call BIS_fnc_camera_setCinemaBordersEnabled;
[_camera, _camFocus] call BIS_fnc_camera_setFocus;
[_camera, _camFov] call BIS_fnc_camera_setFOV;
[_camera, _hudEnabled] call BIS_fnc_camera_setHUDEnabled;
[_camera, _visionMode] call BIS_fnc_camera_setVisionMode;


_camera call BIS_fnc_camera_init;

[_timeline, _interpMode] call BIS_fnc_timeline_setInterpMode;
[_timeline, _length] call BIS_fnc_timeline_setLength;
[_timeline, _isLooping] call BIS_fnc_timeline_setLoop;
[_timeline, _isPaused] call BIS_fnc_timeline_setPause;
[_timeline, _getPlayRate] call BIS_fnc_timeline_setPlayRate;
[_timeline, _getPosition] call BIS_fnc_timeline_setPosition;
[_timeline, _isReverse] call BIS_fnc_timeline_setReverse;



private _keysCreated = [];

{
    _x params [
        "_position", 
        "_arriveControlTangent",
        "_arriveTangentWeight",
        "_interpMode",
        "_leaveControlTangent",
        "_leaveTangentWeight",
        "_time",
        "_value"
    ];

    private _key = "Key_F" createVehicleLocal [0,0,0];
    _key setPos _position;

    [_key, _arriveControlTangent] call BIS_fnc_key_setArriveTangent;
    [_key, _arriveTangentWeight] call BIS_fnc_key_setArriveTangentWeight;
    [_key, _interpMode] call BIS_fnc_key_setInterpMode;
    [_key, _leaveControlTangent] call BIS_fnc_key_setLeaveTangent;
    [_key, _leaveTangentWeight] call BIS_fnc_key_setLeaveTangentWeight;
    [_key, _time] call BIS_fnc_key_setTime;
    [_key, _value] call BIS_fnc_key_setValue;

    _keysCreated pushBack _key;

} forEach _keysEnriched;

_curve synchronizeObjectsAdd _camera;
_curve synchronizeObjectsAdd _timeline;
_curve synchronizeObjectsAdd _keysCreated;




private _vehicle = "C_Offroad_01_F" createVehicleLocal (position player);
_curve synchronizeObjectsAdd [_vehicle];

[_timeline] call BIS_fnc_timeline_play;