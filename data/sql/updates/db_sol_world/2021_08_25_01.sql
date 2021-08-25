-- DB update 2021_08_25_00 -> 2021_08_25_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_25_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_25_00 2021_08_25_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629923717387265776'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629923717387265776');

DELETE FROM `gameobject_template_locale` WHERE `entry` = 2413;
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `castBarCaption`, `VerifiedBuild`)
VALUES
(2413,'deDE','Holzstuhl','',0),
(2413,'esES','Silla de madera','',0),
(2413,'esMX','Silla de madera','',0),
(2413,'frFR','Chaise en bois','',0),
(2413,'koKR','나무 의자','',0),
(2413,'ruRU','Деревянный стул','',0),
(2413,'zhCN','木椅','',0),
(2413,'zhTW','木椅','',0);

DELETE FROM `gameobject` WHERE `guid` IN (61890,61889,61891,61887,61915,61917);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
