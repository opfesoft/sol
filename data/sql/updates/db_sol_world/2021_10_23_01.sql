-- DB update 2021_10_23_00 -> 2021_10_23_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_23_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_23_00 2021_10_23_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635012346050058537'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635012346050058537');

UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` IN (5232,5234,5236,5238,5241,5239);

UPDATE `creature_addon` SET `bytes2` = 4097 WHERE `guid` IN (50172,50174,50181,50184,50185,50189,50199,50209,50213,50228,50242,50256,50267,50275,50304);

UPDATE `creature` SET `position_x` = -3897.81, `position_y` = 204.39, `position_z` = 114.281, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50173;
UPDATE `creature` SET `position_x` = -3987.05, `position_y` = -83.7939, `position_z` = 151.428, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50175;
UPDATE `creature` SET `position_x` = -3995.36, `position_y` = -181.766, `position_z` = 139.435, `orientation` = 0.687519 WHERE `guid` = 50176;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 50176;
UPDATE `creature` SET `position_x` = -3979.18, `position_y` = -95.3347, `position_z` = 150.088, `orientation` = 3.65947 WHERE `guid` = 50177;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 50177;
UPDATE `creature` SET `position_x` = -3679.7, `position_y` = 255.19, `position_z` = 141.801, `MovementType` = 1, `wander_distance` = 4 WHERE `guid` = 50179;
UPDATE `creature` SET `position_x` = -3740.16, `position_y` = 210.875, `position_z` = 121.932, `orientation` = 4.48374 WHERE `guid` = 50180;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 50180;
UPDATE `creature` SET `position_x` = -3905.59, `position_y` = 124.406, `position_z` = 132.432, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50194;
UPDATE `creature` SET `position_x` = -3733.62, `position_y` = 250.087, `position_z` = 121.122, `orientation` = 5.43353 WHERE `guid` = 50195;
UPDATE `creature` SET `position_x` = -3648.27, `position_y` = 241.239, `position_z` = 143.929, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50196;
UPDATE `creature` SET `position_x` = -3989.37, `position_y` = -138.715, `position_z` = 139.434, `orientation` = 1.2857 WHERE `guid` = 50198;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 50198;
UPDATE `creature` SET `position_x` = -3742.89, `position_y` = 203.496, `position_z` = 121.817, `orientation` = 1.26608 WHERE `guid` = 50203;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 50203;
UPDATE `creature` SET `position_x` = -3661.8, `position_y` = 258.85, `position_z` = 143.148, `orientation` = 1.66488 WHERE `guid` = 50205;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 50205;
UPDATE `creature` SET `position_x` = -4888.05, `position_y` = 1162.96, `position_z` = 79.7244, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50206;
UPDATE `creature` SET `position_x` = -3914.04, `position_y` = 184.817, `position_z` = 119.939, `orientation` = 3.97581 WHERE `guid` = 50215;
UPDATE `creature` SET `position_x` = -3941.28, `position_y` = 177.12, `position_z` = 108.953, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50216;
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 4 WHERE `guid` = 50217;
UPDATE `creature` SET `position_x` = -3917.35, `position_y` = 124.288, `position_z` = 132.622, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50218;
UPDATE `creature` SET `position_x` = -5354.23, `position_y` = 1316.75, `position_z` = 35.6191, `orientation` = 4.1195 WHERE `guid` = 50222;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 50222;
UPDATE `creature` SET `position_x` = -4892.93, `position_y` = 1146.19, `position_z` = 81.6357, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50227;
UPDATE `creature` SET `position_x` = -5285.45, `position_y` = 1279.19, `position_z` = 50.7439, `orientation` = 3.036 WHERE `guid` = 50230;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 50230;
UPDATE `creature` SET `position_x` = -5738.07, `position_y` = 1219.12, `position_z` = 66.3986, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50235;
UPDATE `creature` SET `position_x` = -5310.84, `position_y` = 1268.53, `position_z` = 50.2046, `MovementType` = 1, `wander_distance` = 10 WHERE `guid` = 50244;
UPDATE `creature` SET `position_x` = -3938.68, `position_y` = 201.949, `position_z` = 106.854, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50250;
UPDATE `creature` SET `position_x` = -3914.83, `position_y` = 195.759, `position_z` = 119.796, `orientation` = 1.72098 WHERE `guid` = 50251;
UPDATE `creature` SET `position_x` = -3726.04, `position_y` = 240.218, `position_z` = 121.298, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50252;
UPDATE `creature` SET `position_x` = -3985.88, `position_y` = -131.631, `position_z` = 140.165, `orientation` = 4.0607 WHERE `guid` = 50253;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 50253;
UPDATE `creature` SET `position_x` = -4010.64, `position_y` = -149.937, `position_z` = 135.899, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50254;
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `guid` IN (50291,50307,50313,50800,50314);
UPDATE `creature` SET `position_x` = -5355.19, `position_y` = 1300.54, `position_z` = 35.9012, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50297;
UPDATE `creature` SET `position_x` = -5457.03, `position_y` = 1220.89, `position_z` = 32.8686, `orientation` = 2.54091 WHERE `guid` = 50317;
DELETE FROM `creature_addon` WHERE `guid` = 50317;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(50317,0,0,0,0,0,0,NULL);
UPDATE `creature` SET `position_x` = -5396.99, `position_y` = 1276.93, `position_z` = 23.4645, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 50319;
UPDATE `creature` SET `position_x` = -5735.74, `position_y` = 1440.74, `position_z` = 54.1258, `MovementType` = 1, `wander_distance` = 15 WHERE `guid` = 50268;
UPDATE `creature` SET `position_x` = -5752.63, `position_y` = 1329.53, `position_z` = 54.1254, `MovementType` = 1, `wander_distance` = 15 WHERE `guid` = 50269;
UPDATE `creature` SET `position_x` = -5639.95, `position_y` = 1314.21, `position_z` = 54.1259, `MovementType` = 1, `wander_distance` = 15 WHERE `guid` = 50270;
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `guid` IN (50294,91738,91739);
UPDATE `creature` SET `position_x` = -1484.12, `position_y` = 5920.36, `position_z` = 194.493, `MovementType` = 1, `wander_distance` = 10 WHERE `guid` = 91721;
UPDATE `creature` SET `position_x` = -1529.87, `position_y` = 5901.11, `position_z` = 198.985, `MovementType` = 1, `wander_distance` = 5 WHERE `guid` = 91719;
UPDATE `creature` SET `position_x` = -1399.79, `position_y` = 5888.51, `position_z` = 187.202, `MovementType` = 1, `wander_distance` = 10 WHERE `guid` = 91728;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
