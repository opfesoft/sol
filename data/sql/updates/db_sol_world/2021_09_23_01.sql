-- DB update 2021_09_23_00 -> 2021_09_23_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_23_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_23_00 2021_09_23_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632433525610364822'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632433525610364822');

-- Delete obsolete WP path
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 45476;
DELETE FROM `creature_addon` WHERE `guid` = 45476;
DELETE FROM `waypoint_data` WHERE `id` = 454760;
DELETE FROM `waypoint_scripts` WHERE `id` = 30;

-- Update equip
UPDATE `creature_equip_template` SET `ItemID2` = 12865, `VerifiedBuild` = 12340 WHERE `CreatureID` = 14822;

-- Fix option text
UPDATE `gossip_menu_option` SET `OptionBroadcastTextID` = 10087 WHERE `MenuID` = 6210 AND `OptionID` = 0;

DELETE FROM `creature_text` WHERE `CreatureId` = 14822;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(14822,0,0,'Come to me and see what the future holds for you!',12,0,100,0,0,0,10125,0,'Sayge'),
(14822,0,1,'Come speak with me, and what once was cloudy shall become crystal clear.',12,0,100,0,0,0,10126,0,'Sayge'),
(14822,0,2,'Fear not!  All fortunes can be discerned for those who know the way.',12,0,100,0,0,0,10127,0,'Sayge'),
(14822,0,3,'The longer you wait, the less future you have for me to foretell.',12,0,100,0,0,0,10128,0,'Sayge');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
