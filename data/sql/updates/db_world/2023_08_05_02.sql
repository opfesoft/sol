DELETE FROM `creature_text` WHERE `CreatureId` = 18218 AND `GroupID` = 5;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18218,5,0,'Shifting, %s moans from the pain of his thorn scratch.',16,0,100,0,0,0,15157,0,'Harold Lane'),
(18218,5,1,'%s groans in pain.',16,0,100,0,0,0,15158,0,'Harold Lane'),
(18218,5,2,'%s looks at his friends and then grunts painfully.',16,0,100,0,0,0,15159,0,'Harold Lane'),
(18218,5,3,'%s wakes himself up snoring.',16,0,100,0,0,0,15160,0,'Harold Lane'),
(18218,5,4,'%s winces when he touches the tender area around his scratch.',16,0,100,0,0,0,15161,0,'Harold Lane'),
(18218,5,5,'%s begins to whistle a tune, but then stops abruptly and moans.',16,0,100,0,0,0,15162,0,'Harold Lane');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18218;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1821800;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18218,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Respawn - Disable Event Phase Reset'),
(18218,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - Linked - Set Event Phase 1'),
(18218,0,2,0,1,1,100,0,1000,15000,150000,180000,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - OOC - Say Line 5'),
(18218,0,3,0,38,0,100,0,2,1,0,0,0,80,1821800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Data Set 2 1 - Call Timed Action List'),

(1821800,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Set Event Phase 2'),
(1821800,9,1,0,0,0,100,0,14000,14000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Say Line 1'),
(1821800,9,2,0,0,0,100,0,7000,7000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Say Line 2'),
(1821800,9,3,0,0,0,100,0,7000,7000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Say Line 3'),
(1821800,9,4,0,0,0,100,0,8000,8000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Say Line 4'),
(1821800,9,5,0,0,0,100,0,5000,5000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Set Event Phase 1');
