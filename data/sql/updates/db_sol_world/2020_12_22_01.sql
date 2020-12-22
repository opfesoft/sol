-- DB update 2020_12_22_00 -> 2020_12_22_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_22_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_22_00 2020_12_22_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608640604938206967'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608640604938206967');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1057,6412) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1057,0,0,0,25,0,100,1,0,0,0,0,0,11,8853,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dragonmaw Bonewarder - On Reset - Cast ''Summon Skeleton'' (No Repeat)'),
(1057,0,1,0,4,0,100,1,0,0,0,0,0,11,13787,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dragonmaw Bonewarder - On Aggro - Cast ''Demon Armor'' (No Repeat)'),
(1057,0,2,0,0,0,100,0,3000,4000,3000,4000,0,11,6205,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dragonmaw Bonewarder - In Combat - Cast ''Curse of Weakness'''),
(1057,0,3,0,0,0,100,0,0,0,5000,6000,0,11,707,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dragonmaw Bonewarder - In Combat - Cast ''Immolate'''),

(6412,0,0,0,6,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skeleton - On Death - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
