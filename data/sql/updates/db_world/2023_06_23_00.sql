DELETE FROM `gossip_menu_option` WHERE `MenuID` = 8228;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(8228,0,0,'I am that fleshling, Saeed. Let''s go!',18639,0,1,0,0,0,0,'',0,0),
(8228,1,0,'I am ready. Let''s make history!',18641,0,1,0,0,0,0,'',0,0);

DELETE FROM `creature_text` WHERE `CreatureId` IN (19554,20985,21780);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(19554,0,0,'You only hasten the inevitable. In time, all will be devoured!',14,0,100,0,0,0,18602,1,'Dimensius the All-Devouring'),
(19554,1,0,'%s laughs.',16,0,100,0,0,0,18646,0,'Dimensius the All-Devouring'),
(19554,2,0,'Time only has meaning to mortals, insect. Dimensius is infinite!',14,0,100,0,0,0,18647,0,'Dimensius the All-Devouring'),
(19554,3,0,'I hunger! Feed me the power of this forge, my children!',14,0,100,0,0,0,19420,0,'Dimensius the All-Devouring'),

(20985,0,0,'You heard the fleshling! MOVE OUT!',12,0,100,15,0,0,18642,0,'Captain Saeed'),
(20985,1,0,'Tell me when you are ready, $n. We will attack on your command.',12,0,100,0,0,0,18643,0,'Captain Saeed'),
(20985,2,0,'It''s now or never, soldiers! Let''s do this! For K''aresh! For the Protectorate!',12,0,100,0,0,0,18644,0,'Captain Saeed'),
(20985,3,0,'The time for your destruction has finally come, Dimensius!',12,0,100,0,0,0,18645,0,'Captain Saeed'),
(20985,4,0,'We are victorious! Dimensius is no more! Report back to the Professor, hero.',12,0,100,0,0,0,18649,0,'Captain Saeed'),

(21780,0,0,'%s begins channelling power into Dimensius.',16,0,100,0,0,0,19694,0,'Spawn of Dimensius');

