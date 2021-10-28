-- DB update 2021_10_27_04 -> 2021_10_28_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_27_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_27_04 2021_10_28_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635442845528990659'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635442845528990659');

UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 13 WHERE `guid` IN (6385,10279);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 16 WHERE `guid` = 6388;
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 9 WHERE `guid` = 10278;
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 18 WHERE `guid` = 8424;
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 20 WHERE `guid` IN (7668,8417);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 24 WHERE `guid` = 10276;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
