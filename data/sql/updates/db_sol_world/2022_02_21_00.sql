-- DB update 2022_02_20_01 -> 2022_02_21_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_20_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_20_01 2022_02_21_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645427625112607434'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645427625112607434');

DELETE FROM `creature` WHERE `guid` IN (3008943,3008944,3008945,3008946,3008947,3008948);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008943,16332,530,0,0,1,1,1,7724.47,-5631.38,2.27865,0.470633,300,0,1,0,2,0,0,0,0),
(3008944,16332,530,0,0,1,1,1,7745.91,-5595.05,5.28143,4.08407,300,3,1,0,1,0,0,0,0),
(3008945,16332,530,0,0,1,1,1,7764.08,-5621.74,12.7381,2.23402,300,0,1,0,0,0,0,0,0),
(3008946,16332,530,0,0,1,1,1,7730.84,-5575.27,6.95947,4.46768,300,0,1,0,2,0,0,0,0),
(3008947,16332,530,0,0,1,1,1,7775.29,-5634.53,17.8243,0.929924,300,0,1,0,2,0,0,0,0),
(3008948,16332,530,0,0,1,1,1,7772.73,-5629.08,17.9156,2.68781,300,0,1,0,0,0,0,0,0);

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 82292;

DELETE FROM `creature_addon` WHERE `guid` IN (3008943,3008944,3008945,3008946,3008947,3008948,82292);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(3008943,30089430,0,0,1,0,0,NULL),
(3008944,0,0,0,1,0,0,NULL),
(3008945,0,0,0,1,0,0,NULL),
(3008946,30089460,0,0,1,0,0,NULL),
(3008947,30089470,0,0,1,0,0,NULL),
(3008948,0,0,0,1,0,0,NULL),
(82292,822920,0,0,1,0,0,NULL);

UPDATE `creature_addon` SET `bytes2` = 0, `emote` = 0, `auras` = NULL WHERE `guid` IN (82277,82285,82286,82289,82291,82293);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (16331,-82291,-82289,16332);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1633100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16331,0,0,0,0,0,100,0,3000,7000,30000,35000,0,11,25602,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Darnassian Druid - IC - Cast ''Faerie Fire'''),
(16331,0,1,0,74,0,100,0,0,40,15000,25000,0,11,11431,1,0,0,0,0,9,0,0,0,0,0,0,0,0,'Darnassian Druid - On Friendly Between 0-40% Health - Cast ''Healing Touch'''),

