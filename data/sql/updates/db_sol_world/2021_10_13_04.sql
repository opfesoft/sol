-- DB update 2021_10_13_03 -> 2021_10_13_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_13_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_13_03 2021_10_13_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634121696106956043'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634121696106956043');

-- Corrupted plants: Respawn 2h
UPDATE `gameobject` SET `spawntimesecs` = 7200 WHERE `guid` IN (48843,48844,48845,48846,48847,48848,48849,48850,48851,48852,48853,48854,48855,48856,48857,48858,48914,48915,48924,48928,48929,48935,48936,48942,48943,48951,48952,48955,48957);

-- Cleansed plants: Don't spawn (spawned via SAI)
UPDATE `gameobject` SET `spawntimesecs` = -1 WHERE `guid` IN (17641,48873,48874,48875,48878,48879,48880,48881,48882,48883,48884,48885,48886,48887,48888,48889,48890,48891,48897,48899);

DELETE FROM `gameobject` WHERE `guid` IN (17643,17645,17647,17654,17656,17658,17660,17662,17664,18176,18178,18180,18186,18188,18190,18192,18194,18212,18218);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
-- Add missing Corrupted Songflower
(17643,174597,1,0,0,1,1,6297.82,-1972.49,562.09,5.38682,0,0,0.433329,-0.901236,7200,100,1,0),
-- Add missing Cleansed Songflowers
(17645,174614,1,0,0,1,1,6297.82,-1972.49,562.09,5.38682,0,0,0.433329,-0.901236,-1,100,1,0),
(17647,164882,1,0,0,1,1,3766.65,-1400,203.65,-0.453786,0,0,0.224951,-0.97437,-1,100,1,0),
(17654,171940,1,0,0,1,1,3866.65,-1000.02,244.199,0.942478,0,0,0.45399,0.891007,-1,100,1,0),
(17656,171943,1,0,0,1,1,4233.32,-1133.32,322.629,1.64061,0,0,0.731354,0.681998,-1,100,1,0),
(17658,174610,1,0,0,1,1,6266.67,-2000.02,573.426,-1.02974,0,0,0.492424,-0.870356,-1,100,1,0),
(17660,174612,1,0,0,1,1,6900,-2033.33,583.696,1.81514,0,0,0.788011,0.615662,-1,100,1,0),
(17662,174613,1,0,0,1,1,6733.31,-1566.68,477.04,-2.82743,0,0,0.987688,-0.156434,-1,100,1,0),
(17664,174615,1,0,0,1,1,5133.34,-333.352,354.553,-1.41372,0,0,0.649448,-0.760406,-1,100,1,0),
(18176,174714,1,0,0,1,1,4966.66,-666.679,295.082,-2.70526,0,0,0.976296,-0.21644,-1,100,1,0),
(18178,174715,1,0,0,1,1,5433.33,-666.653,348.089,1.65806,0,0,0.737277,0.67559,-1,100,1,0);

-- Corrupted plants: Adjust size; Allow despawn
UPDATE `gameobject_template` SET `size` = 2, `Data5` = 1 WHERE `entry` IN (164885,164886,164887,164888,171939,171942,173284,173324,173327,174594,174595,174596,174597,174598,174599,174600,174601,174602,174603,174604,174605,174606,174607,174608,174684,174686,174708,174709,174712,174713);

-- Cleansed plants: Adjust size; Despawn after used
UPDATE `gameobject_template` SET `size` = 2, `Data3` = 1 WHERE `entry` IN (164881,164882,164883,164884,171940,171943,173325,173326,174609,174610,174612,174613,174614,174615,174616,174617,174618,174619,174620,174621,174622,174623,174624,174625,174685,174687,174710,174711,174714,174715);

-- Cleansed Songflower: Remove GO_FLAG_NOT_SELECTABLE
UPDATE `gameobject_template_addon` SET `flags` = 0 WHERE `entry` = 174610;

DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (164885,164886,164887,164888,171939,171942,173284,173324,173327,174594,174595,174596,174597,174598,174599,174600,174601,174602,174603,174604,174605,174606,174607,174608,174684,174686,174708,174709,174712,174713);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(164885,1,0,1,20,0,100,0,4119,0,0,0,0,70,7200,0,0,0,0,0,14,17641,164881,0,0,0,0,0,0,'Corrupted Night Dragon - On Quest ''Corrupted Night Dragon'' Rewarded - Respawn GO ''Cleansed Night Dragon'''),
(164885,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Night Dragon - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(164886,1,0,1,20,0,100,0,2523,0,0,0,0,70,7200,0,0,0,0,0,14,17647,164882,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(164886,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(164887,1,0,1,20,0,100,0,996,0,0,0,0,70,7200,0,0,0,0,0,14,48878,164884,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(164887,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(164888,1,0,1,20,0,100,0,4117,0,0,0,0,70,7200,0,0,0,0,0,14,48881,164883,0,0,0,0,0,0,'Corrupted Whipper Root - On Quest ''Corrupted Whipper Root'' Rewarded - Respawn GO ''Cleansed Whipper Root'''),
(164888,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Whipper Root - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(171939,1,0,1,20,0,100,0,2878,0,0,0,0,70,7200,0,0,0,0,0,14,17654,171940,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(171939,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(171942,1,0,1,20,0,100,0,3363,0,0,0,0,70,7200,0,0,0,0,0,14,17656,171943,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(171942,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(173284,1,0,1,20,0,100,0,4443,0,0,0,0,70,7200,0,0,0,0,0,14,48882,174622,0,0,0,0,0,0,'Corrupted Whipper Root - On Quest ''Corrupted Whipper Root'' Rewarded - Respawn GO ''Cleansed Whipper Root'''),
(173284,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Whipper Root - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(173324,1,0,1,20,0,100,0,4448,0,0,0,0,70,7200,0,0,0,0,0,14,48874,174609,0,0,0,0,0,0,'Corrupted Night Dragon - On Quest ''Corrupted Night Dragon'' Rewarded - Respawn GO ''Cleansed Night Dragon'''),
(173324,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Night Dragon - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(173327,1,0,1,20,0,100,0,998,0,0,0,0,70,7200,0,0,0,0,0,14,48879,173326,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(173327,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174594,1,0,1,20,0,100,0,4113,0,0,0,0,70,7200,0,0,0,0,0,14,17658,174610,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(174594,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174595,1,0,1,20,0,100,0,4114,0,0,0,0,70,7200,0,0,0,0,0,14,17660,174612,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(174595,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174596,1,0,1,20,0,100,0,4116,0,0,0,0,70,7200,0,0,0,0,0,14,17662,174613,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(174596,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174597,1,0,1,20,0,100,0,4118,0,0,0,0,70,7200,0,0,0,0,0,14,17645,174614,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(174597,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174598,1,0,1,20,0,100,0,4401,0,0,0,0,70,7200,0,0,0,0,0,14,17664,174615,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(174598,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174599,1,0,1,20,0,100,0,1514,0,0,0,0,70,7200,0,0,0,0,0,14,48880,174616,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(174599,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174600,1,0,1,20,0,100,0,4115,0,0,0,0,70,7200,0,0,0,0,0,14,48887,174617,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(174600,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174601,1,0,1,20,0,100,0,4221,0,0,0,0,70,7200,0,0,0,0,0,14,48888,174618,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(174601,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174602,1,0,1,20,0,100,0,4222,0,0,0,0,70,7200,0,0,0,0,0,14,48889,174619,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(174602,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174603,1,0,1,20,0,100,0,4343,0,0,0,0,70,7200,0,0,0,0,0,14,48890,174620,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(174603,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174604,1,0,1,20,0,100,0,4403,0,0,0,0,70,7200,0,0,0,0,0,14,48891,174621,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(174604,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174605,1,0,1,20,0,100,0,4444,0,0,0,0,70,7200,0,0,0,0,0,14,48883,174623,0,0,0,0,0,0,'Corrupted Whipper Root - On Quest ''Corrupted Whipper Root'' Rewarded - Respawn GO ''Cleansed Whipper Root'''),
(174605,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Whipper Root - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174606,1,0,1,20,0,100,0,4445,0,0,0,0,70,7200,0,0,0,0,0,14,48884,174624,0,0,0,0,0,0,'Corrupted Whipper Root - On Quest ''Corrupted Whipper Root'' Rewarded - Respawn GO ''Cleansed Whipper Root'''),
(174606,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Whipper Root - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174607,1,0,1,20,0,100,0,4446,0,0,0,0,70,7200,0,0,0,0,0,14,48885,174625,0,0,0,0,0,0,'Corrupted Whipper Root - On Quest ''Corrupted Whipper Root'' Rewarded - Respawn GO ''Cleansed Whipper Root'''),
(174607,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Whipper Root - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174608,1,0,1,20,0,100,0,4462,0,0,0,0,70,7200,0,0,0,0,0,14,48875,174685,0,0,0,0,0,0,'Corrupted Night Dragon - On Quest ''Corrupted Night Dragon'' Rewarded - Respawn GO ''Cleansed Night Dragon'''),
(174608,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Night Dragon - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174684,1,0,1,20,0,100,0,4447,0,0,0,0,70,7200,0,0,0,0,0,14,48873,173325,0,0,0,0,0,0,'Corrupted Night Dragon - On Quest ''Corrupted Night Dragon'' Rewarded - Respawn GO ''Cleansed Night Dragon'''),
(174684,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Night Dragon - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174686,1,0,1,20,0,100,0,4461,0,0,0,0,70,7200,0,0,0,0,0,14,48886,174687,0,0,0,0,0,0,'Corrupted Whipper Root - On Quest ''Corrupted Whipper Root'' Rewarded - Respawn GO ''Cleansed Whipper Root'''),
(174686,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Whipper Root - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174708,1,0,1,20,0,100,0,4466,0,0,0,0,70,7200,0,0,0,0,0,14,48897,174710,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(174708,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174709,1,0,1,20,0,100,0,4467,0,0,0,0,70,7200,0,0,0,0,0,14,48899,174711,0,0,0,0,0,0,'Corrupted Windblossom - On Quest ''Corrupted Windblossom'' Rewarded - Respawn GO ''Cleansed Windblossom'''),
(174709,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Windblossom - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174712,1,0,1,20,0,100,0,4464,0,0,0,0,70,7200,0,0,0,0,0,14,18176,174714,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(174712,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED'''),

(174713,1,0,1,20,0,100,0,4465,0,0,0,0,70,7200,0,0,0,0,0,14,18178,174715,0,0,0,0,0,0,'Corrupted Songflower - On Quest ''Corrupted Songflower'' Rewarded - Respawn GO ''Cleansed Songflower'''),
(174713,1,1,0,61,0,100,0,0,0,0,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corrupted Songflower - Linked - Set Loot State ''GO_JUST_DEACTIVATED''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
