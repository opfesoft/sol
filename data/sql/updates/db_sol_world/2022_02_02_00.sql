-- DB update 2022_02_01_02 -> 2022_02_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_01_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_01_02 2022_02_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1643797918561083153'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1643797918561083153');

ALTER TABLE `game_event_creature` MODIFY `eventEntry` SMALLINT(5) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.';
ALTER TABLE `game_event_creature` ADD CONSTRAINT `eventEntry_check` CHECK ( `eventEntry` >= -255 AND `eventEntry` <= 255 AND `eventEntry` != 0 );
ALTER TABLE `game_event_gameobject` MODIFY `eventEntry` SMALLINT(5) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.';
ALTER TABLE `game_event_gameobject` ADD CONSTRAINT `eventEntry_check` CHECK ( `eventEntry` >= -255 AND `eventEntry` <= 255 AND `eventEntry` != 0 );
ALTER TABLE `game_event_pool` MODIFY `eventEntry` SMALLINT(5) NOT NULL COMMENT 'Entry of the game event. Put negative entry to remove during event.';
ALTER TABLE `game_event_pool` ADD CONSTRAINT `eventEntry_check` CHECK ( `eventEntry` >= -255 AND `eventEntry` <= 255 AND `eventEntry` != 0 );

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
