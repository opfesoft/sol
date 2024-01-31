DELETE FROM `creature_text` WHERE `CreatureId` = 27202 AND `GroupID` IN (0,1,3);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(27202,0,0,'Gah! What are you doing?',12,0,100,5,0,0,26637,0,'Onslaught Raven Priest'),
(27202,1,0,'I''ve heard whisperings of intruders.  Be wary.',12,0,100,0,0,0,26254,0,'Onslaught Raven Priest'),
(27202,1,1,'I sense the taint of this land in you, footman.  Report to the Bishop before the start of your next shift.',12,0,100,0,0,0,26256,0,'Onslaught Raven Priest'),
(27202,1,2,'You stink.  Take a shower.',12,0,100,0,0,0,26257,0,'Onslaught Raven Priest'),
(27202,1,3,'Your protection is strong, child.  Continue your work.',12,0,100,0,0,0,26390,0,'Onslaught Raven Priest'),
(27202,1,4,'You require the Bishop''s blessing.  Go to him soon.',12,0,100,0,0,0,26391,0,'Onslaught Raven Priest'),
(27202,1,5,'Remain on the pure path.  The Light will protect you.',12,0,100,0,0,0,26392,0,'Onslaught Raven Priest'),
(27202,1,6,'The Grand Admiral himself has come to see to our dedication.  If I see you slacking on your post again, I will gut you myself.',12,0,100,0,0,0,26655,0,'Onslaught Raven Priest'),
(27202,3,0,'You are impure!',12,0,100,0,0,0,26393,0,'Onslaught Raven Priest'),
(27202,3,1,'Die, cur!',12,0,100,0,0,0,26394,0,'Onslaught Raven Priest'),
(27202,3,2,'Be washed from my sight!',12,0,100,0,0,0,26395,0,'Onslaught Raven Priest'),
(27202,3,3,'By the Light!',12,0,100,0,0,0,26396,0,'Onslaught Raven Priest'),
(27202,3,4,'Wretch!',12,0,100,0,0,0,26397,0,'Onslaught Raven Priest'),
(27202,3,5,'Defiler!',12,0,100,0,0,0,26398,0,'Onslaught Raven Priest'),
(27202,3,6,'Abbendis will see you purged!',12,0,100,0,0,0,26399,0,'Onslaught Raven Priest');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27202 AND `id` > 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27202,0,10,0,4,0,30,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onslaught Raven Priest - On Aggro - Say Line 3'),
(27202,0,11,0,34,0,30,0,2,1,0,0,0,1,1,0,1,0,0,0,19,27203,5,0,0,0,0,0,0,'Onslaught Raven Priest - On WP 2 Reached - Say Line 1 (CONDITION_OBJECT_ENTRY_GUID)'),
(27202,0,12,0,34,0,30,0,2,3,0,0,0,1,1,0,1,0,0,0,19,27203,5,0,0,0,0,0,0,'Onslaught Raven Priest - On WP 4 Reached - Say Line 1 (CONDITION_OBJECT_ENTRY_GUID)'),
(27202,0,13,0,34,0,30,0,2,7,0,0,0,1,1,0,1,0,0,0,19,27203,5,0,0,0,0,0,0,'Onslaught Raven Priest - On WP 8 Reached - Say Line 1 (CONDITION_OBJECT_ENTRY_GUID)'),
(27202,0,14,0,34,0,30,0,2,9,0,0,0,1,1,0,1,0,0,0,19,27203,5,0,0,0,0,0,0,'Onslaught Raven Priest - On WP 10 Reached - Say Line 1 (CONDITION_OBJECT_ENTRY_GUID)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 27202;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,12,27202,0,0,31,1,3,0,102075,0,0,0,'Creature ''Onslaught Raven Priest'' - Group 0: Execute SAI ID 11 if has GUID 102075'),
(22,13,27202,0,0,31,1,3,0,102075,0,0,0,'Creature ''Onslaught Raven Priest'' - Group 0: Execute SAI ID 12 if has GUID 102075'),
(22,14,27202,0,0,31,1,3,0,102075,0,0,0,'Creature ''Onslaught Raven Priest'' - Group 0: Execute SAI ID 13 if has GUID 102075'),
(22,15,27202,0,0,31,1,3,0,102075,0,0,0,'Creature ''Onslaught Raven Priest'' - Group 0: Execute SAI ID 14 if has GUID 102075');

UPDATE `waypoint_data` SET `delay` = 60000 WHERE `id` = 1021790 AND `point` = 2;

DELETE FROM `waypoint_data` WHERE `id` = 1020750;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(1020750,1,2801.69,-339.121,130.969,NULL,0,0,0,0,100,0),
(1020750,2,2801.31,-334.339,131.19,0.295438,10000,0,0,0,100,0),
(1020750,3,2798.77,-329.483,130.838,NULL,0,0,0,0,100,0),
(1020750,4,2796.22,-324.615,130.535,0.785179,10000,0,0,0,100,0),
(1020750,5,2797.71,-329.766,130.754,NULL,0,0,0,0,100,0),
(1020750,6,2799.31,-335.307,130.796,NULL,0,0,0,0,100,0),
(1020750,7,2800.77,-340.351,130.744,NULL,0,0,0,0,100,0),
(1020750,8,2802.19,-345.282,130.69,0.061643,10000,0,0,0,100,0),
(1020750,9,2801.18,-352.081,130.769,NULL,0,0,0,0,100,0),
(1020750,10,2800.29,-358.026,131.014,6.28224,10000,0,0,0,100,0),
(1020750,11,2800.75,-351.845,130.741,NULL,0,0,0,0,100,0),
(1020750,12,2801.25,-345.103,130.649,NULL,0,0,0,0,100,0);
