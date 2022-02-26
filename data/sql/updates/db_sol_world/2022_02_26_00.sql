-- DB update 2022_02_25_00 -> 2022_02_26_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_25_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_25_00 2022_02_26_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645887524938969201'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645887524938969201');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4944,5088);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (494400,494401,508800);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4944,0,0,1,20,0,100,0,1220,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Quest ''Captain Vimes'' Finished - Store Target ID 1 (Invoker)'),
(4944,0,1,0,61,0,100,0,0,0,0,0,0,80,494400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - Linked - Call Timed Action List'),
(4944,0,2,3,20,0,100,0,1284,0,0,0,0,64,2,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Quest ''Suspicious Hoofprints'' Finished - Store Target ID 2 (Invoker)'),
(4944,0,3,0,61,0,100,0,0,0,0,0,0,80,494401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - Linked - Call Timed Action List'),

(494400,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(494400,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Say Line 0'),
(494400,9,2,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1.93417,'Captain Garran Vimes - On Script - Set Orientation'),
(494400,9,3,0,0,0,100,0,0,0,0,0,0,50,21128,10,0,0,0,0,8,0,0,0,0,-3735.35,-4554.68,28.5526,3.55917,'Captain Garran Vimes - On Script - Summon Gameobject ''Orc Spy Report'''),
(494400,9,4,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Say Line 1'),
(494400,9,5,0,0,0,100,0,5000,5000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Set Orientation (Stored Target 1)'),
(494400,9,6,0,0,0,100,0,0,0,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Say Line 2'),
(494400,9,7,0,0,0,100,0,2000,2000,0,0,0,85,6245,2,0,0,0,0,12,1,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Invoker Cast ''Force Target - Salute'''),
(494400,9,8,0,0,0,100,0,1000,1000,0,0,0,11,6245,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Cast ''Force Target - Salute'''),
(494400,9,9,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Reset Orientation'),
(494400,9,10,0,0,0,100,0,2000,2000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(494401,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(494401,9,1,0,0,0,100,0,0,0,0,0,0,1,3,0,1,0,0,0,12,2,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Say Line 3'),
(494401,9,2,0,0,0,100,0,7000,7000,0,0,0,1,0,0,0,0,0,0,19,4948,50,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Say Line 0 (Adjutant Tesoran)'),
(494401,9,3,0,0,0,100,0,2000,2000,0,0,0,12,5088,5,0,0,0,0,8,0,0,0,0,-3717.04,-4523.46,25.8339,5.15678,'Captain Garran Vimes - On Script - Summon Creature ''Falgran Hastil'''),
(494401,9,4,0,0,0,100,0,30000,30000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Garran Vimes - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(5088,0,0,0,63,0,100,0,0,0,0,0,0,53,0,508800,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On Just Created - Start WP Movement'),
(5088,0,1,0,40,0,100,0,4,508800,0,0,0,80,508800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On WP 4 Reached - Call Timed Action List'),
(5088,0,2,0,40,0,100,0,4,508801,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On WP 4 Reached - Force Despawn'),

(508800,9,0,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,19,4944,50,0,0,0,0,0,0,'Falgran Hastil - On Script - Set Orientation (Captain Garran Vimes)'),
(508800,9,1,0,0,0,100,0,1000,1000,0,0,0,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On Script - Sheath Weapon'),
(508800,9,2,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(508800,9,3,0,0,0,100,0,2000,2000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(508800,9,4,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On Script - Say Line 0'),
(508800,9,5,0,0,0,100,0,4000,4000,0,0,0,11,6245,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On Script - Cast ''Force Target - Salute'''),
(508800,9,6,0,0,0,100,0,2000,2000,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On Script - Ready Melee Weapon'),
(508800,9,7,0,0,0,100,0,1000,1000,0,0,0,53,1,508801,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falgran Hastil - On Script - Start WP Movement');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
