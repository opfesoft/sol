DELETE FROM `creature_text` WHERE `CreatureId` = 18881;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18881,0,0,'%s shatters into shards.',16,0,100,0,0,0,19115,0,'Sundered Rumbler');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 20498;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18881,20498);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18881,0,0,0,8,0,100,1,34520,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sundered Rumbler - On Spellhit ''Elemental Power Extractor'' - Set Event Phase 1 (No Repeat)'),
(18881,0,1,2,6,1,100,0,0,0,0,0,0,11,34525,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sundered Rumbler - On Death (Event Phase 1) - Cast ''Create Elemental Power'''),
(18881,0,2,3,61,0,100,0,0,0,0,0,0,11,35310,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sundered Rumbler - Linked - Cast ''Summon Sundered Shard'''),
(18881,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sundered Rumbler - Linked - Say Line 0'),

(20498,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,10,0,0,0,0,0,0,0,'Sundered Shard - On Just Summoned - Start Attack (Closest Player)');
