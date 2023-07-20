DELETE FROM `creature_text` WHERE `CreatureId` = 23335;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(23335,0,0,'Wow!  Thanks for bringing it all the way back here.  You didn''t have to do that.',12,0,100,4,0,0,21370,0,'Skyguard Khatie'),
(23335,0,1,'You''re a peach!  I''ll make sure that the ray is properly cared for.',12,0,100,1,0,0,21371,0,'Skyguard Khatie'),
(23335,0,2,'Thank you soooooo much for bringing it back.  I think you''re going to be my best wrangler ever!',12,0,100,1,0,0,21372,0,'Skyguard Khatie'),
(23335,0,3,'Oh, isn''t she a beauty!  Can''t wait to get her properly trained and back up in the air!',12,0,100,1,0,0,21373,0,'Skyguard Khatie'),
(23335,0,4,'Isn''t he so cute?!  Thanks for bringing him right to me!!!',12,0,100,1,0,0,21374,0,'Skyguard Khatie'),
(23335,0,5,'We never have enough of these rays for the Skyguard.  You''re keeping us afloat... literally!',12,0,100,1,0,0,21375,0,'Skyguard Khatie'),
(23335,0,6,'Nice job!  She looks like she''s in fine condition.  Thank you!',12,0,100,1,0,0,21376,0,'Skyguard Khatie'),
(23335,0,7,'Woo hoo!  More rays for training!',12,0,100,1,0,0,21377,0,'Skyguard Khatie');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23335;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23335,0,0,1,1,0,100,0,10000,10000,10000,10000,0,1,0,0,1,0,0,0,19,23343,15,0,0,0,0,0,0,'Skyguard Khatie - OOC - Say Line 0'),
(23335,0,1,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,23343,15,0,0,0,0,0,0,'Skyguard Khatie - Linked - Force Despawn (Wrangled Aether Ray)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 23335 AND `SourceId` = 0;
