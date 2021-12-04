-- DB update 2021_12_04_01 -> 2021_12_04_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_04_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_04_01 2021_12_04_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1638655693295850572'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1638655693295850572');

UPDATE `quest_template` SET `AllowableRaces` = 690 WHERE `ID` = 5238;
UPDATE `quest_template` SET `AllowableRaces` = 1101 WHERE `ID` = 5237;
UPDATE `quest_template_addon` SET `PrevQuestID` = 5236, `RewardMailTemplateID` = 101 WHERE `ID` = 5238;
UPDATE `quest_template_addon` SET `PrevQuestID` = 5226, `RewardMailTemplateID` = 107 WHERE `ID` = 5237;

DELETE FROM `creature_queststarter` WHERE `quest` IN (5238,5237);
INSERT INTO `creature_queststarter` (`id`, `quest`)
VALUES
(10837,5238),
(10838,5237);

DELETE FROM `creature_questender` WHERE `quest` IN (5238,5237);
INSERT INTO `creature_questender` (`id`, `quest`)
VALUES
(10837,5238),
(10838,5237);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
