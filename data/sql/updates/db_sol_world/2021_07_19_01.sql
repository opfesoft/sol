-- DB update 2021_07_19_00 -> 2021_07_19_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_19_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_19_00 2021_07_19_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1626688049982124891'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1626688049982124891');

-- Restrict Quest "One Shot. One Kill." to Alliance
UPDATE `quest_template` SET `AllowableRaces` = 1101 WHERE `id` = 5713;

-- Sentinel Aynasha: Ready ranged weapon
DELETE FROM `creature_addon` WHERE `guid` = 38663;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(38663,0,0,0,2,0,0,NULL);

DELETE FROM `creature_summon_groups` WHERE `summonerId` = 11711;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(11711,0,1,11713,4369,-51,86.68,5.6,4,300000),
(11711,0,1,11713,4374,-48,85.2,5.4,4,300000),
(11711,0,2,11713,4369,-51,86.68,5.6,4,300000),
(11711,0,2,11713,4374,-48,85.2,5.4,4,300000),
(11711,0,2,11713,4361,-43,84.86,5.4,4,300000);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (11713,11714);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (11711,11713,11714);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1171100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11711,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Respawn - Set Event Phase Reset Off'),
(11711,0,1,2,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - Linked - Set Event Phase 1'),
(11711,0,2,0,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - Linked - Disable Combat Movement'),
(11711,0,3,4,19,0,100,0,5713,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Quest ''One Shot. One Kill.'' Accepted - Set Event Phase 2'),
(11711,0,4,0,61,0,100,0,0,0,0,0,0,80,1171100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - Linked - Call Timed Action List'),
(11711,0,5,0,9,3,100,0,5,30,2000,3000,1,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sentinel Aynasha - Within 5-30 Range - Cast ''Shoot'' (Phase 1 & 2)'),

(1171100,9,0,0,0,2,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Set Active On (Phase 2)'),
(1171100,9,1,0,0,2,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'' (Phase 2)'),
(1171100,9,2,0,0,2,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Say Line 0 (Phase 2)'),
(1171100,9,3,0,0,2,100,0,10000,15000,0,0,0,107,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Summon Creature Group 1 (Phase 2)'),
(1171100,9,4,0,0,2,100,0,10000,15000,0,0,0,107,2,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Summon Creature Group 2 (Phase 2)'),
(1171100,9,5,0,0,2,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Say Line 1 (Phase 2)'),
(1171100,9,6,0,0,2,100,0,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Set Event Phase 3 (Phase 2)'),
(1171100,9,7,0,0,4,100,0,10000,15000,0,0,0,12,11714,4,30000,0,1,0,8,0,0,0,0,4361,-43,84.86,5.4,'Sentinel Aynasha - On Script - Summon Creature ''Marosh the Devious'' (Phase 3)'),
(1171100,9,8,0,0,4,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Say Line 2 (Phase 3)'),
(1171100,9,9,0,0,4,100,0,0,0,0,0,0,26,5713,0,0,0,0,0,21,40,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Reward Quest ''One Shot. One Kill.'' (Phase 3)'),
(1171100,9,10,0,0,4,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Say Line 3 (Phase 3)'),
(1171100,9,11,0,0,4,100,0,8000,8000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Say Line 4 (Phase 3)'),
(1171100,9,12,0,0,4,100,0,8000,8000,0,0,0,69,0,0,0,0,0,0,1,0,0,0,0,4374.79,-51.6228,86.3357,0,'Sentinel Aynasha - On Script - Move To Position (Phase 3)'),
(1171100,9,13,0,0,4,100,0,0,0,0,0,0,41,2500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Aynasha - On Script - Force Despawn (Phase 3)'),

(11713,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blackwood Tracker - On Reset - Cast ''Thrash'''),
(11713,0,1,0,0,0,100,0,2000,10000,10000,20000,0,11,6950,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Blackwood Tracker - IC - Cast ''Faerie Fire'''),

(11714,0,0,0,25,0,100,0,0,0,0,0,0,11,8876,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marosh the Devious - On Reset - Cast ''Thrash'''),
(11714,0,1,0,0,0,100,0,2000,10000,10000,20000,0,11,6950,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Marosh the Devious - IC - Cast ''Faerie Fire''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
