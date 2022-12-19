UPDATE `spell_dbc` SET `Effect1` = 76, -- SPELL_EFFECT_SUMMON_OBJECT_WILD
`EffectImplicitTargetA1` = 18,         -- TARGET_DEST_CASTER
`EffectMiscValue1` = 185541            -- GO entry (Raven Stone Fragment)
WHERE `ID` = 39797;

DELETE FROM `gameobject` WHERE `guid` IN (39908,39909,39910,39911,39912,39913,39914,39915,39916,39917,39918,39919,39920);

UPDATE `creature` SET `modelid` = 17188, `spawntimesecs` = 300 WHERE `id` = 22986;
DELETE FROM `creature` WHERE `guid` IN (3009141,3009142,3009143,3009144,3009145,3009146,3009147,3009148);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009141,22986,530,0,0,1,1,17188,0,-3709.53,3744.06,277.073,1.62054,300,0,0,0,0,0,0,0,0),
(3009142,22986,530,0,0,1,1,17188,0,-3758.84,3732.39,276.846,5.73288,300,0,0,0,0,0,0,0,0),
(3009143,22986,530,0,0,1,1,17188,0,-3687.76,3677.07,275.927,5.73288,300,0,0,0,0,0,0,0,0),
(3009144,22986,530,0,0,1,1,17188,0,-3591.33,3724.59,285.996,5.73288,300,0,0,0,0,0,0,0,0),
(3009145,22986,530,0,0,1,1,17188,0,-3615.09,3667.87,277.788,1.00477,300,0,0,0,0,0,0,0,0),
(3009146,22986,530,0,0,1,1,17188,0,-3642.5,3189.22,314.596,1.50114,300,0,0,0,0,0,0,0,0),
(3009147,22986,530,0,0,1,1,17188,0,-3967.37,3323.17,289.012,1.50114,300,0,0,0,0,0,0,0,0),
(3009148,22986,530,0,0,1,1,17188,0,-3523.61,3591.08,279.754,0.483256,300,0,0,0,0,0,0,0,0);

DELETE FROM `creature_text` WHERE `CreatureId` = 22972;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(22972,0,0,'%s looks at you for a moment, then motions for you to follow.',16,0,100,0,0,0,20689,0,'Cenarion Sparrowhawk'),
(22972,1,0,'%s surveys the ground for buried raven stones.',16,0,100,0,0,0,20675,0,'Cenarion Sparrowhawk'),
(22972,2,0,'%s locates a buried raven stone.',16,0,100,0,0,0,20676,0,'Cenarion Sparrowhawk'),
(22972,3,0,'%s doesn''t seem to have had any luck finding raven stones nearby.',16,0,100,0,0,0,21065,0,'Cenarion Sparrowhawk');

UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 768, `flags_extra` = `flags_extra` | 512, `InhabitType` = 3, `AIName` = 'SmartAI' WHERE `entry` = 22972;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 22972;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2297200,2297201,2297202);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22972,0,0,0,54,0,100,0,0,0,0,0,0,80,2297200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Just Summoned - Call Timed Action List'),
(22972,0,1,0,54,0,100,0,0,0,0,0,0,80,2297201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Just Summoned - Call Timed Action List'),
(22972,0,2,0,34,0,100,0,8,1,0,0,0,80,2297202,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Point 1 Reached - Call Timed Action List'),

(2297200,9,0,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Set Run Off'),
(2297200,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Set Orientation (Summoner)'),
(2297200,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Say Line 0'),
(2297200,9,3,0,0,0,100,0,1000,1000,0,0,0,89,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Enable Random Movement'),
(2297200,9,4,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Say Line 1'),
(2297200,9,5,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Say Line 3'),
(2297200,9,6,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Set Run On'),
(2297200,9,7,0,0,0,100,0,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Set Fly On'),
(2297200,9,8,0,0,0,100,0,1000,1000,0,0,0,114,90,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Rise Up'),
(2297200,9,9,0,0,0,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Force Despawn'),

(2297201,9,0,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Set Run Off'),
(2297201,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Set Orientation (Summoner)'),
(2297201,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Say Line 0'),
(2297201,9,3,0,0,0,100,0,3000,3000,0,0,0,69,1,0,0,0,0,0,19,22986,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Move To Point 1 (Skettis - Invis Raven Stone)'),
(2297201,9,4,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Say Line 1'),

(2297202,9,0,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Say Line 2'),
(2297202,9,1,0,0,0,100,0,2000,2000,0,0,0,11,39797,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Cast ''Summon Raven Stone'''),
(2297202,9,2,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,19,22986,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Force Despawn (Skettis - Invis Raven Stone)'),
(2297202,9,3,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Set Run On'),
(2297202,9,4,0,0,0,100,0,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Set Fly On'),
(2297202,9,5,0,0,0,100,0,2000,2000,0,0,0,114,90,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Rise Up'),
(2297202,9,6,0,0,0,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Sparrowhawk - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 22972 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,22972,0,0,29,1,22986,40,0,1,0,0,'Cenarion Sparrowhawk - Group 0: Execute SAI ID 0 only if not near creature ''Skettis - Invis Raven Stone'''),
(22,2,22972,0,0,29,1,22986,40,0,0,0,0,'Cenarion Sparrowhawk - Group 0: Execute SAI ID 1 only if near creature ''Skettis - Invis Raven Stone''');
