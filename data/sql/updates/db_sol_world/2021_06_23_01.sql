-- DB update 2021_06_23_00 -> 2021_06_23_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_23_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_23_00 2021_06_23_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624461284160137124'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624461284160137124');

UPDATE `creature_loot_template` SET `Chance` = 100 WHERE `Item` = 5877 AND `Entry` IN (4130,4131,4132,4133);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 1 AND `SourceEntry` = 5877 AND `ConditionTypeOrReference` = 47 AND `SourceGroup` IN (4130,4131,4132,4133);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(1,4130,5877,0,0,47,0,1147,74,0,0,0,0,'Cracked Silithid Carapace only drops from Silithid Searcher if the quest "The Swarm Grows" is in progress, completed or rewarded'),
(1,4131,5877,0,0,47,0,1147,74,0,0,0,0,'Cracked Silithid Carapace only drops from Silithid Invader if the quest "The Swarm Grows" is in progress, completed or rewarded'),
(1,4132,5877,0,0,47,0,1147,74,0,0,0,0,'Cracked Silithid Carapace only drops from Silithid Ravager if the quest "The Swarm Grows" is in progress, completed or rewarded'),
(1,4133,5877,0,0,47,0,1147,74,0,0,0,0,'Cracked Silithid Carapace only drops from Silithid Hive Drone if the quest "The Swarm Grows" is in progress, completed or rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
