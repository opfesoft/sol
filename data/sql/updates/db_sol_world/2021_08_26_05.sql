-- DB update 2021_08_26_04 -> 2021_08_26_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_26_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_26_04 2021_08_26_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629974728353474011'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629974728353474011');

-- The quest "Gaining Even More Acceptance" needs "Gaining Acceptance" to be completed previously
UPDATE `quest_template_addon` SET `PrevQuestID` = 13662 WHERE `ID` = 7737;

-- Master Smith Burninate: Force gossip (always show gossip window even if the only option is trading)
UPDATE `creature_template` SET `type_flags` = `type_flags` | 134217728 WHERE `entry` = 14624;

-- Master Smith Burninate: Fix gossip text
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 5962;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,5962,7121,0,0,5,0,59,224,0,0,0,0,'Master Smith Burninate - Show gossip text 7121 if at least honored with the Thorium Brotherhood');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
