DELETE FROM `creature_text` WHERE `CreatureId` = 15076;
DELETE FROM `creature_text` WHERE `CreatureId` = 14875 AND `GroupID` = 2;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(15076,0,0,'The Blood God, the Soulflayer, has been defeated!  We are imperiled no longer!',14,0,100,5,0,0,10612,0,'Zandalarian Emissary'),

(14875,2,0,'Now, only one step remains to rid us of the Soulflayer''s threat...',12,0,100,0,0,0,10473,0,'Molthor');

UPDATE `creature_template` SET `gossip_menu_id` = 6425 WHERE `entry` = 15080;
DELETE FROM `gossip_menu` WHERE `MenuID` = 6425;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6425,7718);

DELETE FROM `spell_target_position` WHERE `ID` = 24214;
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`, `Orientation`)
VALUES
(24214,0,0,-11818.9,1343.2,7.905,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 15076;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (14875,15069,15080,15076);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1487500,1508000,1506900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14875,0,0,1,20,0,100,0,8183,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - On Quest ''The Heart of Hakkar'' Rewarded - Set Active On'),
(14875,0,1,2,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - Linked - Say Line 2'),
(14875,0,2,0,61,0,100,0,0,0,0,0,0,53,1,14875,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - Linked - Start WP Movement'),
(14875,0,3,0,40,0,100,0,11,14875,0,0,0,80,1487500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - On WP 11 Reached - Call Timed Action List'),
(14875,0,4,0,40,0,100,0,11,14875,0,0,0,54,40000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - On WP 11 Reached - Pause WP Movement'),
(14875,0,5,0,58,0,100,0,0,14875,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - On WP Path Ended - Set Active Off'),

(1487500,9,0,0,0,0,100,0,0,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,-14449.9,479.185,0,0,'Molthor - On Script - Load Grid (Zandalarian Emissary Position)'),
(1487500,9,1,0,0,0,100,0,0,0,0,0,0,12,15080,6,0,0,0,0,8,0,0,0,0,-11817,1324,1,1,'Molthor - On Script - Summon Creature ''Servant of the Hand'''),
(1487500,9,2,0,0,0,100,0,0,0,0,0,0,12,15080,6,0,0,0,0,8,0,0,0,0,-11831.5,1331.15,1.839,0.615,'Molthor - On Script - Summon Creature ''Servant of the Hand'''),
(1487500,9,3,0,0,0,100,0,0,0,0,0,0,12,15080,6,0,0,0,0,8,0,0,0,0,-11834.8,1349.83,2.009,5.864,'Molthor - On Script - Summon Creature ''Servant of the Hand'''),
(1487500,9,4,0,0,0,100,0,0,0,0,0,0,12,15080,6,0,0,0,0,8,0,0,0,0,-11801,1335.25,1.261,2.808,'Molthor - On Script - Summon Creature ''Servant of the Hand'''),
(1487500,9,5,0,0,0,100,0,0,0,0,0,0,11,24214,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - On Script - Cast ''Heart of Hakkar - Molthor chucks the heart'''),
(1487500,9,6,0,0,0,100,0,5000,5000,0,0,0,12,15069,3,32000,0,0,0,8,0,0,0,0,-11818.9,1343.2,7.905,4.3411,'Molthor - On Script - Summon Creature ''Heart of Hakkar'''),
(1487500,9,7,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - On Script - Say Line 0'),
(1487500,9,8,0,0,0,100,0,7000,7000,0,0,0,11,24203,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - On Script - Cast ''Heart of Hakkar Banning'''),
(1487500,9,9,0,0,0,100,0,25000,25000,0,0,0,11,24204,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - On Script - Cast ''Heart of Hakkar Implode'''),
(1487500,9,10,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Molthor - On Script - Say Line 1'),
(1487500,9,11,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,436,15076,1,1,0,0,0,0,'Molthor - On Script - Set Data 1 1 (Zandalarian Emissary)'),

(15069,0,0,0,54,0,100,0,0,0,0,0,0,80,1506900,2,0,0,0,0,1,0,0,0,0,0,0,-3,0,'Heart of Hakkar - On Just Summoned - Call Timed Action List'),

(1506900,9,0,0,0,0,100,0,0,0,0,0,0,50,180402,32,0,0,0,0,1,0,0,0,0,0,0,-3,0,'Heart of Hakkar - On Script - Summon GO ''Heart of Hakkar Object'''),
(1506900,9,1,0,0,0,100,0,2000,2000,0,0,0,11,24202,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heart of Hakkar - On Script - Cast ''Create Heart of Hakkar Rift'''),

(15080,0,0,0,54,0,100,0,0,0,0,0,0,80,1508000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of the Hand - On Just Summoned - Call Timed Action List'),

(1508000,9,0,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of the Hand - On Script - Remove NPC Flags'),
(1508000,9,1,0,0,0,100,0,0,0,0,0,0,11,12980,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of the Hand - On Script - Cast ''Simple Teleport'''),
(1508000,9,2,0,0,0,100,0,7000,7000,0,0,0,11,24602,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of the Hand - On Script - Cast ''Create Heart of Hakkar Summon Circle'''),
(1508000,9,3,0,0,0,100,0,0,0,0,0,0,11,24217,0,0,0,0,0,19,15069,0,0,0,0,0,0,0,'Servant of the Hand - On Script - Cast ''Quest - Heart of Hakkar, Ritual Cast Visual'''),
(1508000,9,4,0,0,0,100,0,30000,30000,0,0,0,11,42963,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of the Hand - On Script - Cast ''Cosmetic - Combat Knockdown Self'''),
(1508000,9,5,0,0,0,100,0,5000,5000,0,0,0,11,12980,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of the Hand - On Script - Cast ''Simple Teleport'''),
(1508000,9,6,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Servant of the Hand - On Script - Force Despawn'),

(15076,0,0,0,38,0,100,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Zandalarian Emissary - On Data Set 1 1 - Say Line 0');
