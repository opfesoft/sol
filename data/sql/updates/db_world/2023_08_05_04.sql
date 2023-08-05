UPDATE `creature_template` SET `minlevel` = 50, `maxlevel` = 50 WHERE `entry` = 7167;
DELETE FROM `creature_loot_template` WHERE `Entry` = 7168 AND `Item` = 2449;
UPDATE `creature_loot_template` SET `QuestRequired` = 1 WHERE `Entry` = 7168 AND `Item` = 7968;
DELETE FROM `event_scripts` WHERE `id` = 2153;

DELETE FROM `creature` WHERE `guid` = 3009577;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009577,7167,1,0,0,1,1,0,0,-1458.03,-3921.66,0.26073,4.37341,-1,0,1,0,0,0,0,0,0);

DELETE FROM `creature_text` WHERE `CreatureId` IN (7167,7168);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(7167,0,0,'SQUAWK!!!',14,0,100,0,0,0,3170,0,'Polly'),
(7167,1,0,'MmmmmMmmmm... Enormous chemically altered cracker....',12,0,100,0,0,0,3167,0,'Polly'),
(7168,0,0,'What the squawk??? Squawk squawk, squawk? SQUAWK!',12,0,100,0,0,0,3165,0,'Polly');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 7168;
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 123462;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (7167,7168);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 123462;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (716700,716800);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(123462,1,0,0,70,0,100,0,2,0,0,0,0,70,0,0,0,0,0,0,10,3009577,7167,0,2,0,0,0,0,'The Jewel of the Southsea - On GO State Changed ''GO_ACTIVATED'' - Respawn Target (Polly)'),

(7167,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Respawn - Set Active On'),
(7167,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - Linked - Say Line 0'),
(7167,0,2,0,61,0,100,0,0,0,0,0,0,53,0,716700,0,0,1,2,1,0,0,0,0,0,0,0,0,'Polly - Linked - Start WP Movement'),
(7167,0,3,0,40,0,100,0,7,716700,0,0,0,54,60000,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On WP 7 Reached - Pause WP Movement'),
(7167,0,4,0,8,0,100,0,9976,0,0,0,0,80,716700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Spellhit ''Polly Eats the E.C.A.C.'' - Call Timed Action List'),

(716700,9,0,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Script - Set Home Position'),
(716700,9,1,0,0,0,100,0,0,0,0,0,0,55,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Script - Stop WP Movement'),
(716700,9,2,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Script - Set Faction ''Friendly'''),
(716700,9,3,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Script - Say Line 1'),
(716700,9,4,0,0,0,100,0,3000,3000,0,0,0,11,9998,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Script - Cast ''Summon Polly Jr.'''),
(716700,9,5,0,0,0,100,0,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Script - Force Despawn'),

(7168,0,0,0,54,0,100,0,0,0,0,0,0,80,716800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Just Summoned - Call Timed Action List'),
(7168,0,1,0,1,0,100,0,60000,60000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - OOC - Force Despawn'),

(716800,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Script - Set Active On'),
(716800,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Polly - On Script - Say Line 0');

DELETE FROM `waypoints` WHERE `entry` = 716700;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(716700,1,-1458.03,-3921.66,0.26073,'Polly'),
(716700,2,-1461.1,-3926.71,0.242263,NULL),
(716700,3,-1464.68,-3932.59,0.242263,NULL),
(716700,4,-1464.28,-3938.05,0.242263,NULL),
(716700,5,-1463.8,-3944.57,0.242263,NULL),
(716700,6,-1461.71,-3949.26,0.242263,NULL),
(716700,7,-1459,-3955.34,0.242263,NULL),
(716700,8,-1455.31,-3952.17,0.184372,NULL),
(716700,9,-1452.43,-3949.44,0.204293,NULL),
(716700,10,-1452.66,-3943.97,0.24238,NULL),
(716700,11,-1452.89,-3938.49,0.24238,NULL),
(716700,12,-1453.09,-3933.59,0.24238,NULL);
