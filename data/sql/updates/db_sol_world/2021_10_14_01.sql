-- DB update 2021_10_14_00 -> 2021_10_14_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_14_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_14_00 2021_10_14_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634219414279731698'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634219414279731698');

 -- Alliance / Argent Officer Pureheart (old: Argent Quartermaster Lightspark)
UPDATE `creature_queststarter` SET `id` = 10840 WHERE `id` = 10857 AND `quest` = 5405;
UPDATE `creature_questender` SET `id` = 10840 WHERE `id` = 10857 AND `quest` = 5405;

-- Neutral / Duke Nicholas Zverenhoff (old: Argent Officer Pureheart)
UPDATE `creature_queststarter` SET `id` = 11039 WHERE `id` = 10840 AND `quest` = 5401;
UPDATE `creature_questender` SET `id` = 11039 WHERE `id` = 10840 AND `quest` = 5401;

UPDATE `quest_template` SET `AllowableRaces` = 690 WHERE `ID` = 5503;  -- Horde / Argent Officer Garush
UPDATE `quest_template` SET `AllowableRaces` = 1101 WHERE `ID` = 5405; -- Alliance / Argent Officer Pureheart

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
