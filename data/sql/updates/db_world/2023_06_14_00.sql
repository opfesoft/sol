UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 19565;
UPDATE `creature_template_addon` SET `isLarge` = 1 WHERE `entry` = 20933;
UPDATE `creature` SET `spawntimesecs` = 90 WHERE `guid` = 69970;

DELETE FROM `gameobject` WHERE `guid` IN (9381,9385,9386,99956);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(9381,184643,530,0,0,1,1,3930.18,2038.26,383.501,1.72,0,0,0,1,180,0,1,0),
(9385,184643,530,0,0,1,1,3902.94,1996.42,383.644,3.27509,0,0,0,1,180,0,1,0),
(9386,184643,530,0,0,1,1,3943,1970.1,383.321,5.10507,0,0,0,1,180,0,1,0),
(99956,184643,530,0,0,1,1,3964.1,2008.44,383.941,0.176697,0,0,0,1,180,0,1,0);

UPDATE `smart_scripts` SET `action_param1` = 628 WHERE `entryorguid` = 20903 AND `source_type` = 0 AND `id` = 0;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 20933;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20899,20933);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2093300;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20899,0,0,1,25,0,100,0,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Conduit - On Reset - Set Health Regeneration Off'),
(20899,0,1,0,61,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Conduit - Linked - Set React State ''Passive'''),
(20899,0,2,3,6,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,19554,0,0,0,0,0,0,0,'Void Conduit - On Death - Say Line 0 (Dimensius the All-Devouring)'),
(20899,0,3,4,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,9,20933,0,100,0,0,0,0,0,'Void Conduit - Linked - Set Data 1 1 (Camera Shakers Manaforge Ultris)'),
(20899,0,4,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,19,19565,0,0,0,0,0,0,0,'Void Conduit - Linked - Force Despawn (Enormous Void Storm)'),

(20933,0,0,0,38,0,100,0,1,1,0,0,0,80,2093300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Camera Shakers Manaforge Ultris - On Data Set 1 1 - Call Timed Action List'),

(2093300,9,0,0,0,0,100,0,0,1000,0,0,0,11,35761,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Camera Shakers Manaforge Ultris - On Script - Cast ''Ultris Explosion'''),
(2093300,9,1,0,0,0,100,0,1000,2000,0,0,0,11,35763,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Camera Shakers Manaforge Ultris - On Script - Cast ''Ultris Explosion'''),
(2093300,9,2,0,0,0,100,0,1000,2000,0,0,0,11,35763,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Camera Shakers Manaforge Ultris - On Script - Cast ''Ultris Explosion'''),
(2093300,9,3,0,0,0,100,0,1000,2000,0,0,0,11,35763,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Camera Shakers Manaforge Ultris - On Script - Cast ''Ultris Explosion'''),
(2093300,9,4,0,0,0,100,0,1000,2000,0,0,0,11,35763,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Camera Shakers Manaforge Ultris - On Script - Cast ''Ultris Explosion'''),
(2093300,9,5,0,0,0,100,0,1000,2000,0,0,0,11,35763,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Camera Shakers Manaforge Ultris - On Script - Cast ''Ultris Explosion''');
