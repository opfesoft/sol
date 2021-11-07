-- DB update 2021_11_06_00 -> 2021_11_07_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_06_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_06_00 2021_11_07_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636311153097625679'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636311153097625679');

DELETE FROM `gossip_menu` WHERE `MenuID` = 1470 AND `TextID` = 2139;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(1470,2139);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 1470;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(1470,0,0,'Yes.  Give me the spell to summon the avatar.',4567,1,1,0,0,0,0,NULL,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 1470;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,1470,2139,0,0,47,0,3528,64,0,0,0,0,'Yeh''kinya - Group 0: Show gossip text 2139 if the quest ''The God Hakkar'' is rewarded'),
(14,1470,2139,0,0,2,0,10818,1,1,1,0,0,'Yeh''kinya - Group 0: Show gossip text 2139 if the player does not have the item ''Yeh''kinya''s Scroll'' in the inventory or in the bank'),

(14,1470,2140,0,0,47,0,3528,64,0,1,0,0,'Yeh''kinya - Group 0: Show gossip text 2140 if the quest ''The God Hakkar'' is not rewarded'),
(14,1470,2140,0,1,2,0,10818,1,1,0,0,0,'Yeh''kinya - Group 1: Show gossip text 2140 if the player has the item ''Yeh''kinya''s Scroll'' in the inventory or in the bank'),

(15,1470,0,0,0,47,0,3528,64,0,0,0,0,'Yeh''kinya - Group 0: Show gossip option 0 if the quest ''The God Hakkar'' is rewarded'),
(15,1470,0,0,0,2,0,10818,1,1,1,0,0,'Yeh''kinya - Group 0: Show gossip option 0 if the player does not have the item ''Yeh''kinya''s Scroll'' in the inventory or in the bank');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `flags_extra` = `flags_extra` | 512 WHERE `entry` = 8579;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8579;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 857900;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8579,0,0,0,20,0,100,0,8181,0,0,0,0,80,857900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On Quest ''Confront Yeh''kinya'' Rewarded - Call Timed Action List'),
(8579,0,1,0,40,0,100,0,2,8579,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On WP 2 Reached - Force Despawn'),
(8579,0,2,3,62,0,100,0,1470,0,0,0,0,11,12998,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Yeh''kinya - On Gossip Option 0 Selected - Cast ''Create Yeh''kinya''s Scroll'''),
(8579,0,3,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Yeh''kinya - Linked - Close Gossip'),

(857900,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On Script - Set Active On'),
(857900,9,1,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(857900,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On Script - Say Line 0'),
(857900,9,3,0,0,0,100,0,6000,6000,0,0,0,3,0,2706,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On Script - Morph To Model ''Wind Serpent'''),
(857900,9,4,0,0,0,100,0,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On Script - Set Fly On'),
(857900,9,5,0,0,0,100,0,0,0,0,0,0,11,7741,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On Script - Cast ''Summoned Demon'''),
(857900,9,6,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On Script - Say Line 1'),
(857900,9,7,0,0,0,100,0,0,0,0,0,0,53,1,8579,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yeh''kinya - On Script - Start WP Movement');

DELETE FROM `waypoints` WHERE `entry` = 8579;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`)
VALUES
(8579,1,-6916.84,-4847.92,12.5325),
(8579,2,-6964.45,-4949.57,6.45678);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
