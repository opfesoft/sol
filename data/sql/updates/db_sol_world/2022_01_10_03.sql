-- DB update 2022_01_10_02 -> 2022_01_10_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_10_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_10_02 2022_01_10_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641839531167767401'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641839531167767401');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 11882;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11882,0,0,1,1,0,100,1,3000,5000,0,0,0,11,13236,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight Stonecaller - OOC - Cast ''Nature Channeling'' (No Repeat)'),
(11882,0,1,0,61,0,100,0,0,0,0,0,0,41,0,329,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight Stonecaller - Linked - Force Despawn Minion ''Earth Elemental'''),
(11882,0,2,0,0,0,100,0,0,0,3400,4800,0,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Twilight Stonecaller - IC - Cast ''Fireball'''),
(11882,0,3,0,4,0,100,0,0,0,0,0,0,11,19704,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight Stonecaller - On Aggro - Cast ''Summon Earth Elemental'''),
(11882,0,4,0,9,0,100,0,0,5,12000,17000,0,11,11020,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Twilight Stonecaller - Within 0-5 Range - Cast ''Petrify''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
