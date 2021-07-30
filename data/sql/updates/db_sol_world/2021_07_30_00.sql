-- DB update 2021_07_29_00 -> 2021_07_30_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_29_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_29_00 2021_07_30_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1627638843485325246'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1627638843485325246');

-- Adjust positions
UPDATE `creature` SET `position_x` = 1298.87, `position_y` = 319.117, `position_z` = -58.7043 WHERE `guid` = 32054; -- Ambassador Sunsorrow
UPDATE `creature` SET `position_x` = 1299.45, `position_y` = 316.742, `position_z` = -58.7188 WHERE `guid` = 32066; -- Champion Cyssa Dawnrose

-- Champion Cyssa Dawnrose: Use the correct gossip menu text for paladins
UPDATE `gossip_menu` SET `TextID` = 10044 WHERE `MenuID` = 8111 AND `TextID` = 10040;
UPDATE `conditions` SET `SourceEntry` = 10044 WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 8111 AND `SourceEntry` = 10040;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
