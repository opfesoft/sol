-- DB update 2020_05_24_01 -> 2020_05_24_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_24_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_24_01 2020_05_24_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1590332034371098666'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1590332034371098666');

-- Vartrus, Stoma, Hastat: Remove from world as they are spawned via areatrigger script "at_ancient_leaf"
DELETE FROM `creature` WHERE `id` IN (14524,14525,14526);

-- Quest "The Ancient Leaf" should only be ended by Vartrus
DELETE FROM `creature_questender` WHERE `id` IN (14525,14526) AND `quest` = 7632;

-- Vartrus, Stoma, Hastat: Increase despawn time from 100 to 300 seconds
UPDATE `creature_summon_groups` SET `summonTime` = 300000 WHERE `summonerId` = 1;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
