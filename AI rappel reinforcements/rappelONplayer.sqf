// INSTRUCTIONS Add this the below code to a trigger and change the settings to your liking, Enjoy!

_pos1 = [player, 800, 900, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_pos2 = [player, 800, 900, 3, 0, 20, 0] call BIS_fnc_findSafePos; 
if (isServer) then { 
x_landpos = "Land_HelipadEmpty_F" createvehicle getpos player; 
  
x_vehicle = createVehicle  ["B_Heli_Transport_01_F", _pos1, [], 0, "FLY" ];
 
x_vehicle engineOn true;
x_group = createVehicleCrew x_vehicle;
x_group addEventHandler ["HandleDamage", {false}]; 
x_vehicle addEventHandler ["HandleDamage", {false}];
x_group allowfleeing 0;

_group1 = createGroup [west, true];  
        _unit1 = group player createUnit ["B_Soldier_F", _pos1, [], 0, "NONE"];
_group2 = createGroup [west, true];  
        _unit2 = group player createUnit ["B_Soldier_lite_F", _pos1, [], 0, "NONE"]; 
_group3 = createGroup [west, true];  
        _unit3 = group player createUnit ["B_Soldier_GL_F", _pos1, [], 0, "NONE"]; 
 
_unit1 moveInAny x_vehicle; 
  _unit2 moveInAny x_vehicle; 
_unit3 moveInAny x_vehicle; 
 
_wp1 = x_group addWaypoint [(getPosASL x_landpos), 0]; 
_wp1 setWaypointType "MOVE"; 
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setwaypointstatements ["true", "[x_vehicle,15, getposASL x_landpos] call AR_Rappel_All_Cargo;"]; 
 

_wp2 = x_group addWaypoint [(_pos1), 0]; 
_wp2 setWaypointType "MOVE"; 
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointBehaviour "CARELESS"; 

_wp3 = x_group addWaypoint [(_pos2), 0]; 
_wp3 setWaypointType "MOVE"; 
_wp3 setWaypointSpeed "FULL";
_wp3 setWaypointBehaviour "CARELESS";
_wp3 setwaypointstatements ["true", " deleteVehicle x_vehicle; { deleteVehicle _x; } forEach units x_group;
deleteVehicle x_landpos; 
"]; 

};  
 