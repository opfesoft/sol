-- DB update 2021_05_03_00 -> 2021_05_03_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_03_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_03_00 2021_05_03_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1620077895901013397'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1620077895901013397');

UPDATE `gameobject` SET `id` = 182090, `spawntimesecs` = -1 WHERE `guid` IN (22486,22487,22488,22489,24681,24682);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (19291,19292) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19291,0,0,1,8,0,100,0,33655,0,0,0,0,33,19291,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Legion Transporter: Alpha - On Spellhit ''Dropping The Nether Modulator'' - Quest Credit ''Mission: Gateways Murketh and Shaadraz'''),
(19291,0,1,0,61,0,100,0,0,0,0,0,0,70,60,0,0,0,0,0,15,182090,50,0,0,0,0,0,0,'Legion Transporter: Alpha - Linked - Respawn GO ''Vector Coil Fire'''),

(19292,0,0,1,8,0,100,0,33655,0,0,0,0,33,19292,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Legion Transporter: Beta - On Spellhit ''Dropping The Nether Modulator'' - Quest Credit ''Mission: Gateways Murketh and Shaadraz'''),
(19292,0,1,0,61,0,100,0,0,0,0,0,0,70,60,0,0,0,0,0,15,182090,50,0,0,0,0,0,0,'Legion Transporter: Beta - Linked - Respawn GO ''Vector Coil Fire''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
