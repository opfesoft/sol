-- DB update 2021_12_14_02 -> 2021_12_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_14_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_14_02 2021_12_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1639738845404832971'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1639738845404832971');

UPDATE `creature` SET `spawntimesecs` = 30 WHERE `guid` = 5799;

DELETE FROM `creature_text` WHERE `CreatureId` = 8421;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(8421,0,0,'Bravo! Bravo! Good show. What? You thought I was dead?',12,0,100,21,0,0,4393,0,'Dorius'),
(8421,1,0,'Fools. I knew that if I played upon my brother''s feeble emotions, he would send ''rescuers.''',12,0,100,0,0,0,4394,0,'Dorius'),
(8421,2,0,'How easy it was to manipulate you into recovering the last Suntara stone from those imbeciles of the Twilight''s Hammer.',12,0,100,0,0,0,4395,0,'Dorius'),
(8421,3,0,'When I stumbled upon the Suntara stones at the Grimesilt Digsite, the power of Ragnaros surged through my being. It was Ragnaros that gave me a purpose.',12,0,100,0,0,0,4396,0,'Dorius'),
(8421,4,0,'It was the will of Ragnaros that Obsidion be built. Obsidion will destroy the Blackrock orcs of Blackrock Spire, uniting us with our bretheren in the fiery depths.',12,0,100,0,0,0,4397,0,'Dorius'),
(8421,5,0,'And ultimately, it was Ragnaros that named me when I was reborn as an acolyte of fire: Lathoric... Lathoric the Black.',12,0,100,0,0,0,4398,0,'Dorius'),
(8421,6,0,'%s''s laughter trails off...',16,0,100,0,0,0,4399,0,'Dorius');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (8417,8421,8391,8400);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 148498;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (842100,839100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8417,0,0,1,19,0,100,0,3566,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dying Archaeologist - On Quest ''Rise, Obsidion!'' Accepted - Store Target ID 1 (Invoker)'),
(8417,0,1,2,61,0,100,0,0,0,0,0,0,12,8421,4,90000,0,0,0,8,0,0,0,0,-6460.53,-1267.63,180.782,1.89,'Dying Archaeologist - Linked - Summon Creature ''Dorius'''),
(8417,0,2,0,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,8421,0,0,0,0,0,0,0,'Dying Archaeologist - Linked - Send Target ID 1 (Dorius)'),

(148498,1,0,1,62,0,100,0,1282,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Altar of Suntara - On Gossip Select - Store Target ID 1 (Invoker)'),
(148498,1,1,2,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Altar of Suntara - Linked - Close gossip'),
(148498,1,2,3,61,0,100,0,0,0,0,0,0,12,8391,4,90000,0,0,0,8,0,0,0,0,-6475.47,-1242.28,180.19,3.58,'Altar of Suntara - Linked - Summon Creature ''Lathoric the Black'''),
(148498,1,3,0,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,8391,0,0,0,0,0,0,0,'Altar of Suntara - Linked - Send Target ID 1 (Lathoric the Black)'),

(8421,0,0,0,54,0,100,0,0,0,0,0,0,80,842100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Just Summoned - Call Timed Action List'),

(842100,9,0,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Set Run Off'),
(842100,9,1,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-6475.47,-1242.28,180.19,3.58,'Dorius - On Script - Move To Position'),
(842100,9,2,0,0,0,100,0,8000,8000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Say Line 0'),
(842100,9,3,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius - On Script - Set Orientation (Stored Target ID 1)'),
(842100,9,4,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Say Line 1'),
(842100,9,5,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Say Line 2'),
(842100,9,6,0,0,0,100,0,7000,7000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Say Line 3'),
(842100,9,7,0,0,0,100,0,8000,8000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Say Line 4'),
(842100,9,8,0,0,0,100,0,9000,9000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Say Line 5'),
(842100,9,9,0,0,0,100,0,8000,8000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Say Line 6'),
(842100,9,10,0,0,0,100,0,3000,3000,0,0,0,12,8391,4,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Summon Creature ''Lathoric the Black'''),
(842100,9,11,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,8391,0,0,0,0,0,0,0,'Dorius - On Script - Send Target ID 1 (Lathoric the Black)'),
(842100,9,12,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius - On Script - Force Despawn'),

(8391,0,0,0,54,0,100,0,0,0,0,0,0,80,839100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lathoric the Black - On Just Summoned - Call Timed Action List'),
(8391,0,1,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lathoric the Black - On Evade - Force Despawn'),

(839100,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lathoric the Black - On Script - Say Line 0'),
(839100,9,1,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lathoric the Black - On Script - Say Line 1'),
(839100,9,2,0,0,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lathoric the Black - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(839100,9,3,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Lathoric the Black - On Script - Start Attack (Stored Target ID 1)'),
(839100,9,4,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,10,5799,8400,0,0,0,0,0,0,'Lathoric the Black - On Script - Send Target ID 1 (Obsidion)'),
(839100,9,5,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,5799,8400,0,0,0,0,0,0,'Lathoric the Black - On Script - Set Data 1 1 (Obsidion)'),

(8400,0,0,1,38,0,100,0,1,1,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidion - On Data Set 1 1 - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(8400,0,1,2,61,0,100,0,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidion - Linked - Remove ''UNIT_STAND_STATE_DEAD'''),
(8400,0,2,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Obsidion - Linked - Start Attack (Stored Target ID 1)'),
(8400,0,3,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidion - On Evade - Force Despawn'),
(8400,0,4,0,0,0,100,0,15000,15000,15000,30000,0,11,10101,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Obsidion - IC - Cast ''Knock Away'''),
(8400,0,5,0,0,0,100,0,10000,10000,20000,30000,0,11,12734,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Obsidion - IC - Cast ''Floor Smash''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 1282;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 8417;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,1282,0,0,0,29,0,8391,100,0,1,0,0,'Altar of Suntara - Group 0: Show gossip option 0 if not near ''Lathoric the Black'''),
(15,1282,0,0,0,29,0,8421,100,0,1,0,0,'Altar of Suntara - Group 0: Show gossip option 0 if not near ''Dorius'''),
(15,1282,0,0,0,29,0,8400,100,0,0,0,0,'Altar of Suntara - Group 0: Show gossip option 0 if near ''Obsidion'''),
(15,1282,0,0,0,47,0,3566,8,0,0,0,0,'Altar of Suntara - Group 0: Show gossip option 0 if the quest ''Rise, Obsidion!'' is in progress'),

(22,1,8417,0,0,29,0,8391,100,0,1,0,0,'Dying Archaeologist - Group 0: Execute SAI ID 0 only if not near ''Lathoric the Black'''),
(22,1,8417,0,0,29,0,8421,100,0,1,0,0,'Dying Archaeologist - Group 0: Execute SAI ID 0 only if not near ''Dorius'''),
(22,1,8417,0,0,29,0,8400,100,0,0,0,0,'Dying Archaeologist - Group 0: Execute SAI ID 0 only if near ''Obsidion''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
