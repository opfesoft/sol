-- DB update 2022_01_03_00 -> 2022_01_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_03_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_03_00 2022_01_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641311656280601297'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641311656280601297');

DELETE FROM `spell_script_names` WHERE `spell_id` IN (50992,51009);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(50992,'spell_gen_20pct_count_pct_from_max_hp'),
(51009,'spell_gen_soul_deflection');

DELETE FROM `spell_proc_event` WHERE `entry` = 51009;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`)
VALUES
(51009,0,0,0,0,0,69972,3,0,100,0);

UPDATE `creature_template` SET `unit_class` = 2, `faction` = 2005 WHERE `entry` = 28189;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-101303,26170,26203,25301,25250,25251);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2617000,2617001,2617002);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-101303,0,0,1,62,0,100,0,9417,0,0,0,0,53,0,26170,0,0,0,1,1,0,0,0,0,0,0,0,0,'Thassarian - On Gossip 0 Selected - Start WP Movement'),
(-101303,0,1,2,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - Linked - Set Active On'),
(-101303,0,2,3,61,0,100,0,0,0,0,0,0,2,2004,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - Linked - Set Faction ''Valiance Expedition'''),
(-101303,0,3,0,61,0,100,0,0,0,0,0,0,11,50995,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - Linked - Cast ''Empowered Blood Presence'''),
(-101303,0,4,5,40,0,100,0,3,0,0,0,0,54,86400000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On WP 3 Reached - Pause WP Movement'),
(-101303,0,5,0,61,0,100,0,0,0,0,0,0,80,2617000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - Linked - Call Timed Action List'),
(-101303,0,6,7,38,0,100,0,4,4,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Data Set 4 4 - Say Line 0'),
(-101303,0,7,8,61,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - Linked - Set Run On'),
(-101303,0,8,0,61,0,100,0,0,0,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - Linked - Resume WP Movement'),
(-101303,0,9,10,40,0,100,0,4,0,0,0,0,54,86400000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On WP 4 Reached - Pause WP Movement'),
(-101303,0,10,0,61,0,100,0,0,0,0,0,0,80,2617001,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - Linked - Call Timed Action List'),
(-101303,0,11,0,38,0,100,0,6,6,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Data Set 6 6 - Resume WP Movement'),
(-101303,0,12,13,40,0,100,0,5,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.31,'Thassarian - On WP 5 Reached - Set Orientation'),
(-101303,0,13,0,61,0,100,0,0,0,0,0,0,80,2617002,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - Linked - Call Timed Action List'),
(-101303,0,14,0,11,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Respawn - Remove ''UNIT_STAND_STATE_KNEEL'''),
(-101303,0,15,16,6,0,100,0,0,0,0,0,0,6,12019,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Thassarian - On Death - Fail Quest ''Last Rites'''),
(-101303,0,16,17,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Thassarian - Linked - Force Despawn (Stored Target 1)'),
(-101303,0,17,18,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - Linked - Force Despawn (Stored Target 2)'),
(-101303,0,18,19,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Thassarian - Linked - Force Despawn (Stored Target 3)'),
(-101303,0,19,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Thassarian - Linked - Force Despawn (Stored Target 4)'),

(2617000,9,0,0,0,0,100,0,0,0,0,0,0,12,26203,8,0,0,0,0,8,0,0,0,0,3730.31,3518.69,473.324,1.562,'Thassarian - On Script - Summon Creature ''Image of the Lich King'''),
(2617000,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,19,26203,0,0,0,0,0,0,0,'Thassarian - On Script - Store Target 1 (Image of the Lich King)'),
(2617000,9,2,0,0,0,100,0,0,0,0,0,0,12,25301,8,0,0,0,0,8,0,0,0,0,3747.23,3614.94,473.321,4.462,'Thassarian - On Script - Summon Creature ''Counselor Talbot'''),
(2617000,9,3,0,0,0,100,0,0,0,0,0,0,64,2,0,0,0,0,0,19,25301,0,0,0,0,0,0,0,'Thassarian - On Script - Store Target 2 (Counselor Talbot)'),
(2617000,9,4,0,0,0,100,0,22000,22000,0,0,0,36,28189,1,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Update Template ''Prince Valanar'' (Stored Target 2)'),
(2617000,9,5,0,0,0,100,0,500,500,0,0,0,90,8,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target 2)'),
(2617000,9,6,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'' (Stored Target 2)'),
(2617000,9,7,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 0 (Stored Target 2)'),
(2617000,9,8,0,0,0,100,0,8000,8000,0,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 0 (Stored Target 1)'),
(2617000,9,9,0,0,0,100,0,12000,12000,0,0,0,1,1,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 1 (Stored Target 2)'),
(2617000,9,10,0,0,0,100,0,5000,5000,0,0,0,12,25250,8,0,0,0,0,8,0,0,0,0,3745.53,3615.66,473.322,4.4478,'Thassarian - On Script - Summon Creature ''General Arlos'''),
(2617000,9,11,0,0,0,100,0,0,0,0,0,0,64,3,0,0,0,0,0,19,25250,0,0,0,0,0,0,0,'Thassarian - On Script - Store Target 3 (General Arlos)'),
(2617000,9,12,0,0,0,100,0,0,0,0,0,0,12,25251,8,0,0,0,0,8,0,0,0,0,3749.65,3614.96,473.323,4.52496,'Thassarian - On Script - Summon Creature ''Leryssa'''),
(2617000,9,13,0,0,0,100,0,0,0,0,0,0,64,4,0,0,0,0,0,19,25251,0,0,0,0,0,0,0,'Thassarian - On Script - Store Target 4 (Leryssa)'),

(2617001,9,0,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 1'),
(2617001,9,1,0,0,0,100,0,2000,2000,0,0,0,91,8,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target 2)'),
(2617001,9,2,0,0,0,100,0,3000,3000,0,0,0,45,3,3,0,0,0,0,12,1,0,0,0,0,0,0,0,'Thassarian - On Script - Set Data 3 3 (Stored Target 1)'),
(2617001,9,3,0,0,0,100,0,18000,18000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 2'),
(2617001,9,4,0,0,0,100,0,10000,10000,0,0,0,1,2,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 2 (Stored Target 2)'),
(2617001,9,5,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 2 (Stored Target 1)'),
(2617001,9,6,0,0,0,100,0,0,0,0,0,0,41,14000,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Thassarian - On Script - Force Despawn (Stored Target 1)'),
(2617001,9,7,0,0,0,100,0,13000,13000,0,0,0,1,3,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 3 (Stored Target 2)'),
(2617001,9,8,0,0,0,100,0,2000,2000,0,0,0,45,5,5,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Set Data 5 5 (Stored Target 2)'),
(2617001,9,9,0,0,0,100,0,500,500,0,0,0,49,0,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Start Attack (Stored Target 2)'),

(2617002,9,0,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 0 (Stored Target 3)'),
(2617002,9,1,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 1 (Stored Target 3)'),
(2617002,9,2,0,0,0,100,0,0,0,0,0,0,28,0,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Thassarian - On Script - Remove All Auras (Stored Target 3)'),
(2617002,9,3,0,0,0,100,0,0,0,0,0,0,90,7,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Thassarian - On Script - Set ''UNIT_STAND_STATE_DEAD'' (Stored Target 3)'),
(2617002,9,4,0,0,0,100,0,0,0,0,0,0,28,0,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Thassarian - On Script - Remove All Auras (Stored Target 4)'),
(2617002,9,5,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 0 (Stored Target 4)'),
(2617002,9,6,0,0,0,100,0,0,0,0,0,0,45,7,7,0,0,0,0,12,4,0,0,0,0,0,0,0,'Thassarian - On Script - Set Data 7 7 (Stored Target 4)'),
(2617002,9,7,0,0,0,100,0,2000,2000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 3'),
(2617002,9,8,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(2617002,9,9,0,0,0,100,0,7000,7000,0,0,0,1,1,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 1 (Stored Target 4)'),
(2617002,9,10,0,0,0,100,0,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 4'),
(2617002,9,11,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 2 (Stored Target 4)'),
(2617002,9,12,0,0,0,100,0,10000,10000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 5'),
(2617002,9,13,0,0,0,100,0,9000,9000,0,0,0,1,3,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 3 (Stored Target 4)'),
(2617002,9,14,0,0,0,100,0,9000,9000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Script - Say Line 6'),
(2617002,9,15,0,0,0,100,0,60000,60000,0,0,0,41,0,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Thassarian - On Script - Force Despawn (Stored Target 2)'),
(2617002,9,16,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Thassarian - On Script - Force Despawn (Stored Target 3)'),
(2617002,9,17,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Thassarian - On Script - Force Despawn (Stored Target 4)'),
(2617002,9,18,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Script - Force Despawn'),

(25301,0,0,1,54,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Counselor Talbot - On Just Summoned - Disable Event Phase Reset'),
(25301,0,1,2,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Counselor Talbot - Linked - Set Event Phase 1'),
(25301,0,2,3,61,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Counselor Talbot - Linked - Remove All NPC Flags'),
(25301,0,3,4,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Counselor Talbot - Linked - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(25301,0,4,5,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Counselor Talbot - Linked - Set Run Off'),
(25301,0,5,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3738,3568.88,477.433,0,'Counselor Talbot - Linked - Move To Position 1'),
(25301,0,6,0,38,1,100,0,5,5,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Counselor Talbot - On Data Set 5 5 - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(25301,0,7,8,6,1,100,0,0,0,0,0,0,45,6,6,0,0,0,0,19,26170,0,0,0,0,0,0,0,'Counselor Talbot - On Death - Set Data 6 6 (Thassarian)'),
(25301,0,8,0,61,0,100,0,0,0,0,0,0,33,28189,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Counselor Talbot - Linked - Kill Credit ''Prince Valanar'''),
(25301,0,9,0,0,1,100,0,0,0,3000,4000,0,11,51016,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Counselor Talbot - IC - Cast ''Vampiric Bolt'''),
(25301,0,10,0,0,1,100,0,4000,6000,4000,6000,0,11,50992,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Counselor Talbot - IC - Cast ''Soul Blast'''),
(25301,0,11,0,0,1,100,0,10000,20000,10000,20000,0,11,51009,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Counselor Talbot - IC - Cast ''Soul Deflection'''),

(26203,0,0,1,54,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of the Lich King - On Just Summoned - Set Run Off'),
(26203,0,1,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3737.37,3564.84,477.433,0,'Image of the Lich King - Linked - Move To Position 1'),
(26203,0,2,3,38,0,100,0,3,3,0,0,0,66,0,0,0,0,0,0,19,26170,50,0,0,0,0,0,0,'Image of the Lich King - On Data Set 3 3 - Set Orientation (Thassarian)'),
(26203,0,3,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of the Lich King - Linked - Say Line 1'),

(25250,0,0,1,54,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Arlos - On Just Summoned - Remove All NPC Flags'),
(25250,0,1,2,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Arlos - Linked - Set Run Off'),
(25250,0,2,3,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3735.57,3572.42,477.441,0,'General Arlos - Linked - Move To Position 1'),
(25250,0,3,0,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Arlos - Linked - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(25250,0,4,0,34,0,100,0,8,1,0,0,0,11,46957,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'General Arlos - On Position 1 Reached - Cast ''Cosmetic - Stun (Permanent)'''),

(25251,0,0,1,54,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leryssa - On Just Summoned - Remove All NPC Flags'),
(25251,0,1,2,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leryssa - Linked - Set Run Off'),
(25251,0,2,3,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3741.97,3571.44,477.441,0,'Leryssa - Linked - Move To Position 1'),
(25251,0,3,0,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leryssa - Linked - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(25251,0,4,5,34,0,100,0,8,1,0,0,0,11,46957,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leryssa - On Point 1 Reached - Cast ''Cosmetic - Stun (Permanent)'''),
(25251,0,5,0,61,0,100,0,0,0,0,0,0,45,4,4,0,0,0,0,19,26170,50,0,0,0,0,0,0,'Leryssa - Linked - Set Data 4 4 (Thassarian)'),
(25251,0,6,7,38,0,100,0,7,7,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leryssa - On Data Set 7 7 - Set Run On'),
(25251,0,7,0,61,0,100,0,0,0,0,0,0,69,2,0,0,0,0,0,8,0,0,0,0,3722.11,3564.2,477.441,0,'Leryssa - Linked - Move To Position 2'),
(25251,0,8,0,34,0,100,0,8,2,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Leryssa - On Position 2 Reached - Set ''UNIT_STAND_STATE_KNEEL''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
