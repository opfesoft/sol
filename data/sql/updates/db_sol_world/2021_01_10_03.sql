-- DB update 2021_01_10_02 -> 2021_01_10_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_10_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_10_02 2021_01_10_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610279781593831130'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610279781593831130');

UPDATE `creature_equip_template` SET `ItemID3` = 5870 WHERE `CreatureID` = 2779;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (5683,1400,1020,1039,1417,1131,6124,2773,2559,2582,2320,2351,2779,2578);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (5683,1400,1020,1039,1417,1131,6124,2773,2559,2582,2320,14223,2351,2779,2578) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5683,0,0,0,0,0,100,0,2700,3400,8900,9600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Comar Villard - IC - Cast ''Thrash'''),
(5683,0,1,0,2,0,100,1,0,30,0,0,0,11,12540,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Comar Villard - Between 0-30% Health - Cast ''Gouge'' (No Repeat)'),

(1400,0,0,0,4,0,100,1,0,0,0,0,0,11,50433,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wetlands Crocolisk - On Aggro - Cast ''Bad Attitude'' (No Repeat)'),

(1020,0,0,0,0,0,100,0,2300,3000,8400,9100,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mottled Raptor - IC - Cast ''Claw'''),

(1039,0,0,0,0,0,100,0,3800,6900,13800,15700,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fen Dweller - IC - Cast ''Thrash'''),

(1417,0,0,0,4,0,100,1,0,0,0,0,0,11,50433,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Wetlands Crocolisk - On Aggro - Cast ''Bad Attitude'' (No Repeat)'),

(1131,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Winter Wolf - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)'),

(6124,0,0,0,0,0,100,0,3700,5200,10100,12300,0,11,58461,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Captain Beld - IC - Cast ''Sunder Armor'''),

(2773,0,0,0,0,0,100,0,2300,2900,8600,9700,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Or''Kalar - IC - Cast ''Thrash'''),

(2559,0,0,0,0,0,100,0,2300,3000,8400,9100,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Highland Strider - IC - Cast ''Claw'''),

(2582,0,0,0,0,0,100,0,2700,3600,9800,12400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dabyrie Laborer - IC - Cast ''Thrash'''),

(2320,0,0,0,0,0,100,0,2500,3000,6500,7000,0,11,18797,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nagaz - IC - Cast ''Flurry Axe'''),

(14223,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cranky Benj - On Respawn - Set Active On'),
(14223,0,1,0,2,0,100,1,0,40,0,0,0,11,26064,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cranky Benj - Between 0-40% Health - Cast ''Shell Shield'' (No Repeat)'),

(2351,0,0,0,0,0,100,0,2200,2600,7400,8100,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gray Bear - IC - Cast ''Swipe'''),

(2779,0,0,0,0,0,100,1,0,0,0,0,0,11,43107,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Prince Nazjak - IC - Cast ''Spear Throw'' (No Repeat)'),
(2779,0,1,0,0,0,100,0,3800,5400,10900,13100,0,11,17687,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Nazjak - IC - Cast ''Flurry'''),

(2578,0,0,0,0,0,100,0,2300,3000,8400,9100,0,11,51772,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Young Mesa Buzzard - IC - Cast ''Claw''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
