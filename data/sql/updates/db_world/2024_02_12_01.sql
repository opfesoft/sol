DELETE FROM `creature` WHERE `guid` IN (106327,106350);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(106327,20431,530,0,0,1,1,0,0,-4151.47,1285.95,66.784,5.89921,300,0,42,0,0,0,0,0),
(106350,20431,530,0,0,1,1,0,0,-4280.86,1311.67,66.6485,0.733038,300,0,42,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` IN (70850,70851,70852,70853,70854,70856,70858,70862,70869,77143,77144,77145,77147,77150,77151,77152,77153);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 22022;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19796,22017,22022);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1979600,1979601,2201700,2201701);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19796,0,0,0,0,0,100,0,2000,7000,12000,17000,0,11,37986,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Eclipsion Archmage - IC - Cast ''Ancient Fire'''),
(19796,0,1,0,0,0,100,0,0,0,3000,5000,0,11,13878,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Eclipsion Archmage - IC - Cast ''Scorch'''),
(19796,0,2,0,0,0,100,0,9000,15000,16000,24000,0,11,11829,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Eclipsion Archmage - IC - Cast ''Flamestrike'''),
(19796,0,3,0,1,0,100,0,10000,20000,15000,30000,0,87,1979600,1979601,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eclipsion Archmage - OOC - Call Random Timed Action List'),

(1979600,9,0,0,0,0,100,0,0,0,0,0,0,11,35190,0,0,0,0,0,19,20431,30,0,0,0,0,0,0,'Eclipsion Archmage - On Script - Cast ''Crystal Channel'' (Eclipse Point - Bloodcrystal Spell Orgin)'),
(1979601,9,0,0,0,0,100,0,0,0,0,0,0,92,0,35190,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eclipsion Archmage - On Script - Interrupt ''Crystal Channel'''),

(22017,0,0,0,0,0,100,0,0,0,2400,3800,0,11,34446,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Eclipsion Spellbinder - IC - Cast ''Arcane Missiles'''),
(22017,0,1,0,0,0,100,0,8000,12000,18000,24000,0,11,18972,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Eclipsion Spellbinder - IC - Cast ''Slow'''),
(22017,0,2,0,2,0,100,0,0,40,0,0,0,11,38171,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eclipsion Spellbinder - Between 0-40% Health - Cast ''Summon Arcane Bursts'''),
(22017,0,3,0,2,0,100,0,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Eclipsion Spellbinder - Between 0-15% Health - Flee For Assist'),
(22017,0,4,0,1,0,100,0,10000,20000,15000,30000,0,87,2201700,2201701,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eclipsion Spellbinder - OOC - Call Random Timed Action List'),

(2201700,9,0,0,0,0,100,0,0,0,0,0,0,11,35190,0,0,0,0,0,19,20431,30,0,0,0,0,0,0,'Eclipsion Spellbinder - On Script - Cast ''Crystal Channel'' (Eclipse Point - Bloodcrystal Spell Orgin)'),
(2201701,9,0,0,0,0,100,0,0,0,0,0,0,92,0,35190,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eclipsion Spellbinder - On Script - Interrupt ''Crystal Channel'''),

(22022,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,30,0,0,0,0,0,0,0,'Arcane Burst - On Just Summoned - Start Attack (Owner''s Victim)'),
(22022,0,1,0,0,0,100,0,2000,4000,4000,7000,0,11,34517,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Arcane Burst - IC - Cast Arcane Explosion');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 35190;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,35190,0,1,31,0,3,20431,0,0,0,0,'Spell ''Crystal Channel'' - Group 0: Implicit target creature ''Eclipse Point - Bloodcrystal Spell Orgin''');
