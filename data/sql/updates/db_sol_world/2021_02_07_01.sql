-- DB update 2021_02_07_00 -> 2021_02_07_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_07_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_07_00 2021_02_07_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1612722891242413283'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1612722891242413283');

DELETE FROM `gameobject_addon` WHERE `guid` IN (5425,5398,5405,5422,5396,5382,5203,5352,5193,5195,5205,5141);
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`)
VALUES
(5425,0,0),
(5398,0,0),
(5405,0,0),
(5422,0,0),
(5396,0,0),
(5382,0,0),
(5203,0,0),
(5352,0,0),
(5193,0,0),
(5195,0,0),
(5205,0,0),
(5141,0,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
