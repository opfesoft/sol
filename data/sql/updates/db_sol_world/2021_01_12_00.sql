-- DB update 2021_01_11_02 -> 2021_01_12_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_11_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_11_02 2021_01_12_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610437180630811075'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610437180630811075');

DELETE FROM `gameobject` WHERE `guid` = 45964;

DELETE FROM `gossip_menu` WHERE `MenuID` IN (7113,7114,7115,7123,7124,7125,7106,7107,7108,7112,7111,7118,7119,7120,7121,7122);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`) VALUES
(7113,8371),
(7114,8372),
(7115,8373),
(7123,8385),
(7124,8386),
(7125,8387),
(7106,8363),
(7107,8364),
(7108,8365),
(7111,8369),
(7112,8370),
(7118,8380),
(7119,8381),
(7120,8382),
(7121,8383),
(7122,8384);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (16114,16115,16113,16116,16134);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (16114,16115,16113,16116,16134) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 16256 AND `source_type` = 0 AND `id` IN (2,3,4,5,6);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1611400,1625600,1625601,1613400) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16114,0,0,0,1,0,100,0,5000,30000,480000,480000,0,80,1611400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - OOC - Call Timed Action List'),
(16114,0,1,0,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Data 1 1 Set - Set Event Phase 1'),
(16114,0,2,0,38,0,100,0,2,2,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Data 2 2 Set - Set Event Phase 0'),
(16114,0,3,0,1,1,100,0,1000,3000,3000,5000,0,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - OOC - Play Emote ''Eat'''),
(1611400,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Set Active On'),
(1611400,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 0'),
(1611400,9,2,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 0 (Commander Eligor Dawnbringer)'),
(1611400,9,3,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 1 (Commander Eligor Dawnbringer)'),
(1611400,9,4,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 2 (Commander Eligor Dawnbringer)'),
(1611400,9,5,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 3 (Commander Eligor Dawnbringer)'),
(1611400,9,6,0,0,0,100,0,15000,15000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 1'),
(1611400,9,7,0,0,0,100,0,4000,4000,0,0,0,1,4,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 4 (Commander Eligor Dawnbringer)'),
(1611400,9,8,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 2'),
(1611400,9,9,0,0,0,100,0,4000,4000,0,0,0,1,5,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 5 (Commander Eligor Dawnbringer)'),
(1611400,9,10,0,0,0,100,0,10000,10000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 2'),
(1611400,9,11,0,0,0,100,0,5000,5000,0,0,0,1,6,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 6 (Commander Eligor Dawnbringer)'),
(1611400,9,12,0,0,0,100,0,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 4'),
(1611400,9,13,0,0,0,100,0,4000,4000,0,0,0,91,5,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Remove Flag Standstate ''Sit'' (Commander Eligor Dawnbringer)'),
(1611400,9,14,0,0,0,100,0,2000,2000,0,0,0,1,7,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 7 (Commander Eligor Dawnbringer)'),
(1611400,9,15,0,0,0,100,0,10000,10000,0,0,0,1,8,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 8 (Commander Eligor Dawnbringer)'),
(1611400,9,16,0,0,0,100,0,14000,14000,0,0,0,1,9,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 9 (Commander Eligor Dawnbringer)'),
(1611400,9,17,0,0,0,100,0,13000,13000,0,0,0,1,10,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 10 (Commander Eligor Dawnbringer)'),
(1611400,9,18,0,0,0,100,0,20000,20000,0,0,0,1,11,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Say Line 11 (Commander Eligor Dawnbringer)'),
(1611400,9,19,0,0,0,100,0,10000,10000,0,0,0,90,5,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Add Flag Standstate ''Sit'' (Commander Eligor Dawnbringer)'),
(1611400,9,20,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Set Active Off'),
(1611400,9,21,0,0,0,100,0,120000,120000,0,0,0,45,1,1,0,0,0,0,19,16256,0,0,0,0,0,0,0,'Scarlet Commander Marjhan - On Script - Set Data 1 1 (Jessica Chambers)'),

(16256,0,2,3,38,0,100,0,1,1,0,0,0,53,0,16256,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On Data 1 1 Set - Start WP Movement'),
(16256,0,3,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - Linked - Set Active On'),
(16256,0,4,0,40,0,100,0,1,16256,0,0,0,80,1625600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On WP 1 Reached - Call Timed Action List'),
(16256,0,5,0,40,0,100,0,5,16256,0,0,0,80,1625601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On WP 5 Reached - Call Timed Action List'),
(16256,0,6,0,40,0,100,0,8,16256,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.16421,'Jessica Chambers - On WP 8 Reached - Set Orientation'),
(1625600,9,0,0,0,0,100,0,0,0,0,0,0,54,34000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Pause WP'),
(1625600,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.6761,'Jessica Chambers - On Script - Set Orientation'),
(1625600,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 0'),
(1625600,9,4,0,0,0,100,0,0,0,0,0,0,50,181143,120,0,0,0,0,8,0,0,0,0,2298.4,-5341.18,91.8703,5.28751,'Jessica Chambers - On Script - Summon Gameobject ''Fish of the Day'''),
(1625600,9,5,0,0,0,100,0,4000,4000,0,0,0,5,7,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Play Emote ''Eat'' (Commander Eligor Dawnbringer)'),
(1625600,9,6,0,0,0,100,0,4000,4000,0,0,0,1,12,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 12 (Commander Eligor Dawnbringer)'),
(1625600,9,7,0,0,0,100,0,4000,4000,0,0,0,1,13,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 13 (Commander Eligor Dawnbringer)'),
(1625600,9,8,0,0,0,100,0,4000,4000,0,0,0,45,1,1,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Set Data 1 1 (Commander Eligor Dawnbringer)'),
(1625600,9,9,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.23882,'Jessica Chambers - On Script - Set Orientation'),
(1625600,9,10,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 1'),
(1625600,9,11,0,0,0,100,0,0,0,0,0,0,50,181144,103,0,0,0,0,8,0,0,0,0,2298.24,-5339.52,91.8803,0.683735,'Jessica Chambers - On Script - Summon Gameobject ''Bowl of Fruit'''),
(1625600,9,12,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,19,16113,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 0 (Father Inigo Montoy)'),
(1625600,9,13,0,0,0,100,0,4000,4000,0,0,0,5,7,0,0,0,0,0,19,16113,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Play Emote ''Eat'' (Father Inigo Montoy)'),
(1625600,9,14,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,19,16113,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 1 (Father Inigo Montoy)'),
(1625600,9,15,0,0,0,100,0,4000,4000,0,0,0,45,1,1,0,0,0,0,19,16113,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Set Data 1 1 (Father Inigo Montoy)'),
(1625601,9,0,0,0,0,100,0,0,0,0,0,0,54,32000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Pause WP'),
(1625601,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,6.14871,'Jessica Chambers - On Script - Set Orientation'),
(1625601,9,3,0,0,0,100,0,1000,1000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 2'),
(1625601,9,4,0,0,0,100,0,0,0,0,0,0,50,181145,79,0,0,0,0,8,0,0,0,0,2296.58,-5338.5,91.8859,2.16942,'Jessica Chambers - On Script - Summon Gameobject ''Roast Boar Platter'''),
(1625601,9,5,0,0,0,100,0,0,0,0,0,0,50,181145,79,0,0,0,0,8,0,0,0,0,2296.69,-5340.52,91.8701,3.80698,'Jessica Chambers - On Script - Summon Gameobject ''Roast Boar Platter'''),
(1625601,9,6,0,0,0,100,0,4000,4000,0,0,0,1,5,0,0,0,0,0,19,16114,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 5 (Scarlet Commander Marjhan)'),
(1625601,9,7,0,0,0,100,0,0,0,0,0,0,5,7,0,0,0,0,0,19,16116,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Play Emote ''Eat'' (Archmage Angela Dosantos)'),
(1625601,9,8,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,16116,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 0 (Archmage Angela Dosantos)'),
(1625601,9,9,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,19,16116,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Set Data 1 1 (Archmage Angela Dosantos)'),
(1625601,9,10,0,0,0,100,0,2000,2000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 3'),
(1625601,9,11,0,0,0,100,0,0,0,0,0,0,5,7,0,0,0,0,0,19,16114,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Play Emote ''Eat'' (Scarlet Commander Marjhan)'),
(1625601,9,12,0,0,0,100,0,5000,5000,0,0,0,1,6,0,0,0,0,0,19,16114,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 6 (Scarlet Commander Marjhan)'),
(1625601,9,13,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,19,16116,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 2 (Archmage Angela Dosantos)'),
(1625601,9,14,0,0,0,100,0,4000,4000,0,0,0,45,1,1,0,0,0,0,19,16114,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Set Data 1 1 (Scarlet Commander Marjhan)'),
(1625601,9,15,0,0,0,100,0,20000,20000,0,0,0,1,14,0,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 14 (Commander Eligor Dawnbringer)'),
(1625601,9,16,0,0,0,100,0,8000,8000,0,0,0,1,1,0,0,0,0,0,19,16116,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 1 (Archmage Angela Dosantos)'),
(1625601,9,17,0,0,0,100,0,9000,9000,0,0,0,1,2,0,0,0,0,0,19,16113,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Say Line 2 (Father Inigo Montoy)'),
(1625601,9,18,0,0,0,100,0,10000,10000,0,0,0,45,2,2,0,0,0,0,19,16116,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Set Data 2 2 (Archmage Angela Dosantos)'),
(1625601,9,19,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,16115,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Set Data 2 2 (Commander Eligor Dawnbringer)'),
(1625601,9,20,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,16113,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Set Data 2 2 (Father Inigo Montoy)'),
(1625601,9,21,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,16114,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Set Data 2 2 (Scarlet Commander Marjhan)'),
(1625601,9,22,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jessica Chambers - On Script - Set Active Off'),

(16115,0,0,0,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Eligor Dawnbringer - On Data 1 1 Set - Set Event Phase 1'),
(16115,0,1,0,38,0,100,0,2,2,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Eligor Dawnbringer - On Data 2 2 Set - Set Event Phase 0'),
(16115,0,2,0,1,1,100,0,1000,3000,3000,5000,0,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Eligor Dawnbringer - OOC - Play Emote ''Eat'''),

(16113,0,0,0,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Father Inigo Montoy - On Data 1 1 Set - Set Event Phase 1'),
(16113,0,1,0,38,0,100,0,2,2,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Father Inigo Montoy - On Data 2 2 Set - Set Event Phase 0'),
(16113,0,2,0,1,1,100,0,1000,3000,3000,5000,0,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Father Inigo Montoy - OOC - Play Emote ''Eat'''),

(16116,0,0,0,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Angela Dosantos - On Data 1 1 Set - Set Event Phase 1'),
(16116,0,1,0,38,0,100,0,2,2,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Angela Dosantos - On Data 2 2 Set - Set Event Phase 0'),
(16116,0,2,0,1,1,100,0,1000,3000,3000,5000,0,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Angela Dosantos - OOC - Play Emote ''Eat'''),

(16134,0,0,0,1,0,100,0,1000,15000,150000,180000,0,80,1613400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rimblat Earthshatter - OOC - Call Timed Action List'),
(1613400,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Say Line 0'),
(1613400,9,1,0,0,0,100,0,1000,1000,0,0,0,11,27824,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Cast ''Rimblat Grows Flower DND'''),
(1613400,9,2,0,0,0,100,0,2000,2000,0,0,0,50,181103,30,0,0,0,0,8,0,0,0,0,2277,-5326.86,88.7085,-0.541052,'Rimblat Earthshatter - On Script - Summon GO ''Flower'''),
(1613400,9,3,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,16135,0,0,0,0,0,0,0,'Rimblat Earthshatter - On Script - Say Line 0 (Rayne)');

DELETE FROM `waypoints` WHERE `entry` = 16256;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(16256,1,2300.27,-5340.53,90.8799,''),
(16256,2,2300.8,-5337.74,90.8799,''),
(16256,3,2298.02,-5334.07,90.8799,''),
(16256,4,2293.54,-5335.07,90.8799,''),
(16256,5,2294.49,-5339.1,90.8803,''),
(16256,6,2293.89,-5341.91,90.8803,''),
(16256,7,2295.97,-5344.84,90.8803,''),
(16256,8,2300.9,-5345.09,90.8799,'');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
