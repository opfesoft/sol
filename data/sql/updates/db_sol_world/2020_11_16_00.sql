-- DB update 2020_11_12_00 -> 2020_11_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_12_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_12_00 2020_11_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1605512404117880538'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1605512404117880538');

-- Fix and remove some Ymirheim Defenders
UPDATE `creature` SET `orientation` = 1.8339 WHERE `guid` = 120907;
UPDATE `creature_addon` SET `bytes1` = 8 WHERE `guid` IN (120907,120879);
DELETE FROM `creature` WHERE `guid` IN (120880,120881,120878,120904,120884,120882,120883,120906,120905,120899);
DELETE FROM `creature_addon` WHERE `guid` IN (120880,120881,120878,120904,120884,120882,120883,120906,120905,120899);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (31833,31832,31701,31737) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 31746 AND `source_type` = 0 AND `id` IN (1,2);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3183300,3183301,3183302,3183303,3183304,3183305,3183306,3173700,3173701,3173702,3173703,3173704,3173705) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(31746,0,1,0,1,0,100,0,0,0,5000,5000,0,49,0,0,0,0,0,0,19,31832,100,0,0,0,0,0,0,'Ymirheim Defender - OOC - Start Attack ''Kor''kron Infantry'''),
(31746,0,2,0,1,0,100,0,0,0,5000,5000,0,49,0,0,0,0,0,0,19,31701,100,0,0,0,0,0,0,'Ymirheim Defender - OOC - Start Attack ''Skybreaker Infantry'''),

