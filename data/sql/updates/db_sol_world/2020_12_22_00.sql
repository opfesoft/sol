-- DB update 2020_12_20_00 -> 2020_12_22_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_20_00 2020_12_22_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608593558985712909'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608593558985712909');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (18690,18682,18681,18689,17144,18677,18693,18679);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (18690,18682,18681,18689,17144,18677,18693,18679) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (18694,18692,18680,20932) AND `source_type` = 0 AND `id` > 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2093200,2093201,1869300,1869301,1869302) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18694,0,1,0,0,0,100,0,6000,7000,23000,24000,0,11,36414,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Collidus the Warp-Watcher - In Combat - Cast ''Focused Bursts'''),
(18694,0,2,0,2,0,100,0,0,20,0,0,0,11,34322,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Collidus the Warp-Watcher - Between 0-20% Health - Cast ''Psychic Scream'''),

(18692,0,1,0,0,0,100,0,2000,3000,7500,9000,0,11,9573,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hemathion - In Combat - Cast ''Flame Breath'''),
(18692,0,2,0,2,0,100,1,0,20,0,0,0,11,14100,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hemathion - Between 0-20% Health - Cast ''Terrifying Roar'' (No Repeat)'),

(18680,0,1,0,4,0,100,0,0,0,0,0,0,11,32039,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Marticar - On Aggro - Cast ''Magnetic Pull'''),
(18680,0,2,0,0,0,100,0,2500,3000,10000,11000,0,11,35493,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Marticar - In Combat - Cast ''Forked Lightning Tether'''),

(18690,0,0,0,0,0,100,0,1500,2000,6000,8500,0,11,35238,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Morcrush - In Combat - Cast ''War Stomp'''),

(18682,0,0,0,0,0,100,0,2500,3000,7500,9000,0,11,35238,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bog Lurker - In Combat - Cast ''War Stomp'''),
(18682,0,1,0,2,0,100,0,0,50,25000,25000,0,11,34163,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bog Lurker - Between 0-50% Health - Cast ''Fungal Regrowth'''),

