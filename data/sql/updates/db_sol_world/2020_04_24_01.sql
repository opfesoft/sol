-- DB update 2020_04_24_00 -> 2020_04_24_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_04_24_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_04_24_00 2020_04_24_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1587762787056551797'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1587762787056551797');

DELETE FROM `gossip_menu` WHERE `MenuID` = 55002 AND `TextID` = 3550;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(55002,3550);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 9937 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 993700 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9937,0,0,1,1,0,100,0,2000,2000,0,0,0,29,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Common Kitten - OOC - Stop Following'),
(9937,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Common Kitten - Linked - Say Line 0'),
(9937,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,4582.16,-216.249,300.239,0,'Common Kitten - Linked - Move To Pos 1'),
(9937,0,3,0,34,0,100,0,0,1,0,0,0,80,993700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Common Kitten - On WP 1 Reached - Call Action List'),
(9937,0,4,5,62,0,100,0,55002,1,0,0,0,26,4506,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Common Kitten - On Gossip Select - Award Quest ''Corrupted Sabers'''),
(9937,0,5,6,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Common Kitten - Linked - Close Gossip'),
(9937,0,6,0,61,0,100,0,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Common Kitten - Linked - Despawn'),

(993700,9,0,0,0,0,100,0,2000,2000,0,0,0,36,9936,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Common Kitten - On Script - Update Template To ''Corrupted Kitten'''),
(993700,9,1,0,0,0,100,0,4000,4000,0,0,0,11,16510,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Common Kitten - On Script - Cast ''Corrupted Saber Visual (DND)'''),
(993700,9,2,0,0,0,100,0,0,0,0,0,0,3,10042,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Common Kitten - On Script - Morph To Entry ''Corrupted Kitten'''),
(993700,9,3,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Common Kitten - On Script - Say Line 1'),
(993700,9,4,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Common Kitten - On Script - Follow Summoner');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
