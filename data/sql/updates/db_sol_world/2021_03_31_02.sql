-- DB update 2021_03_31_01 -> 2021_03_31_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_31_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_31_01 2021_03_31_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1617204132845994030'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1617204132845994030');

UPDATE `gameobject` SET `position_z` = 23.64, `rotation0` = -0.524703, `rotation1` = -0.171947, `rotation2` = -0.751402, `rotation3` = 0.36127 WHERE `guid` = 11584;

DELETE FROM `gameobject_addon` WHERE `guid` = 11584;
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(11584,0,0,1);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
