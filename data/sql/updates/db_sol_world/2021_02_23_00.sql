-- DB update 2021_02_22_01 -> 2021_02_23_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_22_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_22_01 2021_02_23_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1614062357976981468'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1614062357976981468');

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 29457;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (28274,29457) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2827400 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28274,0,0,1,25,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Sprayer - On Reset - Set React State ''Passive'''),
(28274,0,1,0,61,0,100,0,0,0,0,0,0,60,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Sprayer - Linked - Set Fly On'),
(28274,0,2,3,8,0,100,1,51173,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Plague Sprayer - On Spell Hit ''A Tangled Skein: Encasing Webs - Effect'' - Store Target'),
(28274,0,3,0,61,0,100,0,0,0,0,0,0,80,2827400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Sprayer - Linked - Call Timed Action List'),

(2827400,9,0,0,0,0,100,0,0,0,0,0,0,75,51168,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Sprayer - On Script - Add Aura ''Encasing Webs'''),
(2827400,9,1,0,0,0,100,0,0,0,0,0,0,210,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Sprayer - On Script - Fall'),
(2827400,9,2,0,0,0,100,0,2000,2000,0,0,0,11,53236,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Sprayer - On Script - Cast ''Plague Sprayer: Huge Explosion'''),
(2827400,9,3,0,0,0,100,0,2000,2000,0,0,0,33,28289,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Plague Sprayer - On Script - Quest Credit ''A Tangled Skein'''),
(2827400,9,4,0,0,0,100,0,0,0,0,0,0,50,190539,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Sprayer - On Script - Summon ''Broken Plague Sprayer'''),
(2827400,9,5,0,0,0,100,0,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Sprayer - On Script - Set Visibility Off'),
(2827400,9,6,0,0,0,100,0,10000,10000,0,0,0,41,0,0,0,0,0,0,20,190539,10,0,0,0,0,0,0,'Plague Sprayer - On Script - Delete GO ''Broken Plague Sprayer'''),
(2827400,9,7,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Sprayer - On Script - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
