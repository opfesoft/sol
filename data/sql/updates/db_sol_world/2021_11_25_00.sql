-- DB update 2021_11_24_00 -> 2021_11_25_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_24_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_24_00 2021_11_25_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637796324426632435'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637796324426632435');

DELETE FROM `creature_text` WHERE `CreatureId` IN (7665,7666,7667);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(7665,0,0,'%s is noticeably weakened. The Felcurse is working!',16,0,100,0,0,0,4539,0,'Grol the Destroyer'),
(7666,0,0,'%s seems to no longer be able to cast spells. The Felcurse is working!',16,0,100,0,0,0,4541,0,'Archmage Allistarj'),
(7667,0,0,'%s is substantially more susceptible to your attacks. The Felcurse is working!',16,0,100,0,0,0,4540,0,'Lady Sevine');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (7665,7666,7667);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7665,0,0,0,23,0,100,0,12941,0,5000,5000,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grol the Destroyer - On Has No Aura ''Fel Curse Effect'' - Set Invincibility HP Level 1'),
(7665,0,1,2,8,0,100,0,12938,0,0,0,0,11,12941,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grol the Destroyer - On Spellhit ''Fel Curse'' - Cast ''Fel Curse Effect'''),
(7665,0,2,3,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grol the Destroyer - Linked - Say Line 0'),
(7665,0,3,0,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grol the Destroyer - Linked - Reset Invincibility HP Level'),
(7665,0,4,0,0,0,100,0,3000,6000,12000,15000,0,11,12734,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grol the Destroyer - IC - Cast ''Ground Smash'''),
(7665,0,5,0,0,0,100,0,11000,15000,14000,17000,0,11,10101,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grol the Destroyer - IC - Cast ''Knock Away'''),

(7666,0,0,0,23,0,100,0,12943,0,5000,5000,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Allistarj - On Has No Aura ''Fel Curse Effect'' - Set Invincibility HP Level 1'),
(7666,0,1,2,8,0,100,0,12938,0,0,0,0,11,12943,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Allistarj - On Spellhit ''Fel Curse'' - Cast ''Fel Curse Effect'''),
(7666,0,2,3,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Allistarj - Linked - Say Line 0'),
(7666,0,3,0,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Allistarj - Linked - Reset Invincibility HP Level'),
(7666,0,4,0,1,0,100,0,1000,1000,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Allistarj - OOC - Cast ''Frost Armor'''),
(7666,0,5,0,0,0,100,0,0,0,3400,4800,0,11,12466,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Archmage Allistarj - IC - Cast ''Fireball'''),
(7666,0,6,0,0,0,100,0,9000,12000,11000,14000,0,11,12737,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Archmage Allistarj - IC - Cast ''Frostbolt'''),
(7666,0,7,0,0,0,100,0,13000,16000,13000,16000,0,11,14145,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Archmage Allistarj - IC - Cast ''Fire Blast'''),
(7666,0,8,0,0,0,100,0,5000,7000,16000,20000,0,11,12738,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Archmage Allistarj - IC - Cast ''Amplify Damage'''),
(7666,0,9,0,0,0,100,0,7000,12000,20000,24000,0,11,13323,0,0,0,0,0,6,0,0,0,0,0,0,0,0,'Archmage Allistarj - IC - Cast ''Polymorph'''),

(7667,0,0,0,23,0,100,0,12942,0,5000,5000,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Sevine - On Has No Aura ''Fel Curse Effect'' - Set Invincibility HP Level 1'),
(7667,0,1,2,8,0,100,0,12938,0,0,0,0,11,12942,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Sevine - On Spellhit ''Fel Curse'' - Cast ''Fel Curse Effect'''),
(7667,0,2,3,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Sevine - Linked - Say Line 0'),
(7667,0,3,0,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Sevine - Linked - Reset Invincibility HP Level'),
(7667,0,4,0,1,0,100,0,1000,1000,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Sevine - OOC - Cast ''Frost Armor'''),
(7667,0,5,0,0,0,100,0,0,0,3400,4800,0,11,12739,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Sevine - IC - Cast ''Shadow Bolt'''),
(7667,0,6,0,0,0,100,0,9000,12000,24000,27000,0,11,12742,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Lady Sevine - IC - Cast ''Immolate'''),
(7667,0,7,0,0,0,100,0,2000,5000,30000,45000,0,11,12741,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Sevine - IC - Cast ''Curse of Weakness'''),
(7667,0,8,0,0,0,100,0,7000,9000,15000,25000,0,11,12740,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Sevine - IC - Cast ''Summon Infernal Servant''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 12938;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 7667;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,12938,0,0,31,0,3,7665,0,0,0,0,'Spell ''Fel Curse'' - Group 0: Implicit Target ''Grol the Destroyer'''),
(13,1,12938,0,1,31,0,3,7666,0,0,0,0,'Spell ''Fel Curse'' - Group 1: Implicit Target ''Archmage Allistarj'''),
(13,1,12938,0,2,31,0,3,7667,0,0,0,0,'Spell ''Fel Curse'' - Group 2: Implicit Target ''Lady Sevine'''),

(22,9,7667,0,0,152,1,8616,1,0,1,0,0,'Lady Sevine - Group 0: Execute SAI only if has no alive minion ''Infernal Servant''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
