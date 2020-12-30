-- DB update 2020_12_30_06 -> 2020_12_30_07
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_30_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_30_06 2020_12_30_07 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609328772277680335'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609328772277680335');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2187,2208,2185,2235,2233,2236,3660,2180,2189,10159,10160,2322,2321,2069,2323) AND `source_type` = 0 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2167,2182,10157,2168) AND `source_type` = 0 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2187,0,0,0,0,0,100,0,2500,3200,45500,50000,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Elder Darkshore Thresher - IC - Cast ''Pierce Armor'''),

(2208,0,0,0,0,0,100,0,2700,2900,7900,8100,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Greymist Tidehunter - IC - Cast ''Poison'''),

(2167,0,1,0,0,0,100,0,2700,3300,7900,8600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blackwood Pathfinder - IC - Cast ''Thrash'''),

(2185,0,0,0,0,0,100,0,2300,3200,45000,50000,0,11,6016,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Darkshore Thresher - IC - Cast ''Pierce Armor'''),

(2235,0,0,0,0,0,100,0,2300,2600,8900,9400,0,11,12166,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Reef Crawler - IC - Cast ''Muscle Tear'''),

(2233,0,0,0,0,0,100,0,2400,3100,32500,34600,0,11,3427,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Encrusted Tide Crawler - IC - Cast ''Infected Wound'''),

(2236,0,0,0,0,0,100,0,2700,3100,9500,10100,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Reef Crawler - IC - Cast ''Thrash'''),

(2182,0,1,0,0,0,100,0,0,0,6800,7400,0,11,20792,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Stormscale Sorceress - IC - Cast ''Frostbolt'''),

(3660,0,0,0,0,0,100,0,0,0,6800,7200,0,11,7641,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Athrikus Narassin - IC - Cast ''Shadow Bolt'''),

(2180,0,0,0,0,0,100,0,0,0,6500,6700,0,11,9734,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Stormscale Siren - IC - Cast ''Holy Smite'''),

(2189,0,0,0,0,0,100,0,2400,2900,32400,32900,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Vile Sprite - IC - Cast ''Poison'''),

(10159,0,0,0,0,0,100,0,1000,1200,9600,12700,0,11,8921,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Young Moonkin - IC - Cast ''Moonfire'''),

(10157,0,1,0,0,0,100,0,1400,1600,5400,6200,0,11,9739,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Moonkin Oracle - IC - Cast ''Wrath'''),

(10160,0,0,0,0,0,100,0,1200,1800,16200,16800,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Raging Moonkin - IC - Cast ''Rend'''),

(2322,0,0,0,0,0,100,0,2100,3100,6900,7400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Foreststrider - IC - Cast ''Thrash'''),

(2321,0,0,0,0,0,100,0,2100,3100,6900,7400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Foreststrider Fledgling - IC - Cast ''Thrash'''),

(2069,0,0,0,0,0,100,0,1200,1300,12200,14300,0,11,24331,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Moonstalker - IC - Cast ''Rake'''),

(2168,0,1,0,0,0,100,0,6500,10000,12000,14000,0,11,13532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Blackwood Warrior - IC - Cast ''Thunder Clap'''),

(2323,0,0,0,0,0,100,0,2100,3100,6900,7400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Giant Foreststrider - IC - Cast ''Thrash''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
