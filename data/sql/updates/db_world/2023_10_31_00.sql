DELETE FROM `gameobject` WHERE `guid` = 3009191;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3009191,174683,1,0,0,1,1,-6034.77,-1017.47,-217.119,6.22403,0,0,0,0,-1,0,0,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 9117;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (911700,911701,911702,911703);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9117,0,0,1,19,0,100,0,4321,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'J.D. Collie - On Quest ''Making Sense of It'' Accepted - Store Target 1 (Invoker)'),
(9117,0,1,0,61,0,100,0,0,0,0,0,0,80,911700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - Linked - Call Timed Action List'),
(9117,0,2,0,62,0,100,0,2184,3,0,0,0,85,15211,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'J.D. Collie - On Gossip Option 3 Selected - Invoker Cast ''Create Pylon User''s Manual'''),
(9117,0,3,0,20,0,100,0,3941,0,0,0,0,80,911701,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Quest ''A Gnome''s Assistance'' Rewarded - Call Timed Action List'),
(9117,0,4,0,34,0,100,0,8,1,0,0,0,80,911702,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Point 1 Reached - Call Timed Action List'),
(9117,0,5,0,34,0,100,0,8,2,0,0,0,80,911703,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Point 2 Reached - Call Timed Action List'),

(911700,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Set Active On'),
(911700,9,1,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Remove NPC Flags'),
(911700,9,2,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.08,'J.D. Collie - Set Orientation'),
(911700,9,3,0,0,0,100,0,2000,2000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 0'),
(911700,9,4,0,0,0,100,0,1000,1000,0,0,0,70,15,0,0,0,0,0,14,3009191,174683,0,0,0,0,0,0,'J.D. Collie - Respawn GO (J.D.''s Manual)'),
(911700,9,5,0,0,0,100,0,5000,5000,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 1'),
(911700,9,6,0,0,0,100,0,6000,6000,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 2'),
(911700,9,7,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - Reset Orientation'),
(911700,9,8,0,0,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Restore NPC Flags'),
(911700,9,9,0,0,0,100,0,0,0,0,0,0,15,4321,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'J.D. Collie - On Script - Quest Credit ''Making Sense of It'' (Stored Target 1)'),
(911700,9,10,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Set Active Off'),

(911701,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Set Active On'),
(911701,9,1,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Remove NPC Flags'),
(911701,9,2,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Set Run Off'),
(911701,9,3,0,0,0,100,0,1000,1000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 8'),
(911701,9,4,0,0,0,100,0,5000,5000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,-6027.85,-1020.16,-217.056,0,'J.D. Collie - On Script - Move To Point 1'),

(911702,9,0,0,0,0,100,0,1000,1000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 9'),
(911702,9,1,0,0,0,100,0,3000,3000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 4'),
(911702,9,2,0,0,0,100,0,0,0,0,0,0,11,32990,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Cast ''Enchanting Cast Visual'''),
(911702,9,3,0,0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 5'),
(911702,9,4,0,0,0,100,0,4000,4000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 6'),
(911702,9,5,0,0,0,100,0,3000,3000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 7'),
(911702,9,6,0,0,0,100,0,4000,4000,0,0,0,69,2,0,0,0,0,0,8,0,0,0,0,-6033.25,-1017.56,-217.055,0,'J.D. Collie - On Script - Move To Point 2'),

(911703,9,0,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Reset Orientation'),
(911703,9,1,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Say Line 3'),
(911703,9,2,0,0,0,100,0,2000,2000,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Restore NPC Flags'),
(911703,9,3,0,0,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Set Run On'),
(911703,9,4,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'J.D. Collie - On Script - Set Active Off');
