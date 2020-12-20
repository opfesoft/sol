-- DB update 2020_12_19_02 -> 2020_12_20_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_19_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_19_02 2020_12_20_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608503694599417742'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608503694599417742');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (742,743,744,766);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (742,743,744,766) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(742,0,0,0,0,0,100,0,1700,1900,5600,6100,0,11,6306,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Green Wyrmkin - In Combat - Cast ''Acid Splash'''),

(743,0,0,0,4,0,100,0,0,0,0,0,0,11,7966,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmkin Dreamwalker - On Aggro - Cast ''Thorns Aura'''),
(743,0,1,0,2,0,100,1,20,40,0,0,0,11,12160,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wyrmkin Dreamwalker - Between 20-40% Health - Cast ''Rejuvenation'' (No Repeat)'),
(743,0,2,0,2,0,100,1,0,10,0,0,0,11,15970,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wyrmkin Dreamwalker - Between 0-10% Health - Cast ''Sleep'' (No Repeat)'),

(744,0,0,0,0,0,100,0,2500,2500,8500,8500,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Green Scalebane - In Combat - Cast ''Cleave'''),

(766,0,0,0,2,0,100,0,0,80,2700,3400,0,11,9616,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tangled Horror - Between 0-80% Health - Cast ''Wild Regeneration''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
