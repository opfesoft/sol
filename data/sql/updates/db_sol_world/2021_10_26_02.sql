-- DB update 2021_10_26_01 -> 2021_10_26_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_26_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_26_01 2021_10_26_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635280384628826348'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635280384628826348');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 12699;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,12699,0,0,31,1,3,5307,0,0,0,0,'Spell ''Summon Screecher Spirit'' - Group 0: Spell target ''Vale Screecher'''),
(17,0,12699,0,0,36,1,0,0,0,1,0,0,'Spell ''Summon Screecher Spirit'' - Group 0: Spell target needs to be dead'),
(17,0,12699,0,1,31,1,3,5308,0,0,0,0,'Spell ''Summon Screecher Spirit'' - Group 1: Spell target ''Rogue Vale Screecher'''),
(17,0,12699,0,1,36,1,0,0,0,1,0,0,'Spell ''Summon Screecher Spirit'' - Group 1: Spell target needs to be dead');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 5307 AND `id` > 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 5308 AND `id` > 0;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8612;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5307,0,2,0,8,0,100,1,12699,0,0,0,0,12,8612,4,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Vale Screecher - On Spellhit ''Summon Screecher Spirit'' - Summon Creature ''Screecher Spirit'' (No Repeat)'),

(5308,0,1,0,8,0,100,1,12699,0,0,0,0,12,8612,4,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Rogue Vale Screecher - On Spellhit ''Summon Screecher Spirit'' - Summon Creature ''Screecher Spirit'' (No Repeat)'),

(8612,0,0,0,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Screecher Spirit - On Just Summoned - Set Active'),
(8612,0,1,2,64,0,100,1,0,0,0,0,0,33,8612,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Screecher Spirit - On Gossip Hello - Quest Credit ''Screecher Spirits'' (No Repeat)'),
(8612,0,2,0,61,0,100,0,0,0,0,0,0,41,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Screecher Spirit - Linked - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
