-- DB update 2022_04_11_00 -> 2022_04_13_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_11_00 2022_04_13_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1649862904380231674'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1649862904380231674');

DELETE FROM `gameobject` WHERE `guid` = 3009030;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009030,175885,571,0,0,1,1,3233.33,-733.568,166.9,2.04204,0,0,0.85264,0.522499,900,100,1,0);

UPDATE `broadcast_text` SET `MaleText` = 'At the bell''s toll it will be 4:00pm. That''s HAPPY HOUR at Middleton''s Apothecarium! Come on inside and get poisoned or gassed or both for a mere 35 silver!' WHERE `ID` = 26210;

DELETE FROM `creature_text` WHERE `CreatureId` IN (27033,27191,27198);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(27033,0,0,'Do your job, scum.',12,1,100,1,0,0,27132,0,'Duncan Fallers'),
(27033,0,1,'You''re on, rats.',12,1,100,1,0,0,27134,0,'Duncan Fallers'),
(27033,0,2,'Top of the hour, boys. Go.',12,1,100,1,0,0,27135,0,'Duncan Fallers'),
(27033,0,3,'Get out there.',12,1,100,1,0,0,27131,0,'Duncan Fallers'),
(27033,1,0,'Get out there.',12,1,100,1,0,0,27131,0,'Duncan Fallers'),
(27033,2,0,'Get out there before I clock you. Clock. Get it?',12,1,100,1,0,0,27136,0,'Duncan Fallers'),
(27033,3,0,'If you want to jump to your death this time, I won''t stop you.',12,1,100,1,0,0,27133,0,'Duncan Fallers'),

(27191,0,0,'At the bell''s toll it will be 1:00am. If I ever break free, I will tear this town apart!!!',14,1,100,1,0,0,26216,0,'Skrotee'),
(27191,1,0,'At the bell''s toll it will be 3:00am. Time for bed!',14,1,100,1,0,0,26217,0,'Skrotee'),
(27191,2,0,'At the bell''s toll it will be 5:00am. End me!',14,1,100,1,0,0,26218,0,'Skrotee'),
(27191,3,0,'At the bell''s toll it will be 7:00am. Good morning to all you early risers!',14,1,100,1,0,0,26219,0,'Skrotee'),
(27191,4,0,'At the bell''s toll it will be 9:00am. It looks like another beautiful day in Dragonblight!',14,1,100,1,0,0,26220,0,'Skrotee'),
(27191,5,0,'At the bell''s toll it will be 11:00am. I want to take this opportunity to welcome all you new murderous, twisted Horde to Venomspite! So welcome, on behalf of me and my brother, Brote.',14,1,100,1,0,0,26221,0,'Skrotee'),
(27191,6,0,'At the bell''s toll it will be 1:00pm. We''re right in the middle of the lunch time rush! Your poisons, plagues, and noxious gases are delivered in 60 seconds or your order is free!',14,1,100,1,0,0,26222,0,'Skrotee'),
(27191,7,0,'At the bell''s toll it will be 3:00pm. I think I soiled myself.',14,1,100,1,0,0,26223,0,'Skrotee'),
(27191,8,0,'At the bell''s toll it will be 5:00pm. To those that may have been keeping score, I did - in fact - soil myself.',14,1,100,1,0,0,26224,0,'Skrotee'),
(27191,9,0,'At the bell''s toll it will be 7:00pm. Another productive day at Venomspite comes to a close as night falls upon us.',14,1,100,1,0,0,26225,0,'Skrotee'),
(27191,10,0,'At the bell''s toll it will be 9:00pm. Break time for me! I''ll see you all in 4 hours. Unless one of you kills me in my sleep (please).',14,1,100,1,0,0,26226,0,'Skrotee'),
(27191,15,0,'Not this nonsense again...',12,1,100,1,0,0,26198,0,'Skrotee'),
(27191,15,1,'Has it really been an hour?',12,1,100,1,0,0,26199,0,'Skrotee'),
(27191,16,0,'If I ever get out of here, I will CRUSH every clock I come in contact with...',12,1,100,1,0,0,26200,0,'Skrotee'),
(27191,17,0,'I''m gonna jump this time, Brote. I swear it!',12,1,100,1,0,0,26215,0,'Skrotee'),
(27191,18,0,'Is it my turn?',12,1,100,1,0,0,26213,0,'Skrotee'),
(27191,18,1,'Is it lunch time?',12,1,100,1,0,0,26214,0,'Skrotee'),

