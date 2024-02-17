DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 28347;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2834700,2834701,2834702,2834703);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28347,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Respawn - Disable Event Phase Reset'),
(28347,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - Linked - Set Event Phase 1'),
(28347,0,2,0,1,0,100,0,180000,360000,180000,360000,0,87,2834700,2834701,2834702,2834703,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - OOC - Call Random Timed Action List'),
(28347,0,3,0,10,1,100,0,1,10,30000,120000,1,1,5,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Miles Sidney - OOC LOS (Event Phase 1) - Say Line 5'),

(2834700,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Event Phase 2'),
(2834700,9,1,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,19,28355,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Orientation (Wright Williams)'),
(2834700,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Say Line 0'),
(2834700,9,3,0,0,0,100,0,2000,2000,0,0,0,66,0,19,28355,0,0,0,19,28347,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Orientation ''Wright Williams'' (Miles Sidney)'),
(2834700,9,4,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,19,28355,0,0,0,0,0,0,0,'Miles Sidney - On Script - Say Line 2 (Wright Williams)'),
(2834700,9,5,0,0,0,100,0,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Say Line 4'),
(2834700,9,6,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Reset Orientation'),
(2834700,9,7,0,0,0,100,0,1000,1000,0,0,0,66,0,19,28355,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Reset Orientation ''Wright Williams'''),
(2834700,9,8,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Event Phase 1'),

(2834701,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Event Phase 2'),
(2834701,9,1,0,0,0,100,0,4000,4000,0,0,0,66,0,19,28355,0,0,0,19,28347,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Orientation ''Wright Williams'' (Miles Sidney)'),
(2834701,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,19,28355,0,0,0,0,0,0,0,'Miles Sidney - On Script - Say Line 0 (Wright Williams)'),
(2834701,9,3,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,19,28355,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Orientation (Wright Williams)'),
(2834701,9,4,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Say Line 1'),
(2834701,9,5,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Reset Orientation'),
(2834701,9,6,0,0,0,100,0,1000,1000,0,0,0,66,0,19,28355,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Reset Orientation ''Wright Williams'''),
(2834701,9,7,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Event Phase 1'),

(2834702,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Event Phase 2'),
(2834702,9,1,0,0,0,100,0,4000,4000,0,0,0,66,0,19,28355,0,0,0,19,28347,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Orientation ''Wright Williams'' (Miles Sidney)'),
(2834702,9,2,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,19,28355,0,0,0,0,0,0,0,'Miles Sidney - On Script - Say Line 1 (Wright Williams)'),
(2834702,9,3,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,19,28355,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Orientation (Wright Williams)'),
(2834702,9,4,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Say Line 2'),
(2834702,9,5,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Reset Orientation'),
(2834702,9,6,0,0,0,100,0,1000,1000,0,0,0,66,0,19,28355,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Reset Orientation ''Wright Williams'''),
(2834702,9,7,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Event Phase 1'),

(2834703,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Event Phase 2'),
(2834703,9,1,0,0,0,100,0,4000,4000,0,0,0,66,0,19,28355,0,0,0,19,28347,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Orientation ''Wright Williams'' (Miles Sidney)'),
(2834703,9,2,0,0,0,100,0,1000,1000,0,0,0,1,3,0,0,0,0,0,19,28355,0,0,0,0,0,0,0,'Miles Sidney - On Script - Say Line 3 (Wright Williams)'),
(2834703,9,3,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,19,28355,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Orientation (Wright Williams)'),
(2834703,9,4,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Say Line 3'),
(2834703,9,5,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Reset Orientation'),
(2834703,9,6,0,0,0,100,0,1000,1000,0,0,0,66,0,19,28355,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Reset Orientation ''Wright Williams'''),
(2834703,9,7,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Miles Sidney - On Script - Set Event Phase 1');
