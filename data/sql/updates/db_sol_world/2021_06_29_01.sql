-- DB update 2021_06_29_00 -> 2021_06_29_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_29_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_29_00 2021_06_29_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624947898066103833'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624947898066103833');

UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Mennet Carkad at the Rogues'' Quarter in the Undercity.' WHERE `ID` IN (1886,1899,14420,14421);
UPDATE `quest_template_locale` SET `CompletedText` = 'Kehrt zu Mennet Carkad ins Schurkenviertel von Unterstadt zurück.' WHERE `ID` IN (1886,1899,14420,14421) AND `locale` = 'deDE';

UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Aleric Hawkins at the Royal Quarter in the Undercity.' WHERE `ID` = 14418;
UPDATE `quest_template_locale` SET `CompletedText` = 'Kehrt zu Aleric Hawkins im Königsviertel von Unterstadt zurück.' WHERE `ID` = 14418 AND `locale` = 'deDE';

UPDATE `quest_template` SET `QuestCompletionLog` = 'Return to Andron Gant at the Apothecarium in the Undercity.' WHERE `ID` = 14419;
UPDATE `quest_template_locale` SET `CompletedText` = 'Kehrt zu Andron Gant ins Apothekarium von Unterstadt zurück.' WHERE `ID` = 14419 AND `locale` = 'deDE';

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
