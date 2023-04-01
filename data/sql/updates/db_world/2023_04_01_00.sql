UPDATE `creature_template` SET `gossip_menu_id` = 7748 WHERE `entry` = 18385;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18385;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 19606 AND `id` > 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1838500,1960600);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18385,0,0,0,20,0,100,0,10201,0,0,0,0,80,1838500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rakoria - On Quest ''And Now, the Moment of Truth'' Rewarded - Call Timed Action List'),

(1838500,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rakoria - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1838500,9,1,0,0,0,100,0,0,0,0,0,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rakoria - On Script - Play Emote ''ONESHOT_LAUGH'''),
(1838500,9,2,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rakoria - On Script - Say Line 0'),
(1838500,9,3,0,0,0,100,0,3000,3000,0,0,0,5,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rakoria - On Script - Play Emote ''ONESHOT_LAUGH'''),
(1838500,9,4,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rakoria - On Script - Say Line 1'),
(1838500,9,5,0,0,0,100,0,2000,2000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rakoria - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(19606,0,2,0,62,0,100,0,7999,0,0,0,0,80,1960600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grek - On Gossip Option 0 Selected - Call Timed Action List'),

(1960600,9,0,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Grek - On Script - Close Gossip'),
(1960600,9,1,0,0,0,100,0,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grek - On Script - Remove ''GOSSIP_OPTION_GOSSIP'''),
(1960600,9,2,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grek - On Script - Say Line 2'),
(1960600,9,3,0,0,0,100,0,0,0,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grek - On Script - Set Emote State ''STATE_USESTANDING'''),
(1960600,9,4,0,0,0,100,0,8000,8000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grek - On Script - Set Emote State ''ONESHOT_NONE'''),
(1960600,9,5,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grek - On Script - Say Line 3'),
(1960600,9,6,0,0,0,100,0,0,0,0,0,0,33,19606,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Grek - On Script - Quest Credit And Now, the Moment of Truth'),
(1960600,9,7,0,0,0,100,0,2000,2000,0,0,0,82,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grek - On Script - Add ''GOSSIP_OPTION_GOSSIP''');
