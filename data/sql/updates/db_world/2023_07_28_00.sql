UPDATE `quest_template` SET `TimeAllowed` = 600 WHERE `ID` = 11690;
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 256 WHERE `entry` = 25596;
UPDATE `creature_template_addon` SET `auras` = '45771' WHERE `entry` = 25596;
UPDATE `creature` SET `modelid` = 0 WHERE `id` = 25596;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 25596;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25596,0,0,1,27,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infected Kodo Beast - On Passenger Boarded - Set Active On'),
(25596,0,1,2,61,0,100,0,0,0,0,0,0,41,120000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infected Kodo Beast - Linked - Force Despawn'),
(25596,0,2,3,61,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infected Kodo Beast - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(25596,0,3,4,61,0,100,0,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infected Kodo Beast - Linked - Remove ''UNIT_STAND_STATE_DEAD'''),
(25596,0,4,5,61,0,100,0,0,0,0,0,0,28,45771,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infected Kodo Beast - Linked - Remove Aura ''Scourge Infection'''),
(25596,0,5,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infected Kodo Beast - Linked - Say Line 0'),
(25596,0,6,0,8,0,100,0,45877,0,0,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infected Kodo Beast - On Spellhit ''Deliver Kodo'' - Cast ''Eject All Passengers'''),
(25596,0,7,0,28,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infected Kodo Beast - On Passenger Removed - Force Despawn');
