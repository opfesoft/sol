-- DB update 2020_05_17_02 -> 2020_05_18_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_17_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_17_02 2020_05_18_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1589837389875963038'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1589837389875963038');

-- Ruined Lifeboat: Use the actual rotation values of the GO instead of it's orientation
DELETE FROM `gameobject_addon` WHERE `guid` = 74;
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`) VALUES (74,0,0);

-- Show quest "Enticing Negolash" during "Facing Negolash" (this will delete a condition concerning quest ID 618 which is not used anymore because it has been replaced by 8554)
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` = 619;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(19,0,619,0,0,9,0,8554,0,0,0,0,0,'','Quest ''Enticing Negolash'' is only available as long as ''Facing Negolash'' is taken.'),
(19,0,619,0,0,8,0,8554,0,0,1,0,0,'','Quest ''Enticing Negolash'' is only available as long as ''Facing Negolash'' is not rewarded.'),
(19,0,619,0,0,28,0,8554,0,0,1,0,0,'','Quest ''Enticing Negolash'' is only available as long as ''Facing Negolash'' is not completed.'),
(20,0,619,0,0,9,0,8554,0,0,0,0,0,'','Quest ''Enticing Negolash'' shows quest mark only as long as ''Facing Negolash'' is taken.'),
(20,0,619,0,0,8,0,8554,0,0,1,0,0,'','Quest ''Enticing Negolash'' shows quest mark only as long as ''Facing Negolash'' is not rewarded.'),
(20,0,619,0,0,28,0,8554,0,0,1,0,0,'','Quest ''Enticing Negolash'' shows quest mark only as long as ''Facing Negolash'' is not completed.');

-- Ruined Lifeboat / Negolash SAI: Spawn food on the lifeboat; spawn Negolash
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2289 AND `source_type` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1494 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2289,1,0,1,20,0,100,0,619,0,0,0,0,50,2332,30,0,0,0,0,8,0,0,0,0,-14655.1,148.229,3.01744,3.45635,'Ruined Lifeboat - On Quest ''Enticing Negolash'' Finished - Summon GameObject ''Barbequed Buzzard Wings'''),
(2289,1,1,2,61,0,100,0,0,0,0,0,0,50,2332,30,0,0,0,0,8,0,0,0,0,-14655.6,146.111,2.29463,1.43766,'Ruined Lifeboat - Linked - Summon GameObject ''Barbequed Buzzard Wings'''),
(2289,1,2,3,61,0,100,0,0,0,0,0,0,50,2332,30,0,0,0,0,8,0,0,0,0,-14655.1,147.721,2.64111,3.99435,'Ruined Lifeboat - Linked - Summon GameObject ''Barbequed Buzzard Wings'''),
(2289,1,3,4,61,0,100,0,0,0,0,0,0,50,2332,30,0,0,0,0,8,0,0,0,0,-14654.3,147.015,2.21427,2.44821,'Ruined Lifeboat - Linked - Summon GameObject ''Barbequed Buzzard Wings'''),
(2289,1,4,5,61,0,100,0,0,0,0,0,0,50,2332,30,0,0,0,0,8,0,0,0,0,-14655.8,147.092,2.3646,0.66155,'Ruined Lifeboat - Linked - Summon GameObject ''Barbequed Buzzard Wings'''),
(2289,1,5,6,61,0,100,0,0,0,0,0,0,50,2332,30,0,0,0,0,8,0,0,0,0,-14654.3,147.866,2.90964,0.05732,'Ruined Lifeboat - Linked - Summon GameObject ''Barbequed Buzzard Wings'''),
(2289,1,6,7,61,0,100,0,0,0,0,0,0,50,2332,30,0,0,0,0,8,0,0,0,0,-14653.5,147.004,2.36253,2.80556,'Ruined Lifeboat - Linked - Summon GameObject ''Barbequed Buzzard Wings'''),
(2289,1,7,8,61,0,100,0,0,0,0,0,0,50,2332,30,0,0,0,0,8,0,0,0,0,-14652.2,146.926,3.63756,6.06693,'Ruined Lifeboat - Linked - Summon GameObject ''Barbequed Buzzard Wings'''),
(2289,1,8,9,61,0,100,0,0,0,0,0,0,50,2332,30,0,0,0,0,8,0,0,0,0,-14653,145.274,2.76439,6.06279,'Ruined Lifeboat - Linked - Summon GameObject ''Barbequed Buzzard Wings'''),
(2289,1,9,10,61,0,100,0,0,0,0,0,0,50,2687,30,0,0,0,0,8,0,0,0,0,-14653.5,145.711,2.01005,1.1475,'Ruined Lifeboat - Linked - Summon GameObject ''Bottle'''),
(2289,1,10,11,61,0,100,0,0,0,0,0,0,50,2687,30,0,0,0,0,8,0,0,0,0,-14656.7,147.404,3.05695,1.44181,'Ruined Lifeboat - Linked - Summon GameObject ''Bottle'''),
(2289,1,11,12,61,0,100,0,0,0,0,0,0,50,2687,30,0,0,0,0,8,0,0,0,0,-14657.1,147.068,2.94368,1.40036,'Ruined Lifeboat - Linked - Summon GameObject ''Bottle'''),
(2289,1,12,13,61,0,100,0,0,0,0,0,0,50,2687,30,0,0,0,0,8,0,0,0,0,-14657.5,147.567,2.8356,2.14234,'Ruined Lifeboat - Linked - Summon GameObject ''Bottle'''),
(2289,1,13,14,61,0,100,0,0,0,0,0,0,50,2687,30,0,0,0,0,8,0,0,0,0,-14655.9,148.848,3.93732,2.79728,'Ruined Lifeboat - Linked - Summon GameObject ''Bottle'''),
(2289,1,14,15,61,0,100,0,0,0,0,0,0,50,2562,30,0,0,0,0,8,0,0,0,0,-14654.6,146.299,2.04134,5.47387,'Ruined Lifeboat - Linked - Summon GameObject ''Baked Bread'''),
(2289,1,15,16,61,0,100,0,0,0,0,0,0,50,2562,30,0,0,0,0,8,0,0,0,0,-14656.5,148.372,3.50805,5.76817,'Ruined Lifeboat - Linked - Summon GameObject ''Baked Bread'''),
(2289,1,16,17,61,0,100,0,0,0,0,0,0,50,2562,30,0,0,0,0,8,0,0,0,0,-14652.6,146.079,3.35855,2.89231,'Ruined Lifeboat - Linked - Summon GameObject ''Baked Bread'''),
(2289,1,17,0,61,0,100,0,0,0,0,0,0,12,1494,3,120000,0,0,0,8,0,0,0,0,-14611.4,113.868,-6.54365,1.87176,'Ruined Lifeboat - Linked - Summon Creature ''Negolash'''),

(1494,0,0,1,63,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negolash - On Just created - Say Line 0'),
(1494,0,1,2,61,0,100,0,0,0,0,0,0,11,7095,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negolash - Linked - Cast Knockdown Proc'),
(1494,0,2,0,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-14647.5,143.71,1.16455,0,'Negolash - Linked - Move To Position'),
(1494,0,3,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Negolash - On Evade - Despawn');

-- Ensure that only one Negolash is around
DELETE FROM `conditions` WHERE `SourceEntry` = 2289 AND `SourceTypeOrReferenceId` = 22 AND `SourceId` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(22,1,2289,1,0,29,0,1494,100,0,1,0,0,'','Ruined Lifeboat execute SAI if there''s no Negolash around');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
