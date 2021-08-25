-- DB update 2021_08_25_01 -> 2021_08_25_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_25_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_25_01 2021_08_25_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629924039334152539'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629924039334152539');

UPDATE `npc_text` SET `text0_0` = '$n, I''ve come to find out how rampant the effects of Fel Moss are throughout Darkshore. The remaining corruption in Teldrassil and our surrounding lands really concerns the druids of the Cenarion Circle, and all Night elves.$B$BIt is my goal to find out why this is still happening and put it to an end.' WHERE `ID` = 3334;
UPDATE `broadcast_text` SET `MaleText` = '$n, I''ve come to find out how rampant the effects of Fel Moss are throughout Darkshore. The remaining corruption in Teldrassil and our surrounding lands really concerns the druids of the Cenarion Circle, and all Night elves.$B$BIt is my goal to find out why this is still happening and put it to an end.' WHERE `ID` = 5608;

DELETE FROM `gossip_menu` WHERE `MenuID` = 3693;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(3693,3334);

UPDATE `creature_template` SET `gossip_menu_id` = 3693 WHERE `entry` = 3693;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
