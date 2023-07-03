UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 512 WHERE `entry` = 20787;
UPDATE `gameobject_template` SET `Data2` = 60000, `Data3` = 0 WHERE `entry` = 184588;
UPDATE `creature` SET `spawntimesecs` = -1 WHERE `guid` = 86483;
UPDATE `creature` SET `spawntimesecs` = 60 WHERE `guid` = 73518;

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 20825;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 20787;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 20787;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 184588;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2078700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(184588,1,0,1,8,0,100,0,35707,0,0,0,0,33,20787,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Captain Tyralius''s Prison - On Spellhit ''Opening Tyralius''s Prison'' - Quest Credit ''Captain Tyralius'''),
(184588,1,1,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,86483,20787,0,0,0,0,0,0,'Captain Tyralius''s Prison - Linked - Respawn Target ''Captain Tyralius'''),

(20787,0,0,0,11,0,100,0,0,0,0,0,0,80,2078700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Tyralius - On Just Summoned - Call Timed Action List'),

(2078700,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Tyralius - On Script - Set Active On'),
(2078700,9,1,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,10,73518,20825,0,0,0,0,0,0,'Captain Tyralius - On Script - Force Despawn (Ethereum Prisoner (Tyralius))'),
(2078700,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Tyralius - On Script - Say Line 0'),
(2078700,9,3,0,0,0,100,0,5000,5000,0,0,0,11,51347,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Tyralius - On Script - Cast ''Teleport Visual Only'''),
(2078700,9,4,0,0,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Tyralius - On Script - Force Despawn');
