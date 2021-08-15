-- DB update 2021_08_15_01 -> 2021_08_15_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_15_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_15_01 2021_08_15_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629038460641940245'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629038460641940245');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 9116;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 911600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9116,0,0,0,19,0,100,0,4442,0,0,0,0,80,911600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eridan Bluewind - On Quest ''Purified!'' Taken - Call Timed Action List'),
(9116,0,1,2,62,0,100,0,3142,0,0,0,0,11,47043,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Eridan Bluewind - On Gossip 0 Selected - Cast ''Flute of the Ancients'''),
(9116,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Eridan Bluewind - Linked - Close Gossip'),

(911600,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eridan Bluewind - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(911600,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eridan Bluewind - On Script - Say Line 0'),
(911600,9,2,0,0,0,100,0,1000,1000,0,0,0,11,28892,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eridan Bluewind - On Script - Cast ''Nature Channeling'''),
(911600,9,3,0,0,0,100,0,4000,4000,0,0,0,28,28892,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eridan Bluewind - On Script - Remove Aura ''Nature Channeling'''),
(911600,9,4,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eridan Bluewind - On Script - Say Line 1'),
(911600,9,5,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eridan Bluewind - On Script - Set ''UNIT_NPC_FLAG_QUESTGIVER''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 3142 AND `SourceEntry` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,3142,0,0,0,47,0,4442,64,0,0,0,0,'Eridan Bluewind - Show gossip option 0 if quest ''Purified!'' is rewarded'),
(15,3142,0,0,0,47,0,4261,64,0,1,0,0,'Eridan Bluewind - Show gossip option 0 if quest ''Ancient Spirit'' is not rewarded'),
(15,3142,0,0,0,2,0,11445,1,0,1,0,0,'Eridan Bluewind - Show gossip option 0 if item ''Flute of the Ancients'' is not in inventory');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
