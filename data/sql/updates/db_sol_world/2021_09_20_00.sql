-- DB update 2021_09_19_02 -> 2021_09_20_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_19_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_19_02 2021_09_20_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632089039461013855'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632089039461013855');

DELETE FROM `creature_text` WHERE `CreatureId` = 6251;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(6251,0,0,'I hope you''re ready, $n. Follow me.',12,0,100,0,0,0,2370,0,'Strahad Farsan'),
(6251,1,0,'Come, my acolytes. Take the rods of channeling and create the greater summoning circle.',12,0,100,0,0,0,2374,0,'Strahad Farsan');

-- Remove obsolete summoning circles (summoned via SAI)
DELETE FROM `gameobject` WHERE `id` IN (92252,92388);

-- Ensure that the Summoned Felhunter will despawn if 20s OOC
UPDATE `event_scripts` SET `datalong2` = 20000, `dataint` = 4 WHERE `id` = 1449 AND `command` = 10;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (6251,6252,6253,6254);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (6251,6252,6253,6254);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` > 0 AND `entryorguid` = 6268;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (625100,625101,625102,625103,625200,625300,625400);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6251,0,0,0,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Respawn - Disable Event Phase Reset'),
(6251,0,1,2,19,0,100,0,1795,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Strahad Farsan - On Quest ''The Binding'' Accepted - Say Line 0'),
(6251,0,2,3,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - Linked - Set Active On'),
(6251,0,3,4,61,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - Linked - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(6251,0,4,0,61,0,100,0,0,0,0,0,0,53,0,625100,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - Linked - Start WP Movement'),
(6251,0,5,0,58,0,100,0,0,625100,0,0,0,80,625100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On WP Path Ended - Call Timed Action List'),
(6251,0,6,0,34,0,100,0,8,1,0,0,0,80,625101,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Point 1 Reached - Call Timed Action List'),
(6251,0,7,8,59,0,100,0,1,0,0,0,0,53,0,625101,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Timed Event 1 Triggered - Start WP Movement'),
(6251,0,8,0,61,0,100,0,0,0,0,0,0,80,625102,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - Linked - Call Timed Action List'),
(6251,0,9,0,58,0,100,0,0,625101,0,0,0,80,625103,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On WP Path Ended - Call Timed Action List'),
(6251,0,10,11,38,0,100,0,1,1,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Data Set 1 1 - Remove Timed Event 1'),
(6251,0,11,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - Linked - Set Phase 1'),
(6251,0,12,13,1,1,100,0,5000,5000,5000,5000,0,53,0,625101,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - OOC - Start WP Movement (Phase 1)'),
(6251,0,13,14,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - Linked - Set Phase 0'),
(6251,0,14,0,61,0,100,0,0,0,0,0,0,80,625102,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - Linked - Call Timed Action List'),

(625100,9,0,0,0,0,100,0,0,0,0,0,0,11,30540,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Script - Cast ''Summon Visual'''),
(625100,9,1,0,0,0,100,0,6000,6000,0,0,0,28,30540,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Script - Remove Aura ''Summon Visual'''),
(625100,9,2,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Script - Say Line 1'),
(625100,9,3,0,0,0,100,0,0,0,0,0,0,50,92252,0,0,0,0,0,8,0,0,0,0,-770.513,-3720.37,42.461,5.82547,'Strahad Farsan - On Script - Summon GO ''Strahad''s Summoning Circle'''),
(625100,9,4,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,14370,6252,0,0,0,0,0,0,'Strahad Farsan - On Script - Set Data 1 1 (Acolyte Magaz)'),
(625100,9,5,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,14384,6253,0,0,0,0,0,0,'Strahad Farsan - On Script - Set Data 1 1 (Acolyte Fenrick)'),
(625100,9,6,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,14385,6254,0,0,0,0,0,0,'Strahad Farsan - On Script - Set Data 1 1 (Acolyte Wytula)'),
(625100,9,7,0,0,0,100,0,1000,1000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,-763.97,-3720.19,42.2459,0,'Strahad Farsan - On Script - Move To Position'),

(625101,9,0,0,0,0,100,0,0,0,0,0,0,67,1,60000,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Script - Create Timed Event 1'),
(625101,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.2845,'Strahad Farsan - On Script - Set Orientation'),

(625102,9,0,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,15,92252,10,0,0,0,0,0,0,'Strahad Farsan - On Script - Delete GO ''Strahad''s Summoning Circle'''),
(625102,9,1,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,15,92388,10,0,0,0,0,0,0,'Strahad Farsan - On Script - Delete GO ''Summoning Circle'''),

(625103,9,0,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(625103,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.05949,'Strahad Farsan - On Script - Set Orientation'),
(625103,9,2,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Strahad Farsan - On Script - Set Active Off'),

(6268,0,1,2,54,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,14366,6251,0,0,0,0,0,0,'Summoned Felhunter - On Just Summoned - Set Data 1 1 (Strahad Farsan)'),
(6268,0,2,0,61,0,100,0,0,0,0,0,0,80,625102,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Felhunter - Linked - Call Timed Action List'),

(6252,0,0,0,38,0,100,0,1,1,0,0,0,80,625200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acolyte Magaz - On Data Set 1 1 - Call Timed Action List'),

(625200,9,0,0,0,0,100,0,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acolyte Magaz - On Script - Play Emote ''ONESHOT_BOW'''),
(625200,9,1,0,0,0,100,0,3000,3000,0,0,0,11,8675,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acolyte Magaz - On Script - Cast ''Warlock Channeling'''),
(625200,9,2,0,0,0,100,0,7500,7500,0,0,0,50,92388,0,0,0,0,0,8,0,0,0,0,-770.513,-3720.37,42.461,5.82547,'Acolyte Magaz - On Script - Summon GO ''Summoning Circle'''),

(6253,0,0,0,38,0,100,0,1,1,0,0,0,80,625300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acolyte Fenrick - On Data Set 1 1 - Call Timed Action List'),

(625300,9,0,0,0,0,100,0,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acolyte Fenrick - On Script - Play Emote ''ONESHOT_BOW'''),
(625300,9,1,0,0,0,100,0,3000,3000,0,0,0,11,8675,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acolyte Fenrick - On Script - Cast ''Warlock Channeling'''),

(6254,0,0,0,38,0,100,0,1,1,0,0,0,80,625400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acolyte Wytula - On Data Set 1 1 - Call Timed Action List'),

(625400,9,0,0,0,0,100,0,0,0,0,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acolyte Wytula - Script - Play Emote ''ONESHOT_BOW'''),
(625400,9,1,0,0,0,100,0,3000,3000,0,0,0,11,8675,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acolyte Wytula - On Script - Cast ''Warlock Channeling''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 6251;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,13,6251,0,0,29,1,6268,10,0,1,0,0,'Creature ''Strahad Farsan'' - Execute SAI only if not near ''Summoned Felhunter''');

DELETE FROM `waypoints` WHERE `entry` IN (625100,625101);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(625100,1,-785.912,-3723.26,40.4321,'Strahad Farsan - The Binding - Path 1'),
(625100,2,-781.32,-3717.15,41.5973,NULL),
(625100,3,-778.092,-3718.18,42.5953,NULL),
(625100,4,-770.08,-3720.73,42.4461,NULL),

(625101,1,-763.97,-3720.19,42.2459,'Strahad Farsan - The Binding - Path 2'),
(625101,2,-777.691,-3717.92,42.6121,NULL),
(625101,3,-782.23,-3717.17,41.5657,NULL),
(625101,4,-785.912,-3723.26,40.4321,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
