-- DB update 2020_11_27_00 -> 2020_11_28_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2020_11_27_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2020_11_27_00 2020_11_28_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1605586971095091500'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1605586971095091500');
-- Remove Quest Giver & Gossip flags
UPDATE `creature_template` SET `npcflag` = 0 WHERE (`entry` = 1747);
-- Remove Cataclysm gossip from DB
DELETE FROM `gossip_menu` WHERE (`MenuID` = 11874) AND (`TextID` IN (16642));


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
