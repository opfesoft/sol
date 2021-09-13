-- DB update 2021_09_10_00 -> 2021_09_13_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_09_10_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_09_10_00 2021_09_13_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1631169209646445982'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1631169209646445982');

-- Removed the skinning loot of Rock Worm (NPC 11788), Rock Borer (NPC 11787) and Vile Larva (NPC 12218)
UPDATE `creature_template` SET `skinloot` = 0 WHERE (`entry` IN (11788, 11787, 12218));


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;