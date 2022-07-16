UPDATE `creature_text` SET `Text` = 'Don''t worry, Old Blanchy, we''ll get you something to eat soon...' WHERE `CreatureID` = 238 AND `GroupID` = 0 AND `ID` = 0;
UPDATE `creature_text` SET `Text` = 'I never thought the day would come that I''d leave my homeland of Westfall...' WHERE `CreatureID` = 238 AND `GroupID` = 0 AND `ID` = 1;
UPDATE `creature_text` SET `Text` = 'Can''t believe the forsaken wagon broke down. Ain''t no luck to be had in this land...' WHERE `CreatureID` = 237 AND `GroupID` = 0 AND `ID` = 0;
UPDATE `creature_text` SET `Text` = 'We''ll be out of here just as soon as I get this wagon fixed...' WHERE `CreatureID` = 237 AND `GroupID` = 0 AND `ID` = 1;
UPDATE `broadcast_text` SET `FemaleText` = 'Don''t worry, Old Blanchy, we''ll get you something to eat soon...' WHERE `ID` = 54;
UPDATE `broadcast_text` SET `FemaleText` = 'I never thought the day would come that I''d leave my homeland of Westfall...' WHERE `ID` = 55;
UPDATE `broadcast_text` SET `MaleText` = 'Can''t believe the forsaken wagon broke down. Ain''t no luck to be had in this land...' WHERE `ID` = 56;
UPDATE `broadcast_text` SET `MaleText` = 'We''ll be out of here just as soon as I get this wagon fixed...' WHERE `ID` = 57;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 238;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 238;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(238,0,0,0,1,0,100,0,180000,360000,180000,360000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Verna Furlbrow - OOC - Say Line 0');