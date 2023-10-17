UPDATE `creature_template` SET `faction` = 35 WHERE `entry` IN (5676,5677);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 5677;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (5676,5677);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (567600,567700);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5676,0,0,0,54,0,100,0,0,0,0,0,0,80,567600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Voidwalker - On Just Summoned - Call Timed Action List'),
(5676,0,1,0,2,0,100,0,0,30,0,0,0,11,7750,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Voidwalker - Between 0-30% Health - Cast ''Consuming Rage'''),
(5676,0,2,0,4,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Voidwalker - On Aggro - Say Line 1'),
(5676,0,3,0,1,0,100,0,10000,10000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Voidwalker - OOC - Force Despawn'),

(567600,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Voidwalker - On Script - Set Active On'),
(567600,9,1,0,0,0,100,0,0,0,0,0,0,11,7741,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Voidwalker - On Script - Cast ''Summoned Demon'''),
(567600,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Voidwalker - On Script - Say Line 0'),
(567600,9,3,0,0,0,100,0,3000,3000,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Voidwalker - On Script - Set Faction ''Monster'''),
(567600,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Summoned Voidwalker - On Script - Start Attack (Invoker)'),

(5677,0,0,0,54,0,100,0,0,0,0,0,0,80,567700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Succubus - On Just Summoned - Call Timed Action List'),
(5677,0,1,0,0,0,100,0,3000,5000,7000,11000,0,11,16583,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Summoned Succubus - IC - Cast ''Shadow Shock'''),
(5677,0,2,0,1,0,100,0,10000,10000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Succubus - OOC - Force Despawn'),

(567700,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Succubus - On Script - Set Active On'),
(567700,9,1,0,0,0,100,0,0,0,0,0,0,11,7741,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Succubus - On Script - Cast ''Summoned Demon'''),
(567700,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Succubus - On Script - Say Line 0'),
(567700,9,3,0,0,0,100,0,3000,3000,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Succubus - On Script - Set Faction ''Monster'''),
(567700,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Summoned Succubus - On Script - Start Attack (Invoker)');
