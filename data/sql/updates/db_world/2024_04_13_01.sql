DELETE FROM `creature_text` WHERE `CreatureId` IN (26828,26832);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(26828,0,0,'You test my patience, you now see the true might of the Blue.',12,0,100,0,0,0,28122,0,'Magister Keldonus'),
(26828,1,0,'My lady, the surge needle is fully operational.',12,0,100,1,0,0,26020,0,'Magister Keldonus'),
(26828,2,0,'The ley line beneath this night elf temple is now flowing into the Azure Dragonshrine. Our brothers should have all the power they need to crush our enemies.',12,0,100,0,0,0,26024,0,'Magister Keldonus'),
(26828,3,0,'I live only to serve the master, my lady.',12,0,100,1,0,0,26022,0,'Magister Keldonus to Magister Keldonus'),

(26832,0,0,'You have done well, Keldonus. Lord Malygos will be quite pleased with your progress.',12,0,100,1,0,0,26021,0,'Grand Magus Telestra to Magister Keldonus'),
(26832,1,0,'Deal with this interruption, Keldonus. After you are through, bring me the head of the one they call $n. I will decorate my chambers with $g his:her; skull.',12,0,100,397,0,0,26025,0,'Grand Magus Telestra to player'),
(26832,2,0,'This transgression against the Blue Dragonflight has been noted. I will take extra pleasure in separating the life energy from your body!',12,0,100,1,0,0,26026,0,'Grand Magus Telestra to player');

UPDATE `smart_scripts` SET `link` = 5, `event_param3` = 0, `event_param4` = 0 WHERE `source_type` = 0 AND `entryorguid` = 26828 AND `id` = 4;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 26832;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 26828 AND `id` > 4;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 26832;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2682800;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(26828,0,5,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Keldonus - Linked - Say Line 0'),
(26828,0,6,0,1,0,100,0,120000,240000,120000,240000,0,80,2682800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Keldonus - OOC - Call Timed Action List'),
(26828,0,7,8,4,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Magister Keldonus - On Aggro - Store Target 1 (Invoker)'),
(26828,0,8,9,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,26832,0,0,0,0,0,0,0,'Magister Keldonus - Linked - Send Target 1 (Grand Magus Telestra)'),
(26828,0,9,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,26832,0,0,0,0,0,0,0,'Magister Keldonus - Linked - Set Data 1 1 (Grand Magus Telestra)'),
(26828,0,10,0,6,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,19,26832,40,0,0,0,0,0,0,'Magister Keldonus - On Death - Say Line 2 (Grand Magus Telestra)'),

(2682800,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,19,26832,0,0,0,0,0,0,0,'Magister Keldonus - On Script - Say Line 1'),
(2682800,9,1,0,0,0,100,0,4000,4000,0,0,0,1,2,0,1,0,0,0,19,26832,0,0,0,0,0,0,0,'Magister Keldonus - On Script - Say Line 2'),
(2682800,9,2,0,0,0,100,0,10000,10000,0,0,0,1,0,0,0,0,0,0,19,26832,0,0,0,0,0,0,0,'Magister Keldonus - On Script - Say Line 0 (Grand Magus Telestra)'),
(2682800,9,3,0,0,0,100,0,5000,5000,0,0,0,1,3,0,1,0,0,0,19,26832,0,0,0,0,0,0,0,'Magister Keldonus - On Script - Say Line 3'),

(26832,0,0,0,38,0,100,0,1,1,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Grand Magus Telestra - On Data Set 1 1 - Say Line 1 (Stored Target 1)');
