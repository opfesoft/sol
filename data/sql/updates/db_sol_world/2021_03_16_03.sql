-- DB update 2021_03_16_02 -> 2021_03_16_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_16_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_16_02 2021_03_16_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1615899951227189071'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1615899951227189071');

-- Thrash 10% Chance (ID 3417)
UPDATE `smart_scripts`
SET
`event_type` = 25, `event_param1` = 0, `event_param2` = 0, `event_param3` = 0, `event_param4` = 0, `event_param5` = 0,
`action_type` = 75, `action_param1` = 3417, `action_param2` = 0, `action_param3` = 0, `action_param4` = 0, `action_param5` = 0, `action_param6` = 0,
`target_type` = 1, `target_param1` = 0, `target_param2` = 0, `target_param3` = 0, `target_param4` = 0, `target_x` = 0, `target_y` = 0, `target_z` = 0, `target_o` = 0,
`comment` = REGEXP_REPLACE(REGEXP_REPLACE(`Comment`, ' In Combat | IC ', ' On Reset '), ' Cast ', ' Add Aura ')
WHERE
`source_type` = 0 AND `action_type` = 11 AND `action_param1` = 3391 AND `event_type` = 0
AND 400000 / (`event_param3` + `event_param4`) < 15;

-- Thrash 15% Chance (ID 8876)
UPDATE `smart_scripts`
SET
`event_type` = 25, `event_param1` = 0, `event_param2` = 0, `event_param3` = 0, `event_param4` = 0, `event_param5` = 0,
`action_type` = 75, `action_param1` = 8876, `action_param2` = 0, `action_param3` = 0, `action_param4` = 0, `action_param5` = 0, `action_param6` = 0,
`target_type` = 1, `target_param1` = 0, `target_param2` = 0, `target_param3` = 0, `target_param4` = 0, `target_x` = 0, `target_y` = 0, `target_z` = 0, `target_o` = 0,
`comment` = REGEXP_REPLACE(REGEXP_REPLACE(`Comment`, ' In Combat | IC ', ' On Reset '), ' Cast ', ' Add Aura ')
WHERE
`source_type` = 0 AND `action_type` = 11 AND `action_param1` = 3391 AND `event_type` = 0
AND 400000 / (`event_param3` + `event_param4`) >= 15 AND 400000 / (`event_param3` + `event_param4`) < 20;

-- Thrash 25% Chance (ID 54913)
UPDATE `smart_scripts`
SET
`event_type` = 25, `event_param1` = 0, `event_param2` = 0, `event_param3` = 0, `event_param4` = 0, `event_param5` = 0,
`action_type` = 75, `action_param1` = 54913, `action_param2` = 0, `action_param3` = 0, `action_param4` = 0, `action_param5` = 0, `action_param6` = 0,
`target_type` = 1, `target_param1` = 0, `target_param2` = 0, `target_param3` = 0, `target_param4` = 0, `target_x` = 0, `target_y` = 0, `target_z` = 0, `target_o` = 0,
`comment` = REGEXP_REPLACE(REGEXP_REPLACE(`Comment`, ' In Combat | IC ', ' On Reset '), ' Cast ', ' Add Aura ')
WHERE
`source_type` = 0 AND `action_type` = 11 AND `action_param1` = 3391 AND `event_type` = 0
AND 400000 / (`event_param3` + `event_param4`) >= 20 AND 400000 / (`event_param3` + `event_param4`) < 25;

-- Thrash 35% Chance (ID 12787)
UPDATE `smart_scripts`
SET
`event_type` = 25, `event_param1` = 0, `event_param2` = 0, `event_param3` = 0, `event_param4` = 0, `event_param5` = 0,
`action_type` = 75, `action_param1` = 12787, `action_param2` = 0, `action_param3` = 0, `action_param4` = 0, `action_param5` = 0, `action_param6` = 0,
`target_type` = 1, `target_param1` = 0, `target_param2` = 0, `target_param3` = 0, `target_param4` = 0, `target_x` = 0, `target_y` = 0, `target_z` = 0, `target_o` = 0,
`comment` = REGEXP_REPLACE(REGEXP_REPLACE(`Comment`, ' In Combat | IC ', ' On Reset '), ' Cast ', ' Add Aura ')
WHERE
`source_type` = 0 AND `action_type` = 11 AND `action_param1` = 3391 AND `event_type` = 0
AND 400000 / (`event_param3` + `event_param4`) >= 25;

-- Special cases using other event types than "In Combat"
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (25028,25027,1520,1662) AND `source_type` = 0 AND `id` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25028,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skeletal Ravager - On Reset - Add Aura ''Thrash'''),
(25027,0,0,0,25,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frenzied Ghoul - On Reset - Add Aura ''Thrash'''),
(1520,0,0,0,25,0,100,0,0,0,0,0,0,11,54913,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rattlecage Soldier - On Reset - Add Aura ''Thrash'''),
(1662,0,0,0,25,0,100,0,0,0,0,0,0,11,54913,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Perrine - On Reset - Add Aura ''Thrash''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
