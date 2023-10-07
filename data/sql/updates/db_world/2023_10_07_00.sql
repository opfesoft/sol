UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 256 | 512 | 33554432 WHERE `entry` IN (5691,5692);

UPDATE `creature_text` SET `Emote` = 25 WHERE `CreatureID` = 5693 AND `GroupID` = 0 AND `ID` = 0;
UPDATE `creature_text` SET `Emote` = 25 WHERE `CreatureID` = 5693 AND `GroupID` = 2 AND `ID` = 0;
UPDATE `creature_text` SET `Emote` = 11 WHERE `CreatureID` = 5693 AND `GroupID` = 4 AND `ID` = 0;

UPDATE `creature` SET `orientation` = 4.59053 WHERE `guid` = 41833;

DELETE FROM `quest_details` WHERE `ID` = 1476;
INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `VerifiedBuild`)
VALUES
(1476,1,0,0,0,0,0,0,0,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 5693;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 5693;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 569300;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5693,0,0,0,19,0,100,0,1476,0,0,0,0,80,569300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Quest ''Hearts of the Pure'' Accepted - Call Timed Action List'),

(569300,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Set Active On'),
(569300,9,1,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Remove NPC Flags'),
(569300,9,2,0,0,0,100,0,2000,2000,0,0,0,12,5691,3,35000,0,0,0,8,0,0,0,0,1781.16,61.13,-61.4065,4.869,'Godrick Farsan - On Script - Summon Creature ''Dalin Forgewright Projection'''),
(569300,9,3,0,0,0,100,0,0,0,0,0,0,12,5692,3,35000,0,0,0,8,0,0,0,0,1785.77,60.27,-61.4065,3.961,'Godrick Farsan - On Script - Summon Creature ''Comar Villard Projection'''),
(569300,9,4,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,19,5691,10,0,0,0,0,0,0,'Godrick Farsan - On Script - Set Orientation (Dalin Forgewright Projection)'),
(569300,9,5,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Say Line 0'),
(569300,9,6,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Say Line 1'),
(569300,9,7,0,0,0,100,0,8000,8000,0,0,0,66,0,0,0,0,0,0,19,5692,5,0,0,0,0,0,0,'Godrick Farsan - On Script - Set Orientation (Comar Villard Projection)'),
(569300,9,8,0,0,0,100,0,1000,1000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Say Line 2'),
(569300,9,9,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Say Line 3'),
(569300,9,10,0,0,0,100,0,8000,8000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Reset Orientation'),
(569300,9,11,0,0,0,100,0,1000,1000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Say Line 4'),
(569300,9,12,0,0,0,100,0,2000,2000,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Restore NPC Flags'),
(569300,9,13,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Godrick Farsan - On Script - Set Active Off');
