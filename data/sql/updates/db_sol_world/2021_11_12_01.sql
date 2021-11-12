-- DB update 2021_11_12_00 -> 2021_11_12_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_12_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_12_00 2021_11_12_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1636753702379544040'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1636753702379544040');

UPDATE `creature_template_addon` SET `auras` = '7276 8601' WHERE `entry` = 909; -- Defias Night Blade: Add auras "Poison Proc", "Slowing Poison"
UPDATE `creature_template_addon` SET `auras` = '6752' WHERE `entry` = 1986; -- Webwood Spider: Add aura "Weak Poison Proc"
UPDATE `creature_template_addon` SET `auras` = '18847' WHERE `entry` = 2923; -- Mangy Silvermane: Add aura "Fevered Fatigue"

DELETE FROM `creature_template_addon` WHERE `entry` IN (2707,5277);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(2707,0,0,0,0,0,0,'8601 13299'), -- Shadra: Add auras "Slowing Poison", "Poison Proc"
(5277,0,0,0,0,0,0,'12099'); -- Nightmare Scalebane: Add aura "Shield Spike"

UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 2923; -- Mangy Silvermane: SAI not needed anymore
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (909,2923);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3671 AND `id` = 6;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(909,0,0,0,67,0,70,0,3900,12700,0,0,0,11,2589,2,0,0,0,0,5,0,0,0,0,0,0,0,0,'Defias Night Blade - Behind Target - Cast ''Backstab'''),
(909,0,1,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Defias Night Blade - Between 0-15% Health - Flee For Assist'),

(3671,0,6,0,25,0,100,0,0,0,0,0,0,11,13236,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Anacondra - On Reset - Cast ''Nature Channeling''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
