UPDATE `creature_template` SET `unit_flags` = 0, `flags_extra` = 0 WHERE `entry` = 20603;
UPDATE `creature_text` SET `BroadcastTextId` = 18283 WHERE `CreatureID` = 20552 AND `GroupID` = 0 AND `ID` = 0;

DELETE FROM `creature` WHERE `guid` = 3009607;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009607,20608,530,0,0,1,1,0,0,3749.38,2081.73,148.931,2.9799,300,0,1,0,0,0,0,0,0);

DELETE FROM `creature_text` WHERE `CreatureId` = 20603;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(20603,0,0,'This reflection of me is exceptionally weak. Don''t let these brutes lay a finger on my precious image.',12,0,100,0,0,0,18318,0,'Reflection of Ya-six'),
(20603,1,0,'Arconus is close. I can feel him. Take the northwest passage. He should be just up and around the corner. Be ready to battle!',12,0,100,0,0,0,18310,0,'Reflection of Ya-six'),
(20603,2,0,'This is the wrong way. Arconus is at the other end of the mine. You''re not chickening out, are you, fleshling? I won''t follow a coward.',12,0,100,0,0,0,18304,0,'Reflection of Ya-six');

DELETE FROM `gameobject` WHERE `guid` IN (5,15,20,24,28,30,32,34);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(5,184447,530,0,0,1,1,3793.59,2079.87,153.262,3.61391,0,0,-0.968147,0.250381,181,100,1,0),
(15,184447,530,0,0,1,1,3801.51,2087.91,150.493,4.7822,0,0,-0.681998,0.731354,181,100,1,0),
(20,184447,530,0,0,1,1,3836.21,2111.1,149.73,3.52557,0,0,-0.981627,0.190812,181,100,1,0),
(24,184447,530,0,0,1,1,3819.34,2098.08,147.986,3.15906,0,0,-0.999962,0.00873464,181,100,1,0),
(28,184447,530,0,0,1,1,3855.51,2154.05,140.302,3.05433,0,0,0.999048,0.0436193,181,100,1,0),
(30,184447,530,0,0,1,1,3876.8,2152.48,139.198,2.46091,0,0,0.942641,0.333808,181,100,1,0),
(32,184447,530,0,0,1,1,3891.8,2124.59,134.586,2.32129,0,0,0.91706,0.39875,181,100,1,0),
(34,184447,530,0,0,1,1,3907.58,2105.97,138.454,5.25344,0,0,-0.492423,0.870356,181,100,1,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20552,-247235,-247236,-3009607,20603);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 20554 AND `id` > 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20552,0,0,0,10,0,100,0,1,30,60000,60000,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Agent Ya-six - OOC LOS - Say Line 0 (CONDITION_OBJECT_ENTRY_GUID)'),

(-247235,0,0,0,10,0,100,0,1,5,1000,1000,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ya-six Spell Generator - OOC LOS - Set Data 1 1 (Invoker) (CONDITION_OBJECT_ENTRY_GUID)'),
(-247236,0,0,0,10,0,100,0,1,5,1000,1000,0,45,2,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ya-six Spell Generator - OOC LOS - Set Data 2 2 (Invoker) (CONDITION_OBJECT_ENTRY_GUID)'),
(-3009607,0,0,0,10,0,100,0,1,15,1000,1000,0,45,3,3,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ya-six Spell Generator - OOC LOS - Set Data 3 3 (Invoker) (CONDITION_OBJECT_ENTRY_GUID)'),

(20603,0,0,1,54,0,100,0,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reflection of Ya-six - On Just Summoned - Set React State ''Defensive'''),
(20603,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reflection of Ya-six - Linked - Say Line 0'),
(20603,0,2,3,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reflection of Ya-six - Linked - Disable Event Phase Reset'),
(20603,0,3,4,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reflection of Ya-six - Linked - Set Event Phase 1'),
(20603,0,4,0,61,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reflection of Ya-six - Linked - Cast ''Simple Teleport'''),
(20603,0,5,0,38,1,100,257,1,1,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reflection of Ya-six - On Data Set 1 1 - Say Line 1'),
(20603,0,6,0,38,1,100,257,2,2,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reflection of Ya-six - On Data Set 2 2 - Say Line 2'),
(20603,0,7,0,38,0,100,257,3,3,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reflection of Ya-six - On Data Set 3 3 - Force Despawn'),
(20603,0,8,0,38,1,100,257,4,4,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reflection of Ya-six - On Data Set 4 4 - Set Event Phase 2'),

(20554,0,2,0,6,0,100,0,0,0,0,0,0,45,4,4,0,0,0,0,11,20603,25,0,0,0,0,0,0,'Arconus the Insatiable - On Death - Set Data 4 4 (Reflection of Ya-six)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (20552,-247235,-247236,-3009607);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 35381;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,20552,0,0,31,0,4,0,0,0,0,0,'Creature ''Agent Ya-six'' - Group 0: Execute SAI ID 0 if near player'),
(22,1,20552,0,0,47,0,10353,74,0,1,0,0,'Creature ''Agent Ya-six'' - Group 0: Execute SAI ID 0 if quest ''Arconus the Insatiable'' is not in progress, completed or rewarded'),

(22,1,-247235,0,0,31,0,3,20603,0,0,0,0,'Creature ''Ya-six Spell Generator'' - Group 0: Execute SAI ID 0 if invoker is creature ''Reflection of Ya-six'''),
(22,1,-247236,0,0,31,0,3,20603,0,0,0,0,'Creature ''Ya-six Spell Generator'' - Group 0: Execute SAI ID 0 if invoker is creature ''Reflection of Ya-six'''),
(22,1,-3009607,0,0,31,0,3,20603,0,0,0,0,'Creature ''Ya-six Spell Generator'' - Group 0: Execute SAI ID 0 if invoker is creature ''Reflection of Ya-six'''),

(17,0,35381,0,0,1,0,35381,1,0,1,0,0,'Spell ''Reflection of Ya-six'' - Group 0: Can cast if has no aura ''Reflection of Ya-six''');
