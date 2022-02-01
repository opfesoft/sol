-- DB update 2022_02_01_01 -> 2022_02_01_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_01_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_01_01 2022_02_01_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1643717620332218619'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1643717620332218619');

DELETE FROM `pool_template` WHERE `entry` = 203345;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(203345,45,'Ravager Specimen (45 out of 91)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 203345;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(61226,203345,0,'Ravager Specimen 1'),
(61227,203345,0,'Ravager Specimen 2'),
(61228,203345,0,'Ravager Specimen 3'),
(61229,203345,0,'Ravager Specimen 4'),
(61230,203345,0,'Ravager Specimen 5'),
(61231,203345,0,'Ravager Specimen 6'),
(61232,203345,0,'Ravager Specimen 7'),
(61233,203345,0,'Ravager Specimen 8'),
(61234,203345,0,'Ravager Specimen 9'),
(61235,203345,0,'Ravager Specimen 10'),
(61236,203345,0,'Ravager Specimen 11'),
(61237,203345,0,'Ravager Specimen 12'),
(61238,203345,0,'Ravager Specimen 13'),
(61239,203345,0,'Ravager Specimen 14'),
(61240,203345,0,'Ravager Specimen 15'),
(61241,203345,0,'Ravager Specimen 16'),
(61242,203345,0,'Ravager Specimen 17'),
(61243,203345,0,'Ravager Specimen 18'),
(61244,203345,0,'Ravager Specimen 19'),
(61245,203345,0,'Ravager Specimen 20'),
(61246,203345,0,'Ravager Specimen 21'),
(61247,203345,0,'Ravager Specimen 22'),
(61248,203345,0,'Ravager Specimen 23'),
(61249,203345,0,'Ravager Specimen 24'),
(61250,203345,0,'Ravager Specimen 25'),
(61251,203345,0,'Ravager Specimen 26'),
(61252,203345,0,'Ravager Specimen 27'),
(61253,203345,0,'Ravager Specimen 28'),
(61254,203345,0,'Ravager Specimen 29'),
(61255,203345,0,'Ravager Specimen 30'),
(61256,203345,0,'Ravager Specimen 31'),
(61257,203345,0,'Ravager Specimen 32'),
(61258,203345,0,'Ravager Specimen 33'),
(61259,203345,0,'Ravager Specimen 34'),
(61260,203345,0,'Ravager Specimen 35'),
(61261,203345,0,'Ravager Specimen 36'),
(61262,203345,0,'Ravager Specimen 37'),
(61263,203345,0,'Ravager Specimen 38'),
(61264,203345,0,'Ravager Specimen 39'),
(61265,203345,0,'Ravager Specimen 40'),
(61266,203345,0,'Ravager Specimen 41'),
(61267,203345,0,'Ravager Specimen 42'),
(61268,203345,0,'Ravager Specimen 43'),
(61269,203345,0,'Ravager Specimen 44'),
(61270,203345,0,'Ravager Specimen 45'),
(61271,203345,0,'Ravager Specimen 46'),
(61272,203345,0,'Ravager Specimen 47'),
(61273,203345,0,'Ravager Specimen 48'),
(61274,203345,0,'Ravager Specimen 49'),
(61275,203345,0,'Ravager Specimen 50'),
(61276,203345,0,'Ravager Specimen 51'),
(61277,203345,0,'Ravager Specimen 52'),
(61278,203345,0,'Ravager Specimen 53'),
(61279,203345,0,'Ravager Specimen 54'),
(61280,203345,0,'Ravager Specimen 55'),
(61281,203345,0,'Ravager Specimen 56'),
(61282,203345,0,'Ravager Specimen 57'),
(61283,203345,0,'Ravager Specimen 58'),
(61284,203345,0,'Ravager Specimen 59'),
(61285,203345,0,'Ravager Specimen 60'),
(61286,203345,0,'Ravager Specimen 61'),
(61287,203345,0,'Ravager Specimen 62'),
(61288,203345,0,'Ravager Specimen 63'),
(61289,203345,0,'Ravager Specimen 64'),
(61290,203345,0,'Ravager Specimen 65'),
(61291,203345,0,'Ravager Specimen 66'),
(61292,203345,0,'Ravager Specimen 67'),
(61293,203345,0,'Ravager Specimen 68'),
(61294,203345,0,'Ravager Specimen 69'),
(61295,203345,0,'Ravager Specimen 70'),
(61296,203345,0,'Ravager Specimen 71'),
(61297,203345,0,'Ravager Specimen 72'),
(61298,203345,0,'Ravager Specimen 73'),
(61299,203345,0,'Ravager Specimen 74'),
(61300,203345,0,'Ravager Specimen 75'),
(61301,203345,0,'Ravager Specimen 76'),
(61302,203345,0,'Ravager Specimen 77'),
(61303,203345,0,'Ravager Specimen 78'),
(61304,203345,0,'Ravager Specimen 79'),
(61305,203345,0,'Ravager Specimen 80'),
(61306,203345,0,'Ravager Specimen 81'),
(61307,203345,0,'Ravager Specimen 82'),
(61308,203345,0,'Ravager Specimen 83'),
(61309,203345,0,'Ravager Specimen 84'),
(61310,203345,0,'Ravager Specimen 85'),
(61312,203345,0,'Ravager Specimen 86'),
(61313,203345,0,'Ravager Specimen 87'),
(61314,203345,0,'Ravager Specimen 88'),
(61315,203345,0,'Ravager Specimen 89'),
(61316,203345,0,'Ravager Specimen 90'),
(61317,203345,0,'Ravager Specimen 91');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
