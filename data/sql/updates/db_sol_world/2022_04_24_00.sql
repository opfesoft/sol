-- DB update 2022_04_23_00 -> 2022_04_24_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_23_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_23_00 2022_04_24_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1650834104410202022'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1650834104410202022');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 23569;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23569;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2356900;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23569,0,0,1,62,0,100,0,8837,0,0,0,0,85,42670,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Renn McGill - On Gossip Option 0 Selected - Invoker Cast ''Replace Repaired Diving Gear'''),
(23569,0,1,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Renn McGill - Linked - Close Gossip'),
(23569,0,2,0,20,0,100,0,11140,0,0,0,0,80,2356900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Renn McGill - On Quest ''Recover the Cargo!'' Rewarded - Call Timed Action List'),

(2356900,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Renn McGill - On Script - Remove NPC Flags'),
(2356900,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Renn McGill - On Script - Say Line 0'),
(2356900,9,2,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Renn McGill - On Script - Say Line 1'),
(2356900,9,3,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Renn McGill - On Script - Say Line 2'),
(2356900,9,4,0,0,0,100,0,6000,6000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Renn McGill - On Script - Add NPC Flags');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 8837;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,8837,0,0,0,2,0,33040,1,1,1,0,0,'Renn McGill - Group 0: Show gossip option 0 if the item ''Repaired Diving Gear'' is not in the inventory or in the bank'),
(15,8837,0,0,0,2,0,33045,1,1,1,0,0,'Renn McGill - Group 0: Show gossip option 0 if the item ''Renn''s Supplies'' is not in the inventory or in the bank'),
(15,8837,0,0,0,47,0,11140,8,0,0,0,0,'Renn McGill - Group 0: Show gossip option 0 if quest ''Recover the Cargo!'' is in progress');

-- Shipwreck Debris is the correct GO for quest "Recover the Cargo!", not Burning Wreckage
UPDATE `gameobject_template` SET `Data5` = 0 WHERE `entry` = 186278;
UPDATE `gameobject_template` SET `Data4` = 11140 WHERE `entry` = 186283;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
