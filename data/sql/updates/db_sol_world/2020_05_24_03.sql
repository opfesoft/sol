-- DB update 2020_05_24_02 -> 2020_05_24_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_24_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_24_02 2020_05_24_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1590352331204842105'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1590352331204842105');

-- Nathanos Blightcaller: Fix quest chain:
-- Step 1: "To Kill With Purpose", "Un-Life's Little Annoyances", "The Ranger Lord's Behest"
-- Step 2: "Duskwing, Oh How I Hate Thee...", "The Corpulent One"
-- Step 3: "The Call to Command", "Ramstein" (optional)
-- Step 4: "The Crimson Courier" (Bragor Bloodfist instead of Sylvanas)
-- Step 5: "Nathanos' Ruse"
-- Step 6: "Return to Nathanos"
-- Step 7: "The Scarlet Oracle, Demetria"

DELETE FROM `quest_template_addon` WHERE `ID` IN (6042,6022,6133,6135,6136,6163,6144,14349,14350);
INSERT INTO `quest_template_addon` (`ID`, `MaxLevel`, `AllowableClasses`, `SourceSpellID`, `PrevQuestID`, `NextQuestID`, `ExclusiveGroup`, `RewardMailTemplateID`, `RewardMailDelay`, `RequiredSkillID`, `RequiredSkillPoints`, `RequiredMinRepFaction`, `RequiredMaxRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepValue`, `ProvidedItemCount`, `SpecialFlags`)
VALUES
(6022,0,0,0,0,6136,-6133,0,0,0,0,0,0,0,0,1,0),
(6042,0,0,0,0,6135,-6133,0,0,0,0,0,0,0,0,0,0),
(6133,0,0,0,0,6135,-6133,0,0,0,0,0,0,0,0,0,0),
(6135,0,0,0,0,6144,-6135,0,0,0,0,0,0,0,0,0,0),
(6136,0,0,0,0,6163,-6135,0,0,0,0,0,0,0,0,0,0),
(6144,0,0,0,0,14350,0,0,0,0,0,0,0,0,0,0,0),
(14350,0,0,0,0,6146,0,0,0,0,0,0,0,0,0,0,0);

DELETE FROM `disables` WHERE `sourceType` = 1 AND `entry` IN (14349,6145);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`)
VALUES
(1,6145,0,'','','Deprecated quest'),
(1,14349,0,'','','Deprecated quest');

UPDATE `quest_template` SET `RewardNextQuest` = 14350 WHERE `ID` = 6144;
UPDATE `creature_queststarter` SET `id` = 36273 WHERE `id` = 10181 AND `quest` = 14350;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
