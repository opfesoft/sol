UPDATE `creature_text` SET `Text` = 'No, this can''t be... It says this creature willingly became a servant of the Legion. He transforms into a satyr and receives the Legion''s "blessing."' WHERE `CreatureID` = 17433 AND `GroupID` = 1 AND `ID` = 0;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17433;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17433;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1743300;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17433,0,0,1,20,0,100,0,9567,0,0,0,0,80,1743300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vindicator Aalesia - On Quest ''Know Thine Enemy'' Rewarded - Call Timed Action List'),
(17433,0,1,0,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Vindicator Aalesia - Linked - Store Target 1 (Invoker)'),

(1743300,9,0,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vindicator Aalesia - On Script - Remove NPC Flags'),
(1743300,9,1,0,0,0,100,0,0,0,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vindicator Aalesia - On Script - Set Emote State ''STATE_USESTANDING'''),
(1743300,9,2,0,0,0,100,0,4000,4000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vindicator Aalesia - On Script - Set Emote State ''ONESHOT_NONE'''),
(1743300,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vindicator Aalesia - On Script - Say Line 0'),
(1743300,9,4,0,0,0,100,0,8000,8000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vindicator Aalesia - On Script - Say Line 1'),
(1743300,9,5,0,0,0,100,0,9000,9000,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Vindicator Aalesia - On Script - Say Line 2'),
(1743300,9,6,0,0,0,100,0,5000,5000,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vindicator Aalesia - On Script - Restore NPC Flags');
