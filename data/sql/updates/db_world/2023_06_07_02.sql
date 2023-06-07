UPDATE `gameobject` SET `state` = 0 WHERE `id` = 184117;

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009183 AND 3009186;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009183,184954,530,0,0,1,1,2904.69,4183.84,167.149,0.351951,0,0,0,0,-1,100,0,0),
(3009184,184954,530,0,0,1,1,2408.76,2762.03,137.252,5.87524,0,0,0,0,-1,100,0,0),
(3009185,184954,530,0,0,1,1,2981.85,2169.47,167.817,1.94762,0,0,0,0,-1,100,0,0),
(3009186,184954,530,0,0,1,1,4010.48,4014.03,197.092,1.30969,0,0,0,0,-1,100,0,0);

UPDATE `creature_template` SET `unit_flags` = 256|33554432, `flags_extra` = 2|128 WHERE `entry` = 20440;
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` IN (20438,20439);
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (71972,71974,72205,72208);
UPDATE `creature` SET `position_x` = 2904.69, `position_y` = 4183.84, `position_z` = 169.149 WHERE `guid` = 71910;
UPDATE `creature` SET `position_x` = 2408.76, `position_y` = 2762.03, `position_z` = 139.252 WHERE `guid` = 71911;
UPDATE `creature` SET `position_x` = 2981.85, `position_y` = 2169.47, `position_z` = 169.817 WHERE `guid` = 71912;
UPDATE `creature` SET `position_x` = 4010.48, `position_y` = 4014.03, `position_z` = 199.092 WHERE `guid` = 71913;
DELETE FROM `creature` WHERE `guid` = 71914;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20440,20438,20439,20460,20226);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 184312;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (18431200,2044000,2044001,2043900,2043901,2022600);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(184312,1,0,1,62,0,100,0,8116,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ara Control Console - On Gossip Option 0 Selected - Store Targetlist 1 (Invoker)'),
(184312,1,1,2,61,0,100,0,0,0,0,0,0,64,2,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Ara Control Console - Linked - Store Targetlist 2 (Invoker Party)'),
(184312,1,2,3,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ara Control Console - Linked - Close Gossip (Invoker)'),
(184312,1,3,4,61,0,100,0,0,0,0,0,0,104,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - Linked - Set ''GO_FLAG_NOT_SELECTABLE'''),
(184312,1,4,0,61,0,100,0,0,0,0,0,0,12,20440,8,0,0,0,0,8,0,0,0,0,4014.75,4030.01,198.143,0,'Ara Control Console - Linked - Summon Creature ''Ara Control Console'''),
(184312,1,5,6,17,0,100,0,20440,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ara Control Console - On Summoned Unit ''Ara Control Console'' - Send Target 1 (Invoker)'),
(184312,1,6,0,61,0,100,0,0,0,0,0,0,100,2,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ara Control Console - Linked - Send Target 2 (Invoker)'),

(20440,0,0,0,54,0,100,0,0,0,0,0,0,80,2044000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Just Summoned - Call Timed Action List'),
(20440,0,1,2,59,0,100,0,1,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,3978.84,4027.79,194.221,0.0617225,'Ara Control Console - On Timed Event 1 Triggered - Summon Creature ''Ara Technician'''),
(20440,0,2,3,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,3979.27,4023.37,194.214,0.185003,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,3,0,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,3977.91,4031.52,194.217,6.24229,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,4,5,59,0,100,0,2,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,3989.78,4045.23,194.211,5.73586,'Ara Control Console - On Timed Event 2 Triggered - Summon Creature ''Ara Technician'''),
(20440,0,5,6,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,3992.9,4048.13,194.225,5.59067,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,6,0,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,3995.46,4049.81,194.225,5.48492,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,7,8,59,0,100,0,3,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4005.72,4054.36,194.227,5.0676,'Ara Control Console - On Timed Event 3 Triggered - Summon Creature ''Ara Technician'''),
(20440,0,8,9,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4009.38,4054.48,194.227,4.92857,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,9,0,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4013.32,4054.5,194.227,4.77084,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,10,11,59,0,100,0,4,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4023.94,4051.8,194.227,4.31309,'Ara Control Console - On Timed Event 4 Triggered - Summon Creature ''Ara Technician'''),
(20440,0,11,12,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4027.09,4050.27,194.227,4.16521,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,12,0,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4030.3,4048.18,194.227,4.00446,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,13,14,59,0,100,0,5,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4042.75,4034.52,194.227,3.30141,'Ara Control Console - On Timed Event 5 Triggered - Summon Creature ''Ara Technician'''),
(20440,0,14,15,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4042.98,4030.55,194.227,3.16084,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,15,0,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4042.97,4026.02,194.227,3.00123,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,16,17,59,0,100,0,6,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4046.13,4013.12,194.226,2.64779,'Ara Control Console - On Timed Event 6 Triggered - Summon Creature ''Ara Technician'''),
(20440,0,17,18,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4048.58,4016.7,194.226,2.76685,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,18,0,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4042.92,4009,194.226,2.50075,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,19,20,59,0,100,0,7,0,0,0,0,12,20439,4,60000,0,0,0,8,0,0,0,0,3970.83,4023.92,194.225,0.137874,'Ara Control Console - On Timed Event 7 Triggered - Summon Creature ''Ara Engineer'''),
(20440,0,20,2,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,3978.84,4027.79,194.221,0.0617225,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,21,22,59,0,100,0,8,0,0,0,0,12,20439,4,60000,0,0,0,8,0,0,0,0,4049.26,4004.67,194.225,2.50828,'Ara Control Console - On Timed Event 8 Triggered - Summon Creature ''Ara Engineer'''),
(20440,0,22,17,61,0,100,0,0,0,0,0,0,12,20438,4,60000,0,0,0,8,0,0,0,0,4046.13,4013.12,194.226,2.64779,'Ara Control Console - Linked - Summon Creature ''Ara Technician'''),
(20440,0,23,2,59,0,100,0,9,0,0,0,0,12,20439,4,60000,0,0,0,8,0,0,0,0,3970.83,4023.92,194.225,0.137874,'Ara Control Console - On Timed Event 9 Triggered - Summon Creature ''Ara Engineer'''),
(20440,0,24,17,59,0,100,0,10,0,0,0,0,12,20439,4,60000,0,0,0,8,0,0,0,0,4049.26,4004.67,194.225,2.50828,'Ara Control Console - On Timed Event 10 Triggered - Summon Creature ''Ara Engineer'''),
(20440,0,25,0,59,0,100,0,11,0,0,0,0,12,20460,4,60000,0,0,0,8,0,0,0,0,4021.56,4059.35,193.59,4.48432,'Ara Control Console - On Timed Event 11 Triggered - Summon Creature ''Chief Engineer Gork''lonn'''),
(20440,0,26,28,17,0,100,0,20439,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ara Control Console - On Summoned Unit ''Ara Engineer'' - Send Target 1 (Invoker)'),
(20440,0,27,28,17,0,100,0,20460,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ara Control Console - On Summoned Unit ''Chief Engineer Gork''lonn'' - Send Target 1 (Invoker)'),
(20440,0,28,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ara Control Console - Linked - Send Data 1 1 (Invoker)'),
(20440,0,29,30,38,0,100,0,1,1,5000,5000,0,1,5,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Ara Control Console - On Data Set 1 1 - Say Line 5'),
(20440,0,30,31,61,0,100,0,0,0,0,0,0,104,0,0,0,0,0,0,20,184312,0,0,0,0,0,0,0,'Ara Control Console - Linked - Reset GO Flags (Ara Control Console)'),
(20440,0,31,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - Linked - Force Despawn'),

(2044000,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Set Active On'),
(2044000,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Ara Control Console - On Script - Say Line 0'),
(2044000,9,2,0,0,0,100,0,0,0,0,0,0,125,1,6,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Trigger Random Range Timed Event'),
(2044000,9,3,0,0,0,100,0,15000,15000,0,0,0,125,1,6,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Trigger Random Range Timed Event'),
(2044000,9,4,0,0,0,100,0,15000,15000,0,0,0,125,7,8,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Trigger Random Range Timed Event'),
(2044000,9,5,0,0,0,100,0,15000,15000,0,0,0,125,1,6,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Trigger Random Range Timed Event'),
(2044000,9,6,0,0,0,100,0,15000,15000,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Ara Control Console - On Script - Say Line 1'),
(2044000,9,7,0,0,0,100,0,0,0,0,0,0,125,7,8,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Trigger Random Range Timed Event'),
(2044000,9,8,0,0,0,100,0,15000,15000,0,0,0,125,1,6,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Trigger Random Range Timed Event'),
(2044000,9,9,0,0,0,100,0,15000,15000,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Ara Control Console - On Script - Say Line 2'),
(2044000,9,10,0,0,0,100,0,0,0,0,0,0,125,9,10,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Trigger Random Range Timed Event'),
(2044000,9,11,0,0,0,100,0,0,0,0,0,0,73,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Trigger Timed Event 11'),
(2044000,9,12,0,0,0,100,0,20000,20000,0,0,0,1,3,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Ara Control Console - On Script - Say Line 3'),
(2044000,9,13,0,0,0,100,0,10000,10000,0,0,0,1,4,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Ara Control Console - On Script - Say Line 4'),
(2044000,9,14,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,20226,0,0,0,0,0,0,0,'Ara Control Console - On Script - Set Data 1 1 ''Manaforge Visual Trigger'''),
(2044000,9,15,0,0,0,100,0,0,0,0,0,0,33,20440,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Ara Control Console - On Script - Kill Credit ''Ara Control Console'' (Targetlist 2)'),
(2044000,9,16,0,0,0,100,0,0,0,0,0,0,15,10323,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Ara Control Console - On Script - Complete Quest ''Shutting Down Manaforge Ara (Aldor)'' (Targetlist 2)'),
(2044000,9,17,0,0,0,100,0,0,0,0,0,0,15,10365,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Ara Control Console - On Script - Complete Quest ''Shutting Down Manaforge Ara (Scryers)'' (Targetlist 2)'),
(2044000,9,18,0,0,0,100,0,60000,60000,0,0,0,104,0,0,0,0,0,0,20,184312,0,0,0,0,0,0,0,'Ara Control Console - On Script - Reset GO Flags (Ara Control Console)'),
(2044000,9,19,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Control Console - On Script - Force Despawn'),

(20438,0,0,1,54,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ara Technician - On Just Summoned - Store Targetlist 1 (Invoker)'),
(20438,0,1,2,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Technician - Linked - Set Active On'),
(20438,0,2,3,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Technician - Linked - Disable Event Phase Reset'),
(20438,0,3,4,61,0,100,0,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Technician - Linked - Set React State ''Defensive'''),
(20438,0,4,0,61,0,100,0,0,0,0,0,0,69,1,0,0,10,0,0,12,1,0,0,0,0,0,0,0,'Ara Technician - Linked - Move To Point 1 (Targetlist 1)'),
(20438,0,5,0,34,0,100,0,8,1,0,0,0,11,35176,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Technician - On Point 1 Reached - Cast ''Interrupt Shutdown'''),
(20438,0,6,0,23,0,100,0,35176,1,1000,1000,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Technician - On Has Aura ''Interrupt Shutdown'' - Set Event Phase 1'),
(20438,0,7,0,23,1,100,0,35176,0,1000,1000,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Technician - On Has No Aura ''Interrupt Shutdown'' (Event Phase 1) - Set React State ''Aggressive'''),
(20438,0,8,0,236,0,100,0,35176,0,0,0,0,45,1,1,0,0,0,0,12,1,0,0,0,0,0,0,0,'Ara Technician - On Channel Finished ''Interrupt Shutdown'' - Set Data 1 1 (Targetlist 1)'),

(20439,0,0,0,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ara Engineer - On Just Summoned - Set Active On'),
(20439,0,1,0,38,0,100,0,1,1,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Ara Engineer - On Data Set 1 1 - Start Attack (Targetlist 1)'),

(20460,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Engineer Gork''lonn - On Just Summoned - Set Active On'),
(20460,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chief Engineer Gork''lonn - Linked - Say Line 0'),
(20460,0,2,0,38,0,100,0,1,1,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Chief Engineer Gork''lonn - On Data Set 1 1 - Start Attack (Targetlist 1)'),

(20226,0,0,0,38,0,100,0,1,1,0,0,0,80,2022600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Manaforge Visual Trigger - On Data Set 1 1 - Call Timed Action List'),

(2022600,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Manaforge Visual Trigger - On Script - Set Active On'),
(2022600,9,1,0,0,0,100,0,0,0,0,0,0,9,0,0,0,0,0,0,20,184117,0,0,0,0,0,0,0,'Manaforge Visual Trigger - On Script - Activate GO (Nether Collector Tube)'),
(2022600,9,2,0,0,0,100,0,0,0,0,0,0,11,35031,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Manaforge Visual Trigger - On Script - Cast ''Manaforge Disable Visual'''),
(2022600,9,3,0,0,0,100,0,0,0,0,0,0,70,60,0,0,0,0,0,20,184954,0,0,0,0,0,0,0,'Manaforge Visual Trigger - On Script - Respawn Target (Manaforge Smoke)'),
(2022600,9,4,0,0,0,100,0,60000,60000,0,0,0,9,0,0,0,0,0,0,20,184117,0,0,0,0,0,0,0,'Manaforge Visual Trigger - On Script - Activate GO (Nether Collector Tube)'),
(2022600,9,5,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Manaforge Visual Trigger - On Script - Set Active Off');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 35176;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,35176,0,0,31,0,3,20440,0,0,0,0,'Spell ''Interrupt Shutdown'' - Group 0: Implicit target creature ''Ara Control Console''');

DELETE FROM `waypoints` WHERE `entry` IN (2043900,2043901);
