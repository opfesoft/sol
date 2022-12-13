UPDATE `creature_addon` SET `auras` = NULL WHERE `guid` IN (29210,32204,32205,32206,32207,32208,32209,32211);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (3797,4050) AND `id` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3797,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,7090,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Protector - OOC - Cast ''Bear Form'''),

(4050,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,7090,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cenarion Caretaker - OOC - Cast ''Bear Form''');
