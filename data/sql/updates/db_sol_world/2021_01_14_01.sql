-- DB update 2021_01_14_00 -> 2021_01_14_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_14_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_14_00 2021_01_14_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610663513760366308'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610663513760366308');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (17435,20903,19409,20235,23413,23415,20162,27575,26443,26949,23704,17209);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (17435,20903,19409,20235,23413,23415,20162,27575,26443,26949,23704,17209) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17435,0,0,1,62,0,100,0,7415,0,0,0,0,11,32474,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Susurrus - On Gossip Option 0 Selected - Cast ''Buffeting Winds of Susurrus'''),
(17435,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Susurrus - Linked - Close Gossip'),

(20903,0,0,1,62,0,100,0,8229,0,0,0,0,52,627,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Protectorate Nether Drake - On Gossip Option 0 Selected - Activate Taxi Path 627'),
(20903,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Protectorate Nether Drake - Linked - Close Gossip'),

(19409,0,0,2,62,0,100,0,7970,0,0,0,0,11,33768,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Wing Commander Dabir''ee - On Gossip Option 0 Selected - Cast ''Gateways Murket and Shaadraz'''),
(19409,0,1,2,62,0,100,0,7970,1,0,0,0,11,35069,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Wing Commander Dabir''ee - On Gossip Option 1 Selected - Cast ''Taxi - Hellfire Peninsula - Expedition Point to Shatter Point'''),
(19409,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Wing Commander Dabir''ee - Linked - Close Gossip'),

(20235,0,0,2,62,0,100,0,8096,0,0,0,0,11,33899,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Gryphoneer Windbellow - On Gossip Option 0 Selected - Cast ''Aerial Assault Flight (Alliance)'''),
(20235,0,1,2,62,0,100,0,8096,1,0,0,0,11,35065,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Gryphoneer Windbellow - On Gossip Option 1 Selected - Cast ''Taxi - Hellfire Peninsula - Shatter Point to Beach Head'''),
(20235,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Gryphoneer Windbellow - Linked - Close Gossip'),

(23413,0,0,1,62,0,100,0,8718,0,0,0,0,11,41278,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skyguard Handler Irena - On Gossip Option 0 Selected - Cast ''Taxi - Skyguard Outpost to Skettis'''),
(23413,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skyguard Handler Irena - Linked - Close Gossip'),

(23415,0,0,1,62,0,100,0,8719,0,0,0,0,11,41279,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skyguard Handler Deesak - On Gossip Option 0 Selected - Cast ''Taxi - Skettis to Skyguard Outpost'''),
(23415,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skyguard Handler Deesak - Linked - Close Gossip'),

(20162,0,0,1,62,0,100,0,8082,0,0,0,0,85,34905,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Veronia - On Gossip Option 0 Selected - Invoker Cast ''Stealth Flight'''),
(20162,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Veronia - Linked - Close Gossip'),

(27575,0,0,2,62,0,100,0,9563,0,0,0,0,52,881,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Lord Afrasastrasz - On Gossip Option 0 Selected - Activate Taxi Path 881'),
(27575,0,1,2,62,0,100,0,9563,1,0,0,0,52,882,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Lord Afrasastrasz - On Gossip Option 1 Selected - Activate Taxi Path 882'),
(27575,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Lord Afrasastrasz - Linked - Close Gossip'),

(26443,0,0,2,62,0,100,0,9455,0,0,0,0,52,878,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Tariolstrasz - On Gossip Option 0 Selected - Activate Taxi Path 878'),
(26443,0,1,2,62,0,100,0,9455,1,0,0,0,52,883,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Tariolstrasz - On Gossip Option 1 Selected - Activate Taxi Path 883'),
(26443,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Tariolstrasz - Linked - Close Gossip'),

(26949,0,0,2,62,0,100,0,9457,0,0,0,0,52,879,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Torastrasza - On Gossip Option 0 Selected - Activate Taxi Path 879'),
(26949,0,1,2,62,0,100,0,9457,1,0,0,0,52,880,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Torastrasza - On Gossip Option 1 Selected - Activate Taxi Path 880'),
(26949,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Torastrasza - Linked - Close Gossip'),

(23704,0,0,1,62,0,100,0,8782,0,0,0,0,11,42295,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Cassa Crimsonwing - On Gossip Option 0 Selected - Cast ''Alcaz Island Survey'''),
(23704,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Cassa Crimsonwing - Linked - Close Gossip'),

(17209,0,0,3,62,0,100,0,7379,0,0,0,0,52,494,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'William Kielar - On Gossip Option 0 Selected - Activate Taxi Path 494'),
(17209,0,1,3,62,0,100,0,7379,1,0,0,0,52,495,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'William Kielar - On Gossip Option 1 Selected - Activate Taxi Path 495'),
(17209,0,2,3,62,0,100,0,7379,2,0,0,0,52,496,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'William Kielar - On Gossip Option 2 Selected - Activate Taxi Path 496'),
(17209,0,3,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'William Kielar - Linked - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (7415,8229,8718,8719,8082);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (7970,8096,8782);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(14,7415,8954,0,0,2,0,23843,1,0,1,0,0,'','Susurrus - Show gossip text 8954 if item ''Whorl of Air'' is not in inventory'),
(14,7415,8955,0,0,2,0,23843,1,0,0,0,0,'','Susurrus - Show gossip text 8955 if item ''Whorl of Air'' is in inventory'),
(15,7415,0,0,0,2,0,23843,1,0,0,0,0,'','Susurrus - Show gossip option 0 if item ''Whorl of Air'' is in inventory'),

(15,8229,0,0,0,2,0,29778,1,0,0,0,0,'','Protectorate Nether Drake - Show gossip option 0 if item ''Phase Disruptor'' is in inventory'),
(15,8229,0,0,0,47,0,10438,8,0,0,0,0,'','Protectorate Nether Drake - Show gossip option 0 if quest ''On Nethery Wings'' is in progress'),
(14,8229,10230,0,0,47,0,10438,99,0,0,0,0,'','Protectorate Nether Drake - Show gossip text 10230 if quest ''On Nethery Wings'' is not taken, completed, failed or already rewarded'),
(14,8229,10230,0,1,47,0,10438,8,0,0,0,0,'','Protectorate Nether Drake - Show gossip text 10230 if quest ''On Nethery Wings'' is in progress'),
(14,8229,10230,0,1,2,0,29778,1,0,0,0,0,'','Protectorate Nether Drake - Show gossip text 10230 if item ''Phase Disruptor'' is in inventory'),
(14,8229,10231,0,0,2,0,29778,1,0,1,0,0,'','Protectorate Nether Drake - Show gossip text 10231 if item ''Phase Disruptor'' is not in inventory'),
(14,8229,10231,0,0,47,0,10438,8,0,0,0,0,'','Protectorate Nether Drake - Show gossip text 10231 if quest ''On Nethery Wings'' is in progress'),

(15,7970,0,0,0,47,0,10146,8,0,0,0,0,'','Wing Commander Dabir''ee - Show gossip option 0 if quest ''Mission: The Murketh and Shaadraz Gateways'' is in progress'),
(15,7970,1,0,0,8,0,10340,0,0,1,0,0,'','Wing Commander Dabir''ee - Show gossip option 1 if quest ''Shatter Point'' is not rewarded'),

(15,8096,0,0,0,47,0,10163,8,0,0,0,0,'','Gryphoneer Windbellow - Show gossip option 0 if quest ''Mission: The Abyssal Shelf'' is in progress'),
(15,8096,0,0,1,47,0,10346,8,0,0,0,0,'','Gryphoneer Windbellow - Show gossip option 0 if quest ''Return to the Abyssal Shelf'' is in progress'),
(15,8096,1,0,0,28,0,10382,0,0,0,0,0,'','Gryphoneer Windbellow - Show gossip option 1 if quest ''Go to the Front'' is completed'),

(14,8718,10978,0,0,5,0,1031,224,0,0,0,0,'','Skyguard Handler Irena - Show gossip text 10978 if Honored or above with faction ''Sha''tari Skyguard'''),
(14,8718,10977,0,0,5,0,1031,224,0,1,0,0,'','Skyguard Handler Irena - Show gossip text 10977 if below Honored with faction ''Sha''tari Skyguard'''),
(15,8718,0,0,0,5,0,1031,224,0,0,0,0,'','Skyguard Handler Irena - Show gossip option 0 if Honored or above with faction ''Sha''tari Skyguard'''),

(14,8719,10979,0,0,5,0,1031,224,0,0,0,0,'','Skyguard Handler Deesak - Show gossip text 10979 if Honored or above with faction ''Sha''tari Skyguard'''),
(14,8719,10980,0,0,5,0,1031,224,0,1,0,0,'','Skyguard Handler Deesak - Show gossip text 10980 if below Honored with faction ''Sha''tari Skyguard'''),
(15,8719,0,0,0,5,0,1031,224,0,0,0,0,'','Skyguard Handler Deesak - Show gossip option 0 if Honored or above with faction ''Sha''tari Skyguard'''),

(14,8082,9989,0,0,28,0,10652,0,0,1,0,0,'','Veronia - Show gossip text 9989 if quest ''Behind Enemy Lines'' is not completed'),
(14,8082,9990,0,0,28,0,10652,0,0,0,0,0,'','Veronia - Show gossip text 9990 if quest ''Behind Enemy Lines'' is completed'),
(15,8082,0,0,0,28,0,10652,0,0,0,0,0,'','Veronia - Show gossip option 0 if quest ''Behind Enemy Lines'' is completed'),

(15,8782,0,0,0,47,0,11142,8,0,0,0,0,'','Cassa Crimsonwing - Show gossip option 0 if quest ''Survey Alcaz Island'' is in progress');

-- Add some missing menu texts
UPDATE `npc_text` SET `text0_0` = 'The nether drake refuses to let you mount it. Be sure to get a phase disruptor from Professor Dabiri. It will not take you up without one.', `BroadcastTextID0` = 18638 WHERE `ID` = 10231;

DELETE FROM `gossip_menu` WHERE `MenuID` = 7415 AND `TextID` = 8955;
DELETE FROM `gossip_menu` WHERE `MenuID` = 8229 AND `TextID` = 10231;
DELETE FROM `gossip_menu` WHERE `MenuID` = 8082 AND `TextID` = 9989;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7415,8955),
(8229,10231),
(8082,9989);

-- Cleanup wrong data
UPDATE `creature_template` SET `gossip_menu_id` = 8096 WHERE `entry` = 20235;
UPDATE `gossip_menu_option` SET `OptionText` = 'Send me to the Abyssal Shelf!' WHERE `MenuID` = 8096 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `OptionText` = 'Send me to Honor Point!' WHERE `MenuID` = 8096 AND `OptionID` = 1;
DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (8718,8719) AND `OptionID` = 1;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
