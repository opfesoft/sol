-- DB update 2020_12_30_01 -> 2020_12_30_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_30_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_30_01 2020_12_30_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609317586242441715'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609317586242441715');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (4202,3993,4070,3992,4004,4003,3999,3988,3989,3991,4056,4061,4052,8518,4409,4050,4017,4067,4020,4051,4009,4013,4014,4012,4036,4028,4031,4038,4037,4032,11921,4006,4007,11918,11917,11915,4008,11858,11914,11913,11910,11911);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (4202,3993,4070,3992,4004,4003,3999,3988,3989,3991,4056,4061,4052,8518,4409,4050,4017,4067,4020,4051,4009,4013,4014,4012,4036,4028,4031,4038,4037,4032,11921,4006,4007,11918,11917,11915,4008,11858,11914,11913,11910,11911) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4202,0,0,0,0,0,100,0,2800,3400,9900,12600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gerenzo Wrenchwhistle - IC - Cast ''Thrash'''),
(4202,0,1,0,2,0,100,1,0,30,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gerenzo Wrenchwhistle - Between 0-30% Health - Cast ''Swoop'' (No Repeat)'),

(3993,0,0,0,0,0,100,1,2000,2000,0,0,0,11,4078,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Machine Smith - IC - Cast ''Compact Harvest Reaper'' (No Repeat)'),
(3993,0,1,0,17,0,100,0,2676,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Venture Co. Machine Smith - On Summoned Unit - Store Target'),
(3993,0,2,0,7,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Venture Co. Machine Smith - On Evade - Force Despawn (Stored Target)'),

(4070,0,0,0,0,0,100,0,2100,2500,2100,2500,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Builder - IC - Cast ''Shoot'''),
(4070,0,1,0,9,0,100,0,4,30,1,1,0,79,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Builder - Within 4-30 Range - Set Ranged Movement'),
(4070,0,2,0,9,0,100,0,0,4,1,1,0,79,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Builder - Within 0-4 Range - Set Ranged Movement'),

(3992,0,0,0,0,0,100,1,0,0,0,0,0,11,7978,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Engineer - IC - Cast ''Throw Dynamite'' (No Repeat)'),

(4004,0,0,0,4,0,100,0,0,0,0,0,0,11,3631,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Windshear Overlord - On Aggro - Cast ''Battle Fury'''),
(4004,0,1,0,2,0,100,1,0,80,0,0,0,11,8139,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Windshear Overlord - Between 0-80% Health - Cast ''Fevered Fatigue'' (No Repeat)'),

(4003,0,0,0,0,0,100,0,0,0,7800,9600,0,11,20792,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Windshear Geomancer - IC - Cast ''Frostbolt'''),
(4003,0,1,0,2,0,100,1,0,40,0,0,0,11,8139,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Windshear Geomancer - Between 0-40% Health - Cast ''Fevered Fatigue'' (No Repeat)'),

(3999,0,0,0,0,0,100,0,2400,3600,9800,12400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Windshear Digger - IC - Cast ''Thrash'''),

(3988,0,0,0,0,0,100,0,2400,3600,11800,13400,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Operator - IC - Cast ''Thrash'''),

(3989,0,0,0,0,0,100,1,0,0,0,0,0,11,10277,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Logger - IC - Cast ''Throw'' (No Repeat)'),

(3991,0,0,0,0,0,100,0,0,0,6900,8600,0,11,20793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Deforester - IC - Cast ''Fireball'''),
(3991,0,1,0,2,0,100,1,0,40,0,0,0,11,39273,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Deforester - Between 0-40% Health - Cast ''Rain of Fire'' (No Repeat)'),

(4056,0,0,0,0,0,100,1,0,0,0,0,0,11,8138,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mirkfallon Keeper - IC - Cast ''Mirkfallon Fungus'' (No Repeat)'),

(4061,0,0,0,0,0,100,1,0,0,0,0,0,11,10277,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mirkfallon Dryad - IC - Cast ''Throw'' (No Repeat)'),
(4061,0,1,0,0,0,100,0,2400,2700,22400,22700,0,11,7992,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mirkfallon Dryad - IC - Cast ''Slowing Poison'''),

(4052,0,0,0,0,0,100,1,0,0,0,0,0,11,9739,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cenarion Druid - IC - Cast ''Wrath'' (No Repeat)'),
(4052,0,1,0,2,0,100,1,0,99,0,0,0,11,5759,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Druid - Between 0-99% Health - Cast ''Cat Form'' (No Repeat)'),
(4052,0,2,0,2,0,100,1,0,60,0,0,0,11,5217,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Druid - Between 0-60% Health - Cast ''Tiger''s Fury'' (No Repeat)'),

(8518,0,0,0,0,0,100,1,0,0,0,0,0,11,10277,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rynthariel the Keymaster - IC - Cast ''Throw'' (No Repeat)'),
(8518,0,1,0,0,0,100,0,2700,2900,22700,22900,0,11,7992,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rynthariel the Keymaster - IC - Cast ''Slowing Poison'''),

(4409,0,0,0,0,0,100,1,0,0,0,0,0,11,11922,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gatekeeper Kordurus - IC - Cast ''Entangling Roots'' (No Repeat)'),
(4409,0,1,0,0,0,100,0,2700,2900,15700,15900,0,11,8925,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gatekeeper Kordurus - IC - Cast ''Moonfire'''),

(4050,0,0,0,4,0,100,0,0,0,0,0,0,11,7090,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Caretaker - On Aggro - Cast ''Bear Form'''),
(4050,0,1,0,0,0,100,0,2100,2800,7900,9200,0,11,12161,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cenarion Caretaker - IC - Cast ''Maul'''),
(4050,0,2,0,2,0,100,1,0,80,0,0,0,11,782,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Caretaker - Between 0-80% Health - Cast ''Thorns'' (No Repeat)'),

(4017,0,0,0,2,0,100,1,0,80,0,0,0,11,11981,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wily Fey Dragon - Between 0-80% Health - Cast ''Mana Burn'' (No Repeat)'),

(4067,0,0,0,2,0,100,1,0,80,0,0,0,11,24331,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Twilight Runner - Between 0-80% Health - Cast ''Rake'' (No Repeat)'),

(4020,0,0,0,0,0,100,1,0,0,0,0,0,11,7997,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Sap Beast - IC - Cast ''Sap Might'' (No Repeat)'),

(4051,0,0,0,0,0,100,0,2100,2400,7100,8400,0,11,9739,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cenarion Botanist - IC - Cast ''Wrath'''),
(4051,0,1,0,2,0,100,1,0,60,0,0,0,11,1430,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Botanist - Between 0-60% Health - Cast ''Rejuvenation'' (No Repeat)'),

(4009,0,0,0,4,0,100,0,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Cliff Stormer - On Aggro - Cast ''Rushing Charge'''),
(4009,0,1,0,2,0,100,1,0,60,0,0,0,11,8078,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Raging Cliff Stormer - Between 0-60% Health - Cast ''Thunderclap'' (No Repeat)'),

(4013,0,0,0,0,0,100,0,2400,3100,32400,33100,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Pridewing Skyhunter - IC - Cast ''Poison'''),
(4013,0,1,0,2,0,100,1,0,50,0,0,0,11,5708,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Pridewing Skyhunter - Between 0-50% Health - Cast ''Swoop'' (No Repeat)'),

(4014,0,0,0,2,0,100,1,0,40,0,0,0,11,6605,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Pridewing Consort - Between 0-40% Health - Cast ''Terrifying Screech'' (No Repeat)'),

(4012,0,0,0,0,0,100,0,2100,2300,32100,32300,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Pridewing Wyvern - IC - Cast ''Poison'''),

(4036,0,0,0,0,0,100,1,0,0,0,0,0,11,6205,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Rogue Flame Spirit - IC - Cast ''Curse of Weakness'' (No Repeat)'),
(4036,0,1,0,2,0,100,1,0,60,0,0,0,11,1094,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rogue Flame Spirit - Between 0-60% Health - Cast ''Immolate'' (No Repeat)'),

(4028,0,0,0,0,0,100,1,0,0,0,0,0,11,12747,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Charred Ancient - IC - Cast ''Entangling Roots'' (No Repeat)'),

(4031,0,0,0,0,0,100,0,2100,2300,32100,32300,0,11,3396,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Fledgling Chimaera - IC - Cast ''Corrosive Poison'''),

(4038,0,0,0,0,0,100,0,0,0,8700,9600,0,11,9053,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Burning Destroyer - IC - Cast ''Fireball'''),
(4038,0,1,0,2,0,100,1,0,80,0,0,0,11,8000,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Burning Destroyer - Between 0-80% Health - Cast ''Area Burn'' (No Repeat)'),

(4037,0,0,0,4,0,100,0,0,0,0,0,0,11,184,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Burning Ravager - On Aggro - Cast ''Fire Shield II'''),

(4032,0,0,0,0,0,100,0,0,0,8700,9600,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Young Chimaera - IC - Cast ''Lightning Bolt'''),

(11921,0,0,0,0,0,100,1,0,0,0,0,0,11,745,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Besseleth - IC - Cast ''Web'' (No Repeat)'),
(11921,0,1,0,0,0,100,0,2400,3200,9600,11200,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Besseleth - IC - Cast ''Thrash'''),
(11921,0,2,0,2,0,100,1,0,80,0,0,0,11,5416,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Besseleth - Between 0-80% Health - Cast ''Venom Sting'' (No Repeat)'),

(4006,0,0,0,0,0,100,1,0,0,0,0,0,11,745,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Deepmoss Webspinner - IC - Cast ''Web'' (No Repeat)'),

(4007,0,0,0,0,0,100,1,0,0,0,0,0,11,7951,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Deepmoss Venomspitter - IC - Cast ''Toxic Spit'' (No Repeat)'),

(11918,0,0,0,0,0,100,0,3200,4800,9900,12300,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gogger Stonepounder - IC - Cast ''Thrash'''),

(11917,0,0,0,0,0,100,0,0,0,8600,9400,0,11,20793,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gogger Geomancer - IC - Cast ''Fireball'''),
(11917,0,1,0,2,0,100,1,0,60,0,0,0,11,11990,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gogger Geomancer - Between 0-60% Health - Cast ''Rain of Fire'' (No Repeat)'),

(11915,0,0,0,2,0,100,1,0,80,0,0,0,11,13281,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gogger Rock Keeper - Between 0-80% Health - Cast ''Earth Shock'' (No Repeat)'),

(4008,0,0,0,0,0,100,0,2100,2300,8400,9600,0,11,5401,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cliff Stormer - IC - Cast ''Lizard Bolt'''),

(11858,0,0,0,0,0,100,0,2100,2300,8900,9600,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grundig Darkcloud - IC - Cast ''Thrash'''),

(11914,0,0,0,0,0,100,0,2400,4800,12900,14700,0,11,10101,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Gorehoof the Black - IC - Cast ''Knock Away'''),

(11913,0,0,0,0,0,100,0,0,0,7900,9600,0,11,20802,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Sorcerer - IC - Cast ''Lightning Bolt'''),
(11913,0,1,0,2,0,100,1,0,60,0,0,0,11,12160,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Sorcerer - Between 0-60% Health - Cast ''Rejuvenation'''),

(11910,0,0,0,2,0,100,1,0,60,0,0,0,11,14102,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Ruffian - Between 0-60% Health - Cast ''Head Smash'' (No Repeat)'),

(11911,0,0,0,0,0,100,1,0,0,0,0,0,11,10277,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Mercenary - IC - Cast ''Throw'' (No Repeat)'),
(11911,0,1,0,2,0,100,1,0,60,0,0,0,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Mercenary - Between 0-60% Health - Cast ''Pummel'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
