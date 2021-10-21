-- DB update 2021_10_21_02 -> 2021_10_21_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_21_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_21_02 2021_10_21_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634852688959465107'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634852688959465107');

-- Quests "Suspicious Hoofprints", "The Black Shield (Part 4)" and "Questioning Reethe": Need to be finished before quest "The Black Shield (Part 5)" becomes available
UPDATE `quest_template_addon` SET `NextQuestID` = 1276, `ExclusiveGroup` = -1323 WHERE `ID` IN (1268,1323,1273);

-- Quest "The Black Shield (Part 5)": Remove "The Black Shield (Part 4)" as previous quest
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 1276;

-- Quest "Return to Krog": Needs "The Black Shield (Part 5)" to be finished
UPDATE `quest_template_addon` SET `PrevQuestID` = 1276 WHERE `ID` = 11204;

-- Quests "The Grimtotem Plot" and "More than Coincidence": Need to be finished before quest "Seek Out Tabetha" becomes available
UPDATE `quest_template_addon` SET `ExclusiveGroup` = -11201, `NextQuestID` = 11203 WHERE `ID` IN (11201,11200);

-- Quest "Seek Out Tabetha": Remove "The Grimtotem Plot" as previous quest
UPDATE `quest_template_addon` SET `PrevQuestID`=0 WHERE `ID` = 11203;

-- Quests "Confirming the Suspicion" and "Arms of the Grimtotems": Need to be finished before quest "Tabetha's Assistance" becomes available
UPDATE `quest_template_addon` SET `ExclusiveGroup` = -11144, `NextQuestID` = 11149 WHERE `ID` IN (11144,11148);

-- Quest "Tabetha's Assistance": Remove "Confirming the Suspicion" as previous quest
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 11149;

-- Evidence Marker: Add missing spawns
DELETE FROM `creature` WHERE `guid` IN (3008922,3008923,3008924);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008922,23583,1,0,0,1,1,0,0,-3700.58,-2534.09,68.7248,3.05433,300,0,1,0,0,0,0,0,0),
(3008923,23583,1,0,0,1,1,0,0,-3721.85,-2541.17,69.7589,3.05433,300,0,1,0,0,0,0,0,0),
(3008924,23583,1,0,0,1,1,0,0,-3734.45,-2530.79,73.2862,3.30957,300,0,1,0,0,0,0,0,0);

-- Evidence Marker: Can fly
UPDATE `creature_template` SET `InhabitType` = 7 WHERE `entry` = 23583;

-- Evidence Marker: Add auras "Evidence marker" and "Evidence Marker Invis"
UPDATE `creature_template_addon` SET `auras` = '42171 42175' WHERE `entry` = 23583;

-- Theramore Guard Badge: Fix rotation
DELETE FROM `gameobject_addon` WHERE `guid` = 6376;
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(6376,0,0,1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (8761,1186,1161);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,8761,0,0,0,47,0,11123,64,0,0,0,0,'Inspector Tarem - Group 0: Show gossip option 0 if quest ''Inspecting the Ruins'' is rewarded'),
(15,8761,0,0,1,47,0,11124,64,0,0,0,0,'Inspector Tarem - Group 1: Show gossip option 0 if quest ''Inspecting the Ruins'' is rewarded'),

(15,1186,0,0,0,47,0,11124,10,0,0,0,0,'Krog - Group 0: Show gossip option 0 if quest ''Inspecting the Ruins'' is in progress or completed'),
(15,1186,1,0,0,47,0,1269,64,0,0,0,0,'Krog - Group 0: Show gossip option 1 if quest ''Lieutenant Paval Reethe'' is completed'),
(15,1186,1,0,0,47,0,1273,1,0,0,0,0,'Krog - Group 0: Show gossip option 1 if quest ''Questioning Reethe'' is not taken'),

(15,1161,0,0,0,47,0,1302,64,0,0,0,0,'Captain Garran Vimes - Group 0: Show gossip option 0 if quest ''James Hyal'' is rewarded'),
(15,1161,0,0,0,47,0,11123,10,0,0,0,0,'Captain Garran Vimes - Group 0: Show gossip option 0 if quest ''Inspecting the Ruins'' is in progress or completed'),
(15,1161,0,0,1,47,0,1282,64,0,0,0,0,'Captain Garran Vimes - Group 1: Show gossip option 0 if quest ''They Call Him Smiling Jim'' is rewarded'),
(15,1161,0,0,1,47,0,11123,10,0,0,0,0,'Captain Garran Vimes - Group 1: Show gossip option 0 if quest ''Inspecting the Ruins'' is in progress or completed');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
