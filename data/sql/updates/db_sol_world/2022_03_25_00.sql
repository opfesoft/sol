-- DB update 2022_03_24_01 -> 2022_03_25_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_24_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_24_01 2022_03_25_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648191421201983159'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648191421201983159');

UPDATE `creature_onkill_reputation` SET `MaxStanding1` = 6 WHERE `creature_id` IN (8558,1788,11873,1804,12262,12263,8543,8545);
UPDATE `creature_onkill_reputation` SET `MaxStanding1` = 5 WHERE `creature_id` = 8531;
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 30 WHERE `creature_id` IN (11075,11076,11077,11078);
UPDATE `creature_onkill_reputation` SET `MaxStanding1` = 6, `RewOnKillRepValue1` = 50 WHERE `creature_id` = 1852;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
