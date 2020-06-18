-- DB update 2020_06_17_00 -> 2020_06_18_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_17_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_17_00 2020_06_18_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592461197828017990'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592461197828017990');

-- Oracle Blood, Tainted Crystal: Drop chance 100%
UPDATE `creature_loot_template` SET `Chance` = 100 WHERE `Item` IN (39265,39266);

-- Crystal of the Frozen Grip, Crystal of the Violent Storm, Crystal of Unstable Energy: Disable turning
UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` | 32768 WHERE `entry` IN (29125,29126,29127);

-- Crystal of the Frozen Grip, Crystal of the Violent Storm, Crystal of Unstable Energy SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (29125,29126,29127);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (29125,29126,29127) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(29125,0,0,1,11,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of the Frozen Grip - On Respawn - Stop Following'),
(29125,0,1,2,61,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of the Frozen Grip - Linked - Stop Auto Attack'),
(29125,0,2,3,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of the Frozen Grip - Linked - Stop Combat Movement'),
(29125,0,3,0,61,0,100,0,0,0,0,0,0,11,53219,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of the Frozen Grip - Linked - Cast ''Frozen Grip'''),

(29126,0,0,1,11,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of the Violent Storm - On Respawn - Stop Following'),
(29126,0,1,2,61,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of the Violent Storm - Linked - Stop Auto Attack'),
(29126,0,2,3,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of the Violent Storm - Linked - Stop Combat Movement'),
(29126,0,3,0,61,0,100,0,0,0,0,0,0,11,53229,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of the Violent Storm - Linked - Cast ''Violent Storm'''),

(29127,0,0,1,11,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of Unstable Energy - On Respawn - Stop Following'),
(29127,0,1,2,61,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of Unstable Energy - Linked - Stop Auto Attack'),
(29127,0,2,0,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal of Unstable Energy - Linked - Stop Combat Movement'),
(29127,0,3,0,0,0,100,0,2000,2000,2000,2000,0,11,53235,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crystal of Unstable Energy - IC - Cast ''Unstable Energy''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
