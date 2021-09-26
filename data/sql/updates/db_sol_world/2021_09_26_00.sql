-- DB update 2021_09_25_00 -> 2021_09_26_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_25_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_25_00 2021_09_26_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632662745945181890'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632662745945181890');

UPDATE `creature` SET `position_x` = -9557.07, `position_y` = 83.7086, `position_z` = 58.8816, `MovementType` = 2 WHERE `guid` = 56600; -- Silas Darkmoon
UPDATE `creature` SET `position_x` = -9502.26, `position_y` = 77.9182, `position_z` = 57.5324, `MovementType` = 2 WHERE `guid` = 56624; -- Flik's Frog
UPDATE `creature` SET `position_x` = -9548.53, `position_y` = 74.17, `position_z` = 58.8846, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 56680; -- Darkmoon Faire Carnie
UPDATE `creature` SET `position_x` = -9561.73, `position_y` = 88.4214, `position_z` = 58.8821, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 56613; -- Darkmoon Faire Carnie

-- Melnan Darkstone: Add missing spawn
DELETE FROM `creature` WHERE `guid` = 3008907;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008907,14842,0,0,0,1,1,0,0,-4982.69,-963.739,501.659,0.802197,300,0,1,0,2,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` IN (8969,8971,38004,42598,56600,56624,3008907);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
-- Darkmoon Faire Carnie
(8969,0,0,0,4097,234,0,NULL),
(8971,0,0,0,4097,234,0,NULL),
(38004,0,0,0,4097,234,0,NULL),
(42598,0,0,0,4097,69,0,NULL),
-- Silas Darkmoon
(56600,566000,0,0,1,0,0,NULL),
-- Flik's Frog
(56624,566240,0,0,0,0,0,NULL),
-- Melnan Darkstone
(3008907,30089070,0,0,0,0,0,NULL);

DELETE FROM `creature_formations` WHERE `leaderGUID` IN (56600,56624);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
-- Silas Darkmoon & Burth
(56600,56600,0,0,2),
(56600,56611,6,15,2),
-- Flik's Frog & Flik
(56624,56624,0,0,0),
(56624,56625,2,0,0);

DELETE FROM `game_event_creature` WHERE `eventEntry` = -23;
DELETE FROM `game_event_creature` WHERE `guid` = 3008907;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`)
VALUES
-- Despawn Stonetusk Boars
(-23,80362),
(-23,80367),
-- Spawn Melnan Darkstone
(4,3008907),
(23,3008907);

