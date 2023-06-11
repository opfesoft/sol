UPDATE `creature` SET `modelid` = 0 WHERE `id` IN (3374,3375,3376,3377,3378,3392);
UPDATE `creature_addon` SET `bytes2` = 4097 WHERE `guid` IN (13594,13598,13628,13638,13667,13668,13670,13674);
UPDATE `creature_template_addon` SET `auras` = '8876' WHERE `entry` = 3378;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (3374,3375,3376,3377,3378,3392);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3374,0,0,0,4,0,100,0,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bael''dun Excavator - On Aggro - Cast ''Defensive Stance'''),
(3374,0,1,0,0,0,100,0,5000,20000,10000,30000,0,11,7386,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Bael''dun Excavator - IC - Cast ''Sunder Armor'''),
(3374,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bael''dun Excavator - Between 0-15% Health - Flee For Assist (No Repeat)'),

(3375,0,0,0,0,0,100,0,0,20000,27000,35000,0,11,6257,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Bael''dun Foreman - IC CMC - Cast ''Torch Toss'''),
(3375,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bael''dun Foreman - Between 0-15% Health - Flee For Assist (No Repeat)'),

(3376,0,0,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bael''dun Soldier - Between 0-15% Health - Flee For Assist (No Repeat)'),

(3377,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bael''dun Rifleman - Within 5-30 Range - Cast ''Shoot'''),
(3377,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bael''dun Rifleman - Between 0-15% Health - Flee For Assist (No Repeat)'),

(3378,0,0,0,0,0,100,0,0,20000,45000,60000,0,11,6264,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bael''dun Officer - IC - Cast ''Nimble Reflexes'''),
(3378,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bael''dun Officer - Between 0-15% Health - Flee For Assist (No Repeat)'),

(3392,0,0,0,0,0,100,0,7000,14000,10000,16000,0,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Prospector Khazgorm - IC - Cast ''Backhand''');
