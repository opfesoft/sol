-- DB update 2021_07_01_00 -> 2021_07_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_01_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_01_00 2021_07_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1625229246025063075'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1625229246025063075');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 2080;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (208000,208001,208002);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2080,0,0,0,20,0,100,0,997,0,0,0,0,80,208000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Quest ''Denalan''s Earth'' Rewarded - Call Timed Action List'),
(2080,0,1,0,20,0,100,0,931,0,0,0,0,80,208001,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Quest ''The Shimmering Frond'' Rewarded - Call Timed Action List'),
(2080,0,2,0,20,0,100,0,930,0,0,0,0,80,208002,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Quest ''The Glowing Fruit'' Rewarded - Call Timed Action List'),
(2080,0,3,0,37,0,100,0,930,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On AI Init - Set React State ''Passive'''),

(208000,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(208000,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Denalan - On Script - Say Line 0'),
(208000,9,2,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Set Run Off'),
(208000,9,3,0,0,0,100,0,5000,5000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,9505.41,718.983,1256.22,0,'Denalan - On Script - Move To Position'),
(208000,9,4,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.71669,'Denalan - On Script - Set Orientation'),
(208000,9,5,0,0,0,100,0,1000,1000,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Play Emote ''ONESHOT_KNEEL'''),
(208000,9,6,0,0,0,100,0,5000,5000,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Denalan - On Script - Set Orientation (Invoker)'),
(208000,9,7,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Denalan - On Script - Say Line 1'),
(208000,9,8,0,0,0,100,0,5000,5000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,9506.92,713.766,1255.89,0,'Denalan - On Script - Move To Position'),
(208000,9,9,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.279253,'Denalan - On Script - Set Orientation'),
(208000,9,10,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(208000,9,11,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Set Run On'),

(208001,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(208001,9,1,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Say Line 2'),
(208001,9,2,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,9505.41,718.983,1256.22,0,'Denalan - On Script - Move To Position'),
(208001,9,3,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.71669,'Denalan - On Script - Set Orientation'),
(208001,9,4,0,0,0,100,0,1000,1000,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Play Emote ''ONESHOT_KNEEL'''),
(208001,9,5,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Say Line 3'),
(208001,9,6,0,0,0,100,0,5000,5000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,9506.92,713.766,1255.89,0,'Denalan - On Script - Move To Position'),
(208001,9,7,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.279253,'Denalan - On Script - Set Orientation'),
(208001,9,8,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(208001,9,9,0,0,0,100,0,1000,1000,0,0,0,70,60,0,0,0,0,0,14,67984,7510,0,0,0,0,0,0,'Denalan - On Script - Respawn Gameobject ''Sprouted Frond'''),
(208001,9,10,0,0,0,100,0,0,0,0,0,0,70,60,0,0,0,0,0,14,42936,7510,0,0,0,0,0,0,'Denalan - On Script - Respawn Gameobject ''Sprouted Frond'''),
(208001,9,11,0,0,0,100,0,0,0,0,0,0,70,60,0,0,0,0,0,14,30276,7510,0,0,0,0,0,0,'Denalan - On Script - Respawn Gameobject ''Sprouted Frond'''),

(208002,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(208002,9,1,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Set Run Off'),
(208002,9,2,0,0,0,100,0,2000,2000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Say Line 4'),
(208002,9,3,0,0,0,100,0,3000,3000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Say Line 5'),
(208002,9,4,0,0,0,100,0,2000,2000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,9506.5,720.662,1256.14,0,'Denalan - On Script - Move To Position'),
(208002,9,5,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.71669,'Denalan - On Script - Set Orientation'),
(208002,9,6,0,0,0,100,0,1000,1000,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Play Emote ''ONESHOT_KNEEL'''),
(208002,9,7,0,0,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Say Line 6'),
(208002,9,8,0,0,0,100,0,5000,5000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,9506.92,713.766,1255.89,0,'Denalan - On Script - Move To Position'),
(208002,9,9,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.279253,'Denalan - On Script - Set Orientation'),
(208002,9,10,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(208002,9,11,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Denalan - On Script - Set Run On'),
(208002,9,12,0,0,0,100,0,0,0,0,0,0,12,3569,4,20000,0,0,0,8,0,0,0,0,9505.13,722.011,1255.94,0.0244875,'Denalan - On Script - Summon Creature ''Bogling'''),
(208002,9,13,0,0,0,100,0,0,0,0,0,0,12,3569,4,20000,0,0,0,8,0,0,0,0,9504.09,720.294,1255.94,1.00709,'Denalan - On Script - Summon Creature ''Bogling'''),
(208002,9,14,0,0,0,100,0,0,0,0,0,0,12,3569,4,20000,0,0,0,8,0,0,0,0,9504.13,721.459,1255.94,6.24727,'Denalan - On Script - Summon Creature ''Bogling''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
