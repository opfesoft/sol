-- DB update 2021_07_17_01 -> 2021_07_19_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_17_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_17_01 2021_07_19_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1626647528360506157'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1626647528360506157');

-- Moonkin Stone Aura: Adjust position / orientation; initially despawned, spawned via event script ID 6028
UPDATE `gameobject` SET `position_x` = -2500.09, `position_y` = -1633.34, `position_z` = 91.8455, `orientation` = -0.087267, `rotation2` = 0.04362, `rotation3` = -0.999048, `spawntimesecs` = -1 WHERE `guid` = 15727;

-- Moonkin Stone Aura: Add spawn; spawned via event script ID 5991
DELETE FROM `gameobject` WHERE `guid` = 3008797;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3008797,177644,1,0,0,1,1,6326.02,92.7316,21.9514,1.15192,0,0,0.544639,0.838671,-1,100,1,0);

-- Delete obsolete gossip menu option
DELETE FROM `gossip_menu_option` WHERE `MenuID` = 3862 AND `OptionID` = 1;

-- Event scripts called via spells "Summon Lunaclaw", IDs 18974 & 19138
DELETE FROM `event_scripts` WHERE `id` IN (5991,6028);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(5991,0,9,3008797,60,0,0,0,0,0),
(5991,5,10,12138,180000,0,6343.44,138.5,22.6454,4.75296),
(6028,0,9,15727,60,0,0,0,0,0),
(6028,5,10,12138,180000,0,-2452.84,-1633.18,91.7025,3.15172);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 12138;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(12138,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lunaclaw - On Just Summoned - Set Active On'),
(12138,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Lunaclaw - Linked - Attack Invoker'),
(12138,0,2,0,25,0,100,0,0,0,0,0,0,11,8876,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lunaclaw - On Reset - Cast ''Thrash'''),
(12138,0,3,0,6,0,100,0,0,0,0,0,0,11,18986,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lunaclaw - On Just Died - Cast ''Lunaclaw Spirit''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
