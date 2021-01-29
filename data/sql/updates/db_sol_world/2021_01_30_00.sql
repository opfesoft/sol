-- DB update 2021_01_26_05 -> 2021_01_30_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_26_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_26_05 2021_01_30_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1611963396976699345'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1611963396976699345');

UPDATE `gameobject_template_addon` SET `flags` = 0 WHERE `entry` = 187560;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 42442;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(13,1,42442,0,0,31,0,3,24921,0,0,0,0,'','Spell ''Vengeance Landing Cannonfire'' requires target ''Cosmetic Trigger - LAB''');

UPDATE `creature_addon` SET `isLarge` = 1 WHERE `guid` IN (103946,103949,103933,103979,103937,103942,103982,103963,103966,103944,103945,103968,103981,103943,103934,103988,103989,103969,103938,103980,103990,103935,103965,103991,103964,103948,103967,103962,103936);

UPDATE `smart_scripts` SET `target_param2` = 24042 WHERE `entryorguid` IN (25281,25282) AND `source_type` = 0 AND `id` = 0;
UPDATE `creature` SET `id` = 24042 WHERE `guid` IN (103993,103994);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
