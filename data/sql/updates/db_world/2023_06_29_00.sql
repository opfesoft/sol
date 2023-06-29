UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` | 32768, `flags_extra` = `flags_extra` | 64 | 8388608 WHERE `entry` = 28408;
UPDATE `creature_template` SET `HoverHeight` = 3, `flags_extra` = `flags_extra` | 64 WHERE `entry` = 28389;
UPDATE `creature_template` SET `HoverHeight` = 9 WHERE `entry` = 28378;

DELETE FROM `creature_template_addon` WHERE `entry` = 28389;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(28389,0,0,50331648,0,0,0,NULL);

DELETE FROM `creature` WHERE `guid` IN (117807,117808);
UPDATE `creature` SET `position_x` = 6587.72, `position_y` = 4908.91, `position_z` = -43.8491, `orientation` = 1.53705 WHERE `guid` = 117806;
UPDATE `creature` SET `position_x` = 6434.73, `position_y` = 4759.83, `position_z` = -74.4109, `orientation` = 0.222084, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 116788;
UPDATE `creature` SET `spawntimesecs` = 180, `curhealth` = 1 WHERE `id` = 28408;
UPDATE `creature` SET `id` = 28408, `modelid` = 20245, `spawntimesecs` = 180, `wander_distance` = 0, `curhealth` = 1, `curmana` = 0, `MovementType` = 0 WHERE `id` = 28389;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28408,28389,28378);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28408,0,0,1,25,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake Egg - On Respawn - Set Root On'),
(28408,0,1,2,61,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake Egg - Linked - Set React State ''Passive'''),
(28408,0,2,3,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake Egg - Linked - Disable Event Phase Reset'),
(28408,0,3,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake Egg - Linked - Set Event Phase 1'),
(28408,0,4,0,23,0,100,0,52791,1,1000,1000,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'rimordial Drake Egg - On Has Aura ''Birthing Flame'' - Set Event Phase 2'),
(28408,0,5,6,23,2,100,0,52791,0,1000,1000,0,11,52792,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake Egg - On Has No Aura ''Birthing Flame'' (Event Phase 2) - Cast ''Birthing Flame'''),
(28408,0,6,0,61,0,100,0,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake Egg - Linked - Set Event Phase 3'),
(28408,0,7,0,6,0,100,0,0,0,0,0,0,12,28389,1,45000,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake Egg - On Death - Summon Creature ''Primordial Hatchling'''),

(28389,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Hatchling - On Just Summoned - Set Active On'),
(28389,0,1,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Hatchling - Linked - Start Random Movement'),
(28389,0,2,0,8,0,100,0,51592,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Hatchling - On Spellhit ''Pickup Primordial Hatchling'' - Force Despawn'),

(28378,0,0,0,1,0,100,0,120000,240000,120000,240000,0,11,52791,0,0,0,0,0,19,28408,15,0,0,0,0,0,0,'Primordial Drake - OOC - Cast ''Birthing Flame'' (CONDITION_UNIT_HAS_FLAG)'),
(28378,0,1,0,0,0,100,0,3000,6000,9000,12000,0,11,55071,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Primordial Drake - IC - Cast ''Flame Spit'''),
(28378,0,2,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake - On Death - Cross Cast ''Summon Drostan'' (CONDITION_QUEST_OBJECTIVE_PROGRESS)'),
(28378,0,3,0,11,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake - On Aggro - Set Fly Off (CONDITION_UNIT_HAS_FLAG)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (52791,52793);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` IN (1,4) AND`SourceEntry` = 28378;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,52791,0,0,31,0,3,28408,0,0,0,0,'Spell ''Birthing Flame'' - Group 0: Implicit target creature ''Primordial Drake Egg'''),
(13,1,52793,0,0,31,0,3,28408,0,0,0,0,'Spell ''Flames of Birth'' - Group 0: Implicit target creature ''Primordial Drake Egg'''),

(22,1,28378,0,0,153,1,74,50331648,0,1,0,0,'Creature ''Primordial Drake'' - Group 0: Execute SAI ID 0 if not hovering'),
(22,4,28378,0,0,153,1,74,50331648,0,1,0,0,'Creature ''Primordial Drake'' - Group 0: Execute SAI ID 3 if not hovering');