(18681,0,0,0,26,0,100,1,0,4,0,0,1,11,11831,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Coilfang Emissary - IC LOS - Cast ''Frost Nova'' (No Repeat)'),
(18681,0,1,0,0,0,100,0,4500,6500,14500,17500,0,11,20297,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Coilfang Emissary - In Combat - Cast ''Frostbolt'''),
(18681,0,2,0,2,0,100,1,0,65,0,0,0,11,39207,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Coilfang Emissary - Between 0-65% Health - Cast ''Water Spout'' (No Repeat)'),
(18681,0,3,0,2,0,100,1,0,10,0,0,0,11,33860,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Coilfang Emissary - Between 0-10% Health - Cast ''Arcane Explosion'' (No Repeat)'),

(18689,0,0,0,4,0,100,0,0,0,0,0,0,11,38882,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crippler - On Aggro - Cast ''Bone Armor'''),
(18689,0,1,0,0,0,100,0,4500,5000,14500,19000,0,11,39214,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crippler - In Combat - Cast ''Pierce Armor'''),
(18689,0,2,0,2,0,100,1,0,60,0,0,0,11,38621,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crippler - Between 0-60% Health - Cast ''Debilitating Strike'' (No Repeat)'),

(17144,0,0,0,26,0,100,1,0,2,0,0,1,11,3604,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Goretooth - IC LOS - Cast ''Tendon Rip'' (No Repeat)'),
(17144,0,1,0,0,0,100,0,1900,2200,17400,18300,0,11,39215,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Goretooth - In Combat - Cast ''Gushing Wound'''),
(17144,0,2,0,2,0,100,1,0,25,0,0,0,11,24437,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Goretooth - Between 0-25% Health - Cast ''Blood Leech'' (No Repeat)'),

(18677,0,0,0,0,0,100,0,3000,3200,7500,8400,0,11,38875,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mekthorg the Wild - In Combat - Cast ''Pike Vault'''),
(18677,0,1,0,2,0,100,1,0,40,0,0,0,11,8599,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mekthorg the Wild - Between 0-40% Health - Cast ''Enrage'' (No Repeat)'),
(18677,0,2,0,2,0,100,1,0,15,0,0,0,11,37704,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mekthorg the Wild - Between 0-15% Health - Cast ''Whirlwind'' (No Repeat)'),

(20932,0,1,0,0,0,100,0,0,0,1000,1000,0,87,2093200,2093201,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nuramoc - In Combat - Call Random Timed Action List'),
(20932,0,2,0,2,0,100,1,0,20,0,0,0,11,38905,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nuramoc - Between 0-20% Health - Cast ''Prismatic Shield'' (No Repeat)'),
(2093200,9,0,0,0,0,100,0,0,0,0,0,0,11,15797,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Nuramoc - On Script - Cast ''Lightning Breath'''),
(2093201,9,0,0,0,0,100,0,0,0,0,0,0,11,21971,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Nuramoc - On Script - Cast ''Poison Bolt'''),

(18693,0,0,0,1,0,100,0,15000,30000,40000,60000,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Speaker Mar''grom - Out Of Combat - Say Line 0'),
(18693,0,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Speaker Mar''grom - In Combat - Say Line 1'),
(18693,0,2,0,4,0,100,0,0,0,0,0,0,11,37844,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Speaker Mar''grom - On Aggro - Cast ''Fire Ward'''),
(18693,0,3,0,0,0,100,0,0,0,1000,1000,0,87,1869300,1869300,1869301,1869301,1869302,0,1,0,0,0,0,0,0,0,0,'Speaker Mar''grom - In Combat - Call Random Timed Action List'),
(1869300,9,0,0,0,0,100,0,0,0,0,0,0,11,12466,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Speaker Mar''grom - On Script - Cast ''Fireball'''),
(1869301,9,0,0,0,0,100,0,0,0,0,0,0,11,15497,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Speaker Mar''grom - On Script - Cast ''Frostbolt'''),
(1869302,9,0,0,0,0,100,0,0,0,0,0,0,11,15241,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Speaker Mar''grom - On Script - Cast ''Scorch'''),

(18679,0,0,0,0,0,100,0,1700,2400,15200,16300,0,11,9080,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vorakem Doomspeaker - In Combat - Cast ''Hamstring'''),
(18679,0,1,0,2,0,100,1,0,25,0,0,0,11,8599,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vorakem Doomspeaker - Between 0-25% Health - Cast ''Enrage'' (No Repeat)');

DELETE FROM `creature_text` WHERE `CreatureID` = 18693;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18693,0,0,'Mog''dorg is a fool to think that one of the smaller races will be our savior.',12,0,16,0,0,0,21025,0,'Speaker Mar''grom - Say Speech 1'),
(18693,0,1,'Do not listen to Mog''dorg''s lies! Ogri''la is a myth! We make our own heaven here with the blood of any that would divide and subjugate us!',12,0,16,0,0,0,21029,0,'Speaker Mar''grom - Say Speech 2'),
(18693,0,2,'The time has come. Strike down every creature that stands in the way of the clans!',12,0,16,0,0,0,21028,0,'Speaker Mar''grom - Say Speech 3'),
(18693,0,3,'Will we never learn to work together? Or will we simply kill each other off and be forgotten in time.',12,0,16,0,0,0,19882,0,'Speaker Mar''grom - Say Speech 4'),
(18693,0,4,'Do not bow to Mog''dorg''s puppet! He would replace our gronn overlords with a liege of lesser stock. Why should we replace one master with another?',12,0,16,0,0,0,21027,0,'Speaker Mar''grom - Say Speech 5'),
(18693,0,5,'If only the leaders of the clans would listen. Unity is the only answer. All other paths lead to our destruction.',12,0,16,0,0,0,19883,0,'Speaker Mar''grom - Say Speech 6'),
(18693,1,0,'My message of unity is meant for the Ogre clans, not for you, $R!',12,0,25,0,0,0,19884,0,'Speaker Mar''grom - Say aggro 1'),
(18693,1,1,'I will not allow you to kill any more of my kind! Prepare to die!',12,0,25,0,0,0,19885,0,'Speaker Mar''grom - Say aggro 2'),
(18693,1,2,'I decree that you are an enemy of the Ogre clans. Punishment is death!',12,0,25,0,0,0,19886,0,'Speaker Mar''grom - Say aggro 3'),
(18693,1,3,'The Ogre clans will not be subjugated. Not by the gronn, and not by a puny $R like you!',12,0,25,0,0,0,21024,0,'Speaker Mar''grom - Say aggro 4');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
