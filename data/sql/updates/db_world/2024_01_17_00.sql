UPDATE `creature_text` SET `BroadcastTextId` = 9463 WHERE `CreatureID` = 14383 AND `GroupID` = 0 AND `ID` = 0;
UPDATE `creature_text` SET `BroadcastTextId` = 9464 WHERE `CreatureID` = 14383 AND `GroupID` = 1 AND `ID` = 0;
UPDATE `creature_text` SET `BroadcastTextId` = 9465 WHERE `CreatureID` = 14383 AND `GroupID` = 2 AND `ID` = 0;
UPDATE `creature_text` SET `BroadcastTextId` = 9475 WHERE `CreatureID` = 14383 AND `GroupID` = 3 AND `ID` = 0;

DELETE FROM `creature_text` WHERE `CreatureId` IN (11489,14566);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(11489,0,0,'You do not belong here! Ancients, rise up against these intruders!',14,0,100,0,0,0,11727,0,'Tendris Warpwood'),
(14566,0,0,'%s breaks free of its spectral bonds with a tremendous crash of thunder!',16,0,100,0,0,0,9763,0,'Ancient Equine Spirit');

UPDATE `smart_scripts` SET `link` = 4 WHERE `source_type` = 0 AND `entryorguid` = 14566 AND `id` = 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 11489 AND `id` = 4;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14566 AND `id` = 4;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14566,0,4,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Ancient Equine Spirit - Linked - Say 0');
