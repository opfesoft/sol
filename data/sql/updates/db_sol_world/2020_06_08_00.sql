-- DB update 2020_05_28_00 -> 2020_06_08_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_28_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_28_00 2020_06_08_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1591615464399835179'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1591615464399835179');

-- Argent Tournament Post, Invisible Stalker (Scale x0.5): Set large
DELETE FROM `creature_addon` WHERE `guid` IN
(81432,81433,81434,81435,84073,84074,84483,84657,         -- Argent Tournament Post
209019,209020,209021,209022,209023,209024,209025,209026); -- Invisible Stalker (Scale x0.5)
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(81432,0,0,0,0,0,1,''),
(81433,0,0,0,0,0,1,''),
(81434,0,0,0,0,0,1,''),
(81435,0,0,0,0,0,1,''),
(84073,0,0,0,0,0,1,''),
(84074,0,0,0,0,0,1,''),
(84483,0,0,0,0,0,1,''),
(84657,0,0,0,0,0,1,''),

(209019,0,0,0,0,0,1,''),
(209020,0,0,0,0,0,1,''),
(209021,0,0,0,0,0,1,''),
(209022,0,0,0,0,0,1,''),
(209023,0,0,0,0,0,1,''),
(209024,0,0,0,0,0,1,''),
(209025,0,0,0,0,0,1,''),
(209026,0,0,0,0,0,1,'');

-- Gormok the Impaler: Set large
UPDATE `creature_template_addon` SET `isLarge` = 1 WHERE `entry` = 35469;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
