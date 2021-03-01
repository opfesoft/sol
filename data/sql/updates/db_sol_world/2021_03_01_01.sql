-- DB update 2021_03_01_00 -> 2021_03_01_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_01_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_01_00 2021_03_01_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1614587614479651799'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1614587614479651799');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (14455,14458,14460,14462);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (14455,14458,14460,14462);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (179664,179665,179666,179667);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(179664,1,0,0,60,0,100,0,0,5000,121000,150000,0,12,14462,4,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Earth Elemental Rift - On Update - Summon Creature ''Thundering Invader'''),
(179665,1,0,0,60,0,100,0,0,5000,121000,150000,0,12,14458,4,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Water Elemental Rift - On Update - Summon Creature ''Watery Invader'''),
(179666,1,0,0,60,0,100,0,0,5000,121000,150000,0,12,14460,4,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Fire Elemental Rift - On Update - Summon Creature ''Blazing Invader'''),
(179667,1,0,0,60,0,100,0,0,5000,121000,150000,0,12,14455,4,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Air Elemental Rift - On Update - Summon Creature ''Whirling Invader'''),

(14455,0,0,1,54,0,100,0,0,0,0,0,0,89,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Whirling Invader - On Just Summoned - Enable Random Movement'),
(14455,0,1,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Whirling Invader - Linked - Set Active On'),
(14455,0,2,0,0,0,100,0,6000,12000,10000,16000,0,11,17207,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Whirling Invader - IC - Cast ''Whirlwind'''),

(14458,0,0,1,54,0,100,0,0,0,0,0,0,89,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watery Invader - On Just Summoned - Enable Random Movement'),
(14458,0,1,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watery Invader - Linked - Set Active On'),
(14458,0,2,0,0,0,100,0,0,7000,8000,14000,0,11,19133,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Watery Invader - IC - Cast ''Frost Shock'''),

(14460,0,0,1,54,0,100,0,0,0,0,0,0,89,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blazing Invader - On Just Summoned - Enable Random Movement'),
(14460,0,1,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blazing Invader - Linked - Set Active On'),
(14460,0,2,0,0,0,100,0,0,11000,10000,16000,0,11,23113,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blazing Invader - IC - Cast ''Blast Wave'''),

(14462,0,0,1,54,0,100,0,0,0,0,0,0,89,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thundering Invader - On Just Summoned - Enable Random Movement'),
(14462,0,1,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thundering Invader - Linked - Set Active On'),
(14462,0,2,0,0,0,100,0,0,7000,8000,14000,0,11,23114,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thundering Invader - IC - Cast ''Earth Shock''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
