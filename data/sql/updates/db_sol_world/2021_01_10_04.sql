-- DB update 2021_01_10_03 -> 2021_01_10_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_10_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_10_03 2021_01_10_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610284004015873708'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610284004015873708');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (1971,1780,1766,1769,1778,1765,1782,1779,2332,2053,2054,1923,1924,1797);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1971,1780,1766,1769,1778,1765,1782,1779,2332,2053,2054,1923,1924,1797) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1971,0,0,0,0,0,100,0,2700,3100,5400,5800,0,11,7668,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ivar the Foul - IC - Cast ''Foul Odor'''),

(1780,0,0,0,2,0,100,1,0,80,0,0,0,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Moss Stalker - Between 0-80% Health - Cast ''Poison'' (No Repeat)'),

(1766,0,0,0,2,0,100,1,0,80,0,0,0,11,3150,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mottled Worg - Between 0-80% Health - Cast ''Rabies'' (No Repeat)'),

(1769,0,0,0,1,0,100,0,0,0,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moonrage Whitescalp - OOC - Cast ''Frost Armor'''),

(1778,0,0,0,0,0,100,0,2700,3000,7700,8000,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Ferocious Grizzled Bear - IC - Cast ''Swipe'''),

(1765,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Worg - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)'),

(1782,0,0,0,2,0,100,1,0,30,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moonrage Darksoul - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),

(1779,0,0,0,0,0,100,0,3100,3900,8700,10200,0,11,6958,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Moonrage Glutton - IC - Cast ''Blood Leech'''),

(2332,0,0,0,0,0,100,0,2400,2700,8800,9400,0,11,14873,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Valdred Moray - IC - Cast ''Sinister Strike'''),

(2053,0,0,0,0,0,100,0,2700,3000,22700,23000,0,11,3261,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Haggard Refugee - IC - Cast ''Ignite'''),

(2054,0,0,0,2,0,100,1,0,80,0,0,0,11,5164,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sickly Refugee - Between 0-80% Health - Cast ''Knockdown'' (No Repeat)'),

(1923,0,0,0,2,0,100,1,0,80,0,0,0,11,3149,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodsnout Worg - Between 0-80% Health - Cast ''Furious Howl'' (No Repeat)'),

(1924,0,0,0,0,0,100,0,2700,3000,17700,18000,0,11,3264,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moonrage Bloodhowler - IC - Cast ''Blood Howl'''),

(1797,0,0,0,0,0,100,0,2700,3000,7700,8000,0,11,31279,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Giant Grizzled Bear - IC - Cast ''Swipe''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
