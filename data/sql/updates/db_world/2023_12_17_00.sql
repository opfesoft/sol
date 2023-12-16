UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` IN (22340,22339);
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `id` = 22340;

DELETE FROM `creature_text` WHERE `CreatureId` = 22339;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(22339,0,0,'The %s flies up through the trees, free of Terokk''s corruption.',16,0,100,0,0,0,20136,0,'Redeemed Hatchling');

UPDATE `gameobject_template` SET `Data12` = 0 WHERE `entry` = 185211;

-- GO "[PH] Arakkoa Egg" not needed as trap (handled via SAI), use only for cosmetic purpose
UPDATE `gameobject_template` SET `type` = 5, `Data3` = 0, `Data4` = 0 WHERE `entry` = 185212;
UPDATE `gameobject_template_addon` SET `faction` = 0, `flags` = 16 WHERE `entry` = 185212;

UPDATE `gameobject` SET `spawntimesecs` = 180 WHERE `id` = 185211;
UPDATE `gameobject` SET `spawntimesecs` = 183 WHERE `id` = 185212;

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009200 AND 3009225;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009200,185211,530,0,0,1,1,-3579.06,5817.54,-3.24684,3.7348,0,0,-0.956334,0.292275,180,100,1),
(3009201,185212,530,0,0,1,1,-3579.06,5817.54,-3.24684,3.7348,0,0,-0.956334,0.292275,183,100,1),
(3009202,185211,530,0,0,1,1,-3550.81,5709.02,0.112858,1.5979,0,0,-0.716625,-0.697459,180,100,1),
(3009203,185212,530,0,0,1,1,-3550.81,5709.02,0.112858,1.5979,0,0,-0.716625,-0.697459,183,100,1),
(3009204,185211,530,0,0,1,1,-3687.46,5732.52,-0.673687,0.680559,0,0,-0.333751,-0.942661,180,100,1),
(3009205,185212,530,0,0,1,1,-3687.46,5732.52,-0.673687,0.680559,0,0,-0.333751,-0.942661,183,100,1),
(3009206,185211,530,0,0,1,1,-3620.8,5760.07,1.91674,5.29837,0,0,-0.472748,0.881198,180,100,1),
(3009207,185212,530,0,0,1,1,-3620.8,5760.07,1.91674,5.29837,0,0,-0.472748,0.881198,183,100,1),
(3009208,185211,530,0,0,1,1,-3674.35,5709.55,-0.758734,1.02344,0,0,-0.489679,-0.871903,180,100,1),
(3009209,185212,530,0,0,1,1,-3674.35,5709.55,-0.758734,1.02344,0,0,-0.489679,-0.871903,183,100,1),
(3009210,185211,530,0,0,1,1,-3568.88,5808.19,-3.25185,3.96701,0,0,0.916037,-0.401094,180,100,1),
(3009211,185212,530,0,0,1,1,-3568.88,5808.19,-3.25185,3.96701,0,0,0.916037,-0.401094,183,100,1),
(3009212,185211,530,0,0,1,1,-3624.43,5782.36,1.242,0.590728,0,0,0.532824,0.846226,180,100,1),
(3009213,185212,530,0,0,1,1,-3624.43,5782.36,1.242,0.590728,0,0,0.532824,0.846226,183,100,1),
(3009214,185211,530,0,0,1,1,-3625.97,5752.48,1.734,5.11856,0,0,0.532824,0.846226,180,100,1),
(3009215,185212,530,0,0,1,1,-3625.97,5752.48,1.734,5.11856,0,0,0.532824,0.846226,183,100,1),
(3009216,185211,530,0,0,1,1,-3663.87,5836.52,0.083,5.19711,0,0,0.532824,0.846226,180,100,1),
(3009217,185212,530,0,0,1,1,-3663.87,5836.52,0.083,5.19711,0,0,0.532824,0.846226,183,100,1),
(3009218,185211,530,0,0,1,1,-3680.92,5833.58,0.515,5.45236,0,0,0.532824,0.846226,180,100,1),
(3009219,185212,530,0,0,1,1,-3680.92,5833.58,0.515,5.45236,0,0,0.532824,0.846226,183,100,1),
(3009220,185211,530,0,0,1,1,-3538.94,5702.7,1.0183,0.629442,0,0,0.532824,0.846226,180,100,1),
(3009221,185212,530,0,0,1,1,-3538.94,5702.7,1.0183,0.629442,0,0,0.532824,0.846226,183,100,1),
(3009222,185211,530,0,0,1,1,-3669.77,5715.84,-1.06872,1.11918,0,0,0.530837,0.847474,180,100,1),
(3009223,185212,530,0,0,1,1,-3669.77,5715.84,-1.06872,1.11918,0,0,0.530837,0.847474,183,100,1),
(3009224,185211,530,0,0,1,1,-3692.92,5728.49,-1.08262,6.04755,0,0,0.117545,-0.993068,180,100,1),
(3009225,185212,530,0,0,1,1,-3692.92,5728.49,-1.08262,6.04755,0,0,0.117545,-0.993068,183,100,1);

UPDATE `quest_template` SET `RequiredNpcOrGo1` = 22339 WHERE `ID` = 10861;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 22339;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185211;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18521100,18521101);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22339,0,0,1,54,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Redeemed Hatchling - On Just Summoned - Set Run Off'),
(22339,0,1,2,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,19,22340,0,0,0,0,0,0,0,'Redeemed Hatchling - Linked - Move To Point 1 (Terokkar Arakkoa Fly Target)'),
(22339,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Redeemed Hatchling - Linked - Say Line 0'),
(22339,0,3,0,34,0,100,0,8,1,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Redeemed Hatchling - On Point 1 Reached - Force Despawn'),

(185211,1,0,1,70,0,100,1,2,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Cursed Egg - On GO State Changed ''GO_ACTIVATED'' (No Repeat) - Store Target 1 (Invoker)'),
(185211,1,1,2,61,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,20,185212,0,0,0,0,0,0,0,'Cursed Egg - Linked - Despawn GO ([PH] Arakkoa Egg)'),
(185211,1,2,0,61,0,100,0,0,0,0,0,0,244,1,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cursed Egg - Linked - Trigger Random Timed Event'),
(185211,1,3,4,59,0,100,0,1,0,0,0,0,33,22339,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Cursed Egg - Timed Event 1 Triggered - Quest Credit ''Redeemed Hatchling'' (Stored Target 1)'),
(185211,1,4,0,61,0,100,0,0,0,0,0,0,12,22339,1,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Cursed Egg - Linked - Summon Creature ''Redeemed Hatchling'''),
(185211,1,5,0,59,0,100,0,2,0,0,0,0,12,22337,1,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Cursed Egg - Timed Event 2 Triggered - Summon Creature ''Malevolent Hatchling''');
