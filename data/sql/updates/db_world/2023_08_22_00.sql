DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -48323;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
(-48323,48330,0,'Indisposed - Cast ''Create Amberseeds'' On Expiration');

UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 128 WHERE `entry` = 27326;

DELETE FROM `creature_text` WHERE `CreatureId` IN (27277,27071);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(27277,0,0,'Alright Ben. We''ve retrieved the amberseeds again. You know the drill.',12,7,100,1,0,0,26350,0,'Master Woodsman Anderhol'),
(27071,0,0,'I know, I know. Back in the bucket....',12,7,100,1,0,0,26351,0,'Benjamin Jacobs');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (27277,27071);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (27277,27071);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2727700,2707100,2707101);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27277,0,0,0,20,0,100,0,12227,0,0,0,0,80,2727700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Master Woodsman Anderhol - On Quest ''Doing Your Duty'' Rewarded - Call Timed Action List'),

(2727700,9,0,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Master Woodsman Anderhol - On Script - Remove NPC Flags'),
(2727700,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,27071,0,0,0,0,0,0,0,'Master Woodsman Anderhol - On Script - Set Orientation (Benjamin Jacobs)'),
(2727700,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Master Woodsman Anderhol - On Script - Say Line 0'),
(2727700,9,3,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,19,27071,0,0,0,0,0,0,0,'Master Woodsman Anderhol - On Script - Set Data 1 1 (Benjamin Jacobs)'),
(2727700,9,4,0,0,0,100,0,10000,10000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Master Woodsman Anderhol - On Script - Reset Orientation'),
(2727700,9,5,0,0,0,100,0,30000,30000,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Master Woodsman Anderhol - On Script - Reset NPC Flags'),

(27071,0,0,1,25,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - On Reset - Reset NPC Flags'),
(27071,0,1,0,61,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - Linked - Set Active Off'),
(27071,0,2,3,38,0,100,0,1,1,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - On Data Set 1 1 - Set Active On'),
(27071,0,3,4,61,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - Linked - Remove NPC Flags'),
(27071,0,4,0,61,0,100,0,0,0,0,0,0,53,0,2707100,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - Linked - Start WP Movement'),
(27071,0,5,0,40,0,100,0,2,2707100,0,0,0,80,2707100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - On WP 2 Reached - Call Timed Action List'),
(27071,0,6,0,40,0,100,0,7,2707100,0,0,0,80,2707101,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - On WP 7 Reached - Call Timed Action List'),
(27071,0,7,8,58,0,100,0,0,2707100,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - On WP Path Ended - Reset Home Position'),
(27071,0,8,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protectorate Demolitionist - Linked - Evade'),

(2707100,9,0,0,0,0,100,0,0,0,0,0,0,54,4000,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - On Script - Pause WP Movement'),
(2707100,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - On Script - Say Line 0'),

(2707101,9,0,0,0,0,100,0,0,0,0,0,0,54,6000,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - On Script - Pause WP Movement'),
(2707101,9,1,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(2707101,9,2,0,0,0,100,0,4000,4000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Benjamin Jacobs - On Script - Remove ''UNIT_STAND_STATE_KNEEL''');

DELETE FROM `waypoints` WHERE `entry` = 2707100;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(2707100,1,3406.97,-2792.54,201.521,'Benjamin Jacobs - Quest ''Doing Your Duty'''),
(2707100,2,3414.26,-2794.62,201.516,NULL),
(2707100,3,3417.51,-2789.92,201.507,NULL),
(2707100,4,3421.09,-2784.73,201.501,NULL),
(2707100,5,3422.93,-2783.31,202.616,NULL),
(2707100,6,3424.78,-2781.88,202.639,NULL),
(2707100,7,3431.33,-2780.14,202.656,NULL),
(2707100,8,3426.51,-2779.19,202.64,NULL),
(2707100,9,3422.31,-2782.34,202.616,NULL),
(2707100,10,3420.35,-2783.81,201.501,NULL),
(2707100,11,3415.68,-2787.3,201.511,NULL),
(2707100,12,3410.73,-2791.02,201.52,NULL),
(2707100,13,3401.92,-2791.1,201.521,NULL);
