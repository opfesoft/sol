-- DB update 2020_11_22_00 -> 2020_11_25_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_22_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_22_00 2020_11_25_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606259140633481067'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606259140633481067');

-- Only cast "Siege Tank Control" on spellclick, "Ride Vehicle Hardcoded" is not needed anymore, so delete it
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 25334 AND `spell_id` = 46598;

-- Siege Tank Control: Remove obsolete area restrictions (this is handled via area conditions for the vehicle)
DELETE FROM `spell_area` WHERE `spell` = 47917;

-- Siege Tank Control: Add new condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceGroup` = 0 AND `SourceEntry` = 47917 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(17,0,47917,0,0,9,0,11652,0,0,0,0,0,'','Can cast spell ''Siege Tank Control'' only if on quest ''The Plains of Nasam''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
