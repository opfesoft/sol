-- DB update 2021_12_10_00 -> 2021_12_13_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_10_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_10_00 2021_12_13_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1639433849583256786'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1639433849583256786');

UPDATE `quest_poi` SET `MapID` = 1, `WorldMapAreaId` = 121 WHERE `QuestID` = 7461;
UPDATE `quest_poi_points` SET `X` = -3754, `Y` = 1249 WHERE `QuestID` = 7461;

UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Talvash del Kissel at the Mystic Ward in Ironforge.' WHERE `ID` IN (2199,2204,8355);
UPDATE `quest_template_locale` SET `CompletedText` = 'Kehrt zu Talvash del Kissel im Mystikerviertel von Eisenschmiede zurück.' WHERE `ID` IN (2199,8355) AND `locale` = 'deDE';

UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to the Mound of Dirt in Eastern Plaguelands.' WHERE `ID` = 6024;
UPDATE `quest_template_locale` SET `CompletedText` = 'Kehrt zum Erdhaufen in den Östlichen Pestländern zurück.' WHERE `ID` = 6024 AND `locale` = 'deDE';

UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to the Shen''dralar Ancient at the Court of the Highborne in Dire Maul.' WHERE `ID` = 7461;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
