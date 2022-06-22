DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 28284;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2828400,2828401);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28284,0,0,0,20,0,100,0,12553,0,0,0,0,80,2828400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Quest ''Skimmer Spinnerets'' Rewarded - Call Timed Action List'),
(28284,0,1,0,20,0,100,0,12583,0,0,0,0,80,2828401,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Quest ''Crashed Sprayer'' Rewarded - Call Timed Action List'),

(2828400,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(2828400,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Say Line 0'),
(2828400,9,2,0,0,0,100,0,6000,6000,0,0,0,11,51322,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Cast ''Webs'''),
(2828400,9,3,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Say Line 1'),
(2828400,9,4,0,0,0,100,0,10000,10000,0,0,0,28,51322,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Remove Aura ''Webs'''),
(2828400,9,5,0,0,0,100,0,1000,1000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Add ''UNIT_NPC_FLAG_QUESTGIVER'''),

(2828401,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Remove ''UNIT_NPC_FLAG_QUESTGIVER'''),
(2828401,9,1,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Say Line 2'),
(2828401,9,2,0,0,0,100,0,0,0,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Play Emote ''STATE_WORK_MINING'''),
(2828401,9,3,0,0,0,100,0,3000,3000,0,0,0,5,233,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Play Emote ''STATE_WORK_MINING'''),
(2828401,9,4,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Say Line 3'),
(2828401,9,5,0,0,0,100,0,1000,1000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Specialist Cogwheel - On Script - Add ''UNIT_NPC_FLAG_QUESTGIVER''');
