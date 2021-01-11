-- DB update 2021_01_11_00 -> 2021_01_11_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_11_00 2021_01_11_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610323442754482390'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610323442754482390');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (1848,1850,1851,1837,1841,1838,1843,1844,1847,10359,1531,1936,8213,14280);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1848,1850,1851,1837,1841,1838,1843,1844,1847,10358,10359,1531,1910,1936,12431,12433,8213,14280) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1848,0,0,0,4,0,100,0,0,0,0,0,0,11,17204,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Maldazzar - On Aggro - Cast ''Summon Skeleton'''),
(1848,0,1,0,0,0,100,0,0,0,8700,10300,0,11,12471,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Lord Maldazzar - IC - Cast ''Shadow Bolt'''),
(1848,0,2,0,2,0,100,1,0,40,0,0,0,11,17173,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Maldazzar - Between 0-40% Health - Cast ''Drain Life'' (No Repeat)'),

(1850,0,0,0,2,0,100,1,0,80,0,0,0,11,12946,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Putridius - Between 0-80% Health - Cast ''Putrid Stench'' (No Repeat)'),
(1850,0,1,0,0,0,100,0,3400,5200,12700,16800,0,11,10101,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Putridius - IC - Cast ''Knock Away'''),

(1851,0,0,0,2,0,100,1,0,80,0,0,0,11,17230,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Husk - Between 0-80% Health - Cast ''Infected Wound'' (No Repeat)'),
(1851,0,1,0,0,0,100,0,2400,3800,14900,16800,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'The Husk - IC - Cast ''Tendon Rip'''),

(1837,0,0,0,0,0,100,0,2300,3000,9800,10200,0,11,14518,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Judge - IC - Cast ''Crusader Strike'''),
(1837,0,1,0,2,0,100,1,0,60,0,0,0,11,13953,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Judge - Between 0-60% Health - Cast ''Holy Strike'' (No Repeat)'),
(1837,0,2,0,2,0,100,1,0,25,0,0,0,11,13005,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Judge - Between 0-25% Health - Cast ''Hammer of Justice'' (No Repeat)'),

(1841,0,0,0,4,0,100,0,0,0,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Executioner - On Aggro - Cast ''Enrage'''),
(1841,0,1,0,0,0,100,0,2500,3000,9500,10000,0,11,16856,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Executioner - IC - Cast ''Mortal Strike'''),
(1841,0,2,0,2,0,100,1,0,80,0,0,0,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Executioner - Between 0-80% Health - Cast ''Cleave'' (No Repeat)'),
(1841,0,3,0,12,0,100,1,0,19,0,0,0,11,7160,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Executioner - Target Between 0-19% Health - Cast ''Execute'' (No Repeat)'),

(1838,0,0,0,0,0,100,1,0,0,0,0,0,11,20294,2,0,1,0,0,2,0,0,0,0,0,0,0,0,'Scarlet Interrogator - IC - Cast ''Immolate'' (No Repeat)'),

(1843,0,0,0,0,0,100,0,2500,4000,11500,13000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Foreman Jerris - IC - Cast ''Thrash'''),
(1843,0,1,0,2,0,100,1,0,30,0,0,0,11,15618,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Foreman Jerris - Between 0-30% Health - Cast ''Snap Kick'' (No Repeat)'),

(1844,0,0,0,0,0,100,0,2450,3800,8700,9200,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Foreman Marcrid - IC - Cast ''Strike'''),
(1844,0,1,0,12,0,100,1,0,50,0,0,0,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Foreman Marcrid - Target Between 0-50% Health - Cast ''Cleave'' (No Repeat)'),

(1847,0,0,0,2,0,100,1,0,95,0,0,0,11,3427,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Foulmane - Between 0-95% Health - Cast ''Infected Wound'' (No Repeat)'),
(1847,0,1,0,0,0,100,0,3100,4900,9600,11200,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Foulmane - IC - Cast ''Thrash'''),
(1847,0,2,0,2,0,100,1,0,60,0,0,0,11,13445,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Foulmane - Between 0-60% Health - Cast ''Rend'' (No Repeat)'),

(10358,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fellicent''s Shade - On Respawn - Set Active On'),
(10358,0,1,0,0,0,100,1,0,0,0,0,0,11,7068,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Fellicent''s Shade - IC - Cast ''Veil of Shadow'' (No Repeat)'),
(10358,0,2,0,0,0,100,0,2300,3200,8900,9600,0,11,13901,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Fellicent''s Shade - IC - Cast ''Arcane Bolt'''),
(10358,0,3,0,2,0,100,1,0,40,0,0,0,11,11975,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Fellicent''s Shade - Between 0-40% Health - Cast ''Arcane Explosion'' (No Repeat)'),

(10359,0,0,0,0,0,100,1,2700,3900,0,0,0,11,3583,32,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sri''skulk - IC - Cast ''Deadly Poison'' (No Repeat)'),

(1531,0,0,0,0,0,100,0,2200,2700,9200,9700,0,11,7713,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lost Soul - IC - Cast ''Wailing Dead'''),

(1910,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Muad - On Respawn - Set Active On'),
(1910,0,1,0,0,0,100,0,2400,3000,8700,10100,0,11,2607,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Muad - IC - Cast ''Shock'''),
(1910,0,2,0,2,0,100,1,0,60,0,0,0,11,332,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Muad - Between 0-60% Health - Cast ''Healing Wave'' (No Repeat)'),

(1936,0,0,0,0,0,100,0,2400,2900,8700,9200,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Farmer Solliden - IC - Cast ''Strike'''),

(12431,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gorefang - On Respawn - Set Active On'),
(12431,0,1,0,0,0,100,0,2400,2700,17500,17800,0,11,13445,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gorefang - IC - Cast ''Rend'''),

(12433,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krethis Shadowspinner - On Respawn - Set Active On'),
(12433,0,1,0,4,0,100,0,0,0,0,0,0,11,12040,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Krethis Shadowspinner - On Aggro - Cast ''Shadow Shield'''),
(12433,0,2,0,0,0,100,0,2400,2800,6900,7300,0,11,17439,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Krethis Shadowspinner - IC - Cast ''Shadow Shock'''),

(8213,0,0,0,2,0,100,1,0,40,0,0,0,11,26064,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ironback - Between 0-40% Health - Cast ''Shell Shield'' (No Repeat)'),

(14280,0,0,0,0,0,100,0,2700,3400,8600,11400,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Big Samras - IC - Cast ''Swipe''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
