-- DB update 2020_06_15_00 -> 2020_06_15_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_15_00 2020_06_15_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592256261327134840'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592256261327134840');

-- Quest "Bring 'Em Back Alive": Add areas "Warsong Granary" and "Warsong Slaughterhouse" to conditions
DELETE FROM `conditions` WHERE `SourceEntry` = 25596;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(16,0,25596,0,0,23,0,3537,0,0,0,0,0,'','Dismount player when not in intended zone ''Borean Tundra'' (Quest ''Bring ''Em Back Alive'')'),
(16,0,25596,0,1,23,0,4141,0,0,0,0,0,'','Dismount player when not in intended zone ''Torp''s Farm'' (Quest ''Bring ''Em Back Alive'')'),
(16,0,25596,0,2,23,0,4142,0,0,0,0,0,'','Dismount player when not in intended zone ''Warsong Granary'' (Quest ''Bring ''Em Back Alive'')'),
(16,0,25596,0,3,23,0,4143,0,0,0,0,0,'','Dismount player when not in intended zone ''Warsong Slaughterhouse'' (Quest ''Bring ''Em Back Alive'')'),
(16,0,25596,0,4,23,0,4144,0,0,0,0,0,'','Dismount player when not in intended zone ''Warsong Farms Outpost'' (Quest ''Bring ''Em Back Alive'')');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
