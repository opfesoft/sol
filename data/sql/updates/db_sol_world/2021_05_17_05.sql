-- DB update 2021_05_17_04 -> 2021_05_17_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_17_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_17_04 2021_05_17_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1621266989742984241'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1621266989742984241');

UPDATE `gameobject` SET `rotation0` = -0.061111, `rotation1` = -0.0142727, `rotation2` = -0.950614, `rotation3` = 0.303965 WHERE `guid` = 57889;

DELETE FROM `gameobject_addon` WHERE `guid` = 57889;
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(57889,0,0,1);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
