DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 25379 AND `id` BETWEEN 0 AND 3;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 25759;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2575900,2575901);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25379,0,0,0,19,0,100,0,11711,0,0,0,0,85,45963,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Warden Nork Bloodfrenzy - On Quest ''Coward Delivery... Under 30 Minutes or it''s Free'' Accepted - Invoker Cast ''Call Alliance Deserter'''),
(25379,0,1,2,62,0,100,0,9184,0,0,0,0,85,45963,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Warden Nork Bloodfrenzy - On Gossip Option 0 Selected - Invoker Cast ''Call Alliance Deserter'''),
(25379,0,2,3,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Warden Nork Bloodfrenzy - Linked - Close Gossip'),
(25379,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Warden Nork Bloodfrenzy - Linked - Say Line 0'),

(25759,0,0,0,54,0,100,0,0,0,0,0,0,80,2575900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Valiance Keep Officer - On Just Summoned - Call Timed Action List'),
(25759,0,1,0,34,0,100,0,8,1,0,0,0,80,2575901,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Valiance Keep Officer - On Point 1 Reached - Call Timed Action List'),

(2575900,9,0,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Set Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2575900,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Store Target List 1 (Invoker)'),
(2575900,9,2,0,0,0,100,0,0,0,0,0,0,64,2,0,0,0,0,0,19,25761,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Store Target List 2 (Alliance Deserter)'),
(2575900,9,3,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Set Root On (Stored Target 2)'),
(2575900,9,4,0,0,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,12,2,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Move To Point 1 (Stored Target 2)'),

(2575901,9,0,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Set Orientation (Stored Target 1)'),
(2575901,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Say Line 0 (Stored Target 1)'),
(2575901,9,2,0,0,0,100,0,5000,5000,0,0,0,11,45981,2,0,0,0,0,12,1,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Cast ''Escorting Alliance Deserter'' (Stored Target 1)'),
(2575901,9,3,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,12,2,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Force Despawn (Alliance Deserter)'),
(2575901,9,4,0,0,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Valiance Keep Officer - On Script - Force Despawn');
