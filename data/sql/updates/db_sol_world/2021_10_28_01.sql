-- DB update 2021_10_28_00 -> 2021_10_28_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_28_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_28_00 2021_10_28_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635456472385934775'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635456472385934775');

UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 10 WHERE `creature_id` IN (15168,15333,15343,15344,15387,15461,15462,15202,15211,15212,15307);
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 30 WHERE `creature_id` = 15308;
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1` = 100 WHERE `creature_id` IN (15204,15205,15305);
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue2` = 300 WHERE `creature_id` IN (15340,15341,15348,15369,15370);
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue2` = 600 WHERE `creature_id` = 15339;
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue2` = 10 WHERE `creature_id` IN (15229,15230,15235,15236,15240,15249,15262,15264,15277);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
