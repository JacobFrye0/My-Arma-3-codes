// INSTRUCTION Simply drop throw a green smoke and a heli will drop friendly AI right to your smoke grenade postion, You can add this code to a trigger place it anywhere in the map and set it to "player, not present but make sure trigger has no radius activation, Enjoy!


player addEventHandler ["Fired", 
{ 
   if ((_this select 4) isEqualTo "SmokeShellGreen") then 
   {   
 _grenadeObj = (_this select 6);  _moveMarker = [_grenadeObj] spawn {  private ["_grenadePos","_grenadeObj"]; 
    params ["_grenadeObj"]; 
   waitUntil {speed _grenadeObj == 0}; 
  x_grenadeLPos = getPosASL _grenadeObj;           
      

_pos1 = [x_grenadeLPos, 800, 900, 3, 0, 20, 0] call BIS_fnc_findSafePos;
_pos2 = [x_grenadeLPos, 800, 900, 3, 0, 20, 0] call BIS_fnc_findSafePos; 
if (isServer) then { 

 
  
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
 
_wp1 = x_group addWaypoint [(x_grenadeLPos), 0]; 
_wp1 setWaypointType "MOVE"; 
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "CARELESS";
_wp1 setwaypointstatements ["true", "[x_vehicle,15, x_grenadeLPos] call AR_Rappel_All_Cargo;"]; 
 

_wp2 = x_group addWaypoint [(_pos1), 0]; 
_wp2 setWaypointType "MOVE"; 
_wp2 setWaypointSpeed "FULL";
_wp2 setWaypointBehaviour "CARELESS"; 

_wp3 = x_group addWaypoint [(_pos2), 0]; 
_wp3 setWaypointType "MOVE"; 
_wp3 setWaypointSpeed "FULL";
_wp3 setWaypointBehaviour "CARELESS";
_wp3 setwaypointstatements ["true", " { deleteVehicle vehicle _x } forEach units x_vehicle; { deleteVehicle _x; } forEach units x_group; 
"]; 

};  
  		}
	}
}
];
 