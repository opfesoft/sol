DELETE FROM `spell_script_names` WHERE `spell_id` IN (55426,55519);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(55426,'spell_q12919_gymers_smash'),
(55519,'spell_q12919_ghoul_crush');

UPDATE `gameobject_template_addon` SET `isLarge` = 1 WHERE `entry` IN (191548,191791,192038);
UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 29872;
UPDATE `creature_template_addon` SET `bytes1` = 1 WHERE `entry` = 29647;
UPDATE `creature_template_addon` SET `auras` = '55461' WHERE `entry` = 29884;
UPDATE `creature` SET `position_x` = 6205.63, `position_y` = -2085.16, `position_z` = 251.833, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 142489;

DELETE FROM `creature_text` WHERE `CreatureId` = 29884;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(29884,1,0,'Taste Gymer''s size 600!',14,0,100,0,0,0,30598,0,'Gymer - Ghoul Crush'),
(29884,1,1,'I will crush you under foot!',14,0,100,0,0,0,30595,0,'Gymer - Ghoul Crush'),
(29884,1,2,'Tiny creatures, I trample you!',14,0,100,0,0,0,30597,0,'Gymer - Ghoul Crush'),
(29884,1,3,'I''ll wipe you off of my boots later!',14,0,100,0,0,0,30596,0,'Gymer - Ghoul Crush'),
(29884,2,0,'STORMS GRANT ME POWER!',14,0,100,0,0,0,30586,0,'Gymer - Storm''s Fury'),
(29884,2,1,'AAARRRRRRGGGGGGHHHHHHH!! SUCH POWER!',14,0,100,0,0,0,30590,0,'Gymer - Storm''s Fury'),
(29884,2,2,'LIGHTNING GUIDE MY FURY!',14,0,100,0,0,0,30587,0,'Gymer - Storm''s Fury'),
(29884,2,3,'THE LIGHTNING COURSES THROUGH ME!',14,0,100,0,0,0,30591,0,'Gymer - Storm''s Fury'),
(29884,2,4,'LET THE STORM''S FURY CONSUME YOU!',14,0,100,0,0,0,30588,0,'Gymer - Storm''s Fury'),
(29884,2,5,'NO ESCAPE FOR THE WICKED!',14,0,100,0,0,0,30589,0,'Gymer - Storm''s Fury'),
(29884,2,6,'IT IS THE WRATH OF THE STORM KING!',14,0,100,0,0,0,30592,0,'Gymer - Storm''s Fury'),
(29884,3,0,'Algar the Chosen is at the Reliquary of Pain to the northeast.\nPrince Navarius is on the other side of the Dead Fields to the east.',42,0,100,0,0,0,30511,0,'Gymer - Intro'),
(29884,4,0,'Farewell, friend. May we meet again under better circumstances. I''ll never forget what you did for me!',12,0,100,0,0,0,30510,0,'Gymer - Outro');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 29872 AND `id` = 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 29884;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(29872,0,2,0,11,0,100,0,0,0,0,0,0,53,0,2987200,1,0,0,2,1,0,0,0,0,0,0,0,0,'Algar the Chosen - On Respawn - Start WP Movement'),

(29884,0,0,0,54,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gymer - On Just Summoned - Set React State ''Passive'''),
(29884,0,1,0,27,0,100,1,0,0,0,1,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gymer - On Passenger Boarded - Say Line 3'),
(29884,0,2,0,28,0,100,1,0,0,0,1,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gymer - On Passenger Removed - Say Line 4 (CONDITION_QUESTSTATE)'),
(29884,0,3,4,60,0,100,0,5000,5000,5000,5000,0,11,55519,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gymer - On Update - Cast ''Ghoul Crush'' (CONDITION_NEAR_UNIT)'),
(29884,0,4,0,61,0,100,0,0,0,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gymer - Linked - Trigger Timed Event 1'),
(29884,0,5,0,59,0,10,0,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gymer - On Timed Event 1 Triggered - Say Line 1'),
(29884,0,6,0,23,0,100,0,55462,1,15000,15000,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gymer - On Has Aura ''Storm''s Fury'' - Say Line 2');

DELETE FROM `waypoints` WHERE `entry` = 2987200;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(2987200,1,6205.63,-2085.16,251.833,'Algar the Chosen'),
(2987200,2,6228.58,-2038.08,253.37,NULL),
(2987200,3,6224.98,-1986.64,254.123,NULL),
(2987200,4,6185.56,-1954.52,252.588,NULL),
(2987200,5,6134.84,-1974.14,255.776,NULL),
(2987200,6,6110.03,-2026.83,255.734,NULL),
(2987200,7,6138.87,-2086.99,255.381,NULL);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 16 AND `SourceEntry` = 29884;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 55519;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 29884;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(16,0,29884,0,0,23,0,4313,0,0,0,0,0,'Vehicle ''Gymer'' - Group 0: Vehicle needs to be in area ''Thrym''s End'''),
(16,0,29884,0,1,23,0,4468,0,0,0,0,0,'Vehicle ''Gymer'' - Group 1: Vehicle needs to be in area ''The Dead Fields'''),
(16,0,29884,0,2,23,0,4489,0,0,0,0,0,'Vehicle ''Gymer'' - Group 2: Vehicle needs to be in area ''Crusader Forward Camp'''),
(16,0,29884,0,3,23,0,4315,0,0,0,0,0,'Vehicle ''Gymer'' - Group 3: Vehicle needs to be in area ''Reliquary of Pain'''),
(16,0,29884,0,4,23,0,4469,0,0,0,0,0,'Vehicle ''Gymer'' - Group 4: Vehicle needs to be in area ''Dargath''s Demise'''),

