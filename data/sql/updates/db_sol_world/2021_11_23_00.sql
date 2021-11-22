-- DB update 2021_11_19_01 -> 2021_11_23_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_19_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_19_01 2021_11_23_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637622800247129655'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637622800247129655');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 7774;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (777400,777401);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7774,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Respawn - Disable Event Phase Reset'),
(7774,0,1,2,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Set Phase 0'),
(7774,0,2,0,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7774,0,3,4,19,0,100,0,2845,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Quest ''Wandering Shay'' Accepted - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(7774,0,4,5,61,0,100,0,0,0,0,0,0,41,900000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Force Despawn'),
(7774,0,5,6,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Store Target List (Invoker)'),
(7774,0,6,7,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7774,0,7,8,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Say Line 0'),
(7774,0,8,9,61,0,100,0,0,0,0,0,0,29,1,180,0,0,0,0,12,1,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Start Follow'),
(7774,0,9,10,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Set Phase 1'),
(7774,0,10,11,61,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Set Faction ''Escortee'''),
(7774,0,11,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Set Active On'),
(7774,0,12,0,6,0,100,0,0,0,0,0,0,6,2845,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Death - Fail Quest'),
(7774,0,13,0,1,1,100,0,20000,35000,40000,70000,0,80,777400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - OOC - Call Timed Action List (Phase 1)'),
(7774,0,14,15,8,2,100,0,11402,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Spellhit ''Shay''s Bell'' - Set Phase 1 (Phase 2)'),
(7774,0,15,16,61,0,100,0,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Disable Random Movement'),
(7774,0,16,17,61,0,100,0,0,0,0,0,0,29,1,180,0,0,0,0,12,1,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Start Follow'),
(7774,0,17,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Shay Leafrunner - Linked - Say Line 1'),
(7774,0,18,0,75,1,100,1,0,7765,10,0,0,80,777401,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - Within 10y (Rockbiter) - Call Timed Action List (Phase 1, No Repeat)'),
(7774,0,19,0,231,1,100,0,50,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Follow Target Lost - Force Despawn (Phase 1)'),
(7774,0,20,0,4,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Aggro - Set Home Position'),

(777400,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Set Phase 2'),
(777400,9,1,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Set Home Position'),
(777400,9,2,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Stop Follow'),
(777400,9,3,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Say Line 2'),
(777400,9,4,0,0,0,100,0,2000,2000,0,0,0,89,20,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Enable Random Movement'),
(777400,9,5,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Say Line 3'),

(777401,9,0,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Say Line 4'),
(777401,9,1,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Set Home Position'),
(777401,9,2,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Stop Follow'),
(777401,9,3,0,0,0,100,0,0,0,0,0,0,26,2845,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Reward Quest ''Wandering Shay'''),
(777401,9,4,0,0,0,100,0,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Set Phase 3'),
(777401,9,5,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,19,7765,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Say Line 0 (Rockbiter)'),
(777401,9,6,0,0,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shay Leafrunner - On Script - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
