-- DB update 2020_06_15_02 -> 2020_06_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_15_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_15_02 2020_06_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592259478604756289'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592259478604756289');

-- Magic Sucker Device Spawner: Enable random movement; not selectable
UPDATE `creature_template` SET `AIName` = 'SmartAI', `unit_flags` = `unit_flags` | 33554432 WHERE `entry` = 22260;

-- Demoniac Scryer: Disable health regeneration
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` = 22258;

-- Magic Sucker Device Spawner, Demoniac Scryer, Hellfire Wardling, Fel Warden SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22260,22258,22259,22273) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2225800 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22260,0,0,0,11,0,100,0,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magic Sucker Device Spawner - On Respawn - Start Random Movement'),

(22258,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - On Respawn - Set Active On'),
(22258,0,1,2,61,0,100,0,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Linked - Set NPC Flags (Gossip)'),
(22258,0,2,3,61,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Linked - Disable Auto Attack'),
(22258,0,3,4,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Linked - Disable Combat Movement'),
(22258,0,4,5,61,0,100,0,0,0,0,0,0,18,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Linked - Set Unit Flag ''UNIT_FLAG_REMOVE_CLIENT_CONTROL'''),
(22258,0,5,0,61,0,100,0,0,0,0,0,0,80,2225800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Linked - Call Timed Action List'),
(22258,0,6,7,62,0,100,0,8510,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Demoniac Scryer - On Gossip Select - Close Gossip'),
(22258,0,7,8,61,0,100,0,0,0,0,0,0,85,38708,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Demoniac Scryer - Linked - Cast ''Demoniac Visitation'''),
(22258,0,8,0,61,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Linked - Clear NPC Flags'),
(22258,0,9,10,7,0,100,0,0,0,0,0,0,11,38672,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - On Evade - Cast ''Magic Sucker Device timer'''),
(22258,0,10,0,61,0,100,0,0,0,0,0,0,11,38690,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Linked - Cast ''Magic Sucker Device Bunny Appearance'''),
(22258,0,11,0,6,0,100,0,0,0,0,0,0,11,38691,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - On Death - Cast ''Magic Sucker Device Despawner, Mob AE'''),
(22258,0,12,0,64,0,100,0,0,0,0,0,0,98,8510,10643,0,0,0,0,7,0,0,0,0,0,0,0,0,'Demoniac Scryer - On Gossip Hello - Send Gossip Menu (Disabled via conditions)'),

(2225800,9,0,0,0,0,100,0,0,0,0,0,0,11,38672,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast ''Magic Sucker Device timer'''),
(2225800,9,1,0,0,0,100,0,0,0,0,0,0,11,38690,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast ''Magic Sucker Device Bunny Appearance'''),
(2225800,9,2,0,0,0,100,0,8000,8000,0,0,0,11,38681,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast ''Spawn Magic Sucker Spawner, Device'''),
(2225800,9,3,0,0,0,100,0,7000,7000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,4,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,5,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,6,0,0,0,100,0,0,0,0,0,0,11,38675,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast Create Magic Sucker Device Buttress (N)'),
(2225800,9,7,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,8,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,9,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,10,0,0,0,100,0,0,0,0,0,0,11,38676,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast Create Magic Sucker Device Buttress (S)'),
(2225800,9,11,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,12,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,13,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,14,0,0,0,100,0,0,0,0,0,0,86,38709,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast ''Spawn Magic Sucker Device Boss'' (Magic Sucker Device Spawner)'),
(2225800,9,15,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,16,0,0,0,100,0,0,0,0,0,0,11,38677,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast Create Magic Sucker Device Buttress (E)'),
(2225800,9,17,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,18,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,19,0,0,0,100,0,0,0,0,0,0,11,38678,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast Create Magic Sucker Device Buttress (W)'),
(2225800,9,20,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,21,0,0,0,100,0,15000,15000,0,0,0,86,38679,2,19,22260,15,0,19,22260,15,0,0,0,0,0,0,'Demoniac Scryer - Script - Cross Cast ''Spawn Magic Sucker Device Mob'' (Magic Sucker Device Spawner)'),
(2225800,9,22,0,0,0,100,0,15000,15000,0,0,0,11,38691,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast Magic Sucker Device Despawner, Mob AE'),
(2225800,9,23,0,0,0,100,0,1000,1000,0,0,0,11,38727,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast Magic Sucker Device (Success Visual timer)'),
(2225800,9,24,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Set Unit Flags'),
(2225800,9,25,0,0,0,100,0,0,0,0,0,0,28,38672,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Remove Aura Magic Sucker Device timer'),
(2225800,9,26,0,0,0,100,0,3000,3000,0,0,0,11,38727,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast Magic Sucker Device (Success Visual timer)'),
(2225800,9,27,0,0,0,100,0,0,0,0,0,0,28,38672,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Remove Aura Magic Sucker Device timer'),
(2225800,9,28,0,0,0,100,0,3000,3000,0,0,0,11,38727,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Cast Magic Sucker Device (Success Visual timer)'),
(2225800,9,29,0,0,0,100,0,0,0,0,0,0,28,38672,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Remove Aura Magic Sucker Device timer'),
(2225800,9,30,0,0,0,100,0,84000,84000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demoniac Scryer - Script - Remove Aura Magic Sucker Device timer'),

(22259,0,0,1,54,0,100,0,0,0,0,0,0,11,38683,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hellfire Wardling - On Just Summoned - Cast ''Magic Sucker Device Despawner, Mob'''),
(22259,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hellfire Wardling - Linked - Say Line 0'),
(22259,0,2,3,61,0,100,0,0,0,0,0,0,11,7741,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hellfire Wardling - Linked - Cast ''Summoned Demon'''),
(22259,0,3,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,22258,15,0,0,0,0,0,0,'Hellfire Wardling - Linked - Attack ''Demoniac Scryer'''),
(22259,0,4,5,6,0,100,0,0,0,0,0,0,11,38891,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hellfire Wardling - On Death - Cast ''Magic Sucker Device (Despawn Visual)'''),
(22259,0,5,0,61,0,100,0,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hellfire Wardling - On Death - Despawn'),
(22259,0,6,0,8,0,100,0,38691,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hellfire Wardling - On Spellhit ''Magic Sucker Device Despawner, Mob AE'' - Despawn'),

(22273,0,0,1,54,0,100,0,0,0,0,0,0,11,38683,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Warden - On Just Summoned - Cast ''Magic Sucker Device Despawner, Mob'''),
(22273,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Warden - Linked - Say Line 0'),
(22273,0,2,3,61,0,100,0,0,0,0,0,0,11,7741,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Warden - Linked - Cast ''Summoned Demon'''),
(22273,0,3,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,22258,15,0,0,0,0,0,0,'Fel Warden - Linked - Attack ''Demoniac Scryer'''),
(22273,0,4,0,8,0,100,0,38691,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Warden - On Spellhit ''Magic Sucker Device Despawner, Mob AE'' - Despawn'),
(22273,0,5,0,0,0,100,0,0,0,5000,5000,0,11,14034,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fel Warden - IC - Cast ''Fireball'''),
(22273,0,6,0,0,0,100,0,4000,4000,15000,15000,0,11,11831,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fel Warden - IC - Cast ''Frost Nova''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 22258;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(22,13,22258,0,0,1,0,38708,0,0,1,0,0,'','Demoniac Scryer - Only run SAI if player does not have Aura Demonaic Visitation'),
(22,13,22258,0,0,1,1,38672,0,0,1,0,0,'','Demoniac Scryer - Only run SAI if Demoniac Scryer does not have Aura Magic Sucker Device timer'),
(22,13,22258,0,0,2,0,31607,1,0,1,0,0,'','Demoniac Scryer - Only run SAI if player does not have Demoniac Scryer Reading'),
(22,13,22258,0,0,9,0,10838,0,0,0,0,0,'','Demoniac Scryer - Only run SAI if player has the Demoniac Scryer Taken');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
