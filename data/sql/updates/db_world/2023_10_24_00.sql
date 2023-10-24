DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (1561,3643);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 2044;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 204400;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1561,1,0,1,19,0,100,0,74,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Sealed Crate - On Quest ''The Legend of Stalvan'' Accepted - Store Target 1 (Invoker)'),
(1561,1,1,0,61,0,100,0,0,0,0,0,0,12,2044,1,30000,0,0,0,8,0,0,0,0,-8841.93,985.171,98.6999,6.00926,'Sealed Crate - Linked - Summon Creature ''Forlorn Spirit'''),
(1561,1,2,0,17,0,100,0,2044,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Sealed Crate - On Summoned Unit ''Forlorn Spirit'' - Send Stored Target 1 (Invoker)'),

(3643,1,0,1,20,0,100,0,67,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Old Footlocker - On Quest ''The Legend of Stalvan'' Rewarded - Store Target 1 (Invoker)'),
(3643,1,1,0,61,0,100,0,0,0,0,0,0,12,2044,1,30000,0,0,0,8,0,0,0,0,-10951.4,1568.86,46.9779,3.75142,'Old Footlocker - Linked - Summon Creature ''Forlorn Spirit'''),
(3643,1,2,0,17,0,100,0,2044,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Old Footlocker - On Summoned Unit ''Forlorn Spirit'' - Send Stored Target 1 (Invoker)'),

(2044,0,0,0,54,0,100,0,0,0,0,0,0,80,204400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forlorn Spirit - On Just Summoned - Call Timed Action List'),
(2044,0,1,0,0,0,100,0,2000,2000,2000,2000,0,11,3105,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Forlorn Spirit - IC - Cast ''Curse of Stalvan'''),
(2044,0,2,0,0,0,100,0,10000,15000,18500,27000,0,11,118,32,0,0,0,0,6,0,0,0,0,0,0,0,0,'Forlorn Spirit - IC - Cast ''Polymorph'''),

(204400,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Forlorn Spirit - On Script - Set Active On'),
(204400,9,1,0,0,0,100,0,2000,2000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Forlorn Spirit - On Script - Say Line 0'),
(204400,9,2,0,0,0,100,0,2000,2000,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Forlorn Spirit - On Script - Start Attack (Stored Target 1)');
