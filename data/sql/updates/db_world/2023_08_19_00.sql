UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (35396,35387);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (35396,35387);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (3539600,3538700);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(35396,0,0,0,1,0,100,0,30000,60000,30000,60000,0,80,3539600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darting Hatchling - OOC - Call Timed Action List'),

(3539600,9,0,0,0,0,100,0,0,0,0,0,0,75,62585,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darting Hatchling - On Script - Add Aura ''Mulgore Hatchling'''),
(3539600,9,1,0,0,0,100,0,2000,2000,0,0,0,28,62585,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darting Hatchling - On Script - Remove Aura ''Mulgore Hatchling'''),

(35387,0,0,0,1,0,100,0,30000,60000,30000,60000,0,80,3538700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leaping Hatchling - OOC - Call Timed Action List'),

(3538700,9,0,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leaping Hatchling - On Script - Stop Follow'),
(3538700,9,1,0,0,0,100,0,2000,4000,0,0,0,97,0,10,1,0,0,0,23,0,0,0,0,0,0,0,0,'Leaping Hatchling - On Script - Jump To Position (Owner)'),
(3538700,9,2,0,0,0,100,0,2000,2000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leaping Hatchling - On Script - Evade');
