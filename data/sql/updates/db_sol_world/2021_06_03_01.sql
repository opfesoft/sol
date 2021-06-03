-- DB update 2021_06_03_00 -> 2021_06_03_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_03_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_03_00 2021_06_03_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1622740699246495722'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1622740699246495722');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (45367,45370);
UPDATE `gameobject_template` SET `Data10` = 45368 WHERE `entry` = 187428;
UPDATE `gameobject_template` SET `Data10` = 45371 WHERE `entry` = 187431;

DELETE FROM `spell_target_position` WHERE `ID` IN (45368,45371);
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`, `VerifiedBuild`)
VALUES
(45368,0,530,12780.7,-6876.73,22.7875,5.30244,0),
(45371,0,530,12793.6,-6894.4,30.898,2.20672,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
