DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (35116,35127);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (3511600,3512700);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(35116,0,0,0,54,0,100,0,0,0,0,0,0,80,3511600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Saboteur - On Just Summoned - Call Timed Action List'),

(3511600,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Saboteur - On Script - Set Active On'),
(3511600,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Saboteur - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(3511600,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Saboteur - On Script - Say Line 0'),
(3511600,9,3,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Saboteur - On Script - Say Line 1'),
(3511600,9,4,0,0,0,100,0,5000,5000,0,0,0,66,0,0,0,0,0,0,19,35127,20,0,0,0,0,0,0,'Cult Saboteur - On Script - Set Orientation (Cult Assassin)'),
(3511600,9,5,0,0,0,100,0,1000,1000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Saboteur - On Script - Say Line 2'),
(3511600,9,6,0,0,0,100,0,4000,4000,0,0,0,11,62940,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Saboteur - On Script - Cast ''Teleport'''),
(3511600,9,7,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,35127,20,0,0,0,0,0,0,'Cult Saboteur - On Script - Set Data 1 1 (Cult Assassin)'),
(3511600,9,8,0,0,0,100,0,0,0,0,0,0,41,2500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Saboteur - On Script - Force Despawn'),

(35127,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Assassin - On Just Summoned - Set Active On'),
(35127,0,1,2,61,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Assassin - Linked - Set ''UNIT_STAND_STATE_KNEEL'''),
(35127,0,2,0,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Assassin - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(35127,0,3,0,0,0,100,0,1000,2000,7000,8000,0,11,14873,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cult Assassin - IC - Cast ''Sinister Strike'''),
(35127,0,4,0,0,0,100,0,3000,4000,14000,15000,0,11,60842,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cult Assassin - IC - Cast ''Expose Armor'''),
(35127,0,5,0,6,0,100,0,0,0,0,0,0,11,66785,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Cult Assassin - On Death - Cast ''Black Knight''s Grave Credit'' (Invoker)'),
(35127,0,6,0,38,0,100,0,1,1,0,0,0,80,3512700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Assassin - On Data Set 1 1 - Call Timed Action List'),

(3512700,9,0,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Assassin - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(3512700,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Assassin - On Script - Say Line 0'),
(3512700,9,2,0,0,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Assassin - On Script - Set Emote State ''STATE_READY1H'''),
(3512700,9,3,0,0,0,100,0,1000,1000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cult Assassin - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(3512700,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Cult Assassin - On Script - Start Attack (Stored Target 1)');
