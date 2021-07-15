-- DB update 2021_07_15_00 -> 2021_07_15_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_15_00 2021_07_15_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1626383465275536825'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1626383465275536825');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (3375,5849);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3375,0,0,0,0,0,100,0,1000,2000,3000,4000,0,11,6257,64,0,0,0,0,5,0,0,0,0,0,0,0,0,'Bael''dun Foreman - IC CMC - Cast ''Torch Toss'''),

(5849,0,0,0,0,0,80,0,12500,12500,10000,10000,0,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Digger Flameforge - IC - Cast ''Backhand'''),
(5849,0,1,0,0,0,100,0,2000,2000,2000,2000,0,11,7978,64,0,0,0,0,5,0,0,0,0,0,0,0,0,'Digger Flameforge - IC CMC - Cast ''Throw Dynamite''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
