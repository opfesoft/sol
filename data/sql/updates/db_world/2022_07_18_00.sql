DELETE FROM `disables` WHERE `sourceType` = 0 AND `entry` = 59659;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`)
VALUES
(0,59659,64,'','','Ignore LOS for Neutralizing Dose Applied');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 31773 AND `SourceId` = 0;
DELETE FROM `creature` WHERE `id` = 32442;
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 32442;

DELETE FROM `creature_text` WHERE `CreatureId` IN (32442,31773,32445);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(31773,0,0,'The plague cauldron begins to boil vigorously!',41,0,100,0,0,0,32477,0,'Plague Cauldron Target'),
(31773,1,0,'The cauldron continues to boil...',41,0,100,0,0,0,32483,0,'Plague Cauldron Target'),
(31773,2,0,'Neutralizing agent failing!$bAdd fluid soon!',41,0,100,0,0,0,32484,0,'Plague Cauldron Target'),
(31773,3,0,'Neutralizing agent failing!$bAdd fluid NOW!!',41,0,100,0,0,0,32486,0,'Plague Cauldron Target'),
(31773,4,0,'Neutralizing agent FAILED!',41,0,100,0,0,0,32487,0,'Plague Cauldron Target'),
(31773,5,0,'Plague batch neutralized!',41,0,100,0,0,0,32488,0,'Plague Cauldron Target'),

(32445,0,0,'Something emerges from the cauldron!',41,0,100,0,0,0,32479,0,'Summoned Plague Cauldron Bunny 02');

-- Living Plague: Remove loot
UPDATE `creature_template` SET `lootid` = 0 WHERE `entry` = 32181;
DELETE FROM `creature_loot_template` WHERE `entry` = 32181;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 1 AND `SourceGroup` = 32181;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (32442,31773,32445,32178,32181);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (3177300,3177301,3244500,3244501,3244502);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(31773,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Respawn - Disable Event Phase Reset'),
(31773,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - Linked - Set Event Phase 1'),
(31773,0,2,3,8,1,100,0,59659,0,0,0,0,22,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Spellhit ''Neutralizing Dose Applied'' - Set Event Phase 10 (Event Phase 1)'),
(31773,0,3,4,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - Linked - Say Line 0'),
(31773,0,4,5,61,0,100,0,0,0,0,0,0,11,45797,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - Linked - Cast ''Orange Radiation'''),
(31773,0,5,6,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - Linked - Set Active On'),
(31773,0,6,0,61,0,100,0,0,0,0,0,0,80,3177300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - Linked - Call Timed Action List'),
(31773,0,7,8,8,168,100,0,59659,0,0,0,0,80,3177300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Spellhit ''Neutralizing Dose Applied'' - Call Timed Action List (Event Phase 4,6,8)'),
(31773,0,8,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - Linked - Say Line 1'),
(31773,0,9,10,8,2,100,0,59659,0,0,0,0,80,3177301,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Spellhit ''Neutralizing Dose Applied'' - Call Timed Action List (Event Phase 2)'),
(31773,0,10,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - Linked - Say Line 1'),

(3177300,9,0,0,0,0,100,0,0,0,0,0,0,23,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Decrease Event Phase'),
(3177300,9,1,0,0,0,100,0,4000,4000,0,0,0,11,61026,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Cast ''Summon PC Bunny 02'''),
(3177300,9,2,0,0,0,100,0,40000,40000,0,0,0,23,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Decrease Event Phase'),
(3177300,9,3,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Say Line 2'),
(3177300,9,4,0,0,0,100,0,10000,10000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Say Line 3'),
(3177300,9,5,0,0,0,100,0,10000,10000,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Set Event Phase 0'),
(3177300,9,6,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Say Line 4'),
(3177300,9,7,0,0,0,100,0,0,0,0,0,0,28,45797,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Remove Aura ''Orange Radiation'''),
(3177300,9,8,0,0,0,100,0,10000,10000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Set Event Phase 1'),
(3177300,9,9,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Set Active Off'),

(3177301,9,0,0,0,0,100,0,4000,4000,0,0,0,11,61026,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Cast ''Summon PC Bunny 02'''),
(3177301,9,1,0,0,0,100,0,40000,40000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Say Line 5'),
(3177301,9,2,0,0,0,100,0,0,0,0,0,0,33,31767,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Quest Credit ''Plague Cauldron KC Bunny'''),
(3177301,9,3,0,0,0,100,0,0,0,0,0,0,28,45797,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Remove Aura ''Orange Radiation'''),
(3177301,9,4,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Set Event Phase 0'),
(3177301,9,5,0,0,0,100,0,10000,10000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Set Event Phase 1'),
(3177301,9,6,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Plague Cauldron Target - On Script - Set Active Off'),

(32445,0,0,1,54,0,100,0,0,0,0,0,0,87,3244500,3244501,3244502,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Just Summoned - Call Random Timed Action List'),
(32445,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - Linked - Say Line 0'),
(32445,0,2,0,61,0,100,0,0,0,0,0,0,11,60059,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - Linked - Cast ''Huge Green Splash'''),

(3244500,9,0,0,0,0,100,0,2000,2000,0,0,0,12,32178,1,60000,0,0,1,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Rampaging Ghoul'''),
(3244500,9,1,0,0,0,100,0,1000,1000,0,0,0,12,32181,1,60000,0,0,2,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Living Plague'''),
(3244500,9,2,0,0,0,100,0,1000,1000,0,0,0,12,32181,1,60000,0,0,2,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Living Plague'''),
(3244500,9,3,0,0,0,100,0,1000,1000,0,0,0,12,32181,1,60000,0,0,2,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Living Plague'''),
(3244500,9,4,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Force Despawn'),

(3244501,9,0,0,0,0,100,0,2000,2000,0,0,0,12,32178,1,60000,0,0,1,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Rampaging Ghoul'''),
(3244501,9,1,0,0,0,100,0,2000,2000,0,0,0,12,32178,1,60000,0,0,1,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Rampaging Ghoul'''),
(3244501,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Force Despawn'),

(3244502,9,0,0,0,0,100,0,2000,2000,0,0,0,12,32181,1,60000,0,0,2,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Living Plague'''),
(3244502,9,1,0,0,0,100,0,1000,1000,0,0,0,12,32181,1,60000,0,0,2,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Living Plague'''),
(3244502,9,2,0,0,0,100,0,1000,1000,0,0,0,12,32181,1,60000,0,0,2,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Living Plague'''),
(3244502,9,3,0,0,0,100,0,1000,1000,0,0,0,12,32181,1,60000,0,0,2,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Living Plague'''),
(3244502,9,4,0,0,0,100,0,1000,1000,0,0,0,12,32181,1,60000,0,0,2,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Living Plague'''),
(3244502,9,5,0,0,0,100,0,1000,1000,0,0,0,12,32181,1,60000,0,0,2,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Summon Creature ''Living Plague'''),
(3244502,9,6,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summoned Plague Cauldron Bunny 02 - On Script - Force Despawn'),

(32178,0,0,1,54,0,100,0,0,0,0,0,0,116,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rampaging Ghoul - On Just Summoned - Set Corpse Delay'),
(32178,0,1,0,61,0,100,0,0,0,0,0,0,11,66947,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rampaging Ghoul - Linked - Cast ''Emerge'''),
(32178,0,2,0,60,0,100,0,3800,3800,4000,4000,0,49,0,0,0,0,0,0,21,70,0,0,0,0,0,0,0,'Rampaging Ghoul - On Update - Start Attack (Closest Player)'),
(32178,0,3,0,0,0,100,0,3800,17000,21000,41000,0,11,6016,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rampaging Ghoul - IC - Cast ''Pierce Armor'''),
(32178,0,4,0,0,0,100,0,10000,20000,20000,40000,0,11,54475,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rampaging Ghoul - IC - Cast ''Rampage'''),

(32181,0,0,0,54,0,100,0,0,0,0,0,0,116,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Living Plague - On Just Summoned - Set Corpse Delay'),
(32181,0,1,0,60,0,100,0,1500,1500,4000,4000,0,49,0,0,0,0,0,0,21,70,0,0,0,0,0,0,0,'Living Plague - On Update - Start Attack (Closest Player)');
