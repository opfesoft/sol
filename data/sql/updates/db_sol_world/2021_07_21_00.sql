-- DB update 2021_07_20_00 -> 2021_07_21_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_20_00 2021_07_21_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1626818770118437443'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1626818770118437443');

UPDATE `gameobject` SET `position_x` = -9773.77, `position_y` = -1747.93, `position_z` = 53.0246 WHERE `guid` = 1374;
UPDATE `gameobject` SET `position_x` = -9603.99, `position_y` = -1910.21, `position_z` = 61.5482 WHERE `guid` = 1740;
UPDATE `gameobject` SET `position_x` = -9151.08, `position_y` = -2508.94, `position_z` = 117.203 WHERE `guid` = 1537;
UPDATE `gameobject` SET `position_x` = -9485.22, `position_y` = -2329.47, `position_z` = 69.3981 WHERE `guid` = 1497;
UPDATE `gameobject` SET `position_x` = -9160.94, `position_y` = -3029.85, `position_z` = 96.2563 WHERE `guid` = 1456;
UPDATE `gameobject` SET `position_x` = 606.533, `position_y` = -745.792, `position_z` = 175.907 WHERE `guid` = 8988;
UPDATE `gameobject` SET `position_x` = 822.100, `position_y` = -723.680, `position_z` = 194.222 WHERE `guid` = 8990;
UPDATE `gameobject` SET `position_x` = 1109.57, `position_y` = -454.509, `position_z` = 68.9403 WHERE `guid` = 8769;
UPDATE `gameobject` SET `position_x` = -6064.50, `position_y` = -3238.57, `position_z` = 259.058 WHERE `guid` = 11477;
UPDATE `gameobject` SET `position_x` = -1119.61, `position_y` = -2150.05, `position_z` = 81.8622 WHERE `guid` = 983;
UPDATE `gameobject` SET `position_x` = -9200.57, `position_y` = -2441.51, `position_z` = 60.5342 WHERE `guid` = 5236;
UPDATE `gameobject` SET `position_x` = -8999.95, `position_y` = -3221.55, `position_z` = 112.057 WHERE `guid` = 4755;
UPDATE `gameobject` SET `position_x` = -9001.20, `position_y` = -3207.21, `position_z` = 111.948 WHERE `guid` = 5746;
UPDATE `gameobject` SET `position_x` = -9041.66, `position_y` = -3307.45, `position_z` = 107.945 WHERE `guid` = 5199;
UPDATE `gameobject` SET `position_x` = -8923.28, `position_y` = -2651.38, `position_z` = 134.326 WHERE `guid` = 5637;
DELETE FROM `gameobject` WHERE `guid` in (3433,3801,8638,8639,9190,32194,32203,33141,9141,35390,3435,8063,7716,35379,3332,8989,9004,9171,32211,7832,8927,7841,9057,8771,7773,7732,7731,7575,7423,7436,7407,7551,7549,7548,7515,7512,7529,7474,7697,32693,2350,13358,13372,86281,7327,12487);
DELETE FROM `pool_gameobject` where `guid` in (3433,3801,2350);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
