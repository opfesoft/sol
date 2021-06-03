-- DB update 2021_06_03_01 -> 2021_06_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_03_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_03_01 2021_06_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1622758862073719328'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1622758862073719328');

DELETE FROM `creature_addon` WHERE `guid` BETWEEN 94249 AND 94263;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(94249,0,0,0,2,384,0,NULL),
(94250,0,0,0,2,384,0,NULL),
(94251,0,0,0,2,384,0,NULL),
(94252,0,0,0,2,0,0,NULL),
(94253,0,0,0,2,0,0,NULL),
(94254,0,0,0,2,0,0,NULL),
(94255,0,0,0,2,384,0,NULL),
(94256,0,0,0,2,384,0,NULL),
(94257,0,0,0,2,384,0,NULL),
(94258,0,0,0,2,0,0,NULL),
(94259,942590,0,0,2,0,0,NULL),
(94260,0,0,0,2,0,0,NULL),
(94261,0,0,0,2,0,0,NULL),
(94262,0,0,0,2,0,0,NULL),
(94263,0,0,0,2,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (24979,25063,-94249,-94250,-94251,-94255,-94256,-94257);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(24979,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - Within 5-30 Range - Cast ''Shoot'''),
(24979,0,1,0,0,0,100,0,4000,6000,9000,12000,0,11,37847,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - IC - Cast ''Immolation Arrow'''),

(-94249,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - Within 5-30 Range - Cast ''Shoot'''),
(-94249,0,1,0,0,0,100,0,4000,6000,9000,12000,0,11,37847,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - IC - Cast ''Immolation Arrow'''),
(-94249,0,2,0,1,0,100,0,4000,6000,4000,6000,0,11,45101,0,0,0,0,0,10,94241,5202,1,0,0,0,0,0,'Dawnblade Marksman - OOC - Cast ''Flaming Arrow'' (Archery Target)'),

(-94250,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - Within 5-30 Range - Cast ''Shoot'''),
(-94250,0,1,0,0,0,100,0,4000,6000,9000,12000,0,11,37847,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - IC - Cast ''Immolation Arrow'''),
(-94250,0,2,0,1,0,100,0,4000,6000,4000,6000,0,11,45101,0,0,0,0,0,10,94242,5202,1,0,0,0,0,0,'Dawnblade Marksman - OOC - Cast ''Flaming Arrow'' (Archery Target)'),

(-94251,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - Within 5-30 Range - Cast ''Shoot'''),
(-94251,0,1,0,0,0,100,0,4000,6000,9000,12000,0,11,37847,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - IC - Cast ''Immolation Arrow'''),
(-94251,0,2,0,1,0,100,0,4000,6000,4000,6000,0,11,45101,0,0,0,0,0,10,94246,5202,1,0,0,0,0,0,'Dawnblade Marksman - OOC - Cast ''Flaming Arrow'' (Archery Target)'),

(-94255,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - Within 5-30 Range - Cast ''Shoot'''),
(-94255,0,1,0,0,0,100,0,4000,6000,9000,12000,0,11,37847,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - IC - Cast ''Immolation Arrow'''),
(-94255,0,2,0,1,0,100,0,4000,6000,4000,6000,0,11,45101,0,0,0,0,0,10,94243,5202,1,0,0,0,0,0,'Dawnblade Marksman - OOC - Cast ''Flaming Arrow'' (Archery Target)'),

(-94256,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - Within 5-30 Range - Cast ''Shoot'''),
(-94256,0,1,0,0,0,100,0,4000,6000,9000,12000,0,11,37847,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - IC - Cast ''Immolation Arrow'''),
(-94256,0,2,0,1,0,100,0,4000,6000,4000,6000,0,11,45101,0,0,0,0,0,10,94244,5202,1,0,0,0,0,0,'Dawnblade Marksman - OOC - Cast ''Flaming Arrow'' (Archery Target)'),

(-94257,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - Within 5-30 Range - Cast ''Shoot'''),
(-94257,0,1,0,0,0,100,0,4000,6000,9000,12000,0,11,37847,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dawnblade Marksman - IC - Cast ''Immolation Arrow'''),
(-94257,0,2,0,1,0,100,0,4000,6000,4000,6000,0,11,45101,0,0,0,0,0,10,94245,5202,1,0,0,0,0,0,'Dawnblade Marksman - OOC - Cast ''Flaming Arrow'' (Archery Target)'),

(25063,0,0,0,1,0,100,0,3000,6500,3000,6500,0,11,45189,0,0,0,0,0,19,24938,70,0,0,0,0,0,0,'Dawnblade Hawkrider - OOC - Cast ''Dawnblade Attack'' (Shattered Sun Marksman)');

DELETE FROM `waypoint_data` WHERE `id` = 942590;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(942590,1,12692.8,-6655.74,3.91284,4.82227,30000,0,0,100,0),
(942590,2,12731.4,-6653.77,1.27485,0,30000,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
