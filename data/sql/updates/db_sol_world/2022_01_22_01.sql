-- DB update 2022_01_22_00 -> 2022_01_22_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_22_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_22_00 2022_01_22_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1642868449806820174'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1642868449806820174');

DELETE FROM `creature_equip_template` WHERE `CreatureID` IN (5239,5234,5236,5240);
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`)
VALUES
(5234,1,1903,2809,0,0),
(5236,1,1907,0,0,0),
(5239,1,5304,0,0,0),
(5240,1,2559,0,0,0);

UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (50276,50240,50266);
UPDATE `creature` SET `position_x` = -5758, `position_y` = 1129, `position_z` = 68.4472, `orientation` = 2.75466, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 50237;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
