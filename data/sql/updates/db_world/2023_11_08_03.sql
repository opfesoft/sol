DELETE FROM `gameobject` WHERE `guid` IN (3009198,3009199);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009198,186425,1,0,0,1,1,-2967.03,-3872.18,33.0928,2.24779,0,0,0,0,-1,100,1,0),
(3009199,186418,1,0,0,1,1,-2954.89,-3883.94,32.9969,2.60053,0,0,0,0,-1,100,1,0);

DELETE FROM `event_scripts` WHERE `id` = 15452;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(15452,0,51,3,3,4792,100,0,0,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (4792,23843);
UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~768, `ScriptName` = '', `AIName` = 'SmartAI' WHERE `entry` = 23864;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4792,23843,23864);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2384300,2384301,2384302,479200,2386400);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23843,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Respawn - Disable Event Phase Reset'),
(23843,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - Linked - Set Event Phase 1'),
(23843,0,2,0,34,0,100,0,2,1,0,0,0,80,2384300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On WP 2 Reached (Event Phase 1) - Call Timed Action List'),
(23843,0,3,0,34,1,100,0,2,4,0,0,0,80,2384301,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On WP 5 Reached - Call Timed Action List'),
(23843,0,4,0,34,0,100,0,2,7,0,0,0,80,2384302,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On WP 8 Reached - Call Timed Action List'),
(23843,0,5,0,38,0,100,0,1,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Data Set 1 1 - Set Event Phase 2'),
(23843,0,6,0,38,0,100,0,2,2,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Data Set 2 2 - Set Event Phase 1'),

(2384300,9,0,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,4792,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Set Data 1 1 ("Swamp Eye" Jarl)'),
(2384300,9,1,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Remove NPC Flags'),

(2384301,9,0,0,0,0,100,0,3000,3000,0,0,0,5,381,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Play Emote ''ONESHOT_LOOT'''),
(2384301,9,1,0,0,0,100,0,1000,1000,0,0,0,70,43,0,0,0,0,0,20,186418,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Respawn Target (Mordant''s Gift)'),
(2384301,9,2,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Say Line 0'),
(2384301,9,3,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Say Line 1'),
(2384301,9,4,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Say Line 2'),
(2384301,9,5,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,19,4792,20,0,0,0,0,0,0,'Mordant Grimsby - On Script - Say Line 0 ("Swamp Eye" Jarl)'),
(2384301,9,6,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Say Line 3'),
(2384301,9,7,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,19,4792,20,0,0,0,0,0,0,'Mordant Grimsby - On Script - Say Line 1 ("Swamp Eye" Jarl)'),
(2384301,9,8,0,0,0,100,0,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Say Line 4'),
(2384301,9,9,0,0,0,100,0,8000,8000,0,0,0,5,381,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Play Emote ''ONESHOT_LOOT'''),

(2384302,9,0,0,0,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Restore NPC Flags'),
(2384302,9,1,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,4792,0,0,0,0,0,0,0,'Mordant Grimsby - On Script - Set Data 2 2 ("Swamp Eye" Jarl)'),

(4792,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Respawn - Disable Event Phase Reset'),
(4792,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - Linked - Set Event Phase 1'),
(4792,0,2,3,38,0,100,0,1,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Data Set 1 1 - Set Event Phase 2'),
(4792,0,3,0,61,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - Linked - Remove NPC Flags'),
(4792,0,4,5,38,0,100,0,2,2,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Data Set 2 2 - Set Event Phase 1'),
(4792,0,5,0,61,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - Linked - Restore NPC Flags'),
(4792,0,6,0,38,1,100,0,3,3,0,0,0,80,479200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Data Set 3 3 (Event Phase 1) - Call Timed Action List'),
(4792,0,7,0,38,0,100,0,3,3,0,0,0,70,20,0,0,0,0,0,20,186425,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Data Set 3 3 - Respawn Target (Witchbane Torch)'),

(479200,9,0,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Script - Remove NPC Flags'),
(479200,9,1,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,23843,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Script - Set Data 1 1 (Mordant Grimsby)'),
(479200,9,2,0,0,0,100,0,0,0,0,0,0,11,42515,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Script - Cast ''Jarl Beam'''),
(479200,9,3,0,0,0,100,0,8000,8000,0,0,0,86,42517,0,19,23868,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Script - Cross Cast ''Beam to Zelfrax'''),
(479200,9,4,0,0,0,100,0,7000,7000,0,0,0,12,23864,1,60000,0,0,0,8,0,0,0,0,-2984.98,-3853.72,45.7142,5.44525,'"Swamp Eye" Jarl - On Script - Summon Creature ''Zelfrax'''),
(479200,9,5,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,23843,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Script - Set Data 2 2 (Mordant Grimsby)'),
(479200,9,6,0,0,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Swamp Eye" Jarl - On Script - Restore NPC Flags'),

(23864,0,0,0,54,0,100,0,0,0,0,0,0,80,2386400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zelfrax - On Just Summoned - Call Timed Action List'),
(23864,0,1,2,34,0,100,0,8,1,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zelfrax - On Point 1 Reached - Set Home Position'),
(23864,0,2,3,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zelfrax - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(23864,0,3,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,30,0,0,0,0,0,0,0,'Zelfrax - Linked - Start Attack (Closest Player)'),

(2386400,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zelfrax - On Script - Set Active On'),
(2386400,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zelfrax - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2386400,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zelfrax - On Script - Say Line 0'),
(2386400,9,3,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zelfrax - On Script - Say Line 1'),
(2386400,9,4,0,0,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,-2967.030,-3872.1799,35.620,0,'Zelfrax - On Script - Move To Point 1');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (42515,42517);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,42515,0,0,31,0,3,23868,0,0,0,0,'Spell ''Jarl Beam'' - Group 0: Implicit target creature ''Invis Zelfrax Target'''),
(13,1,42517,0,0,31,0,3,23869,0,0,0,0,'Spell ''Beam to Zelfrax'' - Group 0: Implicit target creature ''Invis Zelfrax Origin''');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 8470;
UPDATE `creature_addon` SET `path_id` = 84700 WHERE `guid` = 8470;
DELETE FROM `waypoint_data` WHERE `id` = 84700;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(84700,1,-2948.36,-3893.17,35.0324,2.46798,300000,0,0,0,100,0),
(84700,2,-2948.36,-3893.17,35.0324,NULL,0,0,0,0,100,0),
(84700,3,-2953.55,-3887.81,34.9859,NULL,0,0,0,0,100,0),
(84700,4,-2955.81,-3885.48,33.2245,NULL,0,0,0,0,100,0),
(84700,5,-2955.98,-3882.95,32.8433,5.6308,48000,0,0,0,100,0),
(84700,6,-2955.81,-3885.48,33.2245,NULL,0,0,0,0,100,0),
(84700,7,-2953.55,-3887.81,34.9859,NULL,0,0,0,0,100,0),
(84700,8,-2948.36,-3893.17,35.0324,NULL,0,0,0,0,100,0);
