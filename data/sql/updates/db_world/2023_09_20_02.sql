DELETE FROM `creature` WHERE `guid` = 3009606;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009606,28105,571,0,0,1,1,0,1,6708.7,5115.45,-18.3037,0.7,-1,0,1,0,0,0,0,0,0);

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI', `ScriptName` = '' WHERE `entry` = 190578;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28105,28399);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 190578;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2839900,19057800);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(190578,1,0,0,64,0,100,0,2,0,0,0,0,80,19057800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mistwhisper Treasure - On Gossip Hello - Call Timed Action List'),

(19057800,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mistwhisper Treasure - On Script - Store Target 1 (Invoker)'),
(19057800,9,1,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,10,3009606,28105,1,2,0,0,0,0,'Mistwhisper Treasure - On Script - Send Target 1 (Warlord Tartek)'),
(19057800,9,2,0,0,0,100,0,2000,2000,0,0,0,70,0,0,0,0,0,0,10,3009606,28105,1,2,0,0,0,0,'Mistwhisper Treasure - On Script - Respawn Target (Warlord Tartek)'),

(28105,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warlord Tartek - On Respawn - Set Active On'),
(28105,0,1,2,61,0,100,0,0,0,0,0,0,2,2061,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warlord Tartek - Linked - Set Faction ''Frenzyheart Tribe'''),
(28105,0,2,3,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warlord Tartek - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(28105,0,3,0,61,0,100,0,0,0,0,0,0,12,28399,1,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Warlord Tartek - Linked - Summon Creature ''Zeptek the Destroyer'''),
(28105,0,4,5,17,0,100,0,28399,0,0,0,0,11,46598,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Warlord Tartek - On Summoned Unit ''Zeptek the Destroyer'' - Cast ''Ride Vehicle Hardcoded'' (Invoker)'),
(28105,0,5,6,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mistwhisper Treasure - Linked - Send Target 1 (Invoker)'),
(28105,0,6,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warlord Tartek - Linked - Say Line 0'),
(28105,0,7,8,38,0,100,0,1,1,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warlord Tartek - On Data Set 1 1 - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(28105,0,8,9,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Warlord Tartek - Linked - Start Attack (Stored Target 1)'),
(28105,0,9,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warlord Tartek - Linked - Say Line 1'),
(28105,0,10,0,1,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warlord Tartek - OOC - Force Despawn'),
(28105,0,11,0,9,0,100,0,5000,8000,5000,8000,0,11,29426,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warlord Tartek - IC - Cast ''Heroic Strike'''),
(28105,0,12,0,0,0,100,0,5000,15000,5000,15000,0,11,35429,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Warlord Tartek - IC - Cast ''Sweeping Strikes'''),
(28105,0,13,0,0,0,100,0,6000,15000,6000,15000,0,11,15572,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warlord Tartek - IC - Cast ''Sunder Armor'''),
(28105,0,14,15,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,9,28121,0,50,0,0,0,0,0,'Warlord Tartek - On Death - Set Data 1 1 (Jaloot)'),
(28105,0,15,0,61,0,100,0,0,0,0,0,0,15,12575,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Warlord Tartek - Linked - Quest Credit ''The Lost Mistwhisper Treasure'' (Stored Target 1)'),

(28399,0,0,1,11,0,100,0,0,0,0,0,0,2,2061,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zeptek the Destroyer - On Respawn - Set Faction ''Frenzyheart Tribe'''),
(28399,0,1,2,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zeptek the Destroyer - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(28399,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,6712.46,5136.46,-19.3981,0,'Zeptek the Destroyer - Linked - Move To Point 1'),
(28399,0,3,0,34,0,100,0,8,1,0,0,0,80,2839900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zeptek the Destroyer - On Point 1 Reached - Call Timed Action List'),

(2839900,9,0,0,0,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,8,0,0,0,0,0,0,0,5.04094,'Zeptek the Destroyer - On Script - Set Orientation'),
(2839900,9,1,0,0,0,100,0,1000,1000,0,0,0,28,46598,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zeptek the Destroyer - On Script - Remove Aura ''Ride Vehicle Hardcoded'''),
(2839900,9,2,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,3009606,28105,1,1,0,0,0,0,'Zeptek the Destroyer - On Script - Set Data 1 1 (Warlord Tartek)'),
(2839900,9,3,0,0,0,100,0,1000,1000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zeptek the Destroyer - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2839900,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Zeptek the Destroyer - On Script - Start Attack (Stored Target 1)');

DELETE FROM `waypoints` WHERE `entry` = 28399;
