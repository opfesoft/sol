UPDATE `creature` SET `orientation` = 5.39307 WHERE `guid` = 80684;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (253,251);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (25300,25100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(253,0,0,0,20,0,100,0,112,0,0,0,0,80,25300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'William Pestle - On Quest ''Collecting Kelp'' Rewarded - Call Timed Action List'),

(25300,9,0,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'William Pestle - On Script - Remove NPC Flags'),
(25300,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1.5708,'William Pestle - On Script - Set Orientation'),
(25300,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'William Pestle - On Script - Say Line 0'),
(25300,9,3,0,0,0,100,0,0,0,0,0,0,17,133,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'William Pestle - On Script - Set Emote State ''STATE_USESTANDING_NOSHEATHE'''),
(25300,9,4,0,0,0,100,0,0,0,0,0,0,71,0,0,3699,3697,0,0,1,0,0,0,0,0,0,0,0,'William Pestle - On Script - Equip Items'),
(25300,9,5,0,0,0,100,0,5000,5000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,'William Pestle - On Script - Reset Orientation'),
(25300,9,6,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'William Pestle - On Script - Set Emote State ''ONESHOT_NONE'''),
(25300,9,7,0,0,0,100,0,0,0,0,0,0,71,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'William Pestle - On Script - Remove Equip'),
(25300,9,8,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'William Pestle - On Script - Say Line 1'),
(25300,9,9,0,0,0,100,0,3000,3000,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'William Pestle - On Script - Restore NPC Flags'),

(251,0,0,0,20,0,100,0,114,0,0,0,0,80,25100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maybell Maclure - On Quest ''The Escape'' Rewarded - Call Timed Action List'),
(251,0,1,0,11,0,100,0,0,0,0,0,0,71,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maybell Maclure - On Respawn - Remove Equip'),

(25100,9,0,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maybell Maclure - On Script - Remove NPC Flags'),
(25100,9,1,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maybell Maclure - On Script - Say Line 0'),
(25100,9,2,0,0,0,100,0,0,0,0,0,0,71,0,0,3699,0,0,0,1,0,0,0,0,0,0,0,0,'Maybell Maclure -  On Script - Equip Item'),
(25100,9,3,0,0,0,100,0,3000,3000,0,0,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maybell Maclure - On Script - Play_Emote ''ONESHOT_EAT_NOSHEATHE'''),
(25100,9,4,0,0,0,100,0,0,0,0,0,0,41,1500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maybell Maclure - On Script - Force Despawn');
