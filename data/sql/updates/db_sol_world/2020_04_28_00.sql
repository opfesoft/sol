-- DB update 2020_04_25_00 -> 2020_04_28_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_04_25_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_04_25_00 2020_04_28_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1588026179012254886'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1588026179012254886');

-- Boss money loot
UPDATE `creature_template` SET `mingold` = 4255, `maxgold` = 7025 WHERE `entry` = 26763;  -- Anomalus (Normal)
UPDATE `creature_template` SET `mingold` = 8410, `maxgold` = 13950 WHERE `entry` = 30529; -- Anomalus (Heroic)
UPDATE `creature_template` SET `mingold` = 4355, `maxgold` = 7125 WHERE `entry` = 26794;  -- Ormok (Normal)
UPDATE `creature_template` SET `mingold` = 8510, `maxgold` = 14050 WHERE `entry` = 30532; -- Ormok (Heroic)
UPDATE `creature_template` SET `mingold` = 4745, `maxgold` = 7515 WHERE `entry` = 26723;  -- Keristrasza (Normal)
UPDATE `creature_template` SET `mingold` = 8900, `maxgold` = 14440 WHERE `entry` = 30540; -- Keristrasza (Heroic)

-- Berinand's Research: Reduce respawn time to 2 secondes
UPDATE `gameobject` SET `spawntimesecs` = 2 WHERE `guid` = 65527;

