UPDATE `quest_template` SET `RewardSpell` = 0 WHERE `ID` IN (12260,12274);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27350;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27350,0,0,0,62,0,100,0,9501,0,0,0,0,85,48762,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Agent Skully - On Gossip 0 Selected - Invoker Cast ''A Fall from Grace: Scarlet Raven Priest Image - Master'' (Invoker)'),
(27350,0,1,0,20,0,100,0,12260,0,0,0,0,28,48648,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Agent Skully - On Quest ''The Perfect Dissemblance'' Rewarded - Remove Aura ''Banshee''s Magic Mirror'' (Invoker)'),
(27350,0,2,3,20,0,100,0,12274,0,0,0,0,28,48761,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Agent Skully - On Quest ''A Fall From Grace'' Rewarded - Remove Aura ''Scarlet Raven Priest Image'' (Invoker)'),
(27350,0,3,0,61,0,100,0,0,0,0,0,0,28,48763,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Agent Skully - Linked - Remove Aura ''Scarlet Raven Priest Image'' (Invoker)');
