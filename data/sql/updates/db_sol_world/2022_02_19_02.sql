-- DB update 2022_02_19_01 -> 2022_02_19_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_19_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_19_01 2022_02_19_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645277032712663182'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645277032712663182');

UPDATE `creature_template` SET `type_flags` = `type_flags` | 134217728 WHERE `entry` = 12919;

DELETE FROM `gossip_menu` WHERE `MenuID` IN (6445,57023,57024);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6445,7638),
(6445,7639),
(57023,7640),
(57024,7645);

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (6445,57023);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(6445,0,0,'I want to catch Gahz''ranka!  Tell me how!',10490,1,1,57023,0,0,0,'',0,0),
(57023,0,1,'Nat, I want to buy your mudskunk lures!',10492,3,128,0,0,0,0,'',0,0),
(57023,1,0,'How do I catch the mudskunks for your lure?',10500,1,1,57024,0,0,0,'',0,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
