UPDATE `creature` SET `equipment_id` = 0 WHERE `guid` = 3009657;

DELETE FROM `creature_text` WHERE `CreatureId` = 22315;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(22315,0,0,'%s will detonate in 5 seconds!',16,0,100,0,0,0,20104,0,'Deathforge Mine'),
(22315,1,0,'Deathforge Mine will detonate in 3 seconds!',16,0,100,0,0,0,20106,0,'Deathforge Mine'),
(22315,2,0,'Deathforge Mine: Detonating!',16,0,100,0,0,0,20108,0,'Deathforge Mine');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 19759;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 21080 AND `id` = 4;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19759,19754,19756,20872,20878,20887,22315);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2231500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21080,0,4,0,0,0,100,0,3000,3000,3000,3000,0,11,12744,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dormant Infernal - IC - Cast ''Immolation'''),

(19759,0,0,0,0,0,100,0,3000,3000,3000,3000,0,11,12744,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Newly Crafted Infernal - IC - Cast ''Immolation'''),

(19754,0,0,0,0,0,100,0,15000,15000,15000,30000,0,11,38107,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathforge Tinkerer - IC - Cast ''Create Deathforge Mine'''),
(19754,0,1,0,0,0,100,0,1000,1000,10000,15000,0,11,38753,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathforge Tinkerer - IC - Cast ''Shrapnel Bomb'''),

(19756,0,0,0,0,0,100,0,8000,8000,10000,15000,0,11,37580,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathforge Smith - IC - Cast ''Drill Armor'''),
(19756,0,1,0,0,0,100,0,12000,12000,12000,16000,0,11,36225,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Smith - IC - Cast ''Chaos Nova'''),

(20872,0,0,0,0,0,100,0,0,0,2400,3800,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathforge Summoner - IC - Cast ''Shadow Bolt'''),
(20872,0,1,0,0,0,100,0,7000,9000,17000,24000,0,11,37628,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathforge Summoner - IC - Cast ''Fel Immolate'''),

(20878,0,0,0,0,0,100,0,8000,8000,8000,14000,0,11,37998,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathforge Guardian - IC - Cast ''Piercing Strike'''),
(20878,0,1,0,0,0,100,0,5000,5000,5000,15000,0,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathforge Guardian - IC - Cast ''Shield Bash'''),

(20887,0,0,0,0,0,100,0,0,0,2400,3800,0,11,36227,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathforge Imp - IC - Cast ''Firebolt'''),

(22315,0,0,0,54,0,100,0,0,0,0,0,0,80,2231500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Mine - On Just Summoned - Call Timed Action List'),

(2231500,9,0,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Mine - On Script - Set Root On'),
(2231500,9,1,0,0,0,100,0,0,0,0,0,0,11,38773,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Mine - On Script - Cast ''Deathforge Mine'''),
(2231500,9,2,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Mine - On Script - Set Reactstate ''Passive'''),
(2231500,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Mine - On Script - Say Line 0'),
(2231500,9,4,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Mine - On Script - Say Line 1'),
(2231500,9,5,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Mine - On Script - Say Line 2'),
(2231500,9,6,0,0,0,100,0,0,0,0,0,0,11,38108,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Mine - On Script - Cast ''Deathforge Mine Explosion'''),
(2231500,9,7,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deathforge Mine - On Script - Force Despawn');
