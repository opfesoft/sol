UPDATE `creature_template` SET `speed_run` = 8/7 WHERE `entry` = 25849;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (25969,25849);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2584900,2584901);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25969,0,0,1,37,0,100,0,0,0,0,0,0,75,46340,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jenny - On AI Init - Add Aura ''Crates Carried'''),
(25969,0,1,0,61,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jenny - Linked - Set Reactstate ''Passive'''),
(25969,0,2,0,32,0,100,0,1,0,1000,1000,0,11,46342,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jenny - On Damage - Cast ''Drop Crate'''),
(25969,0,3,0,23,0,100,0,46340,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jenny - On Has No Aura ''Crates Carried'' - Force Despawn'),
(25969,0,4,5,75,0,100,0,0,25849,5,0,0,11,46358,0,0,0,0,1,23,0,0,0,0,0,0,0,0,'Jenny - Within 5 Range ''Fezzix Geartwist'' - Cast ''Give Jenny Credit'' (Summoner)'),
(25969,0,5,0,61,0,100,0,0,0,0,0,0,41,7000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jenny - Linked - Force Despawn'),

(25849,0,0,0,20,0,100,0,11894,0,0,0,0,80,2584900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Quest ''Patching Up'' Rewarded - Call Timed Action List'),
(25849,0,1,0,40,0,100,0,11,25849,0,0,0,80,2584901,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On WP 11 Reached - Call Timed Action List'),

(2584900,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Active On'),
(2584900,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2584900,9,2,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Remove NPC Flags'),
(2584900,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Say Line 0'),
(2584900,9,4,0,0,0,100,0,5000,5000,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Run Off'),
(2584900,9,5,0,0,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3479.38,4101.78,17.8362,0,'Fezzix Geartwist - On Script - Move To Point 1'),
(2584900,9,6,0,0,0,100,0,3000,3000,0,0,0,17,233,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Emote State ''STATE_WORK_MINING'''),
(2584900,9,7,0,0,0,100,0,8000,8000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Emote State ''ONESHOT_NONE'''),
(2584900,9,8,0,0,0,100,0,0,0,0,0,0,12,26040,3,12000,0,0,0,8,0,0,0,0,3481.33,4099.85,17.839,3.35103,'Fezzix Geartwist - On Script - Summon Creature ''Fezzix''s Flying Machine'''),
(2584900,9,9,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,14,60069,188087,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Despawn GO (Wreckage A)'),
(2584900,9,10,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,14,60080,188088,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Despawn GO (Wreckage B)'),
(2584900,9,11,0,0,0,100,0,0,0,0,0,0,233,0,0,0,0,0,0,14,60095,188089,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Despawn GO (Wreckage C)'),
(2584900,9,12,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,19,25983,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Orientation (Dorain Frosthoof)'),
(2584900,9,13,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Say Line 1'),
(2584900,9,14,0,0,0,100,0,9000,9000,0,0,0,43,0,22719,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Mount Model'),
(2584900,9,15,0,0,0,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Say Line 2'),
(2584900,9,16,0,0,0,100,0,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Fly On'),
(2584900,9,17,0,0,0,100,0,0,0,0,0,0,53,0,25849,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Start WP Movement'),

(2584901,9,0,0,0,0,100,0,0,0,0,0,0,11,46419,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Cast ''Cosmetic - Explosion'''),
(2584901,9,1,0,0,0,100,0,1000,1000,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Dismount'),
(2584901,9,2,0,0,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Fly Off'),
(2584901,9,3,0,0,0,100,0,0,0,0,0,0,210,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Fall'),
(2584901,9,4,0,0,0,100,0,1500,1500,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Say Line 3'),
(2584901,9,5,0,0,0,100,0,0,0,0,0,0,17,93,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Emote State ''STATE_STUN_NOSHEATHE'''),
(2584901,9,6,0,0,0,100,0,5000,5000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Emote State ''ONESHOT_NONE'''),
(2584901,9,7,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Say Line 4'),
(2584901,9,8,0,0,0,100,0,3000,3000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2584901,9,9,0,0,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,14,60069,188087,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Respawn Target (Wreckage A)'),
(2584901,9,10,0,0,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,14,60080,188088,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Respawn Target (Wreckage B)'),
(2584901,9,11,0,0,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,14,60095,188089,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Respawn Target (Wreckage C)'),
(2584901,9,12,0,0,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Restore NPC Flags'),
(2584901,9,13,0,0,0,100,0,0,0,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Reset Home Position'),
(2584901,9,14,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Evade'),
(2584901,9,15,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fezzix Geartwist - On Script - Set Active Off');

DELETE FROM `waypoints` WHERE `entry` = 25849 AND `pointid` = 12;
