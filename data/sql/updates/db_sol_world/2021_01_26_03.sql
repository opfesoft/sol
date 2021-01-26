-- DB update 2021_01_26_02 -> 2021_01_26_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_26_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_26_02 2021_01_26_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1611670389237275542'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1611670389237275542');

UPDATE `creature` SET `position_x` = 1544.11, `position_y` = -27.754, `position_z` = 420.967, `orientation` = 3.01593, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 136610;
UPDATE `creature` SET `position_x` = 1551.16, `position_y` = -31.9396, `position_z` = 420.967, `orientation` = 4.62208 WHERE `guid` = 136603;
UPDATE `creature` SET `position_x` = 1550.44, `position_y` = -37.141, `position_z` = 420.967, `orientation` = 1.66897 WHERE `guid` = 136557;

UPDATE `creature_template_addon` SET `bytes2` = 1 WHERE `entry` IN (34198,34236);

DELETE FROM `creature_equip_template` WHERE `CreatureID` = 34236;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`)
VALUES
(34236,1,39750,0,0,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
