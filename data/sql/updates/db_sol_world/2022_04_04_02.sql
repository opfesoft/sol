-- DB update 2022_04_04_01 -> 2022_04_04_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_04_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_04_01 2022_04_04_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1649108334792687759'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1649108334792687759');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3265;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3265,0,0,0,9,0,100,0,5,30,2300,3900,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Razormane Hunter - Within 5-30 Range - Cast ''Shoot'''),
(3265,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razormane Hunter - Between 0-15% Health - Flee For Assist (No Repeat)'),
(3265,0,2,0,25,0,100,0,0,0,0,0,0,11,6479,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razormane Hunter - On Reset - Cast ''Razormane Wolf'''),
(3265,0,3,0,17,0,100,0,3939,0,0,0,0,240,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Razormane Hunter - On Summoned Unit ''Razormane Wolf'' - Disable Owner Death Despawn (Invoker)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
