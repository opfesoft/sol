-- DB update 2021_11_07_00 -> 2021_11_08_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_07_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_07_00 2021_11_08_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636326392178738926'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636326392178738926');

DELETE FROM `creature_text` WHERE `CreatureId` = 16237;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(16237,0,0,'Look out... the night elves are back!',12,0,100,0,0,0,12115,0,'Quest ''Deliver the Plans to An''telas'' rewarded');

DELETE FROM `creature_summon_groups` WHERE `summonerId` = 16237;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(16237,0,0,16238,7448.06,-7268.19,97.59,6.14,4,60000),
(16237,0,0,16238,7451.11,-7279.82,95.58,0.13,4,60000);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 16237;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16237;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16237,0,0,1,20,0,100,0,9166,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Magister Sylastor - On Quest ''Deliver the Plans to An''telas'' Rewarded - Say Line 0'),
(16237,0,1,0,61,0,100,0,0,0,0,0,0,107,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Sylastor - Linked - Summon Creature Group');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
