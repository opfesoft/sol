-- DB update 2022_02_09_00 -> 2022_02_10_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_09_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_09_00 2022_02_10_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644530494494716299'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644530494494716299');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (10601,10602);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10601,0,0,0,0,0,100,2,3000,5000,3000,6000,0,11,16856,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Urok Enforcer - IC - Cast ''Mortal Strike'' (Normal Dungeon)'),
(10601,0,1,0,0,0,100,2,0,1000,6000,7000,0,11,11084,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Urok Enforcer - IC - Cast ''Shock'' (Normal Dungeon)'),
(10601,0,2,0,0,0,100,2,8000,8000,12000,17000,0,11,14516,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Urok Enforcer - IC - Cast ''Strike'' (Normal Dungeon)'),
(10601,0,3,4,54,0,100,0,0,0,0,0,0,11,64195,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Urok Enforcer - On Just Summoned - Cast ''Simple Teleport'''),
(10601,0,4,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Urok Enforcer - Linked - Attack Closest Player'),

(10602,0,0,0,9,0,100,2,0,40,3400,4700,1,11,15979,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Urok Ogre Magus - Within 0-40 Range - Cast ''Arcane Bolt'' (Normal Dungeon)'),
(10602,0,1,2,2,0,100,3,0,15,0,0,0,25,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Urok Ogre Magus - Between 0-15% Health - Flee For Assist (No Repeat) (Normal Dungeon)'),
(10602,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Urok Ogre Magus - Linked - Say Line 0'),
(10602,0,3,0,16,0,100,2,6742,30,10000,15000,0,11,6742,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Urok Ogre Magus - On Friendly Unit Missing Buff ''Bloodlust'' - Cast ''Bloodlust'' (Normal Dungeon)'),
(10602,0,4,0,0,0,100,2,3000,4000,5000,8000,0,11,13747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Urok Ogre Magus - IC - Cast ''Slow'' (Normal Dungeon)'),
(10602,0,5,6,54,0,100,0,0,0,0,0,0,11,64195,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Urok Ogre Magus - On Just Summoned - Cast ''Simple Teleport'''),
(10602,0,6,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Urok Ogre Magus - Linked - Attack Closest Player');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
