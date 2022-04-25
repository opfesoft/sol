-- DB update 2022_04_25_00 -> 2022_04_26_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_25_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_25_00 2022_04_26_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1650924166582354847'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1650924166582354847');

UPDATE `creature_template` SET `unit_flags` = 768 WHERE `entry` = 17542;
UPDATE `creature_template` SET `speed_walk` = 2/3 WHERE `entry` IN (17320,17321);

DELETE FROM `creature_text` WHERE `CreatureId` = 17542;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17542,0,0,'%s stares at you in sheer wonderment.',16,0,100,0,0,0,14109,0,'Young Furbolg Shaman'),
(17542,1,0,'I run now!',12,0,100,0,0,0,14110,0,'Young Furbolg Shaman');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17542;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1754200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17542,0,0,0,8,0,100,1,8593,0,0,0,0,80,1754200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On Spellhit ''Symbol of Life'' - Call Timed Action List (No Repeat)'),
(17542,0,1,0,58,0,100,0,0,17542,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On WP Path Ended - Force Despawn'),

(1754200,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On Script - Set Active On'),
(1754200,9,1,0,0,0,100,0,0,0,0,0,0,28,29266,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On Script - Remove Aura ''Permanent Feign Death'''),
(1754200,9,2,0,0,0,100,0,0,0,0,0,0,11,25155,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On Script - Cast ''Quest - Self Healing from resurrect'''),
(1754200,9,3,0,0,0,100,0,0,0,0,0,0,33,17542,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On Script - Quest Credit ''Redemption'''),
(1754200,9,4,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On Script - Set Orientation Invoker'),
(1754200,9,5,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On Script - Say Line 0'),
(1754200,9,6,0,0,0,100,0,6000,6000,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On Script - Say Line 1'),
(1754200,9,7,0,0,0,100,0,0,0,0,0,0,53,1,17542,0,0,0,0,1,0,0,0,0,0,0,0,0,'Young Furbolg Shaman - On Script - Start WP Movement');

DELETE FROM `waypoints` WHERE `entry` = 17542;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(17542,1,-2444.69,-12207.2,32.8721,'Young Furbolg Shaman'),
(17542,2,-2443.95,-12213.9,32.2123,NULL),
(17542,3,-2443.19,-12220.9,31.8721,NULL),
(17542,4,-2439.46,-12230.3,31.2457,NULL),
(17542,5,-2435.32,-12240.7,32.0348,NULL),
(17542,6,-2433.85,-12246.6,31.2966,NULL),
(17542,7,-2432.01,-12253.9,29.6504,NULL),
(17542,8,-2432.19,-12262.9,28.1623,NULL),
(17542,9,-2433.08,-12270.7,27.676,NULL),
(17542,10,-2423.95,-12278.5,27.7299,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