(-82291,0,0,0,0,0,100,0,3000,7000,30000,35000,0,11,25602,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Darnassian Druid - IC - Cast ''Faerie Fire'''),
(-82291,0,1,0,74,0,100,0,0,40,15000,25000,0,11,11431,1,0,0,0,0,9,0,0,0,0,0,0,0,0,'Darnassian Druid - On Friendly Between 0-40% Health - Cast ''Healing Touch'''),
(-82291,0,2,0,1,0,100,0,10000,110000,90000,110000,0,80,1633100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darnassian Druid - OOC - Call Timed Action List'),

(-82289,0,0,0,0,0,100,0,3000,7000,30000,35000,0,11,25602,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Darnassian Druid - IC - Cast ''Faerie Fire'''),
(-82289,0,1,0,74,0,100,0,0,40,15000,25000,0,11,11431,1,0,0,0,0,9,0,0,0,0,0,0,0,0,'Darnassian Druid - On Friendly Between 0-40% Health - Cast ''Healing Touch'''),
(-82289,0,2,0,1,0,100,0,10000,110000,90000,110000,0,80,1633100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darnassian Druid - OOC - Call Timed Action List'),

(1633100,9,0,0,0,0,100,0,0,0,0,0,0,11,28892,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darnassian Druid - On Script - Cast ''Nature Channeling'''),
(1633100,9,1,0,0,0,100,0,20000,20000,0,0,0,92,0,28892,0,0,0,0,1,0,0,0,0,0,0,0,0,'Darnassian Druid - On Script - Interrupt ''Nature Channeling'''),

(16332,0,0,0,9,0,100,0,5,30,2300,3900,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Darnassian Huntress - Within 5-30 Range - Cast ''Shoot'''),
(16332,0,1,0,0,0,100,0,3000,6000,4000,6000,0,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Darnassian Huntress - IC - Cast ''Strike'''),
(16332,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Darnassian Huntress - Between 0-15% Health - Flee For Assist (No Repeat)');

DELETE FROM `waypoint_data` WHERE `id` IN (822920,30089430,30089460,30089470);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(822920,1,7754.84,-5700.87,4.02372,0,0,0,0,0,100,0),
(822920,2,7750.25,-5706.9,3.9556,0,0,0,0,0,100,0),
(822920,3,7744.03,-5715.07,3.65547,0,0,0,0,0,100,0),
(822920,4,7737.31,-5723.88,3.34113,0,0,0,0,0,100,0),
(822920,5,7731.71,-5731.24,3.7452,0,0,0,0,0,100,0),
(822920,6,7724.38,-5731.83,3.53453,0,0,0,0,0,100,0),
(822920,7,7715.77,-5732.53,3.42271,0,0,0,0,0,100,0),
(822920,8,7707.05,-5733.23,3.59096,0,0,0,0,0,100,0),
(822920,9,7699.03,-5733.88,3.67102,0,0,0,0,0,100,0),
(822920,10,7697.19,-5744.42,3.6993,0,0,0,0,0,100,0),
(822920,11,7695.75,-5752.66,4.71394,0,0,0,0,0,100,0),
(822920,12,7691.23,-5753.15,4.77751,0,0,0,0,0,100,0),
(822920,13,7685.19,-5753.8,4.28948,0,0,0,0,0,100,0),
(822920,14,7675.68,-5754.82,3.72201,0,0,0,0,0,100,0),
(822920,15,7668.22,-5755.62,3.75702,0,1000,0,0,0,100,0),
(822920,16,7675.68,-5754.82,3.72201,0,0,0,0,0,100,0),
(822920,17,7685.19,-5753.8,4.28948,0,0,0,0,0,100,0),
(822920,18,7691.23,-5753.15,4.77751,0,0,0,0,0,100,0),
(822920,19,7695.75,-5752.66,4.71394,0,0,0,0,0,100,0),
(822920,20,7697.19,-5744.42,3.6993,0,0,0,0,0,100,0),
(822920,21,7699.03,-5733.88,3.67102,0,0,0,0,0,100,0),
(822920,22,7707.05,-5733.23,3.59096,0,0,0,0,0,100,0),
(822920,23,7715.77,-5732.53,3.42271,0,0,0,0,0,100,0),
(822920,24,7724.38,-5731.83,3.53453,0,0,0,0,0,100,0),
(822920,25,7731.71,-5731.24,3.7452,0,0,0,0,0,100,0),
(822920,26,7737.31,-5723.88,3.34113,0,0,0,0,0,100,0),
(822920,27,7744.03,-5715.07,3.65547,0,0,0,0,0,100,0),
(822920,28,7750.25,-5706.9,3.9556,0,0,0,0,0,100,0),
(822920,29,7754.84,-5700.87,4.02372,0,0,0,0,0,100,0),
(822920,30,7753.46,-5691.28,3.52245,0,0,0,0,0,100,0),
(822920,31,7751.92,-5680.66,3.58376,0,0,0,0,0,100,0),
(822920,32,7750.78,-5672.69,3.48059,0,0,0,0,0,100,0),
(822920,33,7749.92,-5666.76,3.40936,0,1000,0,0,0,100,0),
(822920,34,7750.78,-5672.69,3.48059,0,0,0,0,0,100,0),
(822920,35,7751.92,-5680.66,3.58376,0,0,0,0,0,100,0),
(822920,36,7753.46,-5691.28,3.52245,0,0,0,0,0,100,0),

(30089430,1,7724.51,-5631.3,2.18227,0,1000,0,0,0,100,0),
(30089430,2,7730.21,-5628.46,1.1875,0,0,0,0,0,100,0),
(30089430,3,7734.69,-5624.9,2.63391,0,0,0,0,0,100,0),
(30089430,4,7741.71,-5619.31,4.70873,0,0,0,0,0,100,0),
(30089430,5,7747.98,-5614.32,6.56592,0,0,0,0,0,100,0),
(30089430,6,7753.46,-5608.9,6.02237,0,0,0,0,0,100,0),
(30089430,7,7758.29,-5604.12,5.95293,0,1000,0,0,0,100,0),
(30089430,8,7753.46,-5608.9,6.02237,0,0,0,0,0,100,0),
(30089430,9,7747.98,-5614.32,6.56592,0,0,0,0,0,100,0),
(30089430,10,7741.71,-5619.31,4.70873,0,0,0,0,0,100,0),
(30089430,11,7734.69,-5624.9,2.63391,0,0,0,0,0,100,0),
(30089430,12,7730.21,-5628.46,1.18772,0,0,0,0,0,100,0),

(30089460,1,7730.9,-5575.21,6.87522,0,0,0,0,0,100,0),
(30089460,2,7729.7,-5579.84,6.71054,0,0,0,0,0,100,0),
(30089460,3,7732.35,-5586.92,6.20643,0,0,0,0,0,100,0),
(30089460,4,7739.4,-5597.06,5.17654,0,0,0,0,0,100,0),
(30089460,5,7743.16,-5603.15,5.36911,0,0,0,0,0,100,0),
(30089460,6,7750.78,-5606.6,5.80167,0,0,0,0,0,100,0),
(30089460,7,7755.25,-5603.36,5.7955,0,0,0,0,0,100,0),
(30089460,8,7754,-5596.92,5.43916,0,0,0,0,0,100,0),
(30089460,9,7748.68,-5590.26,5.17735,0,0,0,0,0,100,0),
(30089460,10,7741.1,-5580.61,6.18628,0,0,0,0,0,100,0),
(30089460,11,7735.62,-5575.78,6.68511,0,0,0,0,0,100,0),

(30089470,1,7775.22,-5634.52,17.787,0,0,0,0,0,100,0),
(30089470,2,7781.78,-5625.83,17.6942,0,0,0,0,0,100,0),
(30089470,3,7780.74,-5623.48,17.5728,0,0,0,0,0,100,0),
(30089470,4,7778.63,-5620.92,15.0612,0,0,0,0,0,100,0),
(30089470,5,7773.26,-5620.72,12.782,0,0,0,0,0,100,0),
(30089470,6,7767.98,-5624.54,12.7655,0,0,0,0,0,100,0),
(30089470,7,7762.62,-5628.47,12.7785,0,0,0,0,0,100,0),
(30089470,8,7761.01,-5634.16,14.976,0,0,0,0,0,100,0),
(30089470,9,7762.9,-5637.49,17.6058,0,0,0,0,0,100,0),
(30089470,10,7767.26,-5638.09,17.731,0,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
