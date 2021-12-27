-- DB update 2021_12_26_01 -> 2021_12_27_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_26_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_26_01 2021_12_27_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1640611008743184812'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1640611008743184812');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 7572;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 757200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7572,0,0,2,62,0,100,0,842,0,0,0,0,26,2784,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Gossip Option 0 Selected - Quest Credit ''Fall From Grace'' (Invoker)'),
(7572,0,1,2,62,0,100,0,881,0,0,0,0,26,2801,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Gossip Option 0 Selected - Quest Credit ''A Tale of Sorrow'' (Invoker)'),
(7572,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - Linked - Close Gossip'),
(7572,0,3,4,62,0,100,0,840,2,0,0,0,80,757200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Gossip Option 2 Selected - Call Timed Action List'),
(7572,0,4,2,61,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - Linked - Say Line 0'),
(7572,0,5,0,19,0,100,0,2702,0,0,0,0,80,757200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Quest ''Heroes of Old, part 1'' Accepted - Call Timed Action List'),
(7572,0,6,2,62,0,100,0,840,3,0,0,0,11,15247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Gossip Option 3 Selected - Invoker Cast ''Conjure Fel Salve'''),

(757200,9,0,0,0,0,100,0,0,0,0,0,0,11,11024,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Script - Cast ''Call of Thund'''),
(757200,9,1,0,0,0,100,0,1500,1500,0,0,0,12,7750,3,300000,0,0,0,8,0,0,0,0,-10630.2,-2988.19,28.8757,4.93301,'Fallen Hero of the Horde - On Script - Summon Creature ''Corporal Thund Splithoof''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 7572;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,6,7572,0,0,29,0,7750,50,0,1,0,0,'Fallen Hero of the Horde - Group 0: Execute SAI ID 5 only if not near ''Corporal Thund Splithoof''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
