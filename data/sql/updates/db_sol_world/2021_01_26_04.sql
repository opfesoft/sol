-- DB update 2021_01_26_03 -> 2021_01_26_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_26_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_26_03 2021_01_26_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1611685306471936209'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1611685306471936209');

DELETE FROM `creature_text` WHERE `CreatureID` IN (20415,20464);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(20415,0,0,'Mooooo...',12,0,100,0,0,0,18179,0,'bessy SAY_BESSY_0'),
(20415,1,0,'Moooooooooo!',12,0,100,0,0,0,18180,0,'bessy SAY_BESSY_1'),

(20464,0,0,'Bessy, you''re home. Thank the Light!',12,0,100,0,0,0,18181,0,'bessy SAY_THADELL_0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