-- Crazed Mana-Wyrm: Enable random movement for the wyrms above; ensure that the wyrm corpses lie on the ground
UPDATE `creature_template` SET `hoverheight` = 0, `unit_flags` = `unit_flags` ^ 4 WHERE `entry` IN (26761,30521);
UPDATE `creature` SET `unit_flags` = 536870912 | 33554432 | 262144 | 512 | 256, `dynamicflags` = 32 WHERE `guid` IN (126587,126588);
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` IN (126584,126585,126586,126589,126590,126591,126592,126593,126594,126595,126596,126597,126598);

-- Azure Enforcer: Ensure that the corpses lie on the ground
UPDATE `creature` SET `unit_flags` = 536870912 | 33554432 | 262144 | 512 | 256, `dynamicflags` = 32 WHERE `guid` IN (126484,126483,126485);

DELETE FROM `creature_addon` WHERE `guid` IN (126484,126483,126485);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(126483,0,0,0,0,0,1,'29266'),
(126484,0,0,0,0,0,1,'29266'),
(126485,0,0,0,0,0,1,'29266');

-- Azure Skyrazor: Ensure that the corpses lie on the ground
UPDATE `creature_template` SET `hoverheight` = 0 WHERE `entry` IN (26736,30518);
UPDATE `creature` SET `unit_flags` = 536870912 | 33554432 | 262144 | 512 | 256, `dynamicflags` = 32 WHERE `guid` IN (126505,126506);

-- Crazed Mana-Wraith: Change faction so that they fight the Azure Enforcers
UPDATE `creature_template` SET `faction` = 1693 WHERE `entry` IN (26746,30520);

-- Crazed Mana-Surge: Change to same faction as Crazed Mana-Wraith so they don't fight each other
UPDATE `creature_template` SET `faction` = 1693 WHERE `entry` IN (26737,30519);

-- Crazed Mana-Wraith: Add a few more creatures to The Rift (positions taken from TC)
DELETE FROM `creature` WHERE `id` = 26746;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(126522,26746,576,0,0,3,1,27810,0,595.397,-178.336,-27.6075,4.01015,3600,5,0,5574,29328,1,0,0,0,0),
(126523,26746,576,0,0,3,1,27810,0,601.954,-183.935,-28.414,0.697214,3600,5,0,5574,29328,1,0,0,0,0),
(126524,26746,576,0,0,3,1,27810,0,587.247,-171.544,-27.5525,5.26858,3600,5,0,5574,29328,1,0,0,0,0),
(126525,26746,576,0,0,3,1,27810,0,589.867,-199.939,-27.1005,6.1825,3600,5,0,5574,29328,1,0,0,0,0),
(126526,26746,576,0,0,3,1,27810,0,588.003,-183.893,-27.3824,4.31364,3600,5,0,5574,29328,1,0,0,0,0),
(126527,26746,576,0,0,3,1,27810,0,697.255,-175.627,-28.9902,2.38792,3600,5,0,5574,29328,1,0,0,0,0),
(126528,26746,576,0,0,3,1,27810,0,690.537,-162.307,-28.9796,2.14748,3600,5,0,5574,29328,1,0,0,0,0),
(126529,26746,576,0,0,3,1,27810,0,677.544,-190.058,-25.213,1.45003,3600,5,0,5574,29328,1,0,0,0,0),
(126531,26746,576,0,0,3,1,27810,0,596.551,-132.962,-28.5882,6.20321,3600,5,0,5574,29328,1,0,0,0,0),
(126532,26746,576,0,0,3,1,27810,0,646.77,-153.253,-29.724,2.13809,3600,5,0,5574,29328,1,0,0,0,0),
(126533,26746,576,0,0,3,1,27810,0,627.393,-151.941,-28.9796,3.17306,3600,5,0,5574,29328,1,0,0,0,0),
(126534,26746,576,0,0,3,1,27810,0,629.136,-167.085,-30.2922,2.11216,3600,5,0,5574,29328,1,0,0,0,0),
(126535,26746,576,0,0,3,1,27810,0,630.379,-163.046,-30.2922,4.54592,3600,5,0,5574,29328,1,0,0,0,0),
(126536,26746,576,0,0,3,1,27810,0,641.192,-166.133,-30.2922,4.23657,3600,5,0,5574,29328,1,0,0,0,0),
(126537,26746,576,0,0,3,1,27810,0,559.094,-161.072,-24.8939,4.70379,3600,5,0,5574,29328,1,0,0,0,0);

-- Add more frozen heroes to the Halls of Stasis (positions taken from TC);
-- reuse creature GUIDs 126664 and 126665 instead of 115899 and 115900 as those are already in use by other creatures;
-- the creature GUIDs 126667 and 126668 are now not used anymore, 126666 is reused below (see "The Singing Grove")
DELETE FROM `creature` WHERE `id` IN (26800,26802,26805,27949,26796);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
-- Alliance / Horde Berserker
(126664,26800,576,0,0,3,1,0,1,443.366,183.462,-34.9374,4.31096,7200,0,0,0,0,0,0,0,0,0),
(126665,26800,576,0,0,3,1,0,1,450.258,175.462,-34.9375,4.11898,7200,0,0,0,0,0,0,0,0,0),
(113767,26800,576,0,0,3,1,0,1,404.339,181.386,-34.9363,5.11381,7200,0,0,0,0,0,0,0,0,0),
(113689,26800,576,0,0,3,1,0,1,389.534,148.687,-34.9363,5.91667,7200,0,0,0,0,0,0,0,0,0),
(113671,26800,576,0,0,3,1,0,1,408.059,187.066,-34.9363,5.0091,7200,0,0,0,0,0,0,0,0,0),
-- Alliance / Horde Ranger
(115917,26802,576,0,0,3,1,0,1,389.595,167.328,-34.9362,5.53269,7200,0,0,0,0,0,0,0,0,0),
(115918,26802,576,0,0,3,1,0,1,410.012,179.318,-34.9363,5.02655,7200,0,0,0,0,0,0,0,0,0),
(115933,26802,576,0,0,3,1,0,1,442.812,176.398,-34.9374,4.27606,7200,0,0,0,0,0,0,0,0,0),
(115952,26802,576,0,0,3,1,0,1,460.961,147.602,-34.9378,3.45575,7200,0,0,0,0,0,0,0,0,0),
(115965,26802,576,0,0,3,1,0,1,460.826,162.661,-34.9377,3.76991,7200,0,0,0,0,0,0,0,0,0),
-- Alliance / Horde Cleric
(115970,26805,576,0,0,3,1,0,1,395.9,169.22,-34.9363,5.41052,7200,0,0,0,0,0,0,0,0,0),
(116016,26805,576,0,0,3,1,0,1,428.6,189.332,-34.9369,4.60767,7200,0,0,0,0,0,0,0,0,0),
(116017,26805,576,0,0,3,1,0,1,420.703,189.507,-34.9366,4.7822,7200,0,0,0,0,0,0,0,0,0),
-- Alliance / Horde Commander
(247105,27949,576,0,0,1,1,0,1,424.547,185.962,-34.9367,4.69494,7200,0,0,0,0,0,0,0,0,0),
-- Commander Stoutbeard / Commander Kolurg
(4764,26796,576,0,0,2,1,0,1,424.547,185.962,-34.9367,4.69494,86400,0,0,1,0,0,0,0,0,0);

-- Remove creature template addon entries (creature addon is used instead)
DELETE FROM `creature_template_addon` WHERE `entry` IN (26800,30496,26802,30509,26805,30498,27949,26796,26798);

-- Also remove the obsolete creature addon entries for GUIDs 126666,126667 and 126668
DELETE FROM `creature_addon` WHERE `guid` IN (126664,126665,113767,113689,113671,115917,115918,115933,115952,115965,115970,116016,116017,247105,4764,126666,126667,126668);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
-- Alliance / Horde Berserker
(126664,0,0,0,1,333,1,'47543'),
(126665,0,0,0,1,333,1,'47543'),
(113767,0,0,0,1,333,1,'47543'),
(113689,0,0,0,1,333,1,'47543'),
(113671,0,0,0,1,333,1,'47543'),
-- Alliance / Horde Ranger
(115917,0,0,0,1,376,1,'47543'),
(115918,0,0,0,1,376,1,'47543'),
(115933,0,0,0,1,376,1,'47543'),
(115952,0,0,0,1,376,1,'47543'),
(115965,0,0,0,1,376,1,'47543'),
-- Alliance / Horde Cleric
(115970,0,0,0,1,375,1,'47543'),
(116016,0,0,0,1,375,1,'47543'),
(116017,0,0,0,1,375,1,'47543'),
-- Alliance / Horde Commander
(247105,0,0,0,1,333,1,'47543'),
-- Commander Stoutbeard / Commander Kolurg
(4764,0,0,0,1,333,1,'47543');

-- The Singing Grove (reuses creature GUID 126666 mentioned above)
DELETE FROM `creature` WHERE `id` IN (28231,26782);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(126600,26782,576,0,0,3,1,27469,0,356.128,-179.167,-14.2759,3.80705,3600,5,0,37164,0,1,0,0,0,0),
(126601,26782,576,0,0,3,1,27469,0,383.348,-184.97,-14.0888,2.91584,3600,5,0,37164,0,1,0,0,0,0),
(126602,26782,576,0,0,3,1,27469,0,387.443,-184.48,-14.0888,2.63267,3600,5,0,37164,0,1,0,0,0,0),
(126603,26782,576,0,0,3,1,27469,0,458.056,-177.292,-14.0888,5.79238,3600,5,0,37164,0,1,0,0,0,0),
(126604,26782,576,0,0,3,1,27469,0,453.272,-178.744,-14.0888,5.79238,3600,5,0,37164,0,1,0,0,0,0),
(126605,26782,576,0,0,3,1,27469,0,247.919,-235.086,-8.48918,2.34172,3600,5,0,37164,0,1,0,0,0,0),
(126606,26782,576,0,0,3,1,27469,0,251.404,-238.64,-8.25408,2.34654,3600,5,0,37164,0,1,0,0,0,0),
(126607,26782,576,0,0,3,1,27469,0,403.166,-313.62,-14.0888,0.612719,3600,5,0,37164,0,1,0,0,0,0),
(126608,26782,576,0,0,3,1,27469,0,397.014,-322.266,-14.0888,0.174134,3600,5,0,37164,0,1,0,0,0,0),
(126609,26782,576,0,0,3,1,27469,0,431.531,-273.502,-14.0888,2.62032,3600,5,0,37164,0,1,0,0,0,0),
(126666,26782,576,0,0,3,1,27469,0,431.531,-273.502,-14.0888,2.62032,3600,5,0,37164,0,1,0,0,0,0),
(126440,28231,576,0,0,3,1,27609,1,356.727,-174.203,-14.0888,3.80708,3600,5,0,37164,3231,1,0,0,0,0),
(126441,28231,576,0,0,3,1,27609,1,383.407,-184.995,-14.0888,2.74376,3600,5,0,37164,3231,1,0,0,0,0),
(126442,28231,576,0,0,3,1,27609,1,385.189,-183.384,-14.0888,2.64964,3600,0,0,37164,3231,2,0,0,0,0),
(126443,28231,576,0,0,3,1,27609,1,456.604,-172.507,-14.0888,5.79238,3600,0,0,37164,3231,2,0,0,0,0),
(126444,28231,576,0,0,3,1,27609,1,252.187,-239.48,-8.25408,2.34172,3600,5,0,37164,3231,1,0,0,0,0),
(126445,28231,576,0,0,3,1,27609,1,253.398,-238.519,-8.36484,2.58196,3600,0,0,37164,3231,2,0,0,0,0),
(126446,28231,576,0,0,3,1,27609,1,392.948,-316.481,-14.0888,0.118064,3600,0,0,37164,3231,2,0,0,0,0),
(126447,28231,576,0,0,3,1,27609,1,436.391,-274.338,-14.0888,2.46728,3600,0,0,37164,3231,2,0,0,0,0);

-- Add additional creatures to two of the formations
DELETE FROM `creature_formations` WHERE `leaderGUID` IN (126442,126447);
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`)
VALUES
(126442,126441,4,90,2,0,0),
(126442,126601,6,30,2,0,0),
(126442,126602,6,170,2,0,0),
(126442,126442,0,0,0,0,0),
(126447,126447,0,0,0,0,0),
(126447,126609,6,45,2,0,0),
(126447,126666,6,135,2,0,0);

-- Crystal Spider: Enable random movement
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `map` = 576 AND `id` = 32261;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
