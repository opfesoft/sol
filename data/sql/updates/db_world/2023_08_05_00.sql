DELETE FROM `creature_text` WHERE `CreatureId` IN (21151,21197);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(21197,0,0,'Borgrim!  Get over here right this instant and help me with this unpacking!',12,7,100,5,0,0,18810,0,'Bronwyn Stouthammer'),
(21151,0,0,'Yup, just as soon as I finish this pint.  You betcha.',12,7,100,92,0,0,18815,0,'Borgrim Stouthammer'),
(21197,1,0,'Borgrim, this is no time for drinking.  We just got here.  We need to get settled in.',12,7,100,274,0,0,18813,0,'Bronwyn Stouthammer'),
(21151,1,0,'I thought this was going to be our chance to get away from it all?  Our vacation?',12,7,100,6,0,0,18817,0,'Borgrim Stouthammer'),
(21197,2,0,'Men!',12,7,100,5,0,0,18819,0,'Bronwyn Stouthammer'),
(21151,2,0,'Women!',12,7,100,5,0,0,18818,0,'Borgrim Stouthammer'),
(21197,3,0,'I know that you want your vacation, but we still have work to do.',12,7,100,1,0,0,18811,0,'Bronwyn Stouthammer'),
(21151,3,0,'Right.  We just busted our tails to haul all of this stuff up here, and you want to work more?',12,7,100,6,0,0,18816,0,'Borgrim Stouthammer'),
(21197,4,0,'Tell you what, hon.  If you help me get all of this unpacked, we can both take a breather.  Deal?',12,7,100,1,0,0,18812,0,'Bronwyn Stouthammer'),
(21151,4,0,'Uh, yeah... I''ll be right there, dear.',12,7,100,1,0,0,18814,0,'Borgrim Stouthammer'),
(21151,5,0,'ACK!  That''s the worst thing I''ve ever tasted!  I wouldn''t let my ram drink that!',12,7,100,5,0,0,18830,0,'Borgrim Stouthammer');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (21151,21197);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21151,21197);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2115100,2115101);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21151,0,0,0,1,0,100,0,10000,20000,10000,20000,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - OOC - Play Emote ''ONESHOT_EAT_NOSHEATHE'''),
(21151,0,1,0,1,0,100,0,180000,360000,180000,360000,0,80,2115100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Quest ''Strange Brew'' Rewarded - Call Timed Action List'),
(21151,0,2,0,20,0,100,0,10511,0,0,0,0,80,2115101,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Quest ''Strange Brew'' Rewarded - Call Timed Action List'),

(2115100,9,0,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Set Data 1 1 (Bronwyn Stouthammer)'),
(2115100,9,1,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Set Data 2 2 (Bronwyn Stouthammer)'),
(2115100,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 0 (Bronwyn Stouthammer)'),
(2115100,9,3,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Set Orientation (Bronwyn Stouthammer)'),
(2115100,9,4,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 0'),
(2115100,9,5,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 1 (Bronwyn Stouthammer)'),
(2115100,9,6,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 1'),
(2115100,9,7,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 2 (Bronwyn Stouthammer)'),
(2115100,9,8,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 2'),
(2115100,9,9,0,0,0,100,0,5000,5000,0,0,0,1,3,0,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 3 (Bronwyn Stouthammer)'),
(2115100,9,10,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 3'),
(2115100,9,11,0,0,0,100,0,6000,6000,0,0,0,1,4,0,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 4 (Bronwyn Stouthammer)'),
(2115100,9,12,0,0,0,100,0,7000,7000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 4'),
(2115100,9,13,0,0,0,100,0,3000,3000,0,0,0,45,3,3,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Set Data 3 3 (Bronwyn Stouthammer)'),
(2115100,9,14,0,0,0,100,0,1000,1000,0,0,0,45,4,4,0,0,0,0,19,21197,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Set Data 4 4 (Bronwyn Stouthammer)'),
(2115100,9,15,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Data Set 3 3 - Reset Orientation'),

(2115101,9,0,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Remove NPC Flags'),
(2115101,9,1,0,0,0,100,0,1000,1000,0,0,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Play Emote ''ONESHOT_EAT_NOSHEATHE'''),
(2115101,9,2,0,0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Say Line 5'),
(2115101,9,3,0,0,0,100,0,2000,2000,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Borgrim Stouthammer - On Script - Reset NPC Flags'),

(21197,0,0,0,38,0,100,0,1,1,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bronwyn Stouthammer - On Data Set 1 1 - Set Emote State ''ONESHOT_NONE'''),
(21197,0,1,0,38,0,100,0,2,2,0,0,0,66,0,0,0,0,0,0,19,21151,0,0,0,0,0,0,0,'Bronwyn Stouthammer - On Data Set 2 2 - Set Orientation (Borgrim Stouthammer)'),
(21197,0,2,0,38,0,100,0,3,3,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bronwyn Stouthammer - On Data Set 3 3 - Reset Orientation'),
(21197,0,3,0,38,0,100,0,4,4,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bronwyn Stouthammer - On Data Set 1 1 - Set Emote State ''STATE_USESTANDING''');

UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 74215;
UPDATE `creature` SET `MovementType` = 0, `orientation` = 1.96569 WHERE `guid` = 74332;
UPDATE `creature_addon` SET `path_id` = 0, `emote` = 69 WHERE `guid` = 74332;
DELETE FROM `creature_addon` WHERE `guid` = 74215;
DELETE FROM `waypoint_data` WHERE `id` IN (742150,743320);
DELETE FROM `waypoint_scripts` WHERE `id` IN (226,227,228);
