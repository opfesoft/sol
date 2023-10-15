UPDATE `gameobject` SET `spawntimesecs` = -1 WHERE `guid` IN (67923,67927);

DELETE FROM `creature` WHERE `guid` BETWEEN 3009634 AND 3009636;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009634,33439,571,0,0,1,1,0,0,8461.73,468.747,596.234,4.72984,-1,0,1,0,0,0,0,0,0),
(3009635,33455,571,0,0,1,1,0,0,8441.86,452.882,596.166,1.85005,-1,0,1,0,0,0,0,0,0),
(3009636,33457,571,0,0,1,1,0,0,8471.44,452.217,596.155,4.7822,-1,0,1,0,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` BETWEEN 3009634 AND 3009636;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(3009634,0,0,0,0,0,0,'51195 29266'),
(3009635,0,0,0,0,0,0,'41290 61894 29266'),
(3009636,0,0,0,0,0,0,'29266');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (33439,33457,33455);
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` IN (194537,194539,194538);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (33439,33457,33455);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (194537,194539,194538);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(194537,1,0,0,71,0,100,0,21077,0,0,0,0,70,1,0,0,0,0,0,10,3009634,33439,1,0,0,0,0,0,'Sir Wendell''s Grave - On GO Event - Respawn Target (Sir Wendell Balfour)'),
(33439,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sir Wendell Balfour - On Respawn - Set Active On'),
(33439,0,1,2,61,0,100,0,0,0,0,0,0,11,10389,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sir Wendell Balfour - Linked - Cast ''Spawn Smoke'''),
(33439,0,2,0,61,0,100,0,0,0,0,0,0,41,19000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sir Wendell Balfour - Linked - Force Despawn'),

(194539,1,0,1,71,0,100,0,21075,0,0,0,0,70,1,0,0,0,0,0,10,3009635,33455,1,0,0,0,0,0,'Lorien''s Grave - On GO Event - Respawn Target (Lorien Sunblaze)'),
(194539,1,1,0,61,0,100,0,0,0,0,0,0,70,19,0,0,0,0,0,14,67927,194357,1,0,0,0,0,0,'Lorien''s Grave - Linked - Respawn Target (Poison Vial)'),
(33455,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lorien Sunblaze - On Respawn - Set Active On'),
(33455,0,1,0,61,0,100,0,0,0,0,0,0,41,19000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lorien Sunblaze - Linked - Force Despawn'),

(194538,1,0,1,71,0,100,0,21076,0,0,0,0,70,1,0,0,0,0,0,10,3009636,33457,1,0,0,0,0,0,'Connall''s Grave - On GO Event - Respawn Target (Conall Irongrip)'),
(194538,1,1,0,61,0,100,0,0,0,0,0,0,70,19,0,0,0,0,0,14,67923,194352,1,0,0,0,0,0,'Connall''s Grave - Linked - Respawn Target (Sword in the Back)'),
(33457,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Conall Irongrip - On Respawn - Set Active On'),
(33457,0,1,0,61,0,100,0,0,0,0,0,0,41,19000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Conall Irongrip - Linked - Force Despawn');
