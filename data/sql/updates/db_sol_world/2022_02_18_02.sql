-- DB update 2022_02_18_01 -> 2022_02_18_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_18_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_18_01 2022_02_18_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645180328733345096'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645180328733345096');

-- Only use GO ID 19541 and remove all spawns of 19542 (on retail two different GOs were used: one with a trap, one without; not needed because SAI is much more flexible and powerful)
UPDATE `gameobject` SET `id` = 19541, `spawntimesecs` = 180 WHERE `guid` IN (44705,44712,44731,47191,47192,47193);

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 19541;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4263,4264);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 19541;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4263,0,0,1,54,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepmoss Hatchling - On Just Summoned - Say Line 1'),
(4263,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,20,0,0,0,0,0,0,0,'Deepmoss Hatchling - Linked - Attack Closest Player'),
(4263,0,2,3,2,0,100,1,0,30,0,0,0,67,1,500,500,0,0,0,1,0,0,0,0,0,0,0,0,'Deepmoss Hatchling - Between 0-30% Health - Create Timed Event 1 (No Repeat)'),
(4263,0,3,0,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deepmoss Hatchling - Linked - Store Target 1 (Victim)'),
(4263,0,4,5,59,0,30,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepmoss Hatchling - On Timed Event 1 Triggered - Say Line 0'),
(4263,0,5,0,61,0,100,0,0,0,0,0,0,12,4264,1,60000,0,10,10,12,1,0,0,0,0,0,0,0,'Deepmoss Hatchling - Linked - Summon ''Deepmoss Matriarch'' (Stored Target 1)'),
(4263,0,6,7,17,0,100,0,4264,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Deepmoss Hatchling - On Summoned Unit ''Deepmoss Matriarch'' - Send Stored Target 1 (Invoker)'),
(4263,0,7,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Deepmoss Hatchling - Linked - Set Data 1 1 (Invoker)'),

(4264,0,0,0,38,0,100,0,1,1,0,0,0,97,20,10,1,0,0,0,12,1,0,0,0,0,0,0,0,'Deepmoss Matriarch - On Data Set 1 1 - Jump To Stored Target 1'),

(19541,1,0,0,70,0,30,1,2,0,0,0,0,12,4263,1,60000,0,0,0,1,0,0,0,0,0,0,0,0,'Deepmoss Eggs - On GO State Changed ''GO_ACTIVATED'' - Summon Creature ''Deepmoss Hatchling'' (No Repeat)'),
(19541,1,1,0,70,0,100,1,2,0,0,0,0,67,1,10000,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Deepmoss Eggs - On GO State Changed ''GO_ACTIVATED'' - Create Timed Event 1 (No Repeat)'),
(19541,1,2,0,59,0,100,0,1,0,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepmoss Eggs - On Timed Event 1 Triggered - Despawn GO'),
(19541,1,3,0,70,0,100,0,3,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deepmoss Eggs - On GO State Changed ''GO_JUST_DEACTIVATED'' - Remove Timed Event 1');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
