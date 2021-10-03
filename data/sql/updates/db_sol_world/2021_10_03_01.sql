-- DB update 2021_10_03_00 -> 2021_10_03_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_03_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_03_00 2021_10_03_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633262267387109360'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633262267387109360');

DELETE FROM `gameobject` WHERE `guid` = 3008985;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3008985,144069,0,0,0,1,1,-10999,-3484.47,103.122,2.52228,0,0,0,0,-1,100,1,0); -- Grimshade's Vision

DELETE FROM `creature_text` WHERE `CreatureId` = 8022;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(8022,0,0,'Make no sound during the ritual.  One misstep could spell our doom...',12,0,100,0,0,0,4126,0,'Thadius Grimshade'),
(8022,1,0,'Now, watch...',12,0,100,0,0,0,4127,0,'Thadius Grimshade'),
(8022,2,0,'There.  It is done.',12,0,100,0,0,0,4128,0,'Thadius Grimshade');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8022;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8022;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 802200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8022,0,0,0,19,0,100,0,2992,0,0,0,0,80,802200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thadius Grimshade - On Quest ''The Divination'' Accepted - Call Timed Action List'),

(802200,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thadius Grimshade - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(802200,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thadius Grimshade - On Script - Say Line 0'),
(802200,9,2,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thadius Grimshade - On Script - Say Line 1'),
(802200,9,3,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,14,3008985,144069,0,0,0,0,0,0,'Thadius Grimshade - On Script - Respawn GO (Grimshade''s Vision)'),
(802200,9,4,0,0,0,100,0,10000,10000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thadius Grimshade - On Script - Say Line 2'),
(802200,9,5,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thadius Grimshade - On Script - Add ''GOSSIP_OPTION_QUESTGIVER''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
