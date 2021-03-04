-- DB update 2021_03_04_00 -> 2021_03_04_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_04_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_04_00 2021_03_04_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1614897953174375683'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1614897953174375683');

-- Highlord Darion Mograine: Prevent event from triggering multiple times (used for Tirion's script)
UPDATE `smart_scripts` SET `event_flags` = 257 WHERE `entryorguid` = 32312 AND `source_type` = 0 AND `id` = 2;

-- Disguised Crusaders: Delete obsolete spawns (handled via Tirion's script)
DELETE FROM `creature` WHERE `id` = 32241;

-- Thassarian: Add missing broadcast IDs
UPDATE `creature_text` SET `BroadcastTextId` = 32710 WHERE `CreatureID` = 32310 AND `GroupID` = 0;
UPDATE `creature_text` SET `BroadcastTextId` = 32722 WHERE `CreatureID` = 32310 AND `GroupID` = 1;

-- Highlord Tirion Fordring: Add small pause to prevent stutter (the script stops the escort at these waypoints)
UPDATE `script_waypoint` SET `waittime` = 1 WHERE `pointid` IN (17,19) AND `entry` = 32239;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