UPDATE `creature` SET `spawntimesecs` = 60 WHERE `guid` IN (69964,73763,73764,73765,73766,76080,76081,76162,76163,76164,76165);
UPDATE `creature_template` SET `unit_flags` = 0, `mechanic_immune_mask` = 650330047 WHERE `entry` IN (19554,21035,21780);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 21783;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19554,20984,21783,21805,21780);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19554,0,0,1,25,0,100,0,0,0,0,0,0,11,35939,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - On Reset - Cast ''Dimensius Transform'''),
(19554,0,1,2,61,0,100,0,0,0,0,0,0,18,33555200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - Linked - Set Unit Flags'),
(19554,0,2,3,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - Linked - Set Root On'),
(19554,0,3,4,61,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - Linked - Set Corpse Delay'),
(19554,0,4,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,21780,50,0,0,0,0,0,0,'Dimensius the All-Devouring - Linked - Force Despawn (Spawn of Dimensius)'),
(19554,0,5,6,6,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,21780,50,0,0,0,0,0,0,'Dimensius the All-Devouring - On Death - Force Despawn (Spawn of Dimensius)'),
(19554,0,6,0,61,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,19,20985,0,0,0,0,0,0,0,'Dimensius the All-Devouring - Linked - Say Line 4 (Captain Saeed)'),
(19554,0,7,0,0,0,100,0,3000,4000,7000,10000,0,11,37500,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - IC - Cast ''Shadow Spiral'''),
(19554,0,8,0,0,0,100,0,5000,7000,10000,16000,0,11,37412,0,0,0,0,0,5,50,1,0,0,0,0,0,0,'Dimensius the All-Devouring - IC - Cast ''Shadow Vault'''),
(19554,0,9,0,0,0,100,0,5000,5000,5000,5000,0,125,1,5,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - IC - Trigger Random Range Timed Event (CONDITION_AURA)'),
(19554,0,10,11,0,0,100,0,1000,1000,1000,1000,0,92,0,37396,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - IC - Interrupt Spell ''Shadow Rain'' (CONDITION_AURA)'),
(19554,0,11,12,61,0,100,0,0,0,0,0,0,92,0,37397,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - Linked - Interrupt Spell ''Shadow Rain'''),
(19554,0,12,13,61,0,100,0,0,0,0,0,0,92,0,37399,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - Linked - Interrupt Spell ''Shadow Rain'''),
(19554,0,13,14,61,0,100,0,0,0,0,0,0,92,0,37405,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - Linked - Interrupt Spell ''Shadow Rain'''),
(19554,0,14,0,61,0,100,0,0,0,0,0,0,92,0,37409,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - Linked - Interrupt Spell ''Shadow Rain'''),
(19554,0,15,0,59,0,100,0,1,0,0,0,0,11,37396,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - On Timed Event 1 Triggered - Cast Spell ''Shadow Rain'''),
(19554,0,16,0,59,0,100,0,2,0,0,0,0,11,37397,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - On Timed Event 2 Triggered - Cast Spell ''Shadow Rain'''),
(19554,0,17,0,59,0,100,0,3,0,0,0,0,11,37399,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - On Timed Event 3 Triggered - Cast Spell ''Shadow Rain'''),
(19554,0,18,0,59,0,100,0,4,0,0,0,0,11,37405,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - On Timed Event 4 Triggered - Cast Spell ''Shadow Rain'''),
(19554,0,19,0,59,0,100,0,5,0,0,0,0,11,37409,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - On Timed Event 5 Triggered - Cast Spell ''Shadow Rain'''),
(19554,0,20,21,2,0,100,1,0,50,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dimensius the All-Devouring - Between 0-50% Health (No Repeat) - Say Line 3'),
(19554,0,21,22,61,0,100,0,0,0,0,0,0,12,21780,8,0,0,0,0,8,0,0,0,0,3945.3,2030.95,257.356,4.40894,'Dimensius the All-Devouring - Linked - Summon Creature ''Spawn of Dimensius'''),
(19554,0,22,23,61,0,100,0,0,0,0,0,0,12,21780,8,0,0,0,0,8,0,0,0,0,3908.42,2013.4,257.454,5.95852,'Dimensius the All-Devouring - Linked - Summon Creature ''Spawn of Dimensius'''),
(19554,0,23,24,61,0,100,0,0,0,0,0,0,12,21780,8,0,0,0,0,8,0,0,0,0,3927.27,1973.96,257.605,1.26185,'Dimensius the All-Devouring - Linked - Summon Creature ''Spawn of Dimensius'''),
(19554,0,24,0,61,0,100,0,0,0,0,0,0,12,21780,8,0,0,0,0,8,0,0,0,0,3964.97,1993.39,257.533,2.78604,'Dimensius the All-Devouring - Linked - Summon Creature ''Spawn of Dimensius'''),

(21780,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spawn of Dimensius - On Just Summoned - Set Active On'),
(21780,0,1,2,61,0,100,0,0,0,0,0,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spawn of Dimensius - Linked - Disable Evade'),
(21780,0,2,3,61,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spawn of Dimensius - Linked - Set React State ''Passive'''),
(21780,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spawn of Dimensius - Linked - Say Line 0'),
(21780,0,4,0,60,0,100,257,0,0,0,0,0,11,37450,2,0,0,0,0,19,19554,0,0,0,0,0,0,0,'Spawn of Dimensius - On Update (No Repeat, No Reset) - Cast ''Feed Dimensius'''),

(20984,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Defender - On Respawn - Disable Event Phase Reset'),
(20984,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Defender - Linked - Set Phase 1'),
(20984,0,2,0,0,0,100,0,0,1000,3000,4000,0,11,36500,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Protectorate Defender - IC - Cast ''Glaive'''),
(20984,0,3,0,0,0,100,0,5000,10000,10000,20000,0,11,31553,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Protectorate Defender - IC - Cast ''Hamstring'''),
(20984,0,4,0,38,0,100,0,1,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Defender - On Data Set 1 1 - Cast ''Ethereal Teleport'''),
(20984,0,5,0,1,2,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Defender - OOC (Event Phase 2) - Force Despawn'),

(21783,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Regenerator - On Respawn - Disable Event Phase Reset'),
(21783,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Regenerator - Linked - Set Phase 1'),
(21783,0,2,0,0,0,100,0,0,0,4000,6000,0,11,34232,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Protectorate Regenerator - IC - Cast ''Holy Bolt'''),
(21783,0,3,0,14,0,100,0,4000,40,15000,20000,0,11,37460,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Protectorate Regenerator - On Friendly HP Deficit - Cast ''Regeneration'''),
(21783,0,4,0,38,0,100,0,1,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Regenerator - On Data Set 1 1 - Set Event Phase 2'),
(21783,0,5,0,1,2,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Regenerator - OOC (Event Phase 2) - Force Despawn'),

(21805,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Avenger - On Respawn - Disable Event Phase Reset'),
(21805,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Avenger - Linked - Set Phase 1'),
(21805,0,2,0,0,0,100,0,0,1000,3000,4000,0,11,36500,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Protectorate Avenger - IC - Cast ''Glaive'''),
(21805,0,3,0,38,0,100,0,1,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Avenger - On Data Set 1 1 - Set Event Phase 2'),
(21805,0,4,0,1,2,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Avenger - OOC (Event Phase 2) - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 19554 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,10,19554,0,0,1,1,37450,1,0,0,0,0,'Creature ''Dimensius the All-Devouring'' - Group 0: Execute SAI ID 9 only if has aura ''Dimensius Feeding'''),
(22,11,19554,0,0,1,1,37450,1,0,1,0,0,'Creature ''Dimensius the All-Devouring'' - Group 0: Execute SAI ID 10 only if has no aura ''Dimensius Feeding''');

DELETE FROM `script_waypoint` WHERE `entry` = 20985;
INSERT INTO `script_waypoint` (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`, `point_comment`)
VALUES
(20985,1,4259.17,2105.75,142.326,0,'Captain Saeed - Quest ''Dimensius the All-Devouring'''),
(20985,2,4254.23,2108.69,144.247,0,NULL),
(20985,3,4249.47,2110.63,144.579,0,NULL),
(20985,4,4242.66,2113.4,144.831,0,NULL),
(20985,5,4239.06,2114.86,146.949,0,NULL),
(20985,6,4236.22,2115.54,148.834,0,NULL),
(20985,7,4230.55,2116.91,150.897,0,NULL),
(20985,8,4225.45,2118.14,152.244,0,NULL),
(20985,9,4220.81,2114.79,153.692,0,NULL),
(20985,10,4216.18,2111.44,154.976,0,NULL),
(20985,11,4211.32,2107.93,156.701,0,NULL),
(20985,12,4207.94,2105.48,160.058,0,NULL),
(20985,13,4205.23,2102.74,160.149,0,NULL),
(20985,14,4200.89,2098.34,159.626,0,NULL),
(20985,15,4196.13,2093.53,159.669,0,NULL),
(20985,16,4191.62,2088.96,160.234,0,NULL),
(20985,17,4187.19,2084.48,160.78,0,NULL),
(20985,18,4182.51,2079.75,161.932,0,NULL),
(20985,19,4178.02,2075.21,163.157,0,NULL),
(20985,20,4177.12,2070.43,164.66,0,NULL),
(20985,21,4176.27,2065.95,166.172,0,NULL),
(20985,22,4175.38,2061.21,167.984,0,NULL),
(20985,23,4176.78,2057.25,169.948,0,NULL),
(20985,24,4178.85,2051.42,172.719,0,NULL),
(20985,25,4180.75,2046.04,175.216,0,NULL),
(20985,26,4182.58,2040.87,177.694,0,NULL),
(20985,27,4184.3,2036.04,179.629,0,NULL),
(20985,28,4186.4,2030.1,181.958,0,NULL),
(20985,29,4188.63,2023.8,184.661,0,NULL),
(20985,30,4186.33,2019.08,187.225,0,NULL),
(20985,31,4183.73,2013.73,190.822,0,NULL),
(20985,32,4181.12,2008.38,194.647,0,NULL),
(20985,33,4178.47,2002.92,198.326,0,NULL),
(20985,34,4176.07,1997.99,201.557,0,NULL),
(20985,35,4173.8,1993.33,204.116,0,NULL),
(20985,36,4168.91,1990.15,206.688,0,NULL),
(20985,37,4163.72,1986.78,209.242,0,NULL),
(20985,38,4158.14,1983.16,211.79,0,NULL),
(20985,39,4152.96,1979.79,213.991,0,NULL),
(20985,40,4147.48,1976.23,216.03,0,NULL),
(20985,41,4142.52,1973.01,218.002,0,NULL),
(20985,42,4138.51,1976.39,218.943,0,NULL),
(20985,43,4135.2,1979.18,220.462,0,NULL),
(20985,44,4131.01,1982.71,221.747,0,NULL),
(20985,45,4126.46,1986.54,223.06,0,NULL),
(20985,46,4121.91,1990.38,224.416,0,NULL),
(20985,47,4117.01,1994.51,225.966,0,NULL),
(20985,48,4112.36,1998.42,227.326,0,NULL),
(20985,49,4107.37,2002.63,228.819,0,NULL),
(20985,50,4101.52,2007.56,230.967,0,NULL),
(20985,51,4098.95,2013.05,232.81,0,NULL),
(20985,52,4096.42,2018.43,234.29,0,NULL),
(20985,53,4092.63,2026.51,236.429,0,NULL),
(20985,54,4088.01,2031.29,238.176,0,NULL),
(20985,55,4083.14,2036.32,240.14,0,NULL),
(20985,56,4078.44,2041.19,242.079,0,NULL),
(20985,57,4073.25,2046.55,244.368,0,NULL),
(20985,58,4068.71,2051.24,246.367,0,NULL),
(20985,59,4064.09,2056.02,248.253,0,NULL),
(20985,60,4059.49,2060.78,250.161,0,NULL),
(20985,61,4054.8,2063.61,251.492,0,NULL),
(20985,62,4049.21,2066.99,252.789,0,NULL),
(20985,63,4044.31,2069.94,253.642,0,NULL),
(20985,64,4038.21,2073.63,254.156,0,NULL),
(20985,65,4032.52,2077.06,254.449,0,NULL),
(20985,66,4027.77,2080.44,254.355,0,NULL),
(20985,67,4022.34,2084.29,254.22,0,NULL),
(20985,68,4017.01,2088.07,254.213,0,NULL),
(20985,69,4011.97,2091.65,254.212,0,NULL),
(20985,70,4007.02,2095.16,254.277,0,NULL),
(20985,71,4001.34,2099.2,254.212,0,NULL),
(20985,72,3997.64,2094.7,254.314,0,NULL),
(20985,73,3993.95,2090.21,254.32,0,NULL),
(20985,74,3991.34,2086.35,254.359,0,NULL),
(20985,75,3989.04,2082.95,256.405,0,NULL),
(20985,76,3985.6,2077.67,256.405,0,NULL),
(20985,77,3981.59,2071.52,256.405,0,NULL),
(20985,78,3977.51,2065.26,256.405,0,NULL),
(20985,79,3973.37,2058.91,256.405,0,NULL),
(20985,80,3969.16,2052.46,256.405,0,NULL),
(20985,81,3965.59,2046.99,256.441,0,NULL),
(20985,82,3961.95,2041.42,257.263,0,NULL),
(20985,83,3958.96,2036.82,257.811,0,NULL),
(20985,84,3954.6,2030.14,257.814,0,NULL),
(20985,85,3951.24,2024.99,257.005,0,NULL),
(20985,86,3947.78,2019.87,256.193,0,NULL),
(20985,87,3944.13,2014.45,255.689,0,NULL);