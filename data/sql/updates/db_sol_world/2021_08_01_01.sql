-- DB update 2021_08_01_00 -> 2021_08_01_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_01_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_01_00 2021_08_01_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1627851597400686625'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1627851597400686625');

UPDATE `gameobject` SET `position_z` = 91.3 WHERE `guid` = 42907;
UPDATE `gameobject` SET `position_z` = 92.0 WHERE `guid` = 42908;
UPDATE `gameobject` SET `position_z` = 91.9 WHERE `guid` = 42909;
UPDATE `gameobject` SET `position_z` = 91.5 WHERE `guid` = 42910;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
