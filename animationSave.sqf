
/*
    private _pointsArray = [_curve] BIS_fnc_richCurve_getCurvePoints;
*/
params ["_curve", "_timeline"];

/*
    CAMERA
*/

private _camValues = [];

private _cinemaBorders = call BIS_fnc_camera_getCinemaBordersEnabled;
private _camFocus = call BIS_fnc_camera_getFocus;
private _camFov = call BIS_fnc_camera_getFOV;
private _hudEnabled = call BIS_fnc_camera_getHUDEnabled;
private _visionMode = call BIS_fnc_camera_getVisionMode;

_camValues pushBack [_cinemaBorders, _camFocus, _camFov, _hudEnabled, _visionMode];


/*
    TIMELINE
*/

private _timelineEnriched = [];

private _timelineInterpMode = _timeline call BIS_fnc_timeline_getInterpMode;
private _length = _timeline call BIS_fnc_timeline_getLength;
private _isLooping = _timeline call BIS_fnc_timeline_isLooping;
private _isPaused = BIS_fnc_timeline_isPaused;
private _getPlayRate = _timeline call BIS_fnc_timeline_getPlayRate;
private _getPosition = _timeline call BIS_fnc_timeline_getPosition;
private _isReverse = _timeline call BIS_fnc_timeline_isReverse;

_timelineEnriched pushBack [
    _timelineInterpMode, 
    _length, 
    _isLooping,
    _isPaused,
    _getPlayRate,
    _getPosition,
    _isReverse
];

/*
    CURVE KEYS
*/

private _keys = _curve call BIS_fnc_richCurve_getKeys;
private _keysEnriched = [];

{
    // private _arriveControlPoint = _x call BIS_fnc_key_getArriveControlPoint;
    private _arriveTangentFloat = _x call BIS_fnc_key_getArriveTangent;
    private _arriveTangentWeight = _x call BIS_fnc_key_getArriveTangentWeight;
    // private _configTime = _x call BIS_fnc_key_getConfigTime;
    // private _fov = _x call BIS_fnc_key_getFOV;
    private _interpMode = _x call BIS_fnc_key_getInterpMode;
    // private _leaveControlPoint = _x call BIS_fnc_key_getLeaveControlPoint;
    private _leaveTangentFloat = _x call BIS_fnc_key_getLeaveTangent;
    private _leaveTangentWeight = _x call BIS_fnc_key_getLeaveTangentWeight;
    private _time = _x call BIS_fnc_key_getTime;
    private _value = _x call BIS_fnc_key_getValue;

    _keysEnriched pushBack [
        getPos _x, 
        _arriveTangentFloat, 
        _arriveTangentWeight,
        _interpMode,
        _leaveTangentFloat,
        _leaveTangentWeight,
        _time,
        _value
    ];

} forEach _keys;

copyToClipboard str ([_camValues, _timelineEnriched, _keysEnriched]);