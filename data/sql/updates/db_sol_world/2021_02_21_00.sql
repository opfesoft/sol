-- DB update 2021_02_20_00 -> 2021_02_21_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_20_00 2021_02_21_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613862630928270611'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613862630928270611');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (16844,16968,21380,16857,23285,18678);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16844,0,0,1,4,0,100,0,0,0,0,0,0,28,29147,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crust Burster - On Aggro - Remove Aura ''Tunnel Bore Passive'''),
(16844,0,1,2,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crust Burster - Linked - Set Root On'),
(16844,0,2,3,61,0,100,0,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crust Burster - Linked - Remove ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(16844,0,3,0,61,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crust Burster - Linked - Remove ''UNIT_STAND_STATE_SUBMERGED'''),
(16844,0,4,0,9,0,100,0,1,50,2000,3500,0,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crust Burster - Within 1-50 Range - Cast ''Poison'''),
(16844,0,5,0,0,0,100,0,1000,6000,8000,11000,0,11,32738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Crust Burster - IC - Cast ''Bore'''),
(16844,0,6,8,7,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crust Burster - On Evade - Set Root Off'),
(16844,0,7,8,11,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crust Burster - On Respawn - Set Root Off'),
(16844,0,8,9,61,0,100,0,0,0,0,0,0,11,29147,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crust Burster - Linked - Cast ''Tunnel Bore Passive'''),
(16844,0,9,10,61,0,100,0,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crust Burster - Linked - Set ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(16844,0,10,0,61,0,100,0,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crust Burster - Linked - Set ''UNIT_STAND_STATE_SUBMERGED'''),

(16968,0,0,1,4,0,100,0,0,0,0,0,0,28,29147,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tunneler - On Aggro - Remove Aura ''Tunnel Bore Passive'''),
(16968,0,1,2,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tunneler - Linked - Set Root On'),
(16968,0,2,3,61,0,100,0,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tunneler - Linked - Remove ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(16968,0,3,0,61,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tunneler - Linked - Remove ''UNIT_STAND_STATE_SUBMERGED'''),
(16968,0,4,0,9,0,100,0,1,50,2000,3500,0,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tunneler - Within 1-50 Range - Cast ''Poison'''),
(16968,0,5,0,0,0,100,0,1000,6000,8000,11000,0,11,32738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Tunneler - IC - Cast ''Bore'''),
(16968,0,6,8,7,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tunneler - On Evade - Set Root Off'),
(16968,0,7,8,11,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tunneler - On Respawn - Set Root Off'),
(16968,0,8,9,61,0,100,0,0,0,0,0,0,11,29147,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tunneler - Linked - Cast ''Tunnel Bore Passive'''),
(16968,0,9,10,61,0,100,0,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tunneler - Linked - Set ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(16968,0,10,0,61,0,100,0,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Tunneler - Linked - Set ''UNIT_STAND_STATE_SUBMERGED'''),

(21380,0,0,1,4,0,100,0,0,0,0,0,0,28,29147,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greater Crust Burster - On Aggro - Remove Aura ''Tunnel Bore Passive'''),
(21380,0,1,2,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greater Crust Burster - Linked - Set Root On'),
(21380,0,2,3,61,0,100,0,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greater Crust Burster - Linked - Remove ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(21380,0,3,0,61,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greater Crust Burster - Linked - Remove ''UNIT_STAND_STATE_SUBMERGED'''),
(21380,0,4,0,9,0,100,0,1,50,2000,3500,0,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Greater Crust Burster - Within 1-50 Range - Cast ''Poison'''),
(21380,0,5,0,0,0,100,0,1000,6000,8000,11000,0,11,32738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Greater Crust Burster - IC - Cast ''Bore'''),
(21380,0,6,8,7,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greater Crust Burster - On Evade - Set Root Off'),
(21380,0,7,8,11,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greater Crust Burster - On Respawn - Set Root Off'),
(21380,0,8,9,61,0,100,0,0,0,0,0,0,11,29147,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greater Crust Burster - Linked - Cast ''Tunnel Bore Passive'''),
(21380,0,9,10,61,0,100,0,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greater Crust Burster - Linked - Set ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(21380,0,10,0,61,0,100,0,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Greater Crust Burster - Linked - Set ''UNIT_STAND_STATE_SUBMERGED'''),

(16857,0,0,1,4,0,100,0,0,0,0,0,0,28,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Crust Burster - On Aggro - Remove Aura ''Tunnel Bore Red Passive'''),
(16857,0,1,2,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Crust Burster - Linked - Set Root On'),
(16857,0,2,3,61,0,100,0,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Crust Burster - Linked - Remove ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(16857,0,3,0,61,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Crust Burster - Linked - Remove ''UNIT_STAND_STATE_SUBMERGED'''),
(16857,0,4,0,9,0,100,0,1,50,2000,3500,0,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Marauding Crust Burster - Within 1-50 Range - Cast ''Poison'''),
(16857,0,5,0,0,0,100,0,1000,6000,8000,11000,0,11,32738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Marauding Crust Burster - IC - Cast ''Bore'''),
(16857,0,6,8,7,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Crust Burster - On Evade - Set Root Off'),
(16857,0,7,8,11,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Crust Burster - On Respawn - Set Root Off'),
(16857,0,8,9,61,0,100,0,0,0,0,0,0,11,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Crust Burster - Linked - Cast ''Tunnel Bore Red Passive'''),
(16857,0,9,10,61,0,100,0,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Crust Burster - Linked - Set ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(16857,0,10,0,61,0,100,0,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Marauding Crust Burster - Linked - Set ''UNIT_STAND_STATE_SUBMERGED'''),

(23285,0,0,1,4,0,100,0,0,0,0,0,0,28,29147,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Burster - On Aggro - Remove Aura ''Tunnel Bore Passive'''),
(23285,0,1,2,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Burster - Linked - Set Root On'),
(23285,0,2,3,61,0,100,0,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Burster - Linked - Remove ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(23285,0,3,0,61,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Burster - Linked - Remove ''UNIT_STAND_STATE_SUBMERGED'''),
(23285,0,4,0,9,0,100,0,1,50,2000,3500,0,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Nethermine Burster - Within 1-50 Range - Cast ''Poison'''),
(23285,0,5,0,0,0,100,0,1000,6000,8000,11000,0,11,32738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Nethermine Burster - IC - Cast ''Bore'''),
(23285,0,6,8,7,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Burster - On Evade - Set Root Off'),
(23285,0,7,8,11,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Burster - On Respawn - Set Root Off'),
(23285,0,8,9,61,0,100,0,0,0,0,0,0,11,29147,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Burster - Linked - Cast ''Tunnel Bore Passive'''),
(23285,0,9,10,61,0,100,0,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Burster - Linked - Set ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(23285,0,10,0,61,0,100,0,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethermine Burster - Linked - Set ''UNIT_STAND_STATE_SUBMERGED'''),

(18678,0,0,1,4,0,100,0,0,0,0,0,0,28,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - On Aggro - Remove Aura ''Tunnel Bore Red Passive'''),
(18678,0,1,2,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - Linked - Set Root On'),
(18678,0,2,3,61,0,100,0,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - Linked - Remove ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(18678,0,3,0,61,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - Linked - Remove ''UNIT_STAND_STATE_SUBMERGED'''),
(18678,0,4,0,9,0,100,0,1,50,2000,3500,0,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fulgorge - Within 1-50 Range - Cast ''Poison'''),
(18678,0,5,0,0,0,100,0,1000,6000,8000,11000,0,11,32738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Nethermine Burster - IC - Cast ''Bore'''),
(18678,0,6,8,7,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - On Evade - Set Root Off'),
(18678,0,7,8,11,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - On Respawn - Set Root Off'),
(18678,0,8,9,61,0,100,0,0,0,0,0,0,11,34038,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - Linked - Cast ''Tunnel Bore Red Passive'''),
(18678,0,9,10,61,0,100,0,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - Linked - Set ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(18678,0,10,0,61,0,100,0,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - Linked - Set ''UNIT_STAND_STATE_SUBMERGED'''),
(18678,0,11,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fulgorge - On Respawn - Set Active On');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
