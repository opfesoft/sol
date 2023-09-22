UPDATE `creature_addon` SET `bytes1` = 0 WHERE `guid` = 35902;
UPDATE `creature_addon` SET `auras` = '1032' WHERE `guid` = 35891;
UPDATE `creature_template` SET `faction` = 35 WHERE `entry` IN (8380,8378,8381,8382,8386);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (8380,8378,8381,8382,8386);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 838000;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8380,0,0,0,19,0,100,0,3382,0,0,0,0,80,838000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vanessa Beltis - On Quest ''A Crew Under Fire'' Accepted - Call Timed Action List'),
(8380,0,1,0,6,0,100,0,0,0,0,0,0,6,3382,0,0,0,0,0,17,0,50,0,0,0,0,0,0,'Captain Vanessa Beltis - On Death - Fail Quest ''A Crew Under Fire'''),

(838000,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Active On'),
(838000,9,1,0,0,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Faction ''Escortee'''),
(838000,9,2,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Remove NPC Flags'),
(838000,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Say Line 0'),
(838000,9,4,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,8378,50,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Data 1 1 (Alexandra Blazen)'),
(838000,9,5,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,8381,50,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Data 1 1 (Lindros)'),
(838000,9,6,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,8382,50,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Data 1 1 (Patrick Mills)'),
(838000,9,7,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,11,8386,50,1,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Data 1 1 (Horizon Scout Crewman)'),
(838000,9,8,0,0,0,100,0,4000,4000,0,0,0,12,12205,4,30000,0,0,0,8,0,0,0,0,2370.83,-5893.06,-5893.06,5.45564,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Witch'''),
(838000,9,9,0,0,0,100,0,0,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,10,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,11,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,12,0,0,0,100,0,20000,20000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,13,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,14,0,0,0,100,0,500,2000,0,0,0,12,12205,4,30000,0,0,0,8,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Witch'''),
(838000,9,15,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,16,0,0,0,100,0,20000,20000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,17,0,0,0,100,0,500,2000,0,0,0,12,12205,4,30000,0,0,0,8,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Witch'''),
(838000,9,18,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,19,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,20,0,0,0,100,0,20000,20000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,21,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,22,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,23,0,0,0,100,0,500,2000,0,0,0,12,12205,4,30000,0,0,0,8,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Witch'''),
(838000,9,24,0,0,0,100,0,20000,20000,0,0,0,12,12205,4,30000,0,0,0,8,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Witch'''),
(838000,9,25,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,26,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,27,0,0,0,100,0,500,2000,0,0,0,12,12205,4,30000,0,0,0,8,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Witch'''),
(838000,9,28,0,0,0,100,0,20000,20000,0,0,0,12,12205,4,30000,0,0,0,8,0,0,0,0,2370.83,-5893.06,10.6607,5.45564,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Witch'''),
(838000,9,29,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2367.58,-5889.81,11.3931,5.36209,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,30,0,0,0,100,0,500,2000,0,0,0,12,12204,4,30000,0,0,0,8,0,0,0,0,2369.53,-5888.84,11.2888,5.23643,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Raider'''),
(838000,9,31,0,0,0,100,0,500,2000,0,0,0,12,12205,4,30000,0,0,0,8,0,0,0,0,2366.15,-5891.65,11.72,5.46812,'Captain Vanessa Beltis - On Script - Summon Creature ''Spitelash Witch'''),
(838000,9,32,0,0,0,100,0,20000,20000,0,0,0,15,3382,0,0,0,0,0,17,0,30,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Quest Credit ''A Crew Under Fire'''),
(838000,9,33,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Active Off'),
(838000,9,34,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,8378,50,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Data 2 2 (Alexandra Blazen)'),
(838000,9,35,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,8381,50,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Data 2 2 (Lindros)'),
(838000,9,36,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,8382,50,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Data 2 2 (Patrick Mills)'),
(838000,9,37,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,11,8386,50,1,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Data 2 2 (Horizon Scout Crewman)'),
(838000,9,38,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Set Faction ''Friendly'''),
(838000,9,39,0,0,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Captain Vanessa Beltis - On Script - Reset NPC Flags'),

(8378,0,0,0,38,0,100,0,1,1,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alexandra Blazen - On Data Set 1 1 - Set Faction ''Escortee'''),
(8378,0,1,0,38,0,100,0,2,2,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alexandra Blazen - On Data Set 2 2 - Set Faction ''Friendly'''),
(8378,0,2,0,1,0,100,0,1000,1000,1000,1000,0,11,1006,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alexandra Blazen - OOC - Cast ''Inner Fire'''),
(8378,0,3,0,74,0,100,0,0,50,12000,17000,40,11,11640,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Alexandra Blazen - On Friendly Between 0-50% Health - Cast ''Renew'''),

(8381,0,0,0,38,0,100,0,1,1,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lindros - On Data Set 1 1 - Set Faction ''Escortee'''),
(8381,0,1,0,38,0,100,0,2,2,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lindros - On Data Set 2 2 - Set Faction ''Friendly'''),
(8381,0,2,0,4,0,100,0,0,0,0,0,0,206,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lindros - On Aggro - Set Caster Combat Distance'),
(8381,0,3,0,9,0,100,0,0,8,15000,25000,0,11,11975,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lindros - Within 0-8 Range - Cast ''Arcane Explosion'''),
(8381,0,4,0,0,0,100,0,1000,4000,3000,4000,0,11,20823,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lindros - IC - Cast ''Fireball'''),

(8382,0,0,0,38,0,100,0,1,1,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Patrick Mills - On Data Set 1 1 - Set Faction ''Escortee'''),
(8382,0,1,0,38,0,100,0,2,2,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Patrick Mills - On Data Set 2 2 - Set Faction ''Friendly'''),
(8382,0,2,0,0,0,100,0,2000,4000,2000,4000,0,11,17143,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Patrick Mills - IC - Cast ''Holy Strike'''),

(8386,0,0,0,38,0,100,0,1,1,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horizon Scout Crewman - On Data Set 1 1 - Set Faction ''Escortee'''),
(8386,0,1,0,38,0,100,0,2,2,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Horizon Scout Crewman - On Data Set 2 2 - Set Faction ''Friendly'''),
(8386,0,2,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Horizon Scout Crewman - Within 5-30 Range - Cast ''Shoot''');
