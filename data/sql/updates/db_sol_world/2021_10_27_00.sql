-- DB update 2021_10_26_02 -> 2021_10_27_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_26_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_26_02 2021_10_27_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635355952412389987'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635355952412389987');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6492;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6492,0,0,1,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - On Reset - Set Phase 1'),
(6492,0,1,2,61,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Set React State ''Passive'''),
(6492,0,2,3,61,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Set Invincibility HP Level 1'),
(6492,0,3,0,61,0,100,0,0,0,0,0,0,11,9093,34,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Cast ''Rift Spawn Invisibility'''),
(6492,0,4,0,0,1,100,0,0,0,5000,5000,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - IC - Evade (Phase 1)'),
(6492,0,5,6,8,0,100,0,9095,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - On Spellhit ''Cantation of Manifestation'' - Set Phase 2'),
(6492,0,6,7,61,0,100,0,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Set React State ''Aggressive'''),
(6492,0,7,8,61,0,100,0,0,0,0,0,0,28,9093,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Remove Aura ''Rift Spawn Invisibility'''),
(6492,0,8,9,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Say line 0'),
(6492,0,9,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Start Attack (Invoker)'),
(6492,0,10,11,2,2,100,1,0,1,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - On Health Between 0-1% - Set Phase 3 (No Repeat, Phase 2)'),
(6492,0,11,12,61,0,100,0,0,0,0,0,0,11,9032,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Cast ''Self Stun - 30 seconds'''),
(6492,0,12,0,61,0,100,0,0,0,0,0,0,41,30000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Force Despawn'),
(6492,0,13,0,60,4,100,0,29000,29000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - On Update - Say Line 1 (Phase 3)'),
(6492,0,14,15,38,4,100,0,1,0,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - On Data Set 1 0 - Set Phase 4 (Phase 3)'),
(6492,0,15,16,61,0,100,0,0,0,0,0,0,11,9010,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Cast ''Create Filled Containment Coffer'''),
(6492,0,16,0,61,0,100,0,0,0,0,0,0,41,2500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rift Spawn - Linked - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
