-- DB update 2022_03_22_03 -> 2022_03_23_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_22_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_22_03 2022_03_23_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648045013351685579'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648045013351685579');

-- Metal Stake: Ensure it is only usable during quest "A Visit to the Doctor"
UPDATE `gameobject_template` SET `Data1` = 13152 WHERE `entry` = 193025;
UPDATE `gameobject_template_addon` SET `flags` = 4 WHERE `entry` = 193025;

-- "Patches": Decrease respawn time
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `guid` = 121049;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (30995,30993,30992);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 193025;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (3099300,3099200);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(193025,1,0,0,70,0,100,0,2,0,0,0,0,45,1,1,0,0,0,0,10,121049,30993,0,1,0,0,0,0,'Metal Stake - On GO State Changed ''GO_ACTIVATED'' - Set Data 1 1 ("Patches")'),

(30995,0,0,0,38,0,100,0,1,1,0,0,0,28,58108,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Patches Chain Target - On Data Set 1 1 - Remove Aura ''Patches Chain'''),

(30993,0,0,1,11,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - On Respawn - Set Event Phase 2'),
(30993,0,1,2,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - Linked - Enable Random Movement'),
(30993,0,2,3,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - Linked - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(30993,0,3,0,61,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - Linked - Set Invincibility HP Level 1'),
(30993,0,4,0,1,2,100,0,0,0,3000,3000,0,11,58108,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - OOC - Cast ''Patches Chain'' (Event Phase 2)'),
(30993,0,5,6,38,0,100,1,1,1,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - On Data Set 1 1 - Set Event Phase 1 (No Repeat)'),
(30993,0,6,7,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - Linked - Set Active On'),
(30993,0,7,8,61,0,100,0,0,0,0,0,0,28,58108,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - Linked - Remove Aura ''Patches Chain'''),
(30993,0,8,9,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,30995,0,0,0,0,0,0,0,'"Patches" - Linked - Set Data 1 1 (Patches Chain Target)'),
(30993,0,9,10,61,0,100,0,0,0,0,0,0,12,30992,4,60000,0,0,0,8,0,0,0,0,6630.52,3167.31,659.36,2.74005,'"Patches" - Linked - Summon Creature ''Doctor Sabnok'''),
(30993,0,10,11,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - Linked - Say Line 1'),
(30993,0,11,12,61,0,100,0,0,0,0,0,0,2,2036,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - Linked - Set Faction ''Friendly'''),
(30993,0,12,0,61,0,100,0,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - Linked - Disable Random Movement'),
(30993,0,13,0,38,0,100,0,2,2,0,0,0,66,0,0,0,0,0,0,19,30992,0,0,0,0,0,0,0,'"Patches" - On Data Set 2 2 - Set Orientation (Doctor Sabnok)'),
(30993,0,14,0,38,0,100,0,3,3,0,0,0,80,3099300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - On Data Set 3 3 - Call Timed Action List'),
(30993,0,15,16,38,0,100,0,4,4,0,0,0,11,59115,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - On Data Set 4 4 - Cast ''Patches Credit'''),
(30993,0,16,0,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - Linked - Force Despawn'),

(3099300,9,0,0,0,0,100,0,3000,3000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(3099300,9,1,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Patches" - On Script - Say Line 2'),
(3099300,9,2,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,30992,0,0,0,0,0,0,0,'"Patches" - On Script - Start Attack (Doctor Sabnok)'),
(3099300,9,3,0,0,0,100,0,4000,4000,0,0,0,11,58118,0,0,0,0,0,19,30992,0,0,0,0,0,0,0,'"Patches" - On Script - Cast ''Patches Revenge'''),

(30992,0,0,1,54,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - On Just Summoned - Add ''UNIT_FLAG_IMMUNE_TO_PC'''),
(30992,0,1,0,61,0,100,0,0,0,0,0,0,53,0,30992,0,0,0,2,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - Linked - Start WP Movement'),
(30992,0,2,0,58,0,100,0,0,30992,0,0,0,80,3099200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - On WP Path Ended - Call Timed Action List'),
(30992,0,3,0,6,0,100,0,0,0,0,0,0,45,4,4,0,0,0,0,10,121049,30993,0,1,0,0,0,0,'Doctor Sabnok - On Death - Set Data 4 4 ("Patches")'),

(3099200,9,0,0,0,0,100,0,0,0,0,0,0,116,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - On Script - Set Corpse Delay'),
(3099200,9,1,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,10,121049,30993,0,1,0,0,0,0,'Doctor Sabnok - On Script - Set Data 2 2 ("Patches")'),
(3099200,9,2,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Doctor Sabnok - On Script - Set Orientation (Closest Player)'),
(3099200,9,3,0,0,0,100,0,0,0,0,0,0,5,21,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - On Script - Play Emote ''ONESHOT_APPLAUD'''),
(3099200,9,4,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - On Script - Say Line 1'),
(3099200,9,5,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - On Script - Say Line 2'),
(3099200,9,6,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - On Script - Say Line 3'),
(3099200,9,7,0,0,0,100,0,4000,4000,0,0,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - On Script - Play Emote ''ONESHOT_LAUGH'''),
(3099200,9,8,0,0,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doctor Sabnok - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(3099200,9,9,0,0,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,10,121049,30993,0,1,0,0,0,0,'Doctor Sabnok - On Script - Set Data 3 3 ("Patches")');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
