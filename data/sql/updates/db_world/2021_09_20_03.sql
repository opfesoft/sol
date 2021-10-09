-- DB update 2021_09_20_02 -> 2021_09_20_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_09_20_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_09_20_02 2021_09_20_03 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1631739945979964800'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1631739945979964800');

UPDATE `broadcast_text_locale` SET `MaleText`='Saludos. Mi función consiste en proporcionar acceso y, si es admisible, explicaciones sobre la síntesis de terráneos por parte de los Creadores del lugar conocido como Azeroth. Estoy listo para compartir esta información contigo cuando lo desees.' WHERE `ID`=3172 AND `locale` IN ('esES','esMX');


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;