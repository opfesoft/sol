DELETE FROM `creature_template_addon` WHERE `entry` = 20159;
UPDATE `creature_addon` SET `mount` = 0 WHERE `guid` = 86873;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 20159;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 20159;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2015900,2015901);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20159,0,0,1,37,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On AI Init - Disable Event Phase Reset'),
(20159,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - Linked - Set Event Phase 1'),
(20159,0,2,3,25,1,100,0,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Reset (Event Phase 1) - Set ''GOSSIP_OPTION_GOSSIP'''),
(20159,0,3,4,61,0,100,0,0,0,0,0,0,43,0,18696,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - Linked - Mount Hawkstrider'),
(20159,0,4,0,61,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - Linked - Set Active Off'),
(20159,0,5,6,25,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Reset - Add ''UNIT_FLAG_IMMUNE_TO_PC'''),
(20159,0,6,7,61,0,100,0,0,0,0,0,0,2,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - Linked - Reset Faction'),
(20159,0,7,8,61,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(20159,0,8,0,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - Linked - Set Invincibility HP 0'),
(20159,0,9,0,62,0,100,0,8081,0,0,0,0,80,2015900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Gossip Option 0 Selected - Call Timed Action List'),
(20159,0,10,0,0,0,100,0,1000,1000,8000,12000,0,11,20823,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Magister Aledis - IC - Cast ''Fireball'''),
(20159,0,11,0,9,0,100,0,0,8,15000,25000,0,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - Within 0-8 Range - Cast ''Frost Nova'''),
(20159,0,12,0,2,2,100,0,0,20,0,0,0,80,2015901,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Health Between 0-20% (Event Phase 2) - Call Timed Action List'),
(20159,0,13,0,7,2,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Evade (Event Phase 2) - Set Event Phase 1'),

(2015900,9,0,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Close Gossip'),
(2015900,9,1,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Remove NPC Flags'),
(2015900,9,2,0,0,0,100,0,0,0,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Dismount'),
(2015900,9,3,0,0,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Set Orientation (Invoker)'),
(2015900,9,4,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Say Line 0'),
(2015900,9,5,0,0,0,100,0,4000,4000,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Set Invincibility HP 1'),
(2015900,9,6,0,0,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2015900,9,7,0,0,0,100,0,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Set Faction ''Monster'''),
(2015900,9,8,0,0,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2015900,9,9,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Set Event Phase 2'),
(2015900,9,10,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Start Attack (Invoker)'),

(2015901,9,0,0,0,0,100,0,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Set Event Phase 3'),
(2015901,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Set Active On'),
(2015901,9,2,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Set Home Position'),
(2015901,9,3,0,0,0,100,0,0,0,0,0,0,239,0,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Stop WP Path'),
(2015901,9,4,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Evade'),
(2015901,9,5,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Say Line 1'),
(2015901,9,6,0,0,0,100,0,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Set ''GOSSIP_OPTION_QUESTGIVER'''),
(2015901,9,7,0,0,0,100,0,60000,60000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Set Event Phase 1'),
(2015901,9,8,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Magister Aledis - On Script - Evade');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 8081;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,8081,0,0,0,47,0,10286,74,0,0,0,0,'Creature ''Magister Aledis'' - Show gossip option 0 if quest ''Arelion''s Secret'' is in progress, completed or rewarded'),
(15,8081,0,0,0,47,0,10287,1,0,0,0,0,'Creature ''Magister Aledis'' - Show gossip option 0 if quest ''The Mistress Revealed'' is not taken');
