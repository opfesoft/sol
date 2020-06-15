-- DB update 2020_06_15_01 -> 2020_06_15_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_15_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_15_01 2020_06_15_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592256353069049630'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592256353069049630');

-- Fix QuestCompletionLog
-- The Star, the Hand and the Heart (736)
-- The Book of Ur (1013)
-- Battle of Hillsbrad (14351)
-- An Unholy Alliance (14352)
UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Keeper Bel''dugur at the Apothecarium in the Undercity.' WHERE `ID` IN (736,1013);
UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Bragor Bloodfist at the Royal Quarter in the Undercity.' WHERE `ID` IN (14351,14352);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
