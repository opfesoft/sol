DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (22992,22993,22994);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2299200,2299300,2299400);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (185547,185551,185553);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185547,1,0,1,64,0,100,0,1,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Shrine of the Eagle - On Gossip Hello - Store Target 1 (Invoker)'),
(185547,1,1,0,61,0,100,0,0,0,0,0,0,12,22993,4,60000,0,0,0,8,0,0,0,0,-2623.6,4573.66,138.827,1.64381,'Shrine of the Eagle - On Link - Summon Creature ''Guardian of the Eagle'''),
(185547,1,2,0,17,0,100,0,22993,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Shrine of the Eagle - On Summoned Unit ''Guardian of the Eagle'' - Send Target 1 (Invoker)'),

(185551,1,0,1,64,0,100,0,1,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Shrine of the Hawk - On Gossip Hello - Store Target 1 (Invoker)'),
(185551,1,1,0,61,0,100,0,0,0,0,0,0,12,22992,4,60000,0,0,0,8,0,0,0,0,-4362.77,4626.06,-39.2711,0.86199,'Shrine of the Hawk - On Link - Summon Creature ''Guardian of the Hawk'''),
(185551,1,2,0,17,0,100,0,22992,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Shrine of the Hawk - On Summoned Unit ''Guardian of the Hawk'' - Send Target 1 (Invoker)'),

(185553,1,0,1,64,0,100,0,1,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Shrine of the Falcon - On Gossip Hello - Store Target 1 (Invoker)'),
(185553,1,1,0,61,0,100,0,0,0,0,0,0,12,22994,4,60000,0,0,0,8,0,0,0,0,-3166.13,3809.05,59.7824,1.84486,'Shrine of the Falcon - On Gossip Hello - Summon Creature ''Guardian of the Falcon'''),
(185553,1,2,0,17,0,100,0,22994,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Shrine of the Falcon - On Summoned Unit ''Guardian of the Falcon'' - Send Target 1 (Invoker)'),

(22992,0,0,0,54,0,100,0,0,0,0,0,0,80,2299200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Hawk - On Just Summoned - Call Timed Action List'),
(22992,0,1,0,0,0,100,0,16000,20000,17000,23000,0,11,40358,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Guardian of the Hawk - IC - Cast ''Death Hammer'''),
(22992,0,2,0,0,0,100,0,8000,12000,18000,25000,0,11,40412,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Guardian of the Hawk - IC - Cast ''Curse of Blood'''),
(22992,0,3,0,0,0,100,0,10000,15000,25000,35000,0,11,40413,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Guardian of the Hawk - IC - Cast ''Throw'''),

(2299200,9,0,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Hawk - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2299200,9,1,0,0,0,100,0,0,0,0,0,0,17,27,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Hawk - On Script - Set Emote State ''STATE_READYUNARMED'''),
(2299200,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Guardian of the Hawk - On Script - Say Line 0'),
(2299200,9,3,0,0,0,100,0,4000,4000,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Guardian of the Hawk - On Script - Say Line 1'),
(2299200,9,4,0,0,0,100,0,6000,6000,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Hawk - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2299200,9,5,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Hawk - On Script - Set Emote State ''ONESHOT_NONE'''),
(2299200,9,6,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Guardian of the Hawk - On Script - Start Attack (Stored Target 1)'),

(22993,0,0,0,54,0,100,0,0,0,0,0,0,80,2299300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Eagle - On Just Summoned - Call Timed Action List'),
(22993,0,1,0,0,0,100,0,15000,15000,7000,7000,0,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Guardian of the Eagle - IC - Cast ''Wrath'''),
(22993,0,2,0,0,0,100,0,18000,18000,7000,7000,0,11,40339,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Guardian of the Eagle - IC - Cast ''Force Target to Summon Raven Add'''),
(22993,0,3,0,0,0,100,0,24000,24000,30000,30000,0,11,40344,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Guardian of the Eagle - IC - Cast ''Starfire'''),

(2299300,9,0,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Eagle - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2299300,9,1,0,0,0,100,0,0,0,0,0,0,17,27,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Eagle - On Script - Set Emote State ''STATE_READYUNARMED'''),
(2299300,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Guardian of the Eagle - On Script - Say Line 0'),
(2299300,9,3,0,0,0,100,0,4000,4000,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Guardian of the Eagle - On Script - Say Line 1'),
(2299300,9,4,0,0,0,100,0,6000,6000,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Eagle - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2299300,9,5,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Eagle - On Script - Set Emote State ''ONESHOT_NONE'''),
(2299300,9,6,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Guardian of the Eagle - On Script - Start Attack (Stored Target 1)'),

(22994,0,0,0,54,0,100,0,0,0,0,0,0,80,2299400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Falcon - On Just Summoned - Call Timed Action List'),
(22994,0,1,0,0,0,100,0,5000,10000,9000,15000,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Guardian of the Falcon - IC - Cast ''Shadow Bolt'''),
(22994,0,2,0,0,0,100,0,12000,15000,15000,15000,0,11,32712,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Falcon - IC - Cast ''Shadow Nova'''),
(22994,0,3,0,0,0,100,0,9000,15000,6000,17000,0,11,40366,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Guardian of the Falcon - IC - Cast ''Mark of Anzu'''),
(22994,0,4,0,0,0,100,0,15000,15000,20000,30000,0,11,40367,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Guardian of the Falcon - IC - Cast ''Twisting Blast'''),
(22994,0,5,0,0,0,100,0,20000,21000,15000,25000,0,11,40368,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Guardian of the Falcon - IC - Cast ''Nether Vortex'''),
(22994,0,6,0,0,0,100,0,15000,20000,25000,35000,0,11,40400,0,0,0,0,0,6,0,0,0,0,0,0,0,0,'Guardian of the Falcon - IC - Cast ''Hex'''),

(2299400,9,0,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Falcon - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2299400,9,1,0,0,0,100,0,0,0,0,0,0,17,27,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Falcon - On Script - Set Emote State ''STATE_READYUNARMED'''),
(2299400,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Guardian of the Falcon - On Script - Say Line 0'),
(2299400,9,3,0,0,0,100,0,4000,4000,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Guardian of the Falcon - On Script - Say Line 1'),
(2299400,9,4,0,0,0,100,0,6000,6000,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Falcon - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2299400,9,5,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guardian of the Falcon - On Script - Set Emote State ''ONESHOT_NONE'''),
(2299400,9,6,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Guardian of the Falcon - On Script - Start Attack (Stored Target 1)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (185547,185551,185553) AND `SourceId` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,185547,1,0,29,1,22993,50,0,1,0,0,'GO ''Shrine of the Eagle'' - Group 0: Execute SAI ID 0 only if not near creature ''Guardian of the Eagle'''),
(22,1,185551,1,0,29,1,22992,50,0,1,0,0,'GO ''Shrine of the Hawk'' - Group 0: Execute SAI ID 0 only if not near creature ''Guardian of the Hawk'''),
(22,1,185553,1,0,29,1,22994,50,0,1,0,0,'GO ''Shrine of the Falcon'' - Group 0: Execute SAI ID 0 only if not near creature ''Guardian of the Falcon''');
