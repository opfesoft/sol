DELETE FROM `creature_text` WHERE `CreatureId` IN (18445,20812,18369);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18445,0,0,'Thanks, $r! I''m sure my dad will reward you greatly! Bye!',12,0,100,0,0,0,15297,0,'Corki - Quest ''HELP!'''),
(20812,0,0,'This is the last time I get caught! I promise! Bye!',12,0,100,0,0,0,15308,0,'Corki - Quest ''Corki''s Gone Missing Again!'''),
(18369,0,0,'Thanks, $n! How many times have you saved my life now? Three? That makes us blood in my book!',12,0,100,0,0,0,15424,0,'Corki - Quest ''Cho''war the Pillager (Alliance)''');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (18445,18369,20812);
UPDATE `gameobject_template` SET `Data2` = 300000, `AIName` = 'SmartGameObjectAI', `ScriptName` = '' WHERE `entry` IN (182349,182350,182521);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18445,20812,18369);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (182349,182350,182521);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1844500,2081200,1836900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18445,0,0,0,38,0,100,0,1,1,0,0,0,80,1844500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corki - On Data Set 1 1 - Call Timed Action List'),

(1844500,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Corki - On Script - Say Line 0'),
(1844500,9,1,0,0,0,100,0,0,0,0,0,0,33,18369,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Corki - On Script - Kill Credit ''Corki'''),
(1844500,9,2,0,0,0,100,0,4000,4000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-2530.37,6253.86,18.8081,0,'Corki - On Script - Move To Point 0'),
(1844500,9,3,0,0,0,100,0,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corki - On Script - Force Despawn'),

(20812,0,0,0,38,0,100,0,1,1,0,0,0,80,2081200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corki - On Data Set 1 1 - Call Timed Action List'),

(2081200,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Corki - On Script - Say Line 0'),
(2081200,9,1,0,0,0,100,0,0,0,0,0,0,33,20812,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Corki - On Script - Kill Credit ''Corki'''),
(2081200,9,2,0,0,0,100,0,4000,4000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-1001.02,8113.37,-95.849,0,'Corki - On Script - Move To Point 0'),
(2081200,9,3,0,0,0,100,0,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corki - On Script - Force Despawn'),

(18369,0,0,0,38,0,100,0,1,1,0,0,0,80,1836900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corki - On Data Set 1 1 - Call Timed Action List'),

(1836900,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Corki - On Script - Say Line 0'),
(1836900,9,1,0,0,0,100,0,0,0,0,0,0,33,18444,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Corki - On Script - Kill Credit ''Corki Event Controller'''),
(1836900,9,2,0,0,0,100,0,4000,4000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-896.082,8687.35,170.455,0,'Corki - On Script - Move To Point 0'),
(1836900,9,3,0,0,0,100,0,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corki - On Script - Force Despawn'),

(182349,1,0,1,70,0,100,0,2,0,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Corkis Prison - On GO State Changed ''GO_ACTIVATED'' - Store Target 1'),
(182349,1,1,2,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,18445,0,0,0,0,0,0,0,'Corkis Prison - Linked - Send Target 1 (Corki)'),
(182349,1,2,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,18445,0,0,0,0,0,0,0,'Corkis Prison - Linked - Set Data 1 1 (Corki)'),

(182350,1,0,1,70,0,100,0,2,0,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Corkis Prison - On GO State Changed ''GO_ACTIVATED'' - Store Target 1'),
(182350,1,1,2,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,20812,0,0,0,0,0,0,0,'Corkis Prison - Linked - Send Target 1 (Corki)'),
(182350,1,2,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,20812,0,0,0,0,0,0,0,'Corkis Prison - Linked - Set Data 1 1 (Corki)'),

(182521,1,0,1,70,0,100,0,2,0,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Corkis Prison - On GO State Changed ''GO_ACTIVATED'' - Store Target 1'),
(182521,1,1,2,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,18369,0,0,0,0,0,0,0,'Corkis Prison - Linked - Send Target 1 (Corki)'),
(182521,1,2,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,18369,0,0,0,0,0,0,0,'Corkis Prison - Linked - Set Data 1 1 (Corki)');
