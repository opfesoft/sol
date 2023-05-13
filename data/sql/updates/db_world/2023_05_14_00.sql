UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (21847,16915);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16863 AND `id` = 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21847,16915);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2184700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16863,0,2,0,6,0,100,0,0,0,0,0,0,11,37689,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Deranged Helboar - On Death - Cast ''Tell dog I just died!'''),

(16915,0,0,0,20,0,100,0,10629,0,0,0,0,41,0,21847,0,0,0,0,7,0,0,0,0,0,0,0,0,'Foreman Razelcraz - On Quest ''Shizz Work'' Rewarded - Force Despawn Minion ''Fel Guard Hound'' (Invoker)'),

(21847,0,0,1,54,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Just Summoned - Disable Event Phase Reset'),
(21847,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - Linked - Set Event Phase 1'),
(21847,0,2,3,8,1,100,0,37689,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Spellhit ''Tell dog I just died!'' (Phase 1) - Stop Follow'),
(21847,0,3,4,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - Linked - Set Run Off'),
(21847,0,4,5,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,7,0,0,0,0,0,0,0,0.01,'Fel Guard Hound - Linked - Move To Point 1 (Invoker)'),
(21847,0,5,0,61,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - Linked - Set Event Phase 2'),
(21847,0,6,0,34,0,100,0,8,1,0,0,0,80,2184700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Reached Point 1 - Call Timed Action List'),

(2184700,9,0,0,0,0,100,0,0,0,0,0,0,11,37692,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Script - Cast ''Fake Blood Spurt'''),
(2184700,9,1,0,0,0,100,0,0,0,0,0,0,5,51,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Script - Play Emote ''ONESHOT_SPELLCAST'''),
(2184700,9,2,0,0,0,100,0,1500,1500,0,0,0,11,37692,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Script - Cast ''Fake Blood Spurt'''),
(2184700,9,3,0,0,0,100,0,0,0,0,0,0,5,51,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Script - Play Emote ''ONESHOT_SPELLCAST'''),
(2184700,9,4,0,0,0,100,0,1000,1000,0,0,0,11,37688,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Script - Cast ''Create Poodad'''),
(2184700,9,5,0,0,0,100,0,1000,1000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Script - Set Event Phase 1'),
(2184700,9,6,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Script - Set Run On'),
(2184700,9,7,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Guard Hound - On Script - Evade');
