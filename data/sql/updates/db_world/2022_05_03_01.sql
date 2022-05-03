UPDATE `npc_spellclick_spells` SET `spell_id` = 46598 WHERE `npc_entry` = 27661;
UPDATE `vehicle_template_accessory` SET `minion` = 1, `summontimer` = 1 WHERE `entry` = 27661;
UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 27661;
UPDATE `creature` SET `spawntimesecs` = 10 WHERE `id` = 27661;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 27661;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27661;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27661,0,0,1,27,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wintergarde Gryphon - On Passenger Boarded - Set Active On (CONDITION_OBJECT_ENTRY_GUID)'),
(27661,0,1,0,61,0,100,0,0,0,0,0,0,53,1,27661,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wintergarde Gryphon - Linked - Start WP Movement'),
(27661,0,2,0,58,0,100,0,0,27661,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wintergarde Gryphon - On WP Path Ended - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 27661;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 27661;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 16 AND `SourceEntry` = 27661;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 9570;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(18,27661,46598,0,0,47,0,12325,10,0,0,0,0,'Wintergarde Gryphon - Group 0: Spell click event only if quest ''Into Hostile Territory'' is completed or in progress'),
(18,27661,46598,0,1,31,0,3,27662,0,0,0,0,'Wintergarde Gryphon - Group 1: Spell click event only if invoker is creature ''Wintergarde Gryphon Rider'''),

(22,1,27661,0,0,31,0,4,0,0,0,0,0,'Wintergarde Gryphon - Group 0: Execute SAI ID 0 only if invoker is player'),

(16,0,27661,0,0,23,0,4188,0,0,0,0,0,'Wintergarde Gryphon - Group 0: Vehicle needs to be in area ''The Carrion Fields'''),
(16,0,27661,0,1,23,0,4177,0,0,0,0,0,'Wintergarde Gryphon - Group 1: Vehicle needs to be in area ''Wintergarde Keep'''),
(16,0,27661,0,2,23,0,4178,0,0,0,0,0,'Wintergarde Gryphon - Group 2: Vehicle needs to be in area ''Wintergarde Mine'''),
(16,0,27661,0,3,23,0,4190,0,0,0,0,0,'Wintergarde Gryphon - Group 3: Vehicle needs to be in area ''Thorson''s Post'''),

(14,9570,12905,0,0,47,0,12325,10,0,0,0,0,'Master Smith Burninate - Group 0: Show gossip text 12905 if quest ''Into Hostile Territory'' is completed or in progress'),
(14,9570,12904,0,0,47,0,12325,10,0,1,0,0,'Master Smith Burninate - Group 0: Show gossip text 12904 if quest ''Into Hostile Territory'' is not completed or in progress');

DELETE FROM `waypoints` WHERE `entry` = 27661;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(27661,1,3713.96,-699.153,223.542,'Wintergarde Gryphon'),
(27661,2,3708.92,-705.368,225.273,NULL),
(27661,3,3706.68,-713.634,227.012,NULL),
(27661,4,3707.6,-725.592,229.227,NULL),
(27661,5,3716.08,-743.113,235.212,NULL),
(27661,6,3738.72,-777.463,250.112,NULL),
(27661,7,3781.1,-863.255,247.523,NULL),
(27661,8,3844.89,-992.365,243.626,NULL),
(27661,9,3851.62,-1062.85,242.003,NULL),
(27661,10,3855.3,-1181.98,208.948,NULL),
(27661,11,3861.54,-1384.15,152.856,NULL);
