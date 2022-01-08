-- DB update 2022_01_08_00 -> 2022_01_08_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_08_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_08_00 2022_01_08_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641681472513852931'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641681472513852931');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (11056,11057);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (3223,3228);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,3223,3978,0,0,47,0,5230,64,0,1,0,0,'Apothecary Dithers - Group 0: Show gossip text 3978 if quest ''Return to the Bulwark, part 1'' is not rewarded'),
(14,3223,3979,0,0,47,0,5230,64,0,0,0,0,'Apothecary Dithers - Group 0: Show gossip text 3979 if quest ''Return to the Bulwark, part 1'' is rewarded'),

(15,3223,0,0,0,47,0,5230,64,0,0,0,0,'Apothecary Dithers - Group 0: Show gossip option 0 if quest ''Return to the Bulwark, part 1'' is rewarded'),
(15,3223,1,0,0,47,0,5230,64,0,0,0,0,'Apothecary Dithers - Group 0: Show gossip option 1 if quest ''Return to the Bulwark, part 1'' is rewarded'),
(15,3223,2,0,0,47,0,5232,64,0,0,0,0,'Apothecary Dithers - Group 0: Show gossip option 2 if quest ''Return to the Bulwark, part 2'' is rewarded'),
(15,3223,3,0,0,47,0,5234,64,0,0,0,0,'Apothecary Dithers - Group 0: Show gossip option 3 if quest ''Return to the Bulwark, part 3'' is rewarded'),
(15,3223,4,0,0,47,0,5236,64,0,0,0,0,'Apothecary Dithers - Group 0: Show gossip option 4 if quest ''Return to the Bulwark, part 4'' is rewarded'),

(14,3228,3984,0,0,47,0,5217,64,0,1,0,0,'Alchemist Arbington - Group 0: Show gossip text 3984 if quest ''Return to Chillwind Camp, part 1'' is not rewarded'),
(14,3228,3985,0,0,47,0,5217,64,0,0,0,0,'Alchemist Arbington - Group 0: Show gossip text 3985 if quest ''Return to Chillwind Camp, part 1'' is rewarded'),

(15,3228,0,0,0,47,0,5217,64,0,0,0,0,'Alchemist Arbington - Group 0: Show gossip option 0 if quest ''Return to Chillwind Camp, part 1'' is rewarded'),
(15,3228,1,0,0,47,0,5217,64,0,0,0,0,'Alchemist Arbington - Group 0: Show gossip option 1 if quest ''Return to Chillwind Camp, part 1'' is rewarded'),
(15,3228,2,0,0,47,0,5220,64,0,0,0,0,'Alchemist Arbington - Group 0: Show gossip option 2 if quest ''Return to Chillwind Camp, part 2'' is rewarded'),
(15,3228,3,0,0,47,0,5223,64,0,0,0,0,'Alchemist Arbington - Group 0: Show gossip option 3 if quest ''Return to Chillwind Camp, part 3'' is rewarded'),
(15,3228,4,0,0,47,0,5226,64,0,0,0,0,'Alchemist Arbington - Group 0: Show gossip option 4 if quest ''Return to Chillwind Camp, part 4'' is rewarded');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (11056,11057);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1105600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11056,0,0,4,62,0,100,0,3224,0,0,0,0,11,17529,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Alchemist Arbington - On Gossip Option 0 Selected - Cast ''Vitreous Focuser'''),
(11056,0,1,4,62,0,100,0,3225,0,0,0,0,11,17529,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Alchemist Arbington - On Gossip Option 0 Selected - Cast ''Vitreous Focuser'''),
(11056,0,2,4,62,0,100,0,3226,0,0,0,0,11,17529,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Alchemist Arbington - On Gossip Option 0 Selected - Cast ''Vitreous Focuser'''),
(11056,0,3,4,62,0,100,0,3227,0,0,0,0,11,17529,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Alchemist Arbington - On Gossip Option 0 Selected - Cast ''Vitreous Focuser'''),
(11056,0,4,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Alchemist Arbington - Linked - Close Gossip'),
(11056,0,5,0,20,0,100,0,5803,0,0,0,0,80,1105600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alchemist Arbington - On Quest ''Araj''s Scarab'' Rewarded - Call Timed Action List'),

(1105600,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alchemist Arbington and Apothecary Dithers - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1105600,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Alchemist Arbington and Apothecary Dithers - On Script - Say Line 0'),
(1105600,9,2,0,0,0,100,0,0,0,0,0,0,11,15050,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alchemist Arbington and Apothecary Dithers - On Script - Cast ''Psychometry'''),
(1105600,9,3,0,0,0,100,0,8000,8000,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Alchemist Arbington and Apothecary Dithers - On Script - Say Line 1'),
(1105600,9,4,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alchemist Arbington and Apothecary Dithers - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(11057,0,0,4,62,0,100,0,3224,0,0,0,0,11,17529,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Apothecary Dithers - On Gossip Option 0 Selected - Cast ''Vitreous Focuser'''),
(11057,0,1,4,62,0,100,0,3225,0,0,0,0,11,17529,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Apothecary Dithers - On Gossip Option 0 Selected - Cast ''Vitreous Focuser'''),
(11057,0,2,4,62,0,100,0,3226,0,0,0,0,11,17529,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Apothecary Dithers - On Gossip Option 0 Selected - Cast ''Vitreous Focuser'''),
(11057,0,3,4,62,0,100,0,3227,0,0,0,0,11,17529,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Apothecary Dithers - On Gossip Option 0 Selected - Cast ''Vitreous Focuser'''),
(11057,0,4,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Apothecary Dithers - Linked - Close Gossip'),
(11057,0,5,0,20,0,100,0,5804,0,0,0,0,80,1105600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apothecary Dithers - On Quest ''Araj''s Scarab'' Rewarded - Call Timed Action List');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
