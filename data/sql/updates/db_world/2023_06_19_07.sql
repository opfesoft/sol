DELETE FROM `spell_script_names` WHERE `spell_id` = 28728;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(28728,'spell_gen_creature_feign_death');

DELETE FROM `creature_text` WHERE `CreatureId` IN (19706,19729,19730,20279,20280,20283,20607,20924,20925,20987);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(19706,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Marshrock Threshalisk'),
(19729,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Ironspine Threshalisk'),
(19730,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Ironspine Gazer'),
(20279,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Ragestone Threshalisk'),
(20279,1,0,'%s becomes enraged!',16,0,100,0,0,0,24144,0,'Ragestone Threshalisk'),
(20280,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Ragestone Trampler'),
(20280,1,0,'%s becomes enraged!',16,0,100,0,0,0,24144,0,'Ragestone Trampler'),
(20283,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Marshrock Stomper'),
(20607,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Craghide Basilisk'),
(20924,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Grishnath Basilisk'),
(20925,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Scalded Basilisk'),
(20987,0,0,'%s stops playing dead and charges forward!',16,0,100,0,0,0,18325,0,'Ruuan Weald Basilisk');

UPDATE `creature_template` SET `ArmorModifier` = 4.15 WHERE `entry` = 20924;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (20283,20987);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19706,19729,19730,20279,20280,20283,20607,20924,20925,20987);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1970600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19706,0,0,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marshrock Threshalisk - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(19706,0,1,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marshrock Threshalisk - On Timed Event 1 Triggered - Call Timed Action List'),

(1970600,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Marshrock Threshalisk - On Script - Store Target 1 (Victim)'),
(1970600,9,1,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marshrock Threshalisk - On Script - Set React State ''Passive'''),
(1970600,9,2,0,0,0,100,0,0,0,0,0,0,11,28728,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marshrock Threshalisk - On Script - Cast ''Feign Death'''),
(1970600,9,3,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marshrock Threshalisk - On Script - Say Line 0'),
(1970600,9,4,0,0,0,100,0,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marshrock Threshalisk - On Script - Set React State ''Aggressive'''),
(1970600,9,5,0,0,0,100,0,0,0,0,0,0,11,35382,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Marshrock Threshalisk - On Script - Cast ''Rushing Charge'' (Stored Target 1)'),

(19729,0,0,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ironspine Threshalisk - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(19729,0,1,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ironspine Threshalisk - On Timed Event 1 Triggered - Call Timed Action List'),

(19730,0,0,0,0,0,100,0,7000,11000,45000,50000,0,11,35313,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ironspine Gazer - IC - Cast ''Hypnotic Gaze'''),
(19730,0,1,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ironspine Gazer - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(19730,0,2,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ironspine Gazer - On Timed Event 1 Triggered - Call Timed Action List'),

(20279,0,0,1,2,0,100,1,0,50,0,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ragestone Threshalisk - Between 0-50% Health - Cast ''Frenzy'' (No Repeat)'),
(20279,0,1,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ragestone Threshalisk - Linked - Say Line 1'),
(20279,0,2,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ragestone Threshalisk - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(20279,0,3,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ragestone Threshalisk - On Timed Event 1 Triggered - Call Timed Action List'),

(20280,0,0,1,2,0,100,1,0,50,0,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ragestone Trampler - Between 0-50% Health - Cast ''Frenzy'' (No Repeat)'),
(20280,0,1,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ragestone Trampler - Linked - Say Line 1'),
(20280,0,2,0,0,0,100,0,11000,20000,7000,12000,0,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ragestone Trampler - IC - Cast ''Trample'''),
(20280,0,3,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ragestone Trampler - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(20280,0,4,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ragestone Trampler - On Timed Event 1 Triggered - Call Timed Action List'),

(20283,0,0,0,0,0,100,0,5000,10000,15000,30000,0,11,12612,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Marshrock Stomper - IC - Cast ''Stomp'''),
(20283,0,1,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marshrock Stomper - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(20283,0,2,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marshrock Stomper - On Timed Event 1 Triggered - Call Timed Action List'),

(20607,0,0,0,0,0,100,0,7000,11000,45000,50000,0,11,35313,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Craghide Basilisk - IC - Cast ''Hypnotic Gaze'''),
(20607,0,1,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Craghide Basilisk - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(20607,0,2,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Craghide Basilisk - On Timed Event 1 Triggered - Call Timed Action List'),

(20924,0,0,0,2,0,100,1,0,70,0,0,0,11,37590,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grishnath Basilisk - Between 0-70% Health - Cast ''Soften'' (No Repeat)'),
(20924,0,1,0,2,0,100,1,0,40,0,0,0,11,37590,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grishnath Basilisk - Between 0-40% Health - Cast ''Soften'' (No Repeat)'),
(20924,0,2,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grishnath Basilisk - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(20924,0,3,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grishnath Basilisk - On Timed Event 1 Triggered - Call Timed Action List'),

(20925,0,0,0,0,0,85,0,8000,13000,14000,19000,0,11,35236,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scalded Basilisk - IC - Cast ''Heat Wave'''),
(20925,0,1,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scalded Basilisk - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(20925,0,2,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scalded Basilisk - On Timed Event 1 Triggered - Call Timed Action List'),

(20987,0,0,0,2,0,100,1,0,15,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruuan Weald Basilisk - Between 0-15% Health - Trigger Timed Event 1 (No Repeat)'),
(20987,0,1,0,59,0,50,0,1,0,0,0,0,80,1970600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ruuan Weald Basilisk - On Timed Event 1 Triggered - Call Timed Action List');
