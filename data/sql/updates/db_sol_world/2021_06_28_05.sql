-- DB update 2021_06_28_04 -> 2021_06_28_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_28_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_28_04 2021_06_28_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624913321715001988'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624913321715001988');

-- Small/Rich Thorium Vein: Increase spawntimesecs (old value: 180)
UPDATE `gameobject` SET `spawntimesecs` = 2700 WHERE `guid` IN (324,64907,120186);

-- Mithril/Truesilver Deposit: Increase spawntimesecs (old value: 180)
UPDATE `gameobject` SET `spawntimesecs` = 1800 WHERE `guid` IN (65299,65300,65301,65302,65303,65304,65305,65306,65307,65375);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
