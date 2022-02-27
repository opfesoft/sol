-- DB update 2022_02_27_01 -> 2022_02_27_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_27_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_27_01 2022_02_27_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645977346319111206'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645977346319111206');

UPDATE `quest_template_addon` SET `PrevQuestID` = 7648 WHERE `ID` = 7643;
UPDATE `quest_template_addon` SET `PrevQuestID` = 1947 WHERE `ID` = 1948;
UPDATE `quest_template_addon` SET `PrevQuestID` = 2281 WHERE `ID` = 2282;
UPDATE `quest_template_addon` SET `NextQuestID` = 4493 WHERE `ID` IN (162,4267);
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 4493;
UPDATE `quest_template_addon` SET `NextQuestID` = 6761 WHERE `ID` IN (1015,1019,1047);
UPDATE `quest_template_addon` SET `NextQuestID` = 1123 WHERE `ID` IN (1000,1004,1018);
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 5742;
UPDATE `quest_template_addon` SET `NextQuestID` = 5742 WHERE `ExclusiveGroup` = -5542;
UPDATE `quest_template_addon` SET `PrevQuestID` = 1363 WHERE `ID` = 1364;
UPDATE `quest_template_addon` SET `ExclusiveGroup` = -2851 WHERE `ID` IN (2851,2852);
UPDATE `quest_template_addon` SET `NextQuestID` = 2851 WHERE `ID` IN (2848,2849);
UPDATE `quest_template_addon` SET `NextQuestID` = 2852 WHERE `ID` = 2850;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 6806;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
