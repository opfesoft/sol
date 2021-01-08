-- DB update 2021_01_08_05 -> 2021_01_08_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_08_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_08_05 2021_01_08_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610114374636565396'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610114374636565396');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (1225,1186,1193,1189,1693,14268,1188,1224);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1225,1186,1193,1189,1693,14266,14268,1188,1224) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1225,0,0,0,0,0,100,0,2200,3600,8400,9700,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ol'' Sooty - IC - Cast ''Swipe'''),

(1186,0,0,0,0,0,100,0,2700,5100,9900,12600,0,11,15793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Elder Black Bear - IC - Cast ''Maul'''),

(1193,0,0,0,2,0,100,1,0,30,0,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Loch Frenzy - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),

(1189,0,0,0,0,0,100,0,2700,5100,9900,12600,0,11,15793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Black Bear Patriarch - IC - Cast ''Maul'''),

(1693,0,0,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Loch Crocolisk - IC - Cast ''Thrash'''),

(14266,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shanda the Spinner - On Respawn - Set Active On'),
(14266,0,1,0,0,0,100,1,0,0,0,0,0,11,12023,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Shanda the Spinner - IC - Cast ''Web'' (No Repeat)'),
(14266,0,2,0,0,0,100,0,2700,3400,32700,33400,0,11,13298,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Shanda the Spinner - IC - Cast ''Poison'''),

(14268,0,0,0,25,0,100,0,0,0,0,0,0,11,4317,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Condar - On Reset - Cast ''Eye Peck'''),

(1188,0,0,0,0,0,100,0,2700,5100,9900,12600,0,11,15793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grizzled Black Bear - IC - Cast ''Maul'''),

(1224,0,0,0,0,0,100,0,2800,4400,9200,9900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Threshadon - IC - Cast ''Thrash''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