(13,1,55519,0,0,31,0,3,29887,0,0,0,0,'Spell ''Ghoul Crush'' - Group 0: Implicit target creature ''Vargul Doombringer'''),
(13,1,55519,0,1,31,0,3,29889,0,0,0,0,'Spell ''Ghoul Crush'' - Group 1: Implicit target creature ''Vargul Blighthound'''),
(13,1,55519,0,2,31,0,3,29890,0,0,0,0,'Spell ''Ghoul Crush'' - Group 2: Implicit target creature ''Vargul Deathwaker'''),
(13,1,55519,0,3,31,0,3,29891,0,0,0,0,'Spell ''Ghoul Crush'' - Group 3: Implicit target creature ''Vargul Runelord'''),
(13,1,55519,0,4,31,0,3,29892,0,0,0,0,'Spell ''Ghoul Crush'' - Group 4: Implicit target creature ''Vargul Slayer'''),
(13,1,55519,0,5,31,0,3,29893,0,0,0,0,'Spell ''Ghoul Crush'' - Group 5: Implicit target creature ''Banshee Soulclaimer'''),
(13,1,55519,0,6,31,0,3,29894,0,0,0,0,'Spell ''Ghoul Crush'' - Group 6: Implicit target creature ''Vargul Plaguetalon'''),
(13,1,55519,0,7,31,0,3,29897,0,0,0,0,'Spell ''Ghoul Crush'' - Group 7: Implicit target creature ''Reanimated Corpse'''),
(13,1,55519,0,8,31,0,3,29934,0,0,0,0,'Spell ''Ghoul Crush'' - Group 8: Implicit target creature ''Acolyte of Agony'''),

(22,3,29884,0,0,47,0,12919,2,0,0,0,0,'Creature ''Gymer'' - Group 0: Execute SAI ID 2 if quest ''The Storm King''s Vengeance'' is completed'),

(22,4,29884,0,0,29,1,29887,8,0,0,0,0,'Creature ''Gymer'' - Group 0: Execute SAI ID 3 if near creature ''Vargul Doombringer'''),
(22,4,29884,0,1,29,1,29889,8,0,0,0,0,'Creature ''Gymer'' - Group 1: Execute SAI ID 3 if near creature ''Vargul Blighthound'''),
(22,4,29884,0,2,29,1,29890,8,0,0,0,0,'Creature ''Gymer'' - Group 2: Execute SAI ID 3 if near creature ''Vargul Deathwaker'''),
(22,4,29884,0,3,29,1,29891,8,0,0,0,0,'Creature ''Gymer'' - Group 3: Execute SAI ID 3 if near creature ''Vargul Runelord'''),
(22,4,29884,0,4,29,1,29892,8,0,0,0,0,'Creature ''Gymer'' - Group 4: Execute SAI ID 3 if near creature ''Vargul Slayer'''),
(22,4,29884,0,5,29,1,29893,8,0,0,0,0,'Creature ''Gymer'' - Group 5: Execute SAI ID 3 if near creature ''Banshee Soulclaimer'''),
(22,4,29884,0,6,29,1,29894,8,0,0,0,0,'Creature ''Gymer'' - Group 6: Execute SAI ID 3 if near creature ''Vargul Plaguetalon'''),
(22,4,29884,0,7,29,1,29897,8,0,0,0,0,'Creature ''Gymer'' - Group 7: Execute SAI ID 3 if near creature ''Reanimated Corpse'''),
(22,4,29884,0,8,29,1,29934,8,0,0,0,0,'Creature ''Gymer'' - Group 8: Execute SAI ID 3 if near creature ''Acolyte of Agony''');