-- Cleanup old data
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` IN (43671,43673,43679,49446,56625);
DELETE FROM `creature_addon` WHERE `guid` IN (43679,45475,55089,43671,49446,43673,56625);
DELETE FROM `waypoint_data` WHERE `id` IN (436790,436710,494460,436730,566250);
UPDATE `waypoint_data` SET `action` = 0 WHERE `action` IN (215,314);
DELETE FROM `waypoint_scripts` WHERE `id` IN (27,28,29,42,47,215,314);
DELETE FROM `gameobject` WHERE `guid` = 28602;
DELETE FROM `game_event_gameobject` WHERE `guid` = 28602;

-- Add missing creature texts
DELETE FROM `creature_text` WHERE `CreatureId` IN (14823,14828,14844,14845,14846,14847,14860,14842);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(14823,0,0,'Everyone enjoying themselves so far?  That''s great!  Welcome to the Darkmoon Faire, the greatest show on all of Azeroth!  Make sure that you speak with Yebb and his friends here while you''re taking in Neblegear''s Darkmoon Zoo Bizarre.',12,0,100,0,0,0,10153,0,'Silas Darkmoon'),
(14823,0,1,'Come one, come all.  Welcome to the Darkmoon Faire!  Don''t be shy.  Step right up to Lhara and buy yourself an exotic artifact from far off lands.  If you''re one of the lucky few who have found Darkmoon Cards, have a word with Professor Paleo.  Hungry?  Thirsty?  You''re in luck!  Refreshments are available right here from Sylannia and Stamp.  I recommend the Darkmoon Special Reserve to wash down some Red Hot Wings.  And if the future is what you seek, then run, don''t walk, to speak with Sayge.',12,0,100,0,0,0,10154,0,'Silas Darkmoon'),
(14823,0,2,'Welcome one and all to the Darkmoon Faire, the greatest event in all the world!  We have it all... delicious food, strong drink, exotic artifacts, fortunes read, amazing prizes and excitement without end!  Don''t forget to turn in your Darkmoon Faire Prize Tickets to Gelvas Grimegate!  All it takes is five or more and you''re on your way to the most wondrous prizes on all of Azeroth.  Everybody is a winner!',12,0,100,0,0,0,10155,0,'Silas Darkmoon'),
(14823,0,3,'Welcome one and all to the greatest show on all of Azeroth... the Darkmoon Faire!  Adventure and excitement await, don''t be shy!  Mysteries and prizes for both the young and the old are here for the taking.  And be sure to speak with the professor about any Darkmoon Cards that you have come across during your travels!',12,0,100,0,0,0,10156,0,'Silas Darkmoon'),
(14823,0,4,'Greetings friends, and welcome to the greatest show on Azeroth!$B$BPlease, step right up and take in all we have to offer.  Ride the rides and see the sights!  Amaze at the wonders that the Darkmoon Faire has uncovered in this vast and mysterious world!  We have spared no expense in bringing you excitement that children of all ages will delight in!',12,0,100,0,0,0,10157,0,'Silas Darkmoon'),
(14823,0,5,'Come one, come all!  Welcome to the Darkmoon Faire!  Do you crave adventure?  Do you seek exotic and mysterious treasures?  Then look no further!  You, my friend, have come to the right place!  Dive right in and take part in all that the Faire has to offer!  We''ll be at this location all week, so be sure to tell your friends and loved ones!',12,0,100,0,0,0,10158,0,'Silas Darkmoon'),
(14823,0,6,'We''re back and better than ever!  It''s the Darkmoon Faire friend, and it''s your lucky day!  Sparing no expense, we''ve gathered wonders and treats from around the world for your delight.  Whether you''re young or old, rich or poor, the Darkmoon Faire has it all!  Be sure to turn in your Darkmoon Faire Prize Tickets to Gelvas Grimegate, and choose from several exotic and wondrous prizes!',12,0,100,0,0,0,10160,0,'Silas Darkmoon'),
(14823,1,0,'Come one, come all.  Welcome to the Darkmoon Faire!  Don''t be shy.  Step right up to Lhara and buy yourself an exotic artifact from far off lands.  If you''re one of the lucky few who have found Darkmoon Cards, have a word with Professor Paleo.  Hungry?  Thirsty?  You''re in luck!  Refreshments are available right here from Sylannia and Stamp.  I recommend the Darkmoon Special Reserve to wash down some Red Hot Wings.  And if the future is what you seek, then run, don''t walk, to speak with Sayge.',12,0,100,0,0,0,10154,0,'Silas Darkmoon'),
(14823,1,1,'Come one, come all!  Welcome to the Darkmoon Faire!  Do you crave adventure?  Do you seek exotic and mysterious treasures?  Then look no further!  You, my friend, have come to the right place!  Dive right in and take part in all that the Faire has to offer!  We''ll be at this location all week, so be sure to tell your friends and loved ones!',12,0,100,0,0,0,10158,0,'Silas Darkmoon'),
(14823,1,2,'We''re back and better than ever!  It''s the Darkmoon Faire friend, and it''s your lucky day!  Sparing no expense, we''ve gathered wonders and treats from around the world for your delight.  Whether you''re young or old, rich or poor, the Darkmoon Faire has it all!  Be sure to turn in your Darkmoon Faire Prize Tickets to Gelvas Grimegate, and choose from several exotic and wondrous prizes!',12,0,100,0,0,0,10160,0,'Silas Darkmoon'),
(14823,1,3,'Welcome one and all to the greatest show on all of Azeroth... the Darkmoon Faire!  Adventure and excitement await, don''t be shy!  Mysteries and prizes for both the young and the old are here for the taking.  And be sure to speak with the professor about any Darkmoon Cards that you have come across during your travels!',12,0,100,0,0,0,22541,0,'Silas Darkmoon'),
(14823,1,4,'Greetings friends, and welcome to the greatest show on Azeroth!$B$BPlease, step right up and take in all we have to offer.  Ride the rides and see the sights!  Amaze at the wonders that the Darkmoon Faire has uncovered in this vast and mysterious world!  We have spared no expense in bringing you excitement that children of all ages will delight in!',12,0,100,0,0,0,22542,0,'Silas Darkmoon'),
(14823,1,5,'Everyone enjoying themselves so far?  That''s great!  Welcome to the Darkmoon Faire, the greatest show in all of Outland!  Make sure that you speak with Yebb and his friends here while you''re taking in Neblegear''s Darkmoon Zoo Bizarre.',12,0,100,0,0,0,22543,0,'Silas Darkmoon'),
(14823,1,6,'Welcome one and all to the Darkmoon Faire, the greatest event in all the worlds!  We have it all... delicious food, strong drink, exotic artifacts, fortunes read, amazing prizes and excitement without end!  Don''t forget to turn in your Darkmoon Faire Prize Tickets to Gelvas Grimegate!  All it takes is five or more and you''re on your way to the most wondrous prizes in all of Outland.  Everybody is a winner!',12,0,100,0,0,0,22544,0,'Silas Darkmoon'),
(14828,0,0,'Tickets! Redeem your Darkmoon Prize Tickets here!  Wondrous and exotic prizes are waiting for you!',12,0,100,0,0,0,10149,0,'Gelvas Grimegate'),
(14828,0,1,'Mysterious prizes await the adventurous.  Step right up, step right up!',12,0,100,0,0,0,10150,0,'Gelvas Grimegate'),
(14828,0,2,'Five tickets or five hundred, it doesn''t matter friend, everybody is a winner!',12,0,100,0,0,0,10151,0,'Gelvas Grimegate'),
(14828,0,3,'Prizes!  Get your prizes right here!  Get over here and turn in your Darkmoon Prize Tickets for valuable prizes!',12,0,100,0,0,0,10152,0,'Gelvas Grimegate'),
(14844,0,0,'Cheap beer!  Get your cheap beer right here!',12,0,100,0,0,0,10129,0,'Sylannia'),
(14844,0,1,'Huzzah for the tipper!  Step right up and get your delicious, cold drinks right here!',12,0,100,0,0,0,10130,0,'Sylannia'),
(14844,0,2,'Just in... another batch of Darkmoon Special Reserve.  Come get yours before they''re all gone!',12,0,100,0,0,0,10131,0,'Sylannia'),
(14844,0,3,'You there!  Yes you!  You look thirsty.  Get over here, I have just what you need!',12,0,100,0,0,0,10132,0,'Sylannia'),
(14845,0,0,'Step right up!  Get your red hot wings right here!',12,0,100,0,0,0,10133,0,'Stamp Thunderhorn'),
(14845,0,1,'Darkmoon Dogs fresh off the grill.  Come and get ''em while they''re hot!',12,0,100,0,0,0,10134,0,'Stamp Thunderhorn'),
(14845,0,2,'You''ve got money and we''ve got food.  What are you waiting for?!',12,0,100,0,0,0,10135,0,'Stamp Thunderhorn'),
(14845,0,3,'For a limited time only, crunchy frog available exclusively here at the Darkmoon Faire.',12,0,100,0,0,0,10136,0,'Stamp Thunderhorn'),
(14846,0,0,'Every item that I have for sale I acquired myself.  You have my personal guarantee of authenticity.',12,0,100,0,0,0,10141,0,'Lhara'),
(14846,0,1,'Darkmoon Faire Cards?  See the Professor here for those.',12,0,100,0,0,0,10142,0,'Lhara'),
(14846,0,2,'Come and take a look at my wares while you still can.  We''re here all week, and then we''re off to some far off land.',12,0,100,0,0,0,10143,0,'Lhara'),
(14846,0,3,'Have you any idea what I go through to bring these incomparable valuables to sell?  Come see them all for yourself!',12,0,100,0,0,0,10144,0,'Lhara'),
(14847,0,0,'Have a completed Darkmoon deck? Turn it in here!',12,0,100,0,0,0,10137,0,'Professor Thaddeus Paleo'),
(14847,0,1,'Come speak with me if you have any Darkmoon Faire Cards.',12,0,100,0,0,0,10138,0,'Professor Thaddeus Paleo'),
(14847,0,2,'Darkmoon decks! Turn them in here!',12,0,100,0,0,0,10139,0,'Professor Thaddeus Paleo'),
(14847,0,3,'Have you any Darkmoon Faire cards?  Come speak with me to learn more about them if you dare!',12,0,100,0,0,0,10140,0,'Professor Thaddeus Paleo'),
(14860,0,0,'Hey, someone help me catch this thing!',12,0,100,0,0,0,10145,0,'Flik'),
(14860,0,1,'It''s getting away!',12,0,100,0,0,0,10146,0,'Flik'),
(14860,0,2,'Get back here!',12,0,100,0,0,0,10147,0,'Flik'),
(14860,0,3,'Frogs and leather balls for sale!',12,0,100,0,0,0,10148,0,'Flik'),
(14842,0,0,'The Darkmoon Faire is coming to town!  Don''t miss it!',12,0,100,0,0,0,10097,0,'Melnan Darkstone - Darkmoon Faire Building (Elwynn Forest)'),
(14842,0,1,'The Darkmoon Faire is coming!  There is fun for children of ALL ages!  Come one, come all!',12,0,100,0,0,0,10098,0,'Melnan Darkstone - Darkmoon Faire Building (Elwynn Forest)'),
(14842,0,2,'Step right up and hear about the most amazing spectacle in all of Azeroth - the Darkmoon Faire!  Huzzah!',12,0,100,0,0,0,10099,0,'Melnan Darkstone - Darkmoon Faire Building (Elwynn Forest)'),
(14842,0,3,'Be sure to catch all the amazing sights and wonders of the Darkmoon Faire when it comes to town!',12,0,100,0,0,0,10100,0,'Melnan Darkstone - Darkmoon Faire Building (Elwynn Forest)'),
(14842,1,0,'It''s here!  The Darkmoon Faire is now open for business!  Be sure to see the most exciting show on all of Azeroth!',12,0,100,0,0,0,10105,0,'Melnan Darkstone - Darkmoon Faire (Elwynn Forest)'),
(14842,1,1,'The Darkmoon Faire has come to town!  Be sure to experience the most thrilling show you''ll ever see!',12,0,100,0,0,0,10106,0,'Melnan Darkstone - Darkmoon Faire (Elwynn Forest)'),
(14842,1,2,'The Darkmoon Faire will only be live for a short time before the curtains are drawn closed.  Be sure to visit it today!',12,0,100,0,0,0,10107,0,'Melnan Darkstone - Darkmoon Faire (Elwynn Forest)'),
(14842,1,3,'Boys and girls - children of all ages - the Darkmoon Faire has arrived!  Huzzah!',12,0,100,0,0,0,10108,0,'Melnan Darkstone - Darkmoon Faire (Elwynn Forest)');

-- Melnan Darkstone gossip
DELETE FROM `gossip_menu` WHERE `MenuID` IN (6213,6220);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6213,7366),
(6213,7375),
(6220,7378);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 6213;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(6213,0,0,'When the Darkmoon Faire arrives, where will it be located?',10109,1,1,6220,0,0,0,'',0,0),
(6213,1,0,'The Darkmoon Faire has already arrived, you say?  Where is it located?',10110,1,1,6222,0,0,0,'',0,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (14828,14844,14845,14846,14847,14860,14842);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (14823,-56600,14828,14844,14845,14846,14847,14860,14842,14849);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1482300,1484900,1484901,1484902,1484903,1484904,1484905,1484906,1484907);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-56600,0,0,0,34,0,100,0,2,1,0,0,0,80,1482300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 2 Reached - Call Timed Action List'),
(-56600,0,1,0,34,0,100,0,2,11,0,0,0,80,1482300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 12 Reached - Call Timed Action List'),

(1482300,9,0,0,0,0,100,0,0,240000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On Script - Say Line 0'),

(14828,0,0,0,1,0,100,0,0,240000,180000,240000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gelvas Grimegate - OOC - Say Line 0'),

(14844,0,0,0,1,0,100,0,0,240000,180000,240000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sylannia - OOC - Say Line 0'),

(14845,0,0,0,1,0,100,0,0,240000,180000,240000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stamp Thunderhorn - OOC - Say Line 0'),

(14846,0,0,0,1,0,100,0,0,240000,180000,240000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lhara - OOC - Say Line 0'),

(14847,0,0,0,1,0,100,0,0,240000,180000,240000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Professor Thaddeus Paleo - OOC - Say Line 0'),

(14860,0,0,0,1,0,100,0,0,240000,180000,240000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Flik - OOC - Say Line 0'),

(14842,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Melnan Darkstone - On Respawn - Set Active On'),
(14842,0,1,0,1,0,100,0,0,240000,180000,240000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Melnan Darkstone - OOC - Say Line 0'),
(14842,0,2,0,1,0,100,0,0,240000,180000,240000,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Melnan Darkstone - OOC - Say Line 1'),

(14849,0,0,0,1,0,100,1,1000,1000,0,0,0,71,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - OOC - Use Equip 1 (No Repeat)'),
(14849,0,1,0,1,0,100,1,1000,1000,0,0,0,87,1484906,1484907,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - OOC - Call Random Timed Action List (No Repeat)'),
(14849,0,2,0,11,0,100,0,0,0,0,0,0,87,1484900,1484901,1484902,1484903,1484904,1484905,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - On Respawn - Call Random Timed Action List'),

(1484900,9,0,0,0,0,100,0,0,0,0,0,0,3,23629,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - On Script - Morph To Creature ''[PH] Darkmoon Faire Carnie APPEARANCE A'''),
(1484901,9,0,0,0,0,100,0,0,0,0,0,0,3,23630,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - On Script - Morph To Creature ''[PH] Darkmoon Faire Carnie APPEARANCE B'''),
(1484902,9,0,0,0,0,100,0,0,0,0,0,0,3,23631,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - On Script - Morph To Creature ''[PH] Darkmoon Faire Carnie APPEARANCE C'''),
(1484903,9,0,0,0,0,100,0,0,0,0,0,0,3,23632,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - On Script - Morph To Creature ''[PH] Darkmoon Faire Carnie APPEARANCE D'''),
(1484904,9,0,0,0,0,100,0,0,0,0,0,0,3,23633,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - On Script - Morph To Creature ''[PH] Darkmoon Faire Carnie APPEARANCE E'''),
(1484905,9,0,0,0,0,100,0,0,0,0,0,0,3,23634,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - On Script - Morph To Creature ''[PH] Darkmoon Faire Carnie APPEARANCE F'''),
(1484906,9,0,0,0,0,100,0,0,0,0,0,0,71,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - On Script - Use Equip 2'),
(1484907,9,0,0,0,0,100,0,0,0,0,0,0,71,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darkmoon Faire Carnie - On Script - Use Equip 3');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (14860,14842);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 6213;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,14860,0,0,21,1,16,0,0,0,0,0,'Flik - Group 0: Execute SAI ID 0 only if ''UNIT_STATE_ROAMING'' is set'),

(22,2,14842,0,0,12,1,23,0,0,0,0,0,'Melnan Darkstone - Group 0: Execute SAI ID 1 only if event ''Darkmoon Faire Building (Elwynn Forest)'' is active'),
(22,3,14842,0,0,12,1,4,0,0,0,0,0,'Melnan Darkstone - Group 0: Execute SAI ID 2 only if event ''Darkmoon Faire (Elwynn Forest)'' is active'),

(14,6213,7366,0,0,12,1,23,0,0,0,0,0,'Melnan Darkstone - Group 0: Show gossip text 7366 only if event ''Darkmoon Faire Building (Elwynn Forest)'' is active'),
(14,6213,7375,0,0,12,1,4,0,0,0,0,0,'Melnan Darkstone - Group 0: Show gossip text 7375 only if event ''Darkmoon Faire (Elwynn Forest)'' is active'),
(15,6213,0,0,0,12,1,23,0,0,0,0,0,'Melnan Darkstone - Group 0: Show gossip option 0 only if event ''Darkmoon Faire Building (Elwynn Forest)'' is active'),
(15,6213,1,0,0,12,1,4,0,0,0,0,0,'Melnan Darkstone - Group 0: Show gossip option 1 only if event ''Darkmoon Faire (Elwynn Forest)'' is active');

DELETE FROM `waypoint_data` WHERE `id` IN (566000,566240,30089070);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
-- Silas Darkmoon
(566000,1,-9557.07,83.7086,58.8816,0,0,0,0,100,0),
(566000,2,-9544.87,83.2385,60.6677,0,300000,0,0,100,0),
(566000,3,-9557.07,83.7086,58.8816,0,0,0,0,100,0),
(566000,4,-9554.57,88.8444,58.9045,0,0,0,0,100,0),
(566000,5,-9551.84,94.4594,58.8821,0,0,0,0,100,0),
(566000,6,-9545.32,93.8408,58.9446,0,0,0,0,100,0),
(566000,7,-9540.44,93.3775,58.8911,0,0,0,0,100,0),
(566000,8,-9535.49,88.6063,58.887,0,0,0,0,100,0),
(566000,9,-9531.96,85.2087,58.882,0,0,0,0,100,0),
(566000,10,-9525.74,83.6098,58.882,0,0,0,0,100,0),
(566000,11,-9520.09,82.1573,59.2373,0,0,0,0,100,0),
(566000,12,-9516.13,81.1389,59.6036,0,300000,0,0,100,0),
(566000,13,-9525.01,79.8039,58.8824,0,0,0,0,100,0),
(566000,14,-9535.05,78.2951,58.8824,0,0,0,0,100,0),
(566000,15,-9544.4,76.8904,58.9542,0,0,0,0,100,0),
(566000,16,-9551.91,75.7614,58.8821,0,0,0,0,100,0),
(566000,17,-9557.07,83.7086,58.8816,0,0,0,0,100,0),
-- Flik's Frog
(566240,1,-9502.26,77.9182,57.5324,0,0,1,0,100,0),
(566240,2,-9495.38,73.9715,56.3258,0,0,1,0,100,0),
(566240,3,-9487.18,69.272,56.1765,0,0,1,0,100,0),
(566240,4,-9481.24,65.8697,56.1926,0,0,1,0,100,0),
(566240,5,-9473.34,62.1216,56.0828,0,0,1,0,100,0),
(566240,6,-9466.7,58.9703,56.238,0,0,1,0,100,0),
(566240,7,-9462.24,65.2439,55.9709,0,0,1,0,100,0),
(566240,8,-9458.44,70.577,56.4533,0,0,1,0,100,0),
(566240,9,-9465.8,71.4221,56.4302,0,0,1,0,100,0),
(566240,10,-9473.33,72.2868,56.5039,0,0,1,0,100,0),
(566240,11,-9481.63,73.2394,56.5002,0,0,1,0,100,0),
(566240,12,-9489.25,74.3115,56.1007,0,0,1,0,100,0),
(566240,13,-9500.8,75.9345,57.0592,0,0,1,0,100,0),
(566240,14,-9507.4,76.7587,58.3887,0,0,1,0,100,0),
(566240,15,-9514.39,77.6317,59.4991,0,0,1,0,100,0),
(566240,16,-9518.32,77.9041,59.4916,0,0,1,0,100,0),
(566240,17,-9527.51,78.5419,58.8825,0,0,1,0,100,0),
(566240,18,-9536.24,79.1473,58.8825,0,0,1,0,100,0),
(566240,19,-9546.02,79.8254,59.1668,0,0,1,0,100,0),
(566240,20,-9556,80.5177,58.8818,0,0,1,0,100,0),
(566240,21,-9557.31,87.8706,58.8873,0,0,1,0,100,0),
(566240,22,-9558.74,95.8773,58.8826,0,0,1,0,100,0),
(566240,23,-9549.67,93.6517,58.9074,0,0,1,0,100,0),
(566240,24,-9540.39,91.3728,58.9076,0,0,1,0,100,0),
(566240,25,-9528.14,88.3681,58.882,0,0,1,0,100,0),
(566240,26,-9517.49,85.7543,59.4996,0,0,1,0,100,0),
(566240,27,-9509.9,81.8486,59.4903,0,0,1,0,100,0),
-- Melnan Darkstone
(30089070,1,-4982.68,-963.738,501.659,0,0,0,0,100,0),
(30089070,2,-4966.25,-948.009,501.659,0,0,0,0,100,0),
(30089070,3,-4947.42,-931.671,501.659,0,0,0,0,100,0),
(30089070,4,-4922.59,-910.984,501.659,0,0,0,0,100,0),
(30089070,5,-4900.64,-898.418,501.659,0,0,0,0,100,0),
(30089070,6,-4875.92,-890.53,501.659,0,0,0,0,100,0),
(30089070,7,-4855.47,-885.766,501.659,0,0,0,0,100,0),
(30089070,8,-4835.2,-884.038,501.659,0,0,0,0,100,0),
(30089070,9,-4820.52,-883.41,501.659,0,0,0,0,100,0),
(30089070,10,-4800.39,-884.07,501.663,0,0,0,0,100,0),
(30089070,11,-4784.24,-885.432,501.659,0,0,0,0,100,0),
(30089070,12,-4763.38,-889.904,501.659,0,0,0,0,100,0),
(30089070,13,-4748.81,-894.673,501.659,0,0,0,0,100,0),
(30089070,14,-4749.41,-905.275,501.659,0,0,0,0,100,0),
(30089070,15,-4753.94,-909.319,501.659,0,0,0,0,100,0),
(30089070,16,-4769.22,-906.058,501.663,0,0,0,0,100,0),
(30089070,17,-4775.83,-907.238,501.661,0,0,0,0,100,0),
(30089070,18,-4783.41,-907.584,497.961,0,0,0,0,100,0),
(30089070,19,-4804.25,-904.848,497.954,0,0,0,0,100,0),
(30089070,20,-4814.93,-902.961,497.971,0,0,0,0,100,0),
(30089070,21,-4822.86,-902.102,501.66,0,0,0,0,100,0),
(30089070,22,-4844.94,-907.025,501.66,0,0,0,0,100,0),
(30089070,23,-4865.21,-911.545,501.66,0,0,0,0,100,0),
(30089070,24,-4875.69,-913.882,501.66,0,0,0,0,100,0),
(30089070,25,-4890.25,-921.527,501.623,0,0,0,0,100,0),
(30089070,26,-4913.38,-941.166,501.528,0,0,0,0,100,0),
(30089070,27,-4932.3,-957.266,501.553,0,0,0,0,100,0),
(30089070,28,-4945.19,-968.223,501.568,0,0,0,0,100,0),
(30089070,29,-4956.21,-977.597,501.609,0,0,0,0,100,0),
(30089070,30,-4966.41,-987.795,501.657,0,0,0,0,100,0),
(30089070,31,-4975.4,-998.238,501.657,0,0,0,0,100,0),
(30089070,32,-4981.95,-1012.55,501.655,0,0,0,0,100,0),
(30089070,33,-4987.98,-1032.34,501.654,0,0,0,0,100,0),
(30089070,34,-4991.06,-1041.89,501.66,0,0,0,0,100,0),
(30089070,35,-4991.74,-1049.56,497.944,0,0,0,0,100,0),
(30089070,36,-4993.67,-1063.06,497.963,0,0,0,0,100,0),
(30089070,37,-4994.55,-1080.96,497.972,0,0,0,0,100,0),
(30089070,38,-4995.42,-1089.07,501.66,0,0,0,0,100,0),
(30089070,39,-4996.99,-1103.82,501.659,0,0,0,0,100,0),
(30089070,40,-4997.76,-1111,501.663,0,0,0,0,100,0),
(30089070,41,-5010.9,-1113.08,501.668,0,0,0,0,100,0),
(30089070,42,-5014.93,-1102.52,501.671,0,0,0,0,100,0),
(30089070,43,-5015.86,-1081.45,501.68,0,0,0,0,100,0),
(30089070,44,-5014.07,-1055.77,501.724,0,0,0,0,100,0),
(30089070,45,-5011.75,-1042.1,501.712,0,0,0,0,100,0),
(30089070,46,-5003.69,-1018.41,501.656,0,0,0,0,100,0),
(30089070,47,-4998.19,-1003.91,501.658,0,0,0,0,100,0),
(30089070,48,-4990.7,-984.164,501.659,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
