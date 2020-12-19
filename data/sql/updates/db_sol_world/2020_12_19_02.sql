-- DB update 2020_12_19_01 -> 2020_12_19_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_19_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_19_01 2020_12_19_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608390731680813465'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608390731680813465');

DELETE FROM `creature` WHERE `guid` IN (205800,205801,205802);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(205800,10081,209,0,0,1,1,0,1,1863.89,1151.66,12.9287,0.540263,86400,0,5757,0,0,0,0,0,0),
(205801,10082,209,0,0,1,1,0,1,1674.24,904.853,8.92432,0.304632,86400,0,5544,0,0,0,0,0,0),
(205802,10080,209,0,0,1,1,0,1,1546.16,1015.47,8.87699,0.202525,86400,0,5544,0,0,0,0,0,0);

UPDATE `creature_equip_template` SET `ItemID3` = 28932 WHERE `CreatureID` = 9596;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (4535,4285,4283,11789,10080,10081,10082,8319,24777,24552,9416,13276,26555);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (4535,4285,4283,11789,10080,10081,10082,8319,18405,24777,24552,9416,13276,26555) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 9596 AND `source_type` = 0 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 18478 AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4535,0,0,0,4,0,100,0,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tamed Battleboar - On Aggro - Cast ''Rushing Charge'''),

(4285,0,0,0,0,0,100,0,4000,7000,8000,12000,0,11,9734,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Disciple - In Combat - Cast ''Holy Smite'''),
(4285,0,1,0,2,0,100,1,25,50,0,0,0,11,11640,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Disciple - Between 25-50% Health - Cast ''Renew'' (No Repeat)'),
(4285,0,2,0,2,0,100,1,0,10,0,0,0,11,11642,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Disciple - Between 0-10% Health - Cast ''Heal'' (No Repeat)'),

(4283,0,0,0,2,0,100,1,20,80,0,0,0,11,3639,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Sentry - Between 20-80% Health - Cast ''Improved Blocking'' (No Repeat)'),

(11789,0,0,0,0,0,100,0,2500,5700,8700,12300,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deep Borer - In Combat - Cast ''Thrash'''),

(10080,0,0,0,37,0,90,0,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sandarr Dunereaver - On AI Init - Despawn'),
(10080,0,1,0,4,0,100,0,0,0,0,0,0,11,13730,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sandarr Dunereaver - On Aggro - Cast ''Demoralizing Shout'''),
(10080,0,2,0,0,0,100,0,2700,3100,9600,12300,0,11,14516,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sandarr Dunereaver - In Combat - Cast ''Strike'''),
(10080,0,3,0,0,0,100,0,8100,8100,19600,19600,0,11,15615,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sandarr Dunereaver - In Combat - Cast ''Pummel'''),

(10081,0,0,0,37,0,90,0,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dustwraith - On AI Init - Despawn'),
(10081,0,1,0,0,0,100,0,1300,1600,15200,16100,0,11,12251,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dustwraith - In Combat - Cast ''Virulent Poison'''),
(10081,0,2,0,0,0,100,0,4200,4600,8200,9400,0,11,14873,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dustwraith - In Combat - Cast ''Sinister Strike'''),

(10082,0,0,0,37,0,90,0,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zerillis - On AI Init - Despawn'),
(10082,0,1,0,4,0,100,0,0,0,0,0,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Zerillis - On Aggro - Cast ''Net'''),
(10082,0,2,0,0,0,100,0,2100,2500,2100,2500,0,11,15547,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Zerillis - In Combat - Cast ''Shoot'''),
(10082,0,3,0,2,0,100,1,20,40,0,0,0,11,12551,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Zerillis - Between 20-40% Health - Cast ''Frost Shot'' (No Repeat)'),
(10082,0,4,0,9,0,100,0,4,30,1,1,0,79,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zerillis - Within 4-30 Range - Set Ranged Movement'),
(10082,0,5,0,9,0,100,0,0,4,1,1,0,79,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zerillis - Within 0-4 Range - Set Ranged Movement'),

(8319,0,0,0,0,0,100,0,2400,4900,11800,17200,0,11,44477,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Nightmare Whelp - In Combat - Cast ''Acid Spit'''),

(18478,0,2,0,7,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Avatar of the Martyred - On Evade - Despawn In 5000 ms'),

(18405,0,0,0,0,0,100,0,2500,3000,12500,13000,0,11,34793,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tempest-Forge Peacekeeper - In Combat - Cast ''Arcane Blast'''),
(18405,0,1,0,2,0,100,1,60,80,0,0,0,11,34791,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tempest-Forge Peacekeeper - Between 60-80% Health - Cast ''Arcane Explosion'' (No Repeat)'),
(18405,0,2,0,2,0,100,1,20,40,0,0,0,11,34785,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Tempest-Forge Peacekeeper - Between 20-40% Health - Cast ''Arcane Volley'' (No Repeat)'),

(24777,0,0,0,0,0,100,0,4700,5200,14700,15200,0,11,46479,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sunblade Sentinel - In Combat - Cast ''Fel Lightning'''),

(24552,0,0,0,0,0,100,0,5000,10000,15000,20000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sliver - In Combat - Cast ''Thrash'''),

(9416,0,0,0,2,0,100,1,40,80,0,0,0,11,3604,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarshield Worg - Between 40-80% Health - Cast ''Tendon Rip'' (No Repeat)'),

(9596,0,1,0,0,0,100,0,2300,3200,9500,11000,0,11,6466,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Bannok Grimaxe - In Combat - Cast ''Axe Toss'''),

(13276,0,0,0,9,0,100,0,0,20,6100,15700,0,11,13340,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wildspawn Imp - Within 0-20 Range - Cast ''Fire Blast'''),

(26555,0,0,0,0,0,100,0,5000,7000,15000,17000,0,11,48697,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scourge Hulk - In Combat - Cast ''Mighty Blow'''),
(26555,0,1,0,0,0,100,0,10000,10000,20000,20000,0,11,59228,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Scourge Hulk - In Combat - Cast ''Volatile Infection''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
