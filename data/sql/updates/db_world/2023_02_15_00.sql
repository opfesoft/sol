DELETE FROM `gameobject` WHERE `guid` IN (24319,24320,24321);
UPDATE `creature_addon` SET `auras` = NULL WHERE `guid` IN (
9628,9675,9711,8199,46760,6456,25797,46189,40007,40011,32022,31866,27106,27107,51476,46,133,30207,30388,24774,40438,2686,2685,50009,20260,20316,
20368,90826,47771,54146,54174,48790,48792,48968,48969,48972,48973,48974,91336,91337,48850,45350,46762,55823,97718,97724,97736,97747,128136,32101,
60280,60281,60280,60281,60283,60286,60288,60289,60290,60292,60294,63934,66108,66110,66113,66115,66117,66120,66126,66131,66132,66135,66137,66139,
66140,66141,66142,66143,66144,66146,66147,66149,66151,66153,66156,66157,66526,66819,67190,67194,67195,67196,67199,67200,67201,67205,67211,67527,
74179,74193,74198,74203,75234,75259,75289,75295,132841,77495,77497,77498,78216,78218,77815,89285,89303,131832,131833,131834,100326,133422,133423,
133424,133425,133426,131816,131819,131219,133378,133492,133522,133528,133681,133004,128526,128526,129231,129244,128496,128498,127401,130749,130789,
130799,131648,131656);
UPDATE `creature_addon` SET `auras` = '42648' WHERE `guid` IN (52447,52449);
UPDATE `creature_addon` SET `auras` = '50197' WHERE `guid` IN (101972,101973,101975,101976,101977,133280,133282,133288,133290,133291,133293,133294,133298);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 18827;
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 183410;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17150,18827,21911,26607);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 4303 AND `id` = 4;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 183410;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 18341000;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4303,0,4,0,4,0,100,0,0,0,0,0,0,11,1006,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Abbot - On Aggro - Cast ''Inner Fire'''),

(17150,0,0,0,0,0,100,0,0,0,300000,300000,0,11,33839,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vir''aani Arcanist - IC - Cast ''Vir''aani Concentration'''),
(17150,0,1,0,0,0,100,0,0,0,2400,3800,0,11,13901,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vir''aani Arcanist - IC - Cast ''Arcane Bolt'''),
(17150,0,2,0,0,0,100,0,10000,15000,10000,15000,0,11,14514,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vir''aani Arcanist - IC - Cast ''Blink'''),
(17150,0,3,0,9,0,100,0,0,8,13400,36100,0,11,22938,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vir''aani Arcanist - Within 0-8 Range - Cast ''Arcane Explosion'''),
(17150,0,4,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Vir''aani Arcanist - Between 0-15% Health (No Repeat) - Flee For Assist'),

(18827,0,0,1,2,0,100,1,0,15,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gan''arg Sapper - Between 0-15% Health (No Repeat) - Say Line 0'),
(18827,0,1,2,61,0,100,0,0,0,0,0,0,241,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gan''arg Sapper - Linked - Set Kill Delay'),
(18827,0,2,0,61,0,100,0,0,0,0,0,0,11,33974,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gan''arg Sapper - Linked - Cast ''Power Burn'''),
(18827,0,3,0,0,0,100,0,5000,10000,45000,60000,0,11,33895,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gan''arg Sapper - IC - Cast ''Set Charge'''),

(183410,1,0,0,60,0,100,1,10000,10000,0,0,0,80,18341000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Explosive Charge - On Update (No Repeat) - Call Timed Action List'),

(18341000,9,0,0,0,0,100,0,0,0,0,0,0,11,35470,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Explosive Charge - On Script - Cast ''Explosion'''),
(18341000,9,1,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Explosive Charge - On Script - Force Despawn'),

(21911,0,0,0,0,0,100,0,0,0,2400,3800,0,11,20298,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skettis Soulcaller - IC - Cast ''Shadow Bolt'''),
(21911,0,1,0,0,0,100,0,6000,10000,13000,18000,0,11,38663,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skettis Soulcaller - IC - Cast ''Slow'''),
(21911,0,2,0,2,0,100,1,0,30,0,0,0,11,5137,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Skettis Soulcaller - Between 0-30% Health (No Repeat) - Cast ''Call of the Grave'''),

(26607,0,0,0,0,0,100,0,0,0,3400,4800,0,11,21971,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Anub''ar Blightbeast - IC - Cast ''Poison Bolt'''),
(26607,0,1,0,0,0,100,0,9000,12000,20000,24000,0,11,47443,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Anub''ar Blightbeast - IC - Cast ''Blighted Shriek''');
