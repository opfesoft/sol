DELETE FROM `creature` WHERE `id` IN (22798,22799,22800,22801);
UPDATE `creature_template` SET `type` = 10 WHERE `entry` = 21861;
UPDATE `gameobject_template_addon` SET `flags` = 4 WHERE `entry` IN (184969,184968,184967,184950);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 21861;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (184969,184968,184967,184950);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21861,0,0,1,38,0,100,0,1,1,0,0,0,33,22798,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Vision of the Raven God - On Data Set 1 1 - Quest Credit ''Prophecy 1'''),
(21861,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Vision of the Raven God - Linked - Say Line 0'),
(21861,0,2,3,38,0,100,0,1,2,0,0,0,33,22799,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Vision of the Raven God - On Data Set 1 2 - Quest Credit ''Prophecy 2'''),
(21861,0,3,0,61,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Vision of the Raven God - Linked - Say Line 1'),
(21861,0,4,5,38,0,100,0,1,3,0,0,0,33,22800,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Vision of the Raven God - On Data Set 1 3 - Quest Credit ''Prophecy 3'''),
(21861,0,5,0,61,0,100,0,0,0,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Vision of the Raven God - Linked - Say Line 2'),
(21861,0,6,7,38,0,100,0,1,4,0,0,0,33,22801,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Vision of the Raven God - On Data Set 1 4 - Quest Credit ''Prophecy 4'''),
(21861,0,7,0,61,0,100,0,0,0,0,0,0,1,3,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Vision of the Raven God - Linked - Say Line 3'),

(184950,1,0,1,64,0,100,0,1,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The First Prophecy - On Gossip Hello - Store Target 1 (Invoker)'),
(184950,1,1,0,61,0,100,0,0,0,0,0,0,12,21861,3,6000,0,0,0,8,0,0,0,0,3779.99,6729.6,170.497,5.7149,'The First Prophecy - Linked - Summon Creature ''Vision of the Raven God'''),
(184950,1,2,3,17,0,100,0,21861,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The First Prophecy - On Summoned Unit ''Vision of the Raven God'' - Send Target (Invoker)'),
(184950,1,3,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'The First Prophecy - Linked - Set Data 1 1 (Invoker)'),

(184967,1,0,1,64,0,100,0,1,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Second Prophecy - On Gossip Hello - Store Target 1 (Invoker)'),
(184967,1,1,0,61,0,100,0,0,0,0,0,0,12,21861,3,6000,0,0,0,8,0,0,0,0,3629.29,6542.14,155.005,2.56267,'The Second Prophecy - Linked - Summon Creature ''Vision of the Raven God'''),
(184967,1,2,3,17,0,100,0,21861,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Second Prophecy - On Summoned Unit ''Vision of the Raven God'' - Send Target (Invoker)'),
(184967,1,3,0,61,0,100,0,0,0,0,0,0,45,1,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Second Prophecy - Linked - Set Data 1 2 (Invoker)'),

(184968,1,0,1,64,0,100,0,1,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Third Prophecy - On Gossip Hello - Store Target 1 (Invoker)'),
(184968,1,1,0,61,0,100,0,0,0,0,0,0,12,21861,3,6000,0,0,0,8,0,0,0,0,3736.95,6640.75,133.675,3.33629,'The Third Prophecy - Linked - Summon Creature ''Vision of the Raven God'''),
(184968,1,2,3,17,0,100,0,21861,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Third Prophecy - On Summoned Unit ''Vision of the Raven God'' - Send Target (Invoker)'),
(184968,1,3,0,61,0,100,0,0,0,0,0,0,45,1,3,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Third Prophecy - Linked - Set Data 1 3 (Invoker)'),

(184969,1,0,1,64,0,100,0,1,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Fourth Prophecy - On Gossip Hello - Store Target 1 (Invoker)'),
(184969,1,1,0,61,0,100,0,0,0,0,0,0,12,21861,3,6000,0,0,0,8,0,0,0,0,3572.57,6669.2,128.455,5.6229,'The Fourth Prophecy - Linked - Summon Creature ''Vision of the Raven God'''),
(184969,1,2,3,17,0,100,0,21861,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Fourth Prophecy - On Summoned Unit ''Vision of the Raven God'' - Send Target (Invoker)'),
(184969,1,3,0,61,0,100,0,0,0,0,0,0,45,1,4,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Fourth Prophecy - Linked - Set Data 1 4 (Invoker)');
