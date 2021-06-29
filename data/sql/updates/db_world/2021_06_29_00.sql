-- DB update 2021_06_28_01 -> 2021_06_29_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_06_28_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_06_28_01 2021_06_29_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1623943488444083198'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1623943488444083198');

-- Remove Claw (cat ability and sound) from SmartAI for Non-Cat creatures:
-- Mottled Raptor (1020), Highland Strider (2559), Young Mesa Buzzard (2578)
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1020, 2559, 2578)  AND `id`=0;
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` IN (1020, 2559, 2578);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
