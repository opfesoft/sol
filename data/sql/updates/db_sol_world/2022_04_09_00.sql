-- DB update 2022_04_08_05 -> 2022_04_09_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_08_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_08_05 2022_04_09_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1649539218993547402'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1649539218993547402');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8962;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8962;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 896200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8962,0,0,0,20,0,100,0,3741,0,0,0,0,80,896200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hilary - On Quest ''Hilary''s Necklace'' Rewarded - Call Timed Action List'),

(896200,9,0,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,19,8963,0,0,0,0,0,0,0,'Hilary - On Script - Say Line 0 (Effsee)'),
(896200,9,1,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hilary - On Script - Say Line 0');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 1621;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,1621,2273,0,0,47,0,3741,64,0,1,0,0,'Hilary - Group 0: Show gossip menu text 2273 if quest ''Hilary''s Necklace'' is not rewarded'),
(14,1621,2274,0,0,47,0,3741,64,0,0,0,0,'Hilary - Group 0: Show gossip menu text 2274 if quest ''Hilary''s Necklace'' is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
