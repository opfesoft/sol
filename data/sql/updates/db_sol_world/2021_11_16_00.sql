-- DB update 2021_11_13_01 -> 2021_11_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_13_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_13_01 2021_11_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637064249246744203'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637064249246744203');

UPDATE `gameobject_template_addon` SET `flags` = 20 WHERE `entry` IN (141812,141857,141858,141859);

DELETE FROM `gameobject` WHERE `guid` IN (3009020,3009021);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009020,141812,0,0,0,1,1,-11683.5,-3215.04,13.1366,0,0,0,0,0,900,100,1,0),
(3009021,141812,0,0,0,1,1,-11841.1,-3060.92,5.31406,0,0,0,0,0,900,100,1,0);

DELETE FROM `creature` WHERE `guid` IN (3008927,3008928);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008927,7668,0,0,0,1,1,6849,1,-11676.3,-3232.93,15.4765,0,450,5,3758,0,1,0,0,0,0),
(3008928,7668,0,0,0,1,1,6849,1,-11814.4,-3055.36,7.70739,0,450,5,3758,0,1,0,0,0,0);

DELETE FROM `creature_text` WHERE `CreatureId` IN (7668,7669,7670,7671);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(7668,0,0,'%s''s physical form is weakened. You notice the Stone of Binding near the creature is glowing! Strike now!',41,0,100,0,0,0,3642,0,'Servant of Razelikh'),
(7668,1,0,'FREEEEEEEEEEDDOOOOMM!',14,0,100,0,0,0,3641,0,'Servant of Razelikh'),
(7668,1,1,'Finally, the agony ceases....',12,0,100,0,0,0,3681,0,'Servant of Razelikh'),
(7668,1,2,'Give my regards to Commander Trebor.',12,0,100,0,0,0,3682,0,'Servant of Razelikh'),
(7668,1,3,'The Defiler... must warn Thrall...',12,0,100,0,0,0,3683,0,'Servant of Razelikh'),
(7668,1,4,'It was not his fault. Tell him that...',12,0,100,0,0,0,3684,0,'Servant of Razelikh'),
(7668,1,5,'Finally, released from his cursed grasp. Father, I come...',12,0,100,0,0,0,3685,0,'Servant of Razelikh'),

(7669,0,0,'%s''s physical form is weakened. You notice the Stone of Binding near the creature is glowing! Strike now!',41,0,100,0,0,0,3642,0,'Servant of Grol'),
(7669,1,0,'FREEEEEEEEEEDDOOOOMM!',14,0,100,0,0,0,3641,0,'Servant of Grol'),
(7669,1,1,'Finally, the agony ceases....',12,0,100,0,0,0,3681,0,'Servant of Grol'),
(7669,1,2,'Give my regards to Commander Trebor.',12,0,100,0,0,0,3682,0,'Servant of Grol'),
(7669,1,3,'The Defiler... must warn Thrall...',12,0,100,0,0,0,3683,0,'Servant of Grol'),
(7669,1,4,'It was not his fault. Tell him that...',12,0,100,0,0,0,3684,0,'Servant of Grol'),
(7669,1,5,'Finally, released from his cursed grasp. Father, I come... ',12,0,100,0,0,0,3685,0,'Servant of Grol'),

(7670,0,0,'%s''s physical form is weakened. You notice the Stone of Binding near the creature is glowing! Strike now!',41,0,100,0,0,0,3642,0,'Servant of Allistarj'),
(7670,1,0,'FREEEEEEEEEEDDOOOOMM!',14,0,100,0,0,0,3641,0,'Servant of Allistarj'),
(7670,1,1,'Finally, the agony ceases....',12,0,100,0,0,0,3681,0,'Servant of Allistarj'),
(7670,1,2,'Give my regards to Commander Trebor.',12,0,100,0,0,0,3682,0,'Servant of Allistarj'),
(7670,1,3,'The Defiler... must warn Thrall...',12,0,100,0,0,0,3683,0,'Servant of Allistarj'),
(7670,1,4,'It was not his fault. Tell him that...',12,0,100,0,0,0,3684,0,'Servant of Allistarj'),
(7670,1,5,'Finally, released from his cursed grasp. Father, I come... ',12,0,100,0,0,0,3685,0,'Servant of Allistarj'),