(27198,0,0,'At the bell''s toll it will be 12:00am. Midnight to all you scary Forsaken! OOoooo...',14,1,100,1,0,0,26202,0,'Brote'),
(27198,1,0,'At the bell''s toll it will be 2:00am. Coincidentally, a perfect time to kill me and end my misery.',14,1,100,1,0,0,26203,0,'Brote'),
(27198,2,0,'At the bell''s toll it will be 4:00am. Don''t you people ever sleep?',14,1,100,1,0,0,26204,0,'Brote'),
(27198,3,0,'At the bell''s toll it will be 6:00am *yawn*. Rise and shine.',14,1,100,1,0,0,26205,0,'Brote'),
(27198,4,0,'At the bell''s toll it will be 8:00am. I''m sure you''re all getting back from your morning jogs by now.',14,1,100,1,0,0,26206,0,'Brote'),
(27198,5,0,'At the bell''s toll it will be 10:00am. It''s looking like there''s gonna be more of the green poisonous cloud of death in today''s weather forecast.',14,1,100,1,0,0,26207,0,'Brote'),
(27198,6,0,'At the bell''s toll it will be 12:00pm. Noon for those of you that can''t count. That''s right, I''m looking at you, orcs.',14,1,100,1,0,0,26208,0,'Brote'),
(27198,7,0,'At the bell''s toll it will be 2:00pm. I want to take this opportunity to let you all know that Middleton''s got a 2 for 1 sale going on right now! Buy 1 canister of his world famous poisonous biological agents and get the second free!',14,1,100,1,0,0,26209,0,'Brote'),
(27198,8,0,'At the bell''s toll it will be 4:00pm. That''s HAPPY HOUR at Middleton''s Apothecarium! Come on inside and get poisoned or gassed or both for a mere 35 silver!',14,1,100,1,0,0,26210,0,'Brote'),
(27198,9,0,'At the bell''s toll it will be 6:00pm. Please kill my brother!',14,1,100,1,0,0,26211,0,'Brote'),
(27198,15,0,'This is all your fault, you know...',12,1,100,1,0,0,26193,0,'Brote'),
(27198,15,1,'Of all the hair-brained, idiotic, BRAINLESS ideas... "Yea, Brote, it''ll be great... the Forsaken will rain gold coins down on our heads!"',12,1,100,1,0,0,26194,0,'Brote'),
(27198,15,2,'And you know what pisses me off more than anything, Skrotee? No, not that we''ve been made into a living cuckoo clock for the amusement of the Forsaken. And not that we have to endure being spat upon and mocked every waking minute of our time here... What pisses me off the most is being made to wear these damned short-shorts...',12,1,100,1,0,0,26195,0,'Brote'),
(27198,15,3,'Pray Skrotee... Find religion... Because if we ever get out of here, you will be wishing you were back in here!',12,1,100,1,0,0,26196,0,'Brote'),
(27198,15,4,'I hope one of us dies. I hope that one is you, Skrotee.',12,1,100,1,0,0,26197,0,'Brote'),
(27198,15,5,'Not this nonsense again...',12,1,100,1,0,0,26198,0,'Brote'),
(27198,15,6,'Has it really been an hour?',12,1,100,1,0,0,26199,0,'Brote');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (27033,27191,27198);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27033,27191,27198);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = -3009030;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2703300,2703301,2703302,2703303,2719100,2719101,2719102,2719103,2719104,2719105,2719106,2719107,2719108,2719109,2719110,2719111,2719800,2719801,2719802,2719803,2719804,2719805,2719806,2719807,2719808,2719809,2719810);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27033,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Respawn - Set Active On'),
(27033,0,1,0,68,0,100,0,112,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 00'' Started - Call Timed Action List'),
(27033,0,2,0,68,0,100,0,113,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 01'' Started - Call Random Timed Action List'),
(27033,0,3,0,68,0,100,0,114,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 02'' Started - Call Timed Action List'),
(27033,0,4,0,68,0,100,0,115,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 03'' Started - Call Random Timed Action List'),
(27033,0,5,0,68,0,100,0,116,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 04'' Started - Call Timed Action List'),
(27033,0,6,0,68,0,100,0,117,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 05'' Started - Call Random Timed Action List'),
(27033,0,7,0,68,0,100,0,118,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 06'' Started - Call Timed Action List'),
(27033,0,8,0,68,0,100,0,119,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 07'' Started - Call Random Timed Action List'),
(27033,0,9,0,68,0,100,0,120,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 08'' Started - Call Timed Action List'),
(27033,0,10,0,68,0,100,0,121,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 09'' Started - Call Random Timed Action List'),
(27033,0,11,0,68,0,100,0,122,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 10'' Started - Call Timed Action List'),
(27033,0,12,0,68,0,100,0,123,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 11'' Started - Call Random Timed Action List'),
(27033,0,13,0,68,0,100,0,124,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 12'' Started - Call Timed Action List'),
(27033,0,14,0,68,0,100,0,125,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 13'' Started - Call Random Timed Action List'),
(27033,0,15,0,68,0,100,0,126,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 14'' Started - Call Timed Action List'),
(27033,0,16,0,68,0,100,0,127,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 15'' Started - Call Random Timed Action List'),
(27033,0,17,0,68,0,100,0,128,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 16'' Started - Call Timed Action List'),
(27033,0,18,0,68,0,100,0,129,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 17'' Started - Call Random Timed Action List'),
(27033,0,19,0,68,0,100,0,130,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 18'' Started - Call Timed Action List'),
(27033,0,20,0,68,0,100,0,132,0,0,0,0,87,2703300,2703300,2703300,2703300,2703301,2703302,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 20'' Started - Call Timed Action List'),
(27033,0,21,0,68,0,100,0,135,0,0,0,0,80,2703303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Event ''Hour 23'' Started - Call Random Timed Action List'),

(2703300,9,0,0,0,0,100,0,3580000,3580000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 0'),
(2703300,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,19,27191,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Clear Unit Stand State (Skrotee)'),
(2703300,9,2,0,0,0,100,0,2000,2000,0,0,0,1,15,0,0,0,0,0,19,27191,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 15 (Skrotee)'),

(2703301,9,0,0,0,0,100,0,3580000,3580000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 1'),
(2703301,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,19,27191,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Clear Unit Stand State (Skrotee)'),
(2703301,9,2,0,0,0,100,0,2000,2000,0,0,0,1,16,0,0,0,0,0,19,27191,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 16 (Skrotee)'),
(2703301,9,3,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 2'),

(2703302,9,0,0,0,0,100,0,3580000,3580000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 0'),
(2703302,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,19,27191,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Clear Unit Stand State (Skrotee)'),
(2703302,9,2,0,0,0,100,0,2000,2000,0,0,0,1,17,0,0,0,0,0,19,27191,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 17 (Skrotee)'),
(2703302,9,3,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 3'),

(2703303,9,0,0,0,0,100,0,3580000,3580000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 0'),
(2703303,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,19,27198,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Clear Unit Stand State (Brote)'),
(2703303,9,2,0,0,0,100,0,2000,2000,0,0,0,1,15,0,0,0,0,0,19,27198,0,0,0,0,0,0,0,'Duncan Fallers - On Script - Say Line 15 (Brote)'),

(27191,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Respawn - Set Active On'),
(27191,0,1,0,68,0,100,0,112,0,0,0,0,80,2719100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 00'' Started - Call Timed Action List'),
(27191,0,2,0,68,0,100,0,114,0,0,0,0,80,2719101,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 02'' Started - Call Timed Action List'),
(27191,0,3,0,68,0,100,0,116,0,0,0,0,80,2719102,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 04'' Started - Call Timed Action List'),
(27191,0,4,0,68,0,100,0,118,0,0,0,0,80,2719103,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 06'' Started - Call Timed Action List'),
(27191,0,5,0,68,0,100,0,120,0,0,0,0,80,2719104,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 08'' Started - Call Timed Action List'),
(27191,0,6,0,68,0,100,0,122,0,0,0,0,80,2719105,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 10'' Started - Call Timed Action List'),
(27191,0,7,0,68,0,100,0,124,0,0,0,0,80,2719106,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 12'' Started - Call Timed Action List'),
(27191,0,8,0,68,0,100,0,126,0,0,0,0,80,2719107,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 14'' Started - Call Timed Action List'),
(27191,0,9,0,68,0,100,0,128,0,0,0,0,80,2719108,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 16'' Started - Call Timed Action List'),
(27191,0,10,0,68,0,100,0,130,0,0,0,0,80,2719109,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 18'' Started - Call Timed Action List'),
(27191,0,11,0,68,0,100,0,132,0,0,0,0,80,2719110,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 20'' Started - Call Timed Action List'),
(27191,0,12,0,68,0,100,0,133,0,0,0,0,80,2719111,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 21'' Started - Call Timed Action List'),
(27191,0,13,0,68,0,100,0,134,0,0,0,0,80,2719111,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 22'' Started - Call Timed Action List'),
(27191,0,14,0,68,0,100,0,135,0,0,0,0,80,2719111,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Event ''Hour 23'' Started - Call Timed Action List'),
(27191,0,15,0,40,0,100,0,3,27191,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On WP 3 Reached - Pause WP Movement'),
(27191,0,16,17,58,0,100,0,0,27191,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On WP Path Ended - Reset Home Position'),
(27191,0,17,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - Linked - Evade'),

(2719100,9,0,0,0,0,100,0,1800000,1800000,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719100,9,1,0,0,0,100,0,0,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Set ''UNIT_STAND_STATE_SIT'''),
(2719100,9,2,0,0,0,100,0,1790000,1790000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719100,9,3,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719100,9,4,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 0'),

(2719101,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719101,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719101,9,2,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 1'),

(2719102,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719102,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719102,9,2,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 2'),

(2719103,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719103,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719103,9,2,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 3'),

(2719104,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719104,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719104,9,2,0,0,0,100,0,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 4'),

(2719105,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719105,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719105,9,2,0,0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 5'),

(2719106,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719106,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719106,9,2,0,0,0,100,0,5000,5000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 6'),

(2719107,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719107,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719107,9,2,0,0,0,100,0,5000,5000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 7'),

(2719108,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719108,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719108,9,2,0,0,0,100,0,5000,5000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 8'),

(2719109,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719109,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719109,9,2,0,0,0,100,0,5000,5000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 9'),

(2719110,9,0,0,0,0,100,0,0,0,0,0,0,1,18,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 18'),
(2719110,9,1,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27191,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Start WP Movement'),
(2719110,9,2,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719110,9,3,0,0,0,100,0,5000,5000,0,0,0,1,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Say Line 10'),

(2719111,9,0,0,0,0,100,0,60000,60000,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Clear Unit Stand State'),
(2719111,9,1,0,0,0,100,0,0,0,0,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skrotee - On Script - Set ''UNIT_STAND_STATE_SLEEP'''),

(27198,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Respawn - Set Active On'),
(27198,0,1,0,68,0,100,0,135,0,0,0,0,80,2719800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 23'' Started - Call Timed Action List'),
(27198,0,2,0,68,0,100,0,113,0,0,0,0,80,2719801,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 01'' Started - Call Timed Action List'),
(27198,0,3,0,68,0,100,0,115,0,0,0,0,80,2719802,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 03'' Started - Call Timed Action List'),
(27198,0,4,0,68,0,100,0,117,0,0,0,0,80,2719803,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 05'' Started - Call Timed Action List'),
(27198,0,5,0,68,0,100,0,119,0,0,0,0,80,2719804,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 07'' Started - Call Timed Action List'),
(27198,0,6,0,68,0,100,0,121,0,0,0,0,80,2719805,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 09'' Started - Call Timed Action List'),
(27198,0,7,0,68,0,100,0,123,0,0,0,0,80,2719806,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 11'' Started - Call Timed Action List'),
(27198,0,8,0,68,0,100,0,125,0,0,0,0,80,2719807,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 13'' Started - Call Timed Action List'),
(27198,0,9,0,68,0,100,0,127,0,0,0,0,80,2719808,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 15'' Started - Call Timed Action List'),
(27198,0,10,0,68,0,100,0,129,0,0,0,0,80,2719809,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 17'' Started - Call Timed Action List'),
(27198,0,11,0,68,0,100,0,130,0,0,0,0,80,2719810,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 18'' Started - Call Timed Action List'),
(27198,0,12,0,68,0,100,0,131,0,0,0,0,80,2719810,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 19'' Started - Call Timed Action List'),
(27198,0,13,0,68,0,100,0,132,0,0,0,0,80,2719810,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 20'' Started - Call Timed Action List'),
(27198,0,14,0,68,0,100,0,133,0,0,0,0,80,2719810,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 21'' Started - Call Timed Action List'),
(27198,0,15,0,68,0,100,0,134,0,0,0,0,80,2719810,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Event ''Hour 22'' Started - Call Timed Action List'),
(27198,0,16,0,40,0,100,0,2,27198,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On WP 2 Reached - Pause WP Movement'),
(27198,0,17,18,58,0,100,0,0,27198,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On WP Path Ended - Reset Home Position'),
(27198,0,18,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - Linked - Evade'),

(2719800,9,0,0,0,0,100,0,1800000,1800000,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719800,9,1,0,0,0,100,0,0,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Set ''UNIT_STAND_STATE_SIT'''),
(2719800,9,2,0,0,0,100,0,1790000,1790000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719800,9,3,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719800,9,4,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 0'),

(2719801,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719801,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719801,9,2,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 1'),

(2719802,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719802,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719802,9,2,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 2'),

(2719803,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719803,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719803,9,2,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 3'),

(2719804,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719804,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719804,9,2,0,0,0,100,0,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 4'),

(2719805,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719805,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719805,9,2,0,0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 5'),

(2719806,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719806,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719806,9,2,0,0,0,100,0,5000,5000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 6'),

(2719807,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719807,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719807,9,2,0,0,0,100,0,5000,5000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 7'),

(2719808,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719808,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719808,9,2,0,0,0,100,0,5000,5000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 8'),

(2719809,9,0,0,0,0,100,0,3590000,3590000,0,0,0,53,0,27198,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Start WP Movement'),
(2719809,9,1,0,0,0,100,0,0,0,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719809,9,2,0,0,0,100,0,5000,5000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Say Line 9'),

(2719810,9,0,0,0,0,100,0,60000,60000,0,0,0,91,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Clear Unit Stand State'),
(2719810,9,1,0,0,0,100,0,0,0,0,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brote - On Script - Set ''UNIT_STAND_STATE_SLEEP'''),

(-3009030,1,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Respawn - Set Active On'),
(-3009030,1,1,0,61,0,100,0,0,0,0,0,0,67,1,0,0,4000,4000,0,1,0,0,0,0,0,0,0,0,'Horde Bell - Linked - Create Timed Event 1'),
(-3009030,1,2,3,59,4095,100,0,1,0,0,0,0,4,6595,1,0,0,0,0,18,150,0,0,0,0,0,0,0,'Horde Bell - On Timed Event 1 Triggered - Play Direct Sound ''BellTollHorde'' (Phase 1-12) (All Players Within 150y)'),
(-3009030,1,3,0,61,0,100,0,0,0,0,0,0,23,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - Linked - Decrease Phase'),
(-3009030,1,4,0,68,0,100,0,112,0,0,0,0,22,12,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 00'' Started - Set Phase 12'),
(-3009030,1,5,0,68,0,100,0,113,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 01'' Started - Set Phase 1'),
(-3009030,1,6,0,68,0,100,0,114,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 02'' Started - Set Phase 2'),
(-3009030,1,7,0,68,0,100,0,115,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 03'' Started - Set Phase 3'),
(-3009030,1,8,0,68,0,100,0,116,0,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 04'' Started - Set Phase 4'),
(-3009030,1,9,0,68,0,100,0,117,0,0,0,0,22,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 05'' Started - Set Phase 5'),
(-3009030,1,10,0,68,0,100,0,118,0,0,0,0,22,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 06'' Started - Set Phase 6'),
(-3009030,1,11,0,68,0,100,0,119,0,0,0,0,22,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 07'' Started - Set Phase 7'),
(-3009030,1,12,0,68,0,100,0,120,0,0,0,0,22,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 08'' Started - Set Phase 8'),
(-3009030,1,13,0,68,0,100,0,121,0,0,0,0,22,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 09'' Started - Set Phase 9'),
(-3009030,1,14,0,68,0,100,0,122,0,0,0,0,22,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 10'' Started - Set Phase 10'),
(-3009030,1,15,0,68,0,100,0,123,0,0,0,0,22,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 11'' Started - Set Phase 11'),
(-3009030,1,16,0,68,0,100,0,124,0,0,0,0,22,12,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 12'' Started - Set Phase 12'),
(-3009030,1,17,0,68,0,100,0,125,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 13'' Started - Set Phase 1'),
(-3009030,1,18,0,68,0,100,0,126,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 14'' Started - Set Phase 2'),
(-3009030,1,19,0,68,0,100,0,127,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 15'' Started - Set Phase 3'),
(-3009030,1,20,0,68,0,100,0,128,0,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 16'' Started - Set Phase 4'),
(-3009030,1,21,0,68,0,100,0,129,0,0,0,0,22,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 17'' Started - Set Phase 5'),
(-3009030,1,22,0,68,0,100,0,130,0,0,0,0,22,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 18'' Started - Set Phase 6'),
(-3009030,1,23,0,68,0,100,0,131,0,0,0,0,22,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 19'' Started - Set Phase 7'),
(-3009030,1,24,0,68,0,100,0,132,0,0,0,0,22,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 20'' Started - Set Phase 8'),
(-3009030,1,25,0,68,0,100,0,133,0,0,0,0,22,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 21'' Started - Set Phase 9'),
(-3009030,1,26,0,68,0,100,0,134,0,0,0,0,22,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 22'' Started - Set Phase 10'),
(-3009030,1,27,0,68,0,100,0,135,0,0,0,0,22,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horde Bell - On Event ''Hour 23'' Started - Set Phase 11');

DELETE FROM `waypoints` WHERE `entry` IN (27191,27198);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(27191,1,3239.86,-725.702,174.894,'Skrotee'),
(27191,2,3238.95,-723.45,174.894,NULL),
(27191,3,3242.66,-717.079,174.961,NULL),
(27191,4,3238.95,-723.45,174.894,NULL),
(27191,5,3239.86,-725.702,174.894,NULL),
(27191,6,3242.07,-725.513,174.892,NULL),

(27198,1,3238.95,-723.45,174.894,'Brote'),
(27198,2,3242.66,-717.079,174.961,NULL),
(27198,3,3238.95,-723.45,174.894,NULL),
(27198,4,3240.79,-724.326,174.892,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
