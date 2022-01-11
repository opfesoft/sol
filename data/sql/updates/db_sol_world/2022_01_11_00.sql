-- DB update 2022_01_10_03 -> 2022_01_11_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_10_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_10_03 2022_01_11_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641915188629655108'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641915188629655108');

UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `id` IN (180456,180518,180529,180544,180549,180564); -- Lesser Wind Stone
UPDATE `gameobject` SET `spawntimesecs` = 10800 WHERE `id` IN (180466,180539,180559); -- Greater Wind Stone

DELETE FROM `gossip_menu` WHERE `MenuID` IN (6540,6542,6543);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6540,7744), -- Lesser Wind Stone - Without Twilight Set
(6540,7771), -- Lesser Wind Stone - With Twilight Set
(6542,7744), -- Wind Stone - Without Twilight Set
(6542,7772), -- Wind Stone - With Twilight Set / Without Medallion
(6542,7773), -- Wind Stone - With Twilight Set / With Medallion
(6543,7744), -- Greater Wind Stone - Without Twilight Set
(6543,7776), -- Greater Wind Stone - With Twilight Set / Without Medallion / Without Ring
(6543,7775), -- Greater Wind Stone - With Twilight Set / With Medallion / Without Ring
(6543,7774); -- Greater Wind Stone - With Twilight Set / With Medallion / With Ring

UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 256 | 512, `AIName` = 'SmartAI' WHERE `entry` IN (15209,15211,15307,15212,15206,15207,15208,15220,15203,15305,15205,15204);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (15209,15211,15307,15212,15206,15207,15208,15220,15203,15305,15205,15204);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1520900;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15209,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crimson Templar - On Just Summoned - Call Timed Action List'),
(15209,0,1,0,0,0,100,0,4000,6000,7000,11000,0,11,11989,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crimson Templar - IC - Cast ''Fireball Volley'''),
(15209,0,2,0,0,0,100,0,2000,3000,11000,15000,0,11,16536,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crimson Templar - IC - Cast ''Flame Buffet'''),

(1520900,9,0,0,0,0,100,0,0,0,0,0,0,11,25035,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crimson Templar - On Script - Cast ''Elemental Spawn-in'''),
(1520900,9,1,0,0,0,100,0,2000,2000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Crimson Templar - On Script - Say 0 (Stored Target 1, See ''go_wind_stone'')'),
(1520900,9,2,0,0,0,100,0,7000,7000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crimson Templar - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1520900,9,3,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Crimson Templar - On Script - Start Attack (Stored Target 1)'),

(15211,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azure Templar - On Just Summoned - Call Timed Action List'),
(15211,0,1,0,0,0,100,0,3000,5000,8000,12000,0,11,12548,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Azure Templar - IC - Cast ''Frost Shock'''),
(15211,0,2,0,0,0,100,0,7000,9000,11000,15000,0,11,14907,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azure Templar - IC - Cast ''Frost Nova'''),

(15307,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Earthen Templar - On Just Summoned - Call Timed Action List'),
(15307,0,1,0,0,0,100,0,2000,3000,13000,15000,0,11,22127,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Earthen Templar - IC - Cast ''Entangling Roots'''),
(15307,0,2,0,0,0,100,0,7000,9000,12000,16000,0,11,18813,0,0,0,0,0,4,0,0,0,0,0,0,0,0,'Earthen Templar - IC - Cast ''Knock Away'''),

