-- DB update 2020_07_14_01 -> 2020_07_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_07_14_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_07_14_01 2020_07_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1594986792903317397'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1594986792903317397');

DELETE FROM `creature_text` WHERE `CreatureID` IN (37491,37493,37494,37495) AND `GroupID` = 0;
DELETE FROM `creature_text` WHERE `CreatureID` = 20350 AND `GroupID` = 5;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(37491,0,0,'Never... could reach... the top shelf...',14,0,0,0,0,16586,37074,0,'Captain Arnath - SAY_ARNATH_DEATH'),
(37493,0,0,'No amount of healing can save me now. Fight on, brothers...',14,0,0,0,0,16810,37665,0,'Captain Brandon - SAY_BRANDON_DEATH'),
(37494,0,0,'Please... burn my remains. Let me live warm in the afterlife...',14,0,0,0,0,16844,37666,0,'Captain Grondel - SAY_GRONDEL_DEATH'),
(37495,0,0,'It was... a worthy afterlife.',14,0,0,0,0,16998,37668,0,'Captain Rupert - SAY_RUPERT_DEATH'),
(20350,5,0,'No!!! A curse upon you, interlopers! The armies of the Lich King will hunt you down. You will not escape your fate...',14,0,100,0,0,14484,13150,3,'kelthuzad SAY_CAT_DIED');

UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `source_type` = 0 AND `event_type` IN (4,10,19,20,22,54,62) AND `action_type` = 1 AND `target_type` = 7;
UPDATE `smart_scripts` SET `target_type` = 1 WHERE `source_type` = 0 AND `event_type` = 2 AND `action_type` = 1 AND `target_type` = 7;
UPDATE `smart_scripts` SET `target_type` = 1 WHERE `entryorguid` = 28756 AND `source_type` = 0 AND `id` = 3;
UPDATE `smart_scripts` SET `target_type` = 1 WHERE `entryorguid` = 9461 AND `source_type` = 0 AND `id` = 4;
UPDATE `smart_scripts` SET `target_type` = 1 WHERE `entryorguid` = 15420 AND `source_type` = 0 AND `id` = 8;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` = 9520 AND `source_type` = 0 AND `id` IN (2,7);
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` = 15420 AND `source_type` = 0 AND `id` IN (3,5);
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` = 18471 AND `source_type` = 0 AND `id` IN (12,13,14,16,18,27);
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` = 30007 AND `source_type` = 0 AND `id` IN (9,10,11,12,13,14,15);
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` = 29881 AND `source_type` = 0 AND `id` = 0;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` IN (3230,4508,9598,17877,20071,25729,28518) AND `source_type` = 0 AND `id` = 1;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` IN (15481,20677,20678,20679,9026,24539,27933) AND `source_type` = 0 AND `id` = 2;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` IN (23340,23342,23344,23345,23346,23348,28041) AND `source_type` = 0 AND `id` = 3;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` = 716 AND `source_type` = 0 AND `id` = 4;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` IN (19191,23602,11122) AND `source_type` = 0 AND `id` = 5;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` = 18417 AND `source_type` = 0 AND `id` = 6;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` IN (29769,29770,29840) AND `source_type` = 0 AND `id` = 11;
UPDATE `smart_scripts` SET `action_param3` = 1 WHERE `entryorguid` = 17587 AND `source_type` = 0 AND `id` = 12;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 19283 AND `source_type` = 0 AND `id` = 3;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 25773 AND `source_type` = 0 AND `id` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19283,0,3,0,10,0,100,0,1,10,30000,60000,1,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Vagrant - OOC LoS - Say Line 0'),
(25773,0,0,0,1,0,100,1,0,0,0,0,0,1,0,0,1,0,0,0,21,50,0,0,0,0,0,0,0,'Fizzcrank Survivor - OOC - Say Line 0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
