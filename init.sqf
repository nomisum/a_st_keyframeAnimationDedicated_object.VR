private _vehicle = "C_Offroad_01_F" createVehicleLocal (position player);
mycurve synchronizeObjectsAdd [_vehicle];

[mytimeline] call BIS_fnc_timeline_play;