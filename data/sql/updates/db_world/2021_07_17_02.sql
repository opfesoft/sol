-- DB update 2021_07_17_01 -> 2021_07_17_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_07_17_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_07_17_01 2021_07_17_02 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1626123639599949300'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1626123639599949300');

UPDATE `quest_offer_reward` SET `RewardText` = 'Hm... $N. You are still new to your path, but I sense the possibility for greatness in you.$B$BYou were born with gifts, $N. See that they do not go to waste.' WHERE `ID` = 1507;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
