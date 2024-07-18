DELETE FROM `creature_text` WHERE `CreatureID` = 23311 AND `GroupID` = 0 AND `ID` > 5;
DELETE FROM `creature_text` WHERE `CreatureID` = 23311 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 22252 AND `GroupID` = 0 AND `ID` = 4;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(23311,1,0,'I am da powerful! Nobody tell me what to do!',12,0,100,0,0,0,21326,0,'Disobedient Dragonmaw Peon'),
(23311,1,1,'Work is da poop! NO MORE!',12,0,100,0,0,0,21325,0,'Disobedient Dragonmaw Peon'),
(23311,1,2,'Me no work no more!',12,0,100,0,0,0,21324,0,'Disobedient Dragonmaw Peon'),

(22252,0,4,'It put the mutton in the stomach!',12,0,100,0,0,0,21121,0,'Dragonmaw Peon SAY_1');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23311;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2331100,2331101,2331102,2331103);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23311,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Respawn - Disable Event Phase Reset'),
(23311,0,1,2,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Set Event Phase 1'),
(23311,0,2,3,61,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Set Emote State ''ONESHOT_NONE'''),
(23311,0,3,4,61,0,100,0,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Reset Faction'),
(23311,0,4,0,61,0,100,0,0,0,0,0,0,87,2331100,2331101,2331102,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Call Random Timed Action List'),
(23311,0,5,0,1,2,100,0,60000,180000,60000,180000,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - OOC (Event Phase 2) - Say Line 1'),
(23311,0,6,0,1,4,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - OOC (Event Phase 3) - Force Despawn'),
(23311,0,7,0,8,0,100,0,40742,0,0,0,0,11,39160,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Spell Hit ''Booterang'' - Cast ''Booterang'' (Invoker)'),
(23311,0,8,9,8,3,100,0,40742,0,0,0,0,33,23311,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Spell Hit ''Booterang'' (Event Phase 1,2) - Quest Credit ''The Booterang: A Cure For The Common Worthless Peon'' (Invoker Party)'),
(23311,0,9,10,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Say Line 0'),
(23311,0,10,11,61,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Set Run On'),
(23311,0,11,12,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,19,23308,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Move To Point 1 (Dragonmaw Peon Work Node)'),
(23311,0,12,13,61,0,100,0,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Stop Random Movement'),
(23311,0,13,14,61,0,100,0,0,0,0,0,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Set Emote State ''STATE_WORK_MINING'''),
(23311,0,14,0,61,0,100,0,0,0,0,0,0,80,2331103,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Call Timed Action List'),
(23311,0,15,0,4,0,100,0,0,0,0,0,0,80,2331103,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Aggro - Call Timed Action List'),

(2331100,9,0,0,0,0,100,0,0,0,0,0,0,75,40714,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Add Aura ''Dazed and Confused'''),
(2331100,9,1,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Set Faction ''Friendly'''),
(2331100,9,2,0,0,0,100,0,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Start Random Movement'),

(2331101,9,0,0,0,0,100,0,0,0,0,0,0,75,40732,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Add Aura ''Lazy and Good for Nothing'''),

(2331102,9,0,0,0,0,100,0,0,0,0,0,0,75,40735,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Add Aura ''Defiant and Enraged'''),
(2331102,9,1,0,0,0,100,0,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Set Faction ''Monster'''),
(2331102,9,2,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Set Event Phase 2'),

(2331103,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Set Active On'),
(2331103,9,1,0,0,0,100,0,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - Linked - Set Event Phase 3'),
(2331103,9,2,0,0,0,100,0,0,0,0,0,0,28,40714,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Remove Aura ''Dazed and Confused'''),
(2331103,9,3,0,0,0,100,0,0,0,0,0,0,28,40732,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Remove Aura ''Lazy and Good for Nothing'''),
(2331103,9,4,0,0,0,100,0,0,0,0,0,0,28,40735,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disobedient Dragonmaw Peon - On Script - Remove Aura ''Defiant and Enraged''');
