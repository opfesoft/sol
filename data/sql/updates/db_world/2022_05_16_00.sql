UPDATE `creature_text` SET `Emote` = 0 WHERE `CreatureID` = 5634 AND `GroupID` = 3;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 5634;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 5634;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 563400;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5634,0,0,0,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Reset - Set Event Phase 1'),
(5634,0,1,0,1,1,100,0,10000,20000,10000,20000,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - OOC - Play Emote ''ONESHOT_EAT_NOSHEATHE'' (Phase 1)'),
(5634,0,2,0,1,1,100,0,20000,40000,20000,40000,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - OOC - Say Line 3 (Phase 1)'),
(5634,0,3,0,20,0,100,0,1452,0,0,0,0,80,563400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Quest ''Rhapsody''s Kalimdor Kocktail'' Rewarded - Call Timed Action List'),

(563400,9,0,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Set Phase 0'),
(563400,9,1,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Set Run Off'),
(563400,9,2,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(563400,9,3,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Set Emote State ''ONESHOT_NONE'''),
(563400,9,4,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Say Line 0'),
(563400,9,5,0,0,0,100,0,4000,4000,0,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Set Emote State ''STATE_USESTANDING_NOSHEATHE'''),
(563400,9,6,0,0,0,100,0,8000,8000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Set Emote State ''ONESHOT_NONE'''),
(563400,9,7,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Say Line 1'),
(563400,9,8,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Say Line 2'),
(563400,9,9,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Say Line 3'),
(563400,9,10,0,0,0,100,0,0,0,0,0,0,11,42963,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Cast ''Cosmetic - Combat Knockdown Self'''),
(563400,9,11,0,0,0,100,0,3000,3000,0,0,0,1,4,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Say Line 4'),
(563400,9,12,0,0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Say Line 5'),
(563400,9,13,0,0,0,100,0,3000,3000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,218.895,-2613.62,160.524,0,'Rhapsody Shindigger - On Script - Move To Position'),
(563400,9,14,0,0,0,100,0,2000,2000,0,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Set Emote State ''STATE_USESTANDING_NOSHEATHE'''),
(563400,9,15,0,0,0,100,0,7000,7000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Set Emote State ''ONESHOT_NONE'''),
(563400,9,16,0,0,0,100,0,1000,1000,0,0,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Play Emote ''ONESHOT_EAT_NOSHEATHE'''),
(563400,9,17,0,0,0,100,0,3000,3000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,219.598,-2612.21,160.449,0,'Rhapsody Shindigger - On Script - Move To Position'),
(563400,9,18,0,0,0,100,0,3000,3000,0,0,0,1,6,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Say Line 6'),
(563400,9,19,0,0,0,100,0,3000,3000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Add ''UNIT_NPC_FLAG_QUESTGIVER'''),
(563400,9,20,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rhapsody Shindigger - On Script - Evade');