(7671,0,0,'%s''s physical form is weakened. You notice the Stone of Binding near the creature is glowing! Strike now!',41,0,100,0,0,0,3642,0,'Servant of Sevine'),
(7671,1,0,'FREEEEEEEEEEDDOOOOMM!',14,0,100,0,0,0,3641,0,'Servant of Sevine'),
(7671,1,1,'Finally, the agony ceases....',12,0,100,0,0,0,3681,0,'Servant of Sevine'),
(7671,1,2,'Give my regards to Commander Trebor.',12,0,100,0,0,0,3682,0,'Servant of Sevine'),
(7671,1,3,'The Defiler... must warn Thrall...',12,0,100,0,0,0,3683,0,'Servant of Sevine'),
(7671,1,4,'It was not his fault. Tell him that...',12,0,100,0,0,0,3684,0,'Servant of Sevine'),
(7671,1,5,'Finally, released from his cursed grasp. Father, I come... ',12,0,100,0,0,0,3685,0,'Servant of Sevine');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (7668,7669,7670,7671);
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` IN (141812,141857,141858,141859);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (7668,7669,7670,7671);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (141812,141857,141858,141859);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (766800,766900,767000,767100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7668,0,0,0,25,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Razelikh - On Reset - Set Invincibility HP Level 1'),
(7668,0,1,2,2,0,100,1,0,5,0,0,0,45,1,1,0,0,0,0,20,141812,10,0,0,0,0,0,0,'Servant of Razelikh - Between 0-5% Health - Set Data 1 1 (Stone of Binding)'),
(7668,0,2,0,61,0,100,0,0,0,0,0,0,11,10794,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Razelikh - Linked - Cast ''Spirit Shock'' (No Repeat)'),
(7668,0,3,0,38,0,100,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,'Servant of Razelikh - On Data Set 1 1 - Say Line 0'),
(7668,0,4,0,38,0,100,0,2,2,0,0,0,80,766800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Razelikh - On Data Set 2 2 - Call Timed Action List'),

(766800,9,0,0,0,0,100,0,3000,3000,0,0,0,234,3643,2,0,0,0,0,20,141812,10,0,0,0,0,0,0,'Servant of Razelikh - On Script - Custom Talk (Stone of Binding)'),
(766800,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Razelikh - On Script - Say Line 1'),
(766800,9,2,0,0,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Razelikh - On Script - Die'),

(141812,1,0,1,38,0,100,0,1,1,0,0,0,106,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - On Data Set 1 1 - Remove ''GO_FLAG_NOT_SELECTABLE'''),
(141812,1,1,2,61,0,100,0,0,0,0,0,0,67,1,27000,27000,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - Linked - Create Timed Event 1'),
(141812,1,2,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,7668,10,0,0,0,0,0,0,'Stone of Binding - Linked - Set Data 1 1 (Servant of Razelikh)'),
(141812,1,3,0,59,0,100,0,1,0,0,0,0,105,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - On Timed Event 1 Triggered - Set ''GO_FLAG_NOT_SELECTABLE'''),
(141812,1,4,0,70,0,100,0,2,0,0,0,0,45,2,2,0,0,0,0,19,7668,10,0,0,0,0,0,0,'Stone of Binding - On Gameobject State Changed - Set Data 2 2 (Servant of Razelikh)'),

(7669,0,0,0,25,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Grol - On Reset - Set Invincibility HP Level 1'),
(7669,0,1,2,2,0,100,1,0,5,0,0,0,45,1,1,0,0,0,0,20,141857,10,0,0,0,0,0,0,'Servant of Grol - Between 0-5% Health - Set Data 1 1 (Stone of Binding)'),
(7669,0,2,0,61,0,100,0,0,0,0,0,0,11,10794,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Grol - Linked - Cast ''Spirit Shock'' (No Repeat)'),
(7669,0,3,0,38,0,100,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,'Servant of Grol - On Data Set 1 1 - Say Line 0'),
(7669,0,4,0,38,0,100,0,2,2,0,0,0,80,766900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Grol - On Data Set 2 2 - Call Timed Action List'),

(766900,9,0,0,0,0,100,0,3000,3000,0,0,0,234,3643,2,0,0,0,0,20,141857,10,0,0,0,0,0,0,'Servant of Grol - On Script - Custom Talk (Stone of Binding)'),
(766900,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Grol - On Script - Say Line 1'),
(766900,9,2,0,0,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Grol - On Script - Die'),

(141857,1,0,1,38,0,100,0,1,1,0,0,0,106,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - On Data Set 1 1 - Remove ''GO_FLAG_NOT_SELECTABLE'''),
(141857,1,1,2,61,0,100,0,0,0,0,0,0,67,1,27000,27000,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - Linked - Create Timed Event 1'),
(141857,1,2,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,7669,10,0,0,0,0,0,0,'Stone of Binding - Linked - Set Data 1 1 (Servant of Grol)'),
(141857,1,3,0,59,0,100,0,1,0,0,0,0,105,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - On Timed Event 1 Triggered - Set ''GO_FLAG_NOT_SELECTABLE'''),
(141857,1,4,0,70,0,100,0,2,0,0,0,0,45,2,2,0,0,0,0,19,7669,10,0,0,0,0,0,0,'Stone of Binding - On Gameobject State Changed - Set Data 2 2 (Servant of Grol)'),

(7670,0,0,0,25,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Allistarj - On Reset - Set Invincibility HP Level 1'),
(7670,0,1,2,2,0,100,1,0,5,0,0,0,45,1,1,0,0,0,0,20,141858,10,0,0,0,0,0,0,'Servant of Allistarj - Between 0-5% Health - Set Data 1 1 (Stone of Binding)'),
(7670,0,2,0,61,0,100,0,0,0,0,0,0,11,10794,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Allistarj - Linked - Cast ''Spirit Shock'' (No Repeat)'),
(7670,0,3,0,38,0,100,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,'Servant of Allistarj - On Data Set 1 1 - Say Line 0'),
(7670,0,4,0,38,0,100,0,2,2,0,0,0,80,767000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Allistarj - On Data Set 2 2 - Call Timed Action List'),

(767000,9,0,0,0,0,100,0,3000,3000,0,0,0,234,3643,2,0,0,0,0,20,141858,10,0,0,0,0,0,0,'Servant of Allistarj - On Script - Custom Talk (Stone of Binding)'),
(767000,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Allistarj - On Script - Say Line 1'),
(767000,9,2,0,0,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Allistarj - On Script - Die'),

(141858,1,0,1,38,0,100,0,1,1,0,0,0,106,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - On Data Set 1 1 - Remove ''GO_FLAG_NOT_SELECTABLE'''),
(141858,1,1,2,61,0,100,0,0,0,0,0,0,67,1,27000,27000,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - Linked - Create Timed Event 1'),
(141858,1,2,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,7670,10,0,0,0,0,0,0,'Stone of Binding - Linked - Set Data 1 1 (Servant of Allistarj)'),
(141858,1,3,0,59,0,100,0,1,0,0,0,0,105,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - On Timed Event 1 Triggered - Set ''GO_FLAG_NOT_SELECTABLE'''),
(141858,1,4,0,70,0,100,0,2,0,0,0,0,45,2,2,0,0,0,0,19,7670,10,0,0,0,0,0,0,'Stone of Binding - On Gameobject State Changed - Set Data 2 2 (Servant of Allistarj)'),

(7671,0,0,0,25,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Sevine - On Reset - Set Invincibility HP Level 1'),
(7671,0,1,2,2,0,100,1,0,5,0,0,0,45,1,1,0,0,0,0,20,141859,10,0,0,0,0,0,0,'Servant of Sevine - Between 0-5% Health - Set Data 1 1 (Stone of Binding)'),
(7671,0,2,0,61,0,100,0,0,0,0,0,0,11,10794,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Sevine - Linked - Cast ''Spirit Shock'' (No Repeat)'),
(7671,0,3,0,38,0,100,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,'Servant of Sevine - On Data Set 1 1 - Say Line 0'),
(7671,0,4,0,38,0,100,0,2,2,0,0,0,80,767100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Sevine - On Data Set 2 2 - Call Timed Action List'),

(767100,9,0,0,0,0,100,0,3000,3000,0,0,0,234,3643,2,0,0,0,0,20,141859,10,0,0,0,0,0,0,'Servant of Sevine - On Script - Custom Talk (Stone of Binding)'),
(767100,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Sevine - On Script - Say Line 1'),
(767100,9,2,0,0,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of Sevine - On Script - Die'),

(141859,1,0,1,38,0,100,0,1,1,0,0,0,106,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - On Data Set 1 1 - Remove ''GO_FLAG_NOT_SELECTABLE'''),
(141859,1,1,2,61,0,100,0,0,0,0,0,0,67,1,27000,27000,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - Linked - Create Timed Event 1'),
(141859,1,2,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,7671,10,0,0,0,0,0,0,'Stone of Binding - Linked - Set Data 1 1 (Servant of Sevine)'),
(141859,1,3,0,59,0,100,0,1,0,0,0,0,105,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone of Binding - On Timed Event 1 Triggered - Set ''GO_FLAG_NOT_SELECTABLE'''),
(141859,1,4,0,70,0,100,0,2,0,0,0,0,45,2,2,0,0,0,0,19,7671,10,0,0,0,0,0,0,'Stone of Binding - On Gameobject State Changed - Set Data 2 2 (Servant of Sevine)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
