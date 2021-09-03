-- DB update 2021_09_02_03 -> 2021_09_03_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_02_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_02_03 2021_09_03_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630658332274128744'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630658332274128744');

-- Remove wrong translation
DELETE FROM `npc_text_locale` WHERE `ID` = 10106 AND `Locale` = 'zhCN';

-- Overwrite broadcast text with the correct NPC text
DELETE FROM `broadcast_text` WHERE `ID` = 18360;
INSERT INTO `broadcast_text` (`ID`, `Language`, `MaleText`, `FemaleText`, `EmoteID0`, `EmoteID1`, `EmoteID2`, `EmoteDelay0`, `EmoteDelay1`, `EmoteDelay2`, `SoundId`, `Unk1`, `Unk2`, `VerifiedBuild`)
VALUES
(18360,7,'I don''t know what''s possessed you to look for a shaman... but I have seen someone who matches the profile. There''s a woman who calls herself a Farseer on the shore in the Valley of Heroes.','I don''t know what''s possessed you to look for a shaman... but I have seen someone who matches the profile. There''s a woman who calls herself a Farseer on the shore in the Valley of Heroes.',0,0,0,0,0,0,0,0,1,0);

DELETE FROM `broadcast_text_locale` WHERE `ID` = 18360;
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `MaleText`, `FemaleText`, `VerifiedBuild`)
VALUES
(18360,'deDE','Ich weiß nicht, was in Euch gefahren ist, einen Schamanen zu suchen... aber ich habe jemanden gesehen, der Euch weiterhelfen könnte. Am Ufer im Tal der Helden gibt es eine Frau, die sich Weissagerin nennt','Ich weiß nicht, was in Euch gefahren ist, einen Schamanen zu suchen... aber ich habe jemanden gesehen, der Euch weiterhelfen könnte. Am Ufer im Tal der Helden gibt es eine Frau, die sich Weissagerin nennt.',0),
(18360,'frFR','Je ne sais pas ce qui vous prend de réclamer un chaman... mais j''ai vu quelqu''un qui correspond au profil. Il y a une femme qui se fait appeler long-voyante sur la rive, dans la vallée des Héros.','Je ne sais pas ce qui vous prend de réclamer un chaman... mais j''ai vu quelqu''un qui correspond au profil. Il y a une femme qui se fait appeler long-voyante sur la rive, dans la vallée des Héros.',0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
