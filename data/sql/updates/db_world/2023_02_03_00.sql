DELETE FROM `creature_text` WHERE `CreatureID` = 21504 AND `GroupID` > 13;

UPDATE `creature` SET `position_x` = -2288.35, `position_y` = 3091.5, `orientation` = 3.2263 WHERE `guid` = 86925;
DELETE FROM `creature_addon` WHERE `guid` = 86925;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(86925,0,0,0,0,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21504,18554,20617,20781);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2150400,2150401,2150402,1855400,2078100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21504,0,0,1,54,0,100,0,0,0,0,0,0,11,34427,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Just Summoned - Cast ''Ethereal Teleport'''),
(21504,0,1,0,61,0,100,0,0,0,0,0,0,11,33900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - Linked - Cast ''Shroud of Death'''),
(21504,0,2,0,38,0,100,0,1,1,0,0,0,80,2150400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Data Set 1 1 - Call Timed Action List'),
(21504,0,3,0,38,0,100,0,2,2,0,0,0,80,2150401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Data Set 2 2 - Call Timed Action List'),
(21504,0,4,0,38,0,100,0,3,3,0,0,0,80,2150402,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Data Set 3 3 - Call Timed Action List'),

(2150400,9,0,0,0,0,100,0,1000,1000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Say Line 8'),
(2150400,9,1,0,0,0,100,0,5000,5000,0,0,0,11,34427,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Cast ''Ethereal Teleport'''),
(2150400,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Force Despawn'),

(2150401,9,0,0,0,0,100,0,1000,1000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Say Line 9'),
(2150401,9,1,0,0,0,100,0,12000,12000,0,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Say Line 10'),
(2150401,9,2,0,0,0,100,0,12000,12000,0,0,0,11,23017,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - Cast ''Arcane Channeling'''),
(2150401,9,3,0,0,0,100,0,0,0,0,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Say Line 11'),
(2150401,9,4,0,0,0,100,0,12000,12000,0,0,0,92,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Interrupt Spell'),
(2150401,9,5,0,0,0,100,0,0,0,0,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Say Line 12'),
(2150401,9,6,0,0,0,100,0,0,0,0,0,0,12,19305,1,60000,0,0,0,8,0,0,0,0,107.409,4839.76,78.9819,6.11836,'Pathaleon the Calculator''s Image - On Script - Summon Creature ''Goliathon'''),
(2150401,9,7,0,0,0,100,0,5000,5000,0,0,0,11,34427,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Cast ''Ethereal Teleport'''),
(2150401,9,8,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Force Despawn'),

(2150402,9,0,0,0,0,100,0,8000,8000,0,0,0,11,34427,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Cast ''Ethereal Teleport'''),
(2150402,9,1,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pathaleon the Calculator''s Image - On Script - Force Despawn'),

(18554,0,0,0,0,0,100,0,3000,5000,40000,45000,0,11,15277,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - IC - Cast ''Seal of Reckoning'''),
(18554,0,1,0,2,0,100,0,0,40,15000,20000,0,11,13952,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - Between 0-40% Health - Cast ''Holy Light'''),
(18554,0,2,3,4,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Sharth Voldoun - On Aggro - Say Line 0'),
(18554,0,3,4,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,21504,50,0,0,0,0,0,0,'Sharth Voldoun - Linked - Set Data 1 1 (Pathaleon the Calculator''s Image)'),
(18554,0,4,0,61,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - Linked - Remove ''UNIT_STAND_STATE_KNEEL'''),
(18554,0,5,0,1,0,100,0,0,0,360000,360000,0,80,1855400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - OOC - Call Timed Action List'),

(1855400,9,0,0,0,0,100,0,30000,30000,0,0,0,12,21504,8,0,0,0,0,8,0,0,0,0,-2293.52,3091.34,152.818,6.17546,'Sharth Voldoun - On Script - Summon Creature ''Pathaleon the Calculator''s Image'''),
(1855400,9,1,0,0,0,100,0,2000,2000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1855400,9,2,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Say Line 1'),
(1855400,9,3,0,0,0,100,0,7000,7000,0,0,0,1,13,0,0,0,0,0,19,21504,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Say Line 13 (Pathaleon the Calculator''s Image)'),
(1855400,9,4,0,0,0,100,0,3000,3000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1855400,9,5,0,0,0,100,0,8000,8000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Say Line 2'),
(1855400,9,6,0,0,0,100,0,14000,14000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Say Line 3'),
(1855400,9,7,0,0,0,100,0,4000,4000,0,0,0,1,4,0,0,0,0,0,19,21504,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Say Line 4 (Pathaleon the Calculator''s Image)'),
(1855400,9,8,0,0,0,100,0,16000,16000,0,0,0,1,5,0,0,0,0,0,19,21504,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Say Line 5 (Pathaleon the Calculator''s Image)'),
(1855400,9,9,0,0,0,100,0,16000,16000,0,0,0,1,6,0,0,0,0,0,19,21504,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Say Line 6 (Pathaleon the Calculator''s Image)'),
(1855400,9,10,0,0,0,100,0,10000,10000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Say Line 4'),
(1855400,9,11,0,0,0,100,0,13000,13000,0,0,0,1,7,0,0,0,0,0,19,21504,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Say Line 7 (Pathaleon the Calculator''s Image)'),
(1855400,9,12,0,0,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,19,21504,0,0,0,0,0,0,0,'Sharth Voldoun - On Script - Set Data 3 3 (Pathaleon the Calculator''s Image)'),

(20617,0,0,0,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Red Crystal Trigger - On Data Set 1 1 - Set Event Phase 1'),
(20617,0,1,0,1,1,100,0,0,0,2500,3500,0,11,35487,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Red Crystal Trigger - OOC (Event Phase 1) - Cast ''Seed of Revitalization Lightning Cloud Visual'''),
(20617,0,2,0,38,0,100,0,2,2,0,0,0,11,35468,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Red Crystal Trigger - On Data Set 2 2 - Cast ''Seed of Revitalization Entangling Roots Visual'''),
(20617,0,3,0,38,0,100,0,3,3,0,0,0,11,35471,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Red Crystal Trigger - On Data Set 3 3 - Cast ''Seed of Revitalization Giant Insect Swarm Visual'''),
(20617,0,4,5,38,0,100,0,4,4,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Red Crystal Trigger - On Data Set 4 4 - Set Event Phase 0'),
(20617,0,5,0,61,0,100,0,0,0,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Red Crystal Trigger - Linked - Remove All Auras'),

(20781,0,0,0,8,0,100,0,35413,0,60000,60000,0,80,2078100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Seed of Revitalization Target Trigger - On Spellhit ''Seed of Revitalization'' - Call Timed Action List'),

(2078100,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Seed of Revitalization Target Trigger - On Script - Set Active On'),
(2078100,9,1,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,9,20617,0,100,0,0,0,0,0,'Seed of Revitalization Target Trigger - On Script - Set Data 1 1 (Red Crystal Trigger)'),
(2078100,9,2,0,0,0,100,0,8000,8000,0,0,0,45,2,2,0,0,0,0,10,72893,20617,0,0,0,0,0,0,'Seed of Revitalization Target Trigger - On Script - Set Data 2 2 (Red Crystal Trigger)'),
(2078100,9,3,0,0,0,100,0,0,0,0,0,0,12,21504,1,60000,0,0,0,8,0,0,0,0,129.135,4834.79,76.1942,0.0698132,'Seed of Revitalization Target Trigger - On Script - Summon Creature ''Pathaleon the Calculator''s Image'''),
(2078100,9,4,0,0,0,100,0,2000,2000,0,0,0,45,2,2,0,0,0,0,19,21504,0,0,0,0,0,0,0,'Seed of Revitalization Target Trigger - On Script - Set Data 2 2 (Pathaleon the Calculator''s Image)'),
(2078100,9,5,0,0,0,100,0,10000,10000,0,0,0,45,3,3,0,0,0,0,10,72891,20617,0,0,0,0,0,0,'Seed of Revitalization Target Trigger - On Script - Set Data 3 3 (Red Crystal Trigger)'),
(2078100,9,6,0,0,0,100,0,26000,26000,0,0,0,45,4,4,0,0,0,0,9,20617,0,100,0,0,0,0,0,'Seed of Revitalization Target Trigger - On Script - Set Data 4 4 (Red Crystal Trigger)'),
(2078100,9,7,0,0,0,100,0,10000,10000,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Seed of Revitalization Target Trigger - On Script - Set Active Off');
