-- DB update 2021_06_28_02 -> 2021_06_28_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_28_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_28_02 2021_06_28_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624912541007693310'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624912541007693310');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 9546 AND `SourceEntry` IN (1,2);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,9546,1,0,0,47,0,12298,2,0,0,0,0,'Greer Orehammer - Show gossip option 1 if quest ''High Commander Halford Wyrmbane'' is completed'),
(15,9546,2,0,0,47,0,11332,8,0,0,0,0,'Greer Orehammer - Show gossip option 2 if quest ''Mission: Plague This!'' is in progress');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23859;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2385901;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23859,0,0,0,4,0,100,0,0,0,0,0,0,80,2385900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greer Orehammer - On Aggro - Call Timed Action List'),
(23859,0,1,2,62,0,100,0,9546,1,0,0,0,11,48862,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Greer Orehammer - On Gossip Select - Cast ''High Commander Halford Wyrmbane: Westguard Keep to Wintergarde Keep Taxi'''),
(23859,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Greer Orehammer - Linked - Close Gossip'),
(23859,0,3,0,62,0,100,0,9546,2,0,0,0,80,2385901,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greer Orehammer - On Gossip Select - Call Timed Action List'),

(2385901,9,0,0,0,0,100,0,0,0,0,0,0,56,33634,10,0,0,0,0,7,0,0,0,0,0,0,0,0,'Greer Orehammer - On Script - Add Item ''Orehammer''s Precision Bombs'''),
(2385901,9,1,0,0,0,100,0,3000,3000,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Greer Orehammer - On Script - Close Gossip'),
(2385901,9,2,0,0,0,100,0,0,0,0,0,0,52,745,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Greer Orehammer - On Script - Activate Taxi ID 745');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
