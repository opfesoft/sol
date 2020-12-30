-- DB update 2020_12_29_00 -> 2020_12_30_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_29_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_29_00 2020_12_30_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609317403593093092'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609317403593093092');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (5836,677) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5836,0,0,0,0,0,100,1,2000,2000,0,0,0,11,4078,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Engineer Whirleygig - IC - Cast ''Compact Harvest Reaper'' (No Repeat)'),
(5836,0,1,0,0,0,100,0,6500,6500,10000,10000,0,11,8209,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Engineer Whirleygig - In Combat - Cast ''Explosive Sheep'''),
(5836,0,2,0,17,0,100,0,2676,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Engineer Whirleygig - On Summoned Unit - Store Target'),
(5836,0,3,0,7,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Engineer Whirleygig - On Evade - Force Despawn (Stored Target)'),

(677,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,34,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Tinkerer - OOC - Cast ''Frost Armor'''),
(677,0,1,0,0,0,100,0,3000,4000,5000,6000,0,11,20823,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Tinkerer - In Combat CMC - Cast ''Fireball'''),
(677,0,2,0,0,0,100,1,8000,8000,0,0,0,11,4078,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Tinkerer - IC - Cast ''Compact Harvest Reaper'' (No Repeat)'),
(677,0,3,0,17,0,100,0,2676,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Venture Co. Tinkerer - On Summoned Unit - Store Target'),
(677,0,4,0,7,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Venture Co. Tinkerer - On Evade - Force Despawn (Stored Target)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