(15212,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hoary Templar - On Just Summoned - Call Timed Action List'),
(15212,0,1,0,0,0,100,0,3000,5000,7000,11000,0,11,2610,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hoary Templar - IC - Cast ''Shock'''),
(15212,0,2,0,4,0,100,0,0,0,0,0,0,11,25020,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hoary Templar - On Aggro - Cast ''Lightning Shield'''),

(15206,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Duke of Cynders - On Just Summoned - Call Timed Action List'),
(15206,0,1,0,0,0,100,0,3000,6000,6000,9000,0,11,25028,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'The Duke of Cynders - IC - Cast ''Fire Blast'''),
(15206,0,2,0,0,0,100,0,8000,14000,12000,17000,0,11,18399,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'The Duke of Cynders - IC - Cast ''Flamestrike'''),
(15206,0,3,0,0,0,100,0,6000,10000,8000,12000,0,11,22424,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Duke of Cynders - IC - Cast ''Blast Wave'''),

(15207,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Duke of Fathoms - On Just Summoned - Call Timed Action List'),
(15207,0,1,0,4,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Duke of Fathoms - On Aggro - Cast ''Thrash'''),
(15207,0,2,0,0,0,100,0,8000,12000,8000,12000,0,11,16790,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Duke of Fathoms - IC - Cast ''Knockdown'''),
(15207,0,3,0,0,0,100,0,3000,6000,10000,15000,0,11,18670,0,0,0,0,0,4,0,0,0,0,0,0,0,0,'The Duke of Fathoms - IC - Cast ''Knock Away'''),

(15208,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Duke of Shards - On Just Summoned - Call Timed Action List'),
(15208,0,1,0,0,0,100,0,4000,6000,4000,6000,0,11,13446,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Duke of Shards - IC - Cast ''Strike'''),
(15208,0,2,0,0,0,100,0,8000,12000,13000,17000,0,11,8078,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Duke of Shards - IC - Cast ''Thunderclap'''),
(15208,0,3,0,0,0,100,0,6000,10000,10000,15000,0,11,6524,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Duke of Shards - IC - Cast ''Ground Tremor'''),

(15220,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Duke of Zephyrs - On Just Summoned - Call Timed Action List'),
(15220,0,1,0,0,0,100,0,5000,8000,14000,18000,0,11,25034,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'The Duke of Zephyrs - IC - Cast ''Forked Lightning'''),
(15220,0,2,0,0,0,100,0,10000,12000,18000,22000,0,11,44417,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'The Duke of Zephyrs - IC - Cast ''Lightning Cloud'''),
(15220,0,3,0,0,0,100,0,5000,15000,10000,15000,0,11,12882,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Duke of Zephyrs - IC - Cast ''Wing Flap'''),
(15220,0,4,0,0,0,100,0,8000,20000,8000,20000,0,11,15535,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'The Duke of Zephyrs - IC - Cast ''Enveloping Winds'''),

(15203,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Skaldrenox - On Just Summoned - Call Timed Action List'),
(15203,0,1,0,0,0,100,0,4000,6000,20000,30000,0,11,25050,0,0,0,0,0,4,0,0,0,0,0,0,0,0,'Prince Skaldrenox - IC - Cast ''Mark of Flames'''),
(15203,0,2,0,0,0,100,0,8000,10000,15000,24000,0,11,25049,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Skaldrenox - IC - Cast ''Blast Wave'''),
(15203,0,3,0,0,0,100,0,7000,8000,7000,8000,0,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Prince Skaldrenox - IC - Cast ''Cleave'''),

(15305,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Skwol - On Just Summoned - Call Timed Action List'),
(15305,0,1,0,4,0,100,0,0,0,0,0,0,11,3417,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Skwol - On Aggro - Cast ''Thrash'''),
(15305,0,2,0,0,0,100,0,10000,12000,18000,20000,0,11,25053,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Skwol - IC - Cast ''Venom Spit'''),
(15305,0,3,0,0,0,100,0,2000,3000,5000,8000,0,11,25051,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Skwol - IC - Cast ''Sunder Armor'''),

(15205,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Baron Kazum - On Just Summoned - Call Timed Action List'),
(15205,0,1,0,0,0,100,0,3000,6000,13000,16000,0,11,25056,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Baron Kazum - IC - Cast ''Stomp'''),
(15205,0,2,0,0,0,100,0,7000,10000,15000,28000,0,11,19129,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Baron Kazum - IC - Cast ''Massive Tremor'''),
(15205,0,3,0,0,0,100,0,12000,15000,15000,18000,0,11,17547,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Baron Kazum - IC - Cast ''Mortal Strike'''),

(15204,0,0,0,54,0,100,0,0,0,0,0,0,80,1520900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Marshal Whirlaxis - On Just Summoned - Call Timed Action List'),
(15204,0,1,0,0,0,100,0,0,0,5000,5000,0,11,25020,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Marshal Whirlaxis - IC - Cast ''Lightning Shield'''),
(15204,0,2,0,0,0,100,0,9000,11000,21000,26000,0,11,23103,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'High Marshal Whirlaxis - IC - Cast ''Enveloping Winds'''),
(15204,0,3,0,0,0,100,0,17000,20000,17000,20000,0,11,25060,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Marshal Whirlaxis - IC - Cast ''Updraft''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
