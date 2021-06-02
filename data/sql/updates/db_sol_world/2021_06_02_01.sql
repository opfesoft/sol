-- DB update 2021_06_02_00 -> 2021_06_02_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_02_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_02_00 2021_06_02_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1622651021277746598'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1622651021277746598');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (45367,45370);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
(45367,45368,0,'Orb of Translocation'),
(45370,45371,0,'Orb of Translocation');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (45371,45368);

DELETE FROM `spell_target_position` WHERE `ID` IN (45368,45371);
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`, `VerifiedBuild`)
VALUES
(45368,0,530,12783.5,-6880.73,23.641,2.20281,0),
(45371,0,530,12790.4,-6890.16,31.7537,5.30904,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
