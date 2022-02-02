-- DB update 2022_02_02_01 -> 2022_02_02_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_02_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_02_01 2022_02_02_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1643804405440867376'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1643804405440867376');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 9217;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9217,0,0,0,0,0,100,2,0,0,2400,3800,0,11,15230,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spirestone Lord Magus - IC - Cast ''Arcane Bolt'' (Normal Dungeon)'),
(9217,0,1,0,0,0,100,2,7000,12000,14000,19000,0,11,13323,1,0,0,0,0,6,0,0,0,0,0,0,0,0,'Spirestone Lord Magus - IC - Cast ''Polymorph'' (Normal Dungeon)'),
(9217,0,2,0,74,0,100,2,0,50,25000,30000,30,11,8365,33,0,0,0,0,7,0,0,0,0,0,0,0,0,'Spirestone Lord Magus - On Friendly Between 0-50% Health - Cast ''Enlarge'' (Normal Dungeon)'),
(9217,0,3,0,74,0,100,2,0,30,30000,35000,30,11,6742,33,0,0,0,0,7,0,0,0,0,0,0,0,0,'Spirestone Lord Magus - On Friendly Between 0-30% Health - Cast ''Bloodlust'' (Normal Dungeon)');

DELETE FROM `creature_id_chance` WHERE `guid` = 43521;
INSERT INTO `creature_id_chance` (`guid`, `id`, `chance`)
VALUES
(43521,9201,70);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
