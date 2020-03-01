-- DB update 2019_02_04_01 -> 2019_02_06_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2019_02_04_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2019_02_04_01 2019_02_06_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1549334128470728600'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO version_db_world (`sql_rev`) VALUES ('1549334128470728600');

SET @GUID := 200150;
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID+0 AND @GUID+2;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`, `curmana`, `MovementType`) VALUES
(@GUID+0,23090,1,1,1,0,1,1708.89,-4407.32,40.1085,2.35614,300,0,104790,0,2),
(@GUID+1,23090,1,1,1,0,1,1685.87,-4437.94,36.0057,2.50928,300,0,104790,0,2),
(@GUID+2,23090,1,1,1,0,1,1651.35,-4448.69,38.0034,1.59431,300,0,104790,0,2);

DELETE FROM `creature_addon` WHERE `guid` BETWEEN @GUID+0 AND @GUID+2;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@GUID+0,(@GUID+0)*10,0,0,1,0,'18950 32199'),
(@GUID+1,(@GUID+1)*10,0,0,1,0,'18950 32199'),
(@GUID+2,(@GUID+2)*10,0,0,1,0,'18950 32199');

DELETE FROM `waypoint_data` WHERE `id` BETWEEN (@GUID+0)*10 AND (@GUID+2)*10;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `move_type`, `action_chance`) VALUES
((@GUID+0)*10,1,1708.89,-4407.32,40.1085,0,100),
((@GUID+0)*10,2,1699.21,-4398.37,40.5289,0,100),
((@GUID+0)*10,3,1694.41,-4397.78,40.6138,0,100),
((@GUID+0)*10,4,1682.94,-4404.49,40.6853,0,100),
((@GUID+0)*10,5,1680.72,-4409.19,40.8754,0,100),
((@GUID+0)*10,6,1682.71,-4422.11,40.4622,0,100),
((@GUID+0)*10,7,1686.17,-4425.78,40.6093,0,100),
((@GUID+0)*10,8,1698.87,-4427.43,40.7538,0,100),
((@GUID+0)*10,9,1686.17,-4425.78,40.6093,0,100),
((@GUID+0)*10,10,1682.71,-4422.11,40.4622,0,100),
((@GUID+0)*10,11,1680.72,-4409.19,40.8754,0,100),
((@GUID+0)*10,12,1682.94,-4404.49,40.6853,0,100),
((@GUID+0)*10,13,1694.41,-4397.78,40.6138,0,100),
((@GUID+0)*10,14,1699.21,-4398.37,40.5289,0,100),
((@GUID+0)*10,15,1708.89,-4407.32,40.1085,0,100),
((@GUID+1)*10,1,1685.87,-4437.94,36.0057,0,100),
((@GUID+1)*10,2,1681.13,-4434.01,35.3238,0,100),
((@GUID+1)*10,3,1673.04,-4431.93,34.8667,0,100),
((@GUID+1)*10,4,1665.67,-4435.66,34.8775,0,100),
((@GUID+1)*10,5,1661.73,-4441.26,34.9755,0,100),
((@GUID+1)*10,6,1661.59,-4447.54,35.0587,0,100),
((@GUID+1)*10,7,1661.73,-4441.26,34.9755,0,100),
((@GUID+1)*10,8,1665.67,-4435.66,34.8775,0,100),
((@GUID+1)*10,9,1673.04,-4431.93,34.8667,0,100),
((@GUID+1)*10,10,1681.13,-4434.01,35.3238,0,100),
((@GUID+1)*10,11,1685.87,-4437.94,36.0057,0,100),
((@GUID+2)*10,1,1651.35,-4448.69,38.0034,0,100),
((@GUID+2)*10,2,1651.75,-4437.17,38.0053,0,100),
((@GUID+2)*10,3,1648.66,-4432.08,37.8909,0,100),
((@GUID+2)*10,4,1633.78,-4428.19,38.146,0,100),
((@GUID+2)*10,5,1628.51,-4430.07,38.1318,0,100),
((@GUID+2)*10,6,1620.25,-4441.33,37.8515,0,100),
((@GUID+2)*10,7,1620.04,-4447.66,37.9152,0,100),
((@GUID+2)*10,8,1628.39,-4458.96,38.0537,0,100),
((@GUID+2)*10,9,1620.04,-4447.66,37.9152,0,100),
((@GUID+2)*10,10,1620.25,-4441.33,37.8515,0,100),
((@GUID+2)*10,11,1628.51,-4430.07,38.1318,0,100),
((@GUID+2)*10,12,1633.78,-4428.19,38.146,0,100),
((@GUID+2)*10,13,1648.66,-4432.08,37.8909,0,100),
((@GUID+2)*10,14,1651.75,-4437.17,38.0053,0,100),
((@GUID+2)*10,15,1651.35,-4448.69,38.0034,0,100);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