(31832,0,0,0,0,0,100,0,0,0,3500,4100,0,11,15547,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kor''kron Infantry - IC - Cast ''Shoot'''),
(31832,0,1,0,0,0,100,0,4500,5500,11300,12700,0,11,29426,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kor''kron Infantry - IC - Cast ''Heroic Strike'''),
(31832,0,2,6,38,0,100,0,1,1,0,0,0,29,2,160,0,0,0,0,12,2,0,0,0,0,0,0,0,'Kor''kron Infantry - On Data 1 1 Set - Follow ''Kor''kron Squad Leader'''),
(31832,0,3,6,38,0,100,0,1,2,0,0,0,29,1,200,0,0,0,0,12,2,0,0,0,0,0,0,0,'Kor''kron Infantry - On Data 1 2 Set - Follow ''Kor''kron Squad Leader'''),
(31832,0,4,6,38,0,100,0,1,3,0,0,0,29,4,170,0,0,0,0,12,2,0,0,0,0,0,0,0,'Kor''kron Infantry - On Data 1 3 Set - Follow ''Kor''kron Squad Leader'''),
(31832,0,5,6,38,0,100,0,1,4,0,0,0,29,3,190,0,0,0,0,12,2,0,0,0,0,0,0,0,'Kor''kron Infantry - On Data 1 4 Set - Follow ''Kor''kron Squad Leader'''),
(31832,0,6,0,61,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Infantry - Linked - Remove Flags ''UNIT_STAND_STATE_SIT'' & ''UNIT_STAND_STATE_KNEEL'''),
(31832,0,7,0,7,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Infantry - On Evade - Remove Flags ''UNIT_STAND_STATE_SIT'' & ''UNIT_STAND_STATE_KNEEL'''),
(31832,0,8,9,38,0,100,0,2,2,0,0,0,11,59764,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Kor''kron Infantry - On Data 2 2 Set - Cast ''Horde Ground Troop Kill Credit'''),
(31832,0,9,0,61,0,100,0,0,0,0,0,0,41,9000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Infantry - Linked - Despawn In 9 Seconds'),
(31832,0,10,0,4,0,100,0,5000,5000,5000,5000,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Infantry - On Aggro - Set Home Position'),

(31833,0,0,0,0,0,100,0,0,0,3500,4100,0,11,15547,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - IC - Cast ''Shoot'''),
(31833,0,1,0,0,0,100,0,3500,4300,15700,16500,0,11,12551,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - IC - Cast ''Frost Shot'''),
(31833,0,2,0,0,0,100,0,4500,5500,11300,12700,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - IC - Cast ''Cleave'''),
(31833,0,3,0,19,0,100,0,13301,0,0,0,0,80,3183300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Quest ''Assault by Ground'' Accepted - Call Timed Action List'),
(31833,0,4,0,40,0,100,0,3,3183300,0,0,0,80,3183301,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On WP 3 Reached - Call Timed Action List'),
(31833,0,5,0,40,0,100,0,5,3183301,0,0,0,80,3183302,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On WP 5 Reached - Call Timed Action List'),
(31833,0,6,0,40,0,100,0,11,3183301,0,0,0,80,3183303,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On WP 11 Reached - Call Timed Action List'),
(31833,0,7,0,40,0,100,0,24,3183301,0,0,0,80,3183304,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On WP 24 Reached - Call Timed Action List'),
(31833,0,8,0,40,0,100,0,26,3183301,0,0,0,80,3183305,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On WP 26 Reached - Call Timed Action List'),
(31833,0,9,0,40,0,100,0,38,3183301,0,0,0,80,3183306,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On WP 38 Reached - Call Timed Action List'),
(31833,0,10,11,6,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Death - Force Despawn'),
(31833,0,11,12,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Death - Force Despawn Stored Target ''Kor''kron Infantry'''),
(31833,0,12,13,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Kor''kron Squad Leader - Linked - Force Despawn Stored Target ''Kor''kron Infantry'''),
(31833,0,13,14,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,5,0,0,0,0,0,0,0,'Kor''kron Squad Leader - Linked - Force Despawn Stored Target ''Kor''kron Infantry'''),
(31833,0,14,0,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,6,0,0,0,0,0,0,0,'Kor''kron Squad Leader - Linked - Force Despawn Stored Target ''Kor''kron Infantry'''),

(3183300,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set Active On'),
(3183300,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Store Invoker''s Party'),
(3183300,9,2,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Remove Gossip & Questgiver NPC Flag'),
(3183300,9,3,0,0,0,100,0,0,0,0,0,0,64,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Store Self'),
(3183300,9,4,0,0,0,100,0,0,0,0,0,0,64,3,6,0,0,0,0,11,31832,50,1,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Store 4 Units ''Kor''kron Infantry'''),
(3183300,9,5,0,0,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Send Stored Target ''Self'' To ''Kor''kron Infantry'''),
(3183300,9,6,0,0,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Send Stored Target ''Self'' To ''Kor''kron Infantry'''),
(3183300,9,7,0,0,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,12,5,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Send Stored Target ''Self'' To ''Kor''kron Infantry'''),
(3183300,9,8,0,0,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,12,6,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Send Stored Target ''Self'' To ''Kor''kron Infantry'''),
(3183300,9,9,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,12,3,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set Data 1 1 (Stored Target ''Kor''kron Infantry'')'),
(3183300,9,10,0,0,0,100,0,0,0,0,0,0,45,1,2,0,0,0,0,12,4,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set Data 1 2 (Stored Target ''Kor''kron Infantry'')'),
(3183300,9,11,0,0,0,100,0,0,0,0,0,0,45,1,3,0,0,0,0,12,5,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set Data 1 3 (Stored Target ''Kor''kron Infantry'')'),
(3183300,9,12,0,0,0,100,0,0,0,0,0,0,45,1,4,0,0,0,0,12,6,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set Data 1 4 (Stored Target ''Kor''kron Infantry'')'),
(3183300,9,13,0,0,0,100,0,3000,3000,0,0,0,53,0,3183300,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Start WP Movement'),

(3183301,9,0,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Say Line 0'),
(3183301,9,1,0,0,0,100,0,0,0,0,0,0,53,1,3183301,0,0,0,2,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Start WP Movement'),

(3183302,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Say Line 1'),
(3183302,9,1,0,0,0,100,0,0,0,0,0,0,107,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Summon Creature Group 1'),

(3183303,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Say Line 2'),
(3183303,9,1,0,0,0,100,0,0,0,0,0,0,107,2,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Summon Creature Group 2'),

(3183304,9,0,0,0,0,100,0,0,0,0,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Pause WP Movement'),
(3183304,9,1,0,0,0,100,0,500,500,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(3183304,9,2,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Kor''kron Infantry'')'),
(3183304,9,3,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Kor''kron Infantry'')'),
(3183304,9,4,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,12,5,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Kor''kron Infantry'')'),
(3183304,9,5,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,12,6,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Kor''kron Infantry'')'),
(3183304,9,6,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Say Line 3'),
(3183304,9,7,0,0,0,100,0,10000,10000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(3183304,9,8,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Kor''kron Infantry'')'),
(3183304,9,9,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Kor''kron Infantry'')'),
(3183304,9,10,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,12,5,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Kor''kron Infantry'')'),
(3183304,9,11,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,12,6,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Kor''kron Infantry'')'),
(3183304,9,12,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Say Line 4'),

(3183305,9,0,0,0,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Say Line 5'),
(3183305,9,1,0,0,0,100,0,0,0,0,0,0,107,3,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Summon Creature Group 3'),

(3183306,9,0,0,0,0,100,0,1000,1000,0,0,0,5,214,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Play Emote ''STATE_READYRIFLE'''),
(3183306,9,1,0,0,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Say Line 6'),
(3183306,9,2,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,9,31832,0,20,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Send TargetList (Kor''kron Infantry)'),
(3183306,9,3,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,9,31832,0,20,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Set Data 2 2 (Kor''kron Infantry)'),
(3183306,9,4,0,0,0,100,0,0,0,0,0,0,11,59764,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Cast ''Horde Ground Troop Kill Credit'''),
(3183306,9,5,0,0,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kor''kron Squad Leader - On Script - Despawn In 10 Seconds'),

(31701,0,0,0,0,0,100,0,0,0,3500,4100,0,11,15547,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skybreaker Infantry - In Combat - Cast ''Shoot'''),
(31701,0,1,0,0,1,100,0,4500,5500,11300,12700,0,11,29426,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skybreaker Infantry - In Combat - Cast ''Heroic Strike'''),
(31701,0,2,0,38,0,100,0,1,1,0,0,0,29,2,160,0,0,0,0,12,2,0,0,0,0,0,0,0,'Skybreaker Infantry - On Data 1 1 Set - Follow ''Skybreaker Squad Leader'''),
(31701,0,3,0,38,0,100,0,1,2,0,0,0,29,1,200,0,0,0,0,12,2,0,0,0,0,0,0,0,'Skybreaker Infantry - On Data 1 2 Set - Follow ''Skybreaker Squad Leader'''),
(31701,0,4,0,38,0,100,0,1,3,0,0,0,29,3,170,0,0,0,0,12,2,0,0,0,0,0,0,0,'Skybreaker Infantry - On Data 1 3 Set - Follow ''Skybreaker Squad Leader'''),
(31701,0,5,0,38,0,100,0,1,4,0,0,0,29,2,190,0,0,0,0,12,2,0,0,0,0,0,0,0,'Skybreaker Infantry - On Data 1 4 Set - Follow ''Skybreaker Squad Leader'''),
(31701,0,6,0,38,0,100,0,1,5,0,0,0,29,1,180,0,0,0,0,12,2,0,0,0,0,0,0,0,'Skybreaker Infantry - On Data 1 5 Set - Follow ''Skybreaker Squad Leader'''),
(31701,0,7,8,38,0,100,0,2,2,0,0,0,11,59677,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Skybreaker Infantry - On Data 2 2 Set - Cast ''Alliance Ground Troop Kill Credit'''),
(31701,0,8,0,61,0,100,0,0,0,0,0,0,41,9000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Infantry - Linked - Despawn In 9 Seconds'),
(31701,0,9,0,4,0,100,0,5000,5000,5000,5000,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Infantry - On Aggro - Set Home Position'),

(31737,0,0,0,0,0,100,0,0,0,3500,3500,0,11,15547,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - In Combat - Cast ''Shoot'''),
(31737,0,1,0,0,0,100,0,3500,4300,15700,16500,0,11,12551,64,0,0,0,0,5,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - In Combat - Cast ''Frost Shot'''),
(31737,0,2,0,0,0,100,0,4500,5500,11300,12700,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - In Combat - Cast ''Cleave'''),
(31737,0,3,0,19,0,100,0,13284,0,0,0,0,80,3173700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Quest ''Assault by Ground'' Accepted - Call Timed Action List'),
(31737,0,4,0,40,0,100,0,4,3173700,0,0,0,80,3173701,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On WP 4 Reached - Call Timed Action List'),
(31737,0,5,0,40,0,100,0,9,3173701,0,0,0,80,3173702,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On WP 9 Reached - Call Timed Action List'),
(31737,0,6,0,40,0,100,0,24,3173701,0,0,0,80,3173703,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On WP 24 Reached - Call Timed Action List'),
(31737,0,7,0,40,0,100,0,37,3173701,0,0,0,80,3173704,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On WP 37 Reached - Call Timed Action List'),
(31737,0,8,0,40,0,100,0,40,3173701,0,0,0,107,3,0,1,0,0,0,0,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On WP 40 Reached - Summon Creature Group 3'),
(31737,0,9,0,40,0,100,0,53,3173701,0,0,0,80,3173705,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On WP 53 Reached - Call Timed Action List'),
(31737,0,10,11,6,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Death - Force Despawn'),
(31737,0,11,12,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Death - Force Despawn Stored Target ''Skybreaker Infantry'''),
(31737,0,12,13,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Skybreaker Squad Leader - Linked - Force Despawn Stored Target ''Skybreaker Infantry'''),
(31737,0,13,14,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,5,0,0,0,0,0,0,0,'Skybreaker Squad Leader - Linked - Force Despawn Stored Target ''Skybreaker Infantry'''),
(31737,0,14,15,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,6,0,0,0,0,0,0,0,'Skybreaker Squad Leader - Linked - Force Despawn Stored Target ''Skybreaker Infantry'''),
(31737,0,15,0,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,7,0,0,0,0,0,0,0,'Skybreaker Squad Leader - Linked - Force Despawn Stored Target ''Skybreaker Infantry'''),

(3173700,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set Active On'),
(3173700,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Store Invoker''s Party'),
(3173700,9,2,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Remove Gossip & Questgiver NPC Flag'),
(3173700,9,3,0,0,0,100,0,0,0,0,0,0,64,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Store Self'),
(3173700,9,4,0,0,0,100,0,0,0,0,0,0,64,3,7,0,0,0,0,11,31701,50,1,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Store 5 Units ''Skybreaker Infantry'''),
(3173700,9,5,0,0,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Send Stored Target ''Self'' To ''Skybreaker Infantry'''),
(3173700,9,6,0,0,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Send Stored Target ''Self'' To ''Skybreaker Infantry'''),
(3173700,9,7,0,0,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,12,5,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Send Stored Target ''Self'' To ''Skybreaker Infantry'''),
(3173700,9,8,0,0,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,12,6,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Send Stored Target ''Self'' To ''Skybreaker Infantry'''),
(3173700,9,9,0,0,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,12,7,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Send Stored Target ''Self'' To ''Skybreaker Infantry'''),
(3173700,9,10,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,12,3,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set Data 1 1 (Stored Target ''Skybreaker Infantry'')'),
(3173700,9,11,0,0,0,100,0,0,0,0,0,0,45,1,2,0,0,0,0,12,4,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set Data 1 2 (Stored Target ''Skybreaker Infantry'')'),
(3173700,9,12,0,0,0,100,0,0,0,0,0,0,45,1,3,0,0,0,0,12,5,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set Data 1 3 (Stored Target ''Skybreaker Infantry'')'),
(3173700,9,13,0,0,0,100,0,0,0,0,0,0,45,1,4,0,0,0,0,12,6,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set Data 1 4 (Stored Target ''Skybreaker Infantry'')'),
(3173700,9,14,0,0,0,100,0,0,0,0,0,0,45,1,5,0,0,0,0,12,7,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set Data 1 5 (Stored Target ''Skybreaker Infantry'')'),
(3173700,9,15,0,0,0,100,0,3000,3000,0,0,0,53,0,3173700,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Start WP Movement'),

(3173701,9,0,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Say Line 0'),
(3173701,9,1,0,0,0,100,0,0,0,0,0,0,53,1,3173701,0,0,0,2,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Start WP Movement'),

(3173702,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Say Line 1'),
(3173702,9,1,0,0,0,100,0,0,0,0,0,0,107,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Summon Creature Group 1'),

(3173703,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Say Line 2'),
(3173703,9,1,0,0,0,100,0,0,0,0,0,0,107,2,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Summon Creature Group 2'),

(3173704,9,0,0,0,0,100,0,0,0,0,0,0,54,12000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Pause WP Movement'),
(3173704,9,1,0,0,0,100,0,500,500,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(3173704,9,2,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,3,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,4,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,12,5,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,5,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,12,6,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,6,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,12,7,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,7,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Say Line 3'),
(3173704,9,8,0,0,0,100,0,10000,10000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(3173704,9,9,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,12,3,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,10,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,12,4,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,11,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,12,5,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,12,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,12,6,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,13,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,12,7,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Remove ''UNIT_STAND_STATE_KNEEL'' (Stored Target ''Skybreaker Infantry'')'),
(3173704,9,14,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Say Line 4'),

(3173705,9,0,0,0,0,100,0,1000,1000,0,0,0,5,214,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Play Emote ''STATE_READYRIFLE'''),
(3173705,9,1,0,0,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Say Line 5'),
(3173705,9,2,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,9,31701,0,20,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Send TargetList (Skybreaker Infantry)'),
(3173705,9,3,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,9,31701,0,20,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Set Data 2 2 (Skybreaker Infantry)'),
(3173705,9,4,0,0,0,100,0,0,0,0,0,0,11,59677,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Cast ''Alliance Ground Troop Kill Credit'''),
(3173705,9,5,0,0,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skybreaker Squad Leader - On Script - Despawn In 10 Seconds');

DELETE FROM `creature_text` WHERE `CreatureID` IN (31737,31833);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(31737,0,0,'On the move, men!',12,0,100,0,0,0,32409,0,'Skybreaker Squad Leader'),
(31737,1,0,'Heads up!',14,0,100,0,0,0,32398,0,'Skybreaker Squad Leader'),
(31737,2,0,'Time for some blood, men!',14,0,100,0,0,0,32416,0,'Skybreaker Squad Leader'),
(31737,3,0,'Nice work! We can only rest a moment.',12,0,100,0,0,0,32352,0,'Skybreaker Squad Leader'),
(31737,4,0,'On your feet, men! Move, move move!',12,0,100,0,0,0,32411,0,'Skybreaker Squad Leader'),
(31737,5,0,'Thanks for keeping us covered back there! We''ll hold the gate while we wait for reinforcements.',12,0,100,0,0,0,32353,0,'Skybreaker Squad Leader'),

(31833,0,0,'Alright boys, let''s do this!',12,0,100,0,0,0,32351,0,'Kor''kron Squad Leader'),
(31833,1,0,'Incoming!',14,0,100,0,0,0,32407,0,'Kor''kron Squad Leader'),
(31833,2,0,'For the horde!',14,0,100,0,0,0,32418,0,'Kor''kron Squad Leader'),
(31833,3,0,'Quickly, catch your breaths before we press to the gate!',12,0,100,0,0,0,32410,0,'Kor''kron Squad Leader'),
(31833,4,0,'On your feet, boys! Move, move move!',12,0,100,0,0,0,32405,0,'Kor''kron Squad Leader'),
(31833,5,0,'On your feet, boys!',14,0,100,0,0,0,32399,0,'Kor''kron Squad Leader'),
(31833,6,0,'You''ve got some fight in you! Blood and honor, friend!',12,0,100,0,0,0,32412,0,'Kor''kron Squad Leader');

DELETE FROM `creature_summon_groups` WHERE `summonerId` IN (31833,31737);
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(31833,0,1,31746,7452.86,1848.66,403.43,4.41001,4,60000),
(31833,0,1,31746,7437.8,1830.68,416.046,0.793254,4,60000),
(31833,0,1,31746,7448.97,1829.15,405.966,1.35089,4,60000),
(31833,0,2,31746,7411.18,1815.32,426.975,1.96581,4,60000),
(31833,0,2,31746,7400.26,1807.37,430.156,1.51368,4,60000),
(31833,0,2,31746,7418.56,1834.57,426.048,1.6729,4,60000),
(31833,0,3,31746,7320.67,1710.2,464.93,2.12058,4,60000),
(31833,0,3,31746,7294.07,1722.61,469.051,0.345577,4,60000),
(31833,0,3,31746,7293.69,1735.55,468.782,0.200278,4,60000),

(31737,0,1,31746,7210.69,1550.28,374.405,1.14666,4,60000),
(31737,0,1,31746,7228.6,1590.09,379.73,5.08936,4,60000),
(31737,0,1,31746,7228.32,1597.87,380.158,5.07522,4,60000),
(31737,0,1,31746,7237.66,1597.79,379.932,4.70844,4,60000),
(31737,0,1,31746,7240.67,1582.62,362.23,3.40625,4,60000),
(31737,0,2,31746,7326.36,1622.48,410.893,3.58296,4,60000),
(31737,0,2,31746,7307.36,1635.15,440.141,4.87887,4,60000),
(31737,0,2,31746,7291.22,1634.52,435.014,5.06736,4,60000),
(31737,0,3,31746,7215.31,1661.69,451.205,6.04276,4,60000),
(31737,0,3,31746,7219.9,1668.14,451.418,5.8388,4,60000),
(31737,0,3,31746,7223.49,1673.29,452.479,5.78773,4,60000),
(31737,0,3,31746,7277.57,1656.87,434.679,3.48652,4,60000);

DELETE FROM `waypoints` WHERE `entry` IN (3183300,3183301,3173700,3173701);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(3183300,1,7503.22,1807.51,356.196,'Kor''kron Squad Leader (Path 1)'),
(3183300,2,7500.23,1813.19,355.431,NULL),
(3183300,3,7496.28,1820.7,356.883,NULL),

(3183301,1,7491.93,1829.69,362.299,'Kor''kron Squad Leader (Path 2)'),
(3183301,2,7484.5,1834.73,368.363,NULL),
(3183301,3,7477.58,1839.43,373.66,NULL),
(3183301,4,7469.73,1840.57,378.96,NULL),
(3183301,5,7462.56,1841.61,384.7,NULL),
(3183301,6,7453.96,1840.15,391.675,NULL),
(3183301,7,7444.18,1840.93,398.101,NULL),
(3183301,8,7436.27,1845.73,403.43,NULL),
(3183301,9,7429.27,1849.97,408.592,NULL),
(3183301,10,7422.99,1849.37,413.366,NULL),
(3183301,11,7418.6,1848.96,416.636,NULL),
(3183301,12,7412.98,1845.67,421.026,NULL),
(3183301,13,7410.59,1839.59,423.787,NULL),
(3183301,14,7407.01,1830.46,426.816,NULL),
(3183301,15,7403.45,1821.38,428.551,NULL),
(3183301,16,7396.56,1813.46,430.886,NULL),
(3183301,17,7389.21,1805,433.661,NULL),
(3183301,18,7381.32,1795.93,436.885,NULL),
(3183301,19,7372.59,1785.89,440.497,NULL),
(3183301,20,7365.17,1777.36,443.647,NULL),
(3183301,21,7357.21,1768.2,446.979,NULL),
(3183301,22,7350.4,1760.37,449.604,NULL),
(3183301,23,7342.51,1751.3,452.312,NULL),
(3183301,24,7334.47,1742.05,454.717,NULL),
(3183301,25,7322.98,1738.97,458.61,NULL),
(3183301,26,7312.76,1736.24,463.04,NULL),
(3183301,27,7305.44,1735.44,465.893,NULL),
(3183301,28,7295.47,1734.34,468.413,NULL),
(3183301,29,7284.33,1733.12,470.434,NULL),
(3183301,30,7273.9,1731.97,472.119,NULL),
(3183301,31,7263.81,1730.87,473.667,NULL),
(3183301,32,7256.18,1730.03,474.196,NULL),
(3183301,33,7247.82,1729.11,474.078,NULL),
(3183301,34,7240.65,1728.33,474.561,NULL),
(3183301,35,7233.19,1725.29,474.865,NULL),
(3183301,36,7224.97,1721.97,475.823,NULL),
(3183301,37,7216.86,1718.69,476.293,NULL),
(3183301,38,7208.49,1718.36,476.844,NULL),

(3173700,1,7268.3,1511.7,321.05,'Skybreaker Squad Leader (Path 1)'),
(3173700,2,7265.45,1517.93,321.661,NULL),
(3173700,3,7257.35,1523.39,323.525,NULL),
(3173700,4,7258.35,1538.76,329.182,NULL),

(3173701,1,7260.61,1545.75,333.194,'Skybreaker Squad Leader (Path 2)'),
(3173701,2,7262.59,1551.86,336.705,NULL),
(3173701,3,7264.49,1557.75,339.351,NULL),
(3173701,4,7266.29,1563.3,341.177,NULL),
(3173701,5,7260.6,1569.49,345.031,NULL),
(3173701,6,7253.57,1577.14,352.198,NULL),
(3173701,7,7246.13,1585.23,358.475,NULL),
(3173701,8,7239.24,1582.89,363.204,NULL),
(3173701,9,7232.23,1580.5,367.908,NULL),
(3173701,10,7226.53,1580.85,371.507,NULL),
(3173701,11,7220.87,1581.2,375.593,NULL),
(3173701,12,7217.84,1588.22,378.433,NULL),
(3173701,13,7218.28,1592.98,379.275,NULL),
(3173701,14,7218.7,1597.63,379.207,NULL),
(3173701,15,7225.65,1598.97,379.672,NULL),
(3173701,16,7232.75,1600.35,380.99,NULL),
(3173701,17,7241,1601.95,381.76,NULL),
(3173701,18,7247.93,1606.87,383.289,NULL),
(3173701,19,7253.09,1609.32,383.855,NULL),
(3173701,20,7258.64,1611.95,383.28,NULL),
(3173701,21,7265.35,1610.99,382.571,NULL),
(3173701,22,7275.13,1609.36,383.285,NULL),
(3173701,23,7285.82,1607.56,387.273,NULL),
(3173701,24,7293.15,1609.21,391.745,NULL),
(3173701,25,7302.02,1611.68,396.608,NULL),
(3173701,26,7312.25,1614.52,401.023,NULL),
(3173701,27,7321.1,1616.98,405.628,NULL),
(3173701,28,7328.37,1620.94,411.159,NULL),
(3173701,29,7336.06,1625.12,417.073,NULL),
(3173701,30,7342.12,1628.42,421.849,NULL),
(3173701,31,7346.79,1633.76,426.629,NULL),
(3173701,32,7349.21,1638.17,429.013,NULL),
(3173701,33,7347.55,1644.92,430.406,NULL),
(3173701,34,7341.73,1644.33,430.46,NULL),
(3173701,35,7333.02,1645.17,431.515,NULL),
(3173701,36,7322.69,1646.17,432.692,NULL),
(3173701,37,7312.48,1647.15,433.445,NULL),
(3173701,38,7303.31,1648.04,434.396,NULL),
(3173701,39,7296.32,1651.26,434.905,NULL),
(3173701,40,7289.32,1654.49,435.26,NULL),
(3173701,41,7282.68,1658.2,434.739,NULL),
(3173701,42,7275.41,1658.34,434.989,NULL),
(3173701,43,7263.73,1652.36,434.161,NULL),
(3173701,44,7252.81,1649.82,433.605,NULL),
(3173701,45,7244.95,1654.55,435.348,NULL),
(3173701,46,7237.35,1659.13,438.996,NULL),
(3173701,47,7227.83,1660.01,443.231,NULL),
(3173701,48,7218.87,1660.85,448.636,NULL),
(3173701,49,7210.51,1661.63,454.238,NULL),
(3173701,50,7201.97,1662.42,458.887,NULL),
(3173701,51,7199.34,1672.09,463.384,NULL),
(3173701,52,7196.95,1680.9,467.002,NULL),
(3173701,53,7194.53,1689.82,469.482,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
