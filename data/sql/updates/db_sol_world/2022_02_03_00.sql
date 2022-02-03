-- DB update 2022_02_02_04 -> 2022_02_03_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_02_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_02_04 2022_02_03_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1643870582290348430'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1643870582290348430');

DELETE FROM `quest_poi` WHERE `QuestID` IN (6661,6662);
INSERT INTO `quest_poi` (`QuestID`, `id`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `VerifiedBuild`)
VALUES
(6661,0,0,0,341,0,0,1,0),
(6661,1,-1,0,341,0,0,1,0),

(6662,0,-1,0,301,0,0,1,0);

DELETE FROM `quest_poi_points` WHERE `QuestID` IN (6661,6662);
INSERT INTO `quest_poi_points` (`QuestID`, `Idx1`, `Idx2`, `X`, `Y`, `VerifiedBuild`)
VALUES
(6661,0,0,-4838.95,-1318.46,0),
(6661,1,0,-4838.95,-1318.46,0),

(6662,0,0,-8364.57,535.981,0);

UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Monty at the Deeprun Tram' WHERE `ID` = 6661;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
