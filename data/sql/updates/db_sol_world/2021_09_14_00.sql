-- DB update 2021_09_13_02 -> 2021_09_14_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_13_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_13_02 2021_09_14_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631570779200015871'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631570779200015871');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 20803;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` > 9 AND `entryorguid` = 21319;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20803,0,0,1,0,0,100,0,10000,15000,15000,20000,0,11,35491,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overmaster Grindgarr - IC - Cast ''Furious Rage'''),
(20803,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overmaster Grindgarr - Linked - Set Phase 1'),
(20803,0,2,3,23,1,100,0,35491,0,1000,1000,0,11,35492,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overmaster Grindgarr - On Has No Aura ''Furious Rage'' - Cast ''Exhaustion'' (Phase 1)'),
(20803,0,3,0,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Overmaster Grindgarr - Linked - Set Phase 0'),

(21319,0,10,11,0,0,100,0,10000,15000,15000,20000,0,11,35491,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gor Grimgut - IC - Cast ''Furious Rage'''),
(21319,0,11,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gor Grimgut - Linked - Set Phase 1'),
(21319,0,12,13,23,1,100,0,35491,0,1000,1000,0,11,35492,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gor Grimgut - On Has No Aura ''Furious Rage'' - Cast ''Exhaustion'' (Phase 1)'),
(21319,0,13,0,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gor Grimgut - Linked - Set Phase 0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
