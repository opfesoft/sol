UPDATE `creature` SET `spawntimesecs` = 300 WHERE `guid` = 86754;
UPDATE `creature_addon` SET `addonFlags` = 1 WHERE `guid` = 86754;
UPDATE `creature_model_info` SET `BoundingRadius` = 3.05556, `CombatReach` = 10 WHERE `DisplayID` = 20952;

DELETE FROM `creature_text` WHERE `CreatureId` = 22357;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(22357,0,0,'What do you hope to accomplish from this, insect?',14,0,100,0,0,0,21556,0,'Reth''hedron the Subduer'),
(22357,0,1,'I WILL CRUSH YOU LIKE A GNAT!',14,0,100,0,0,0,21557,0,'Reth''hedron the Subduer'),
(22357,0,2,'You cannot stop us!',14,0,100,0,0,0,21558,0,'Reth''hedron the Subduer'),
(22357,0,3,'You are making me angry, mortal!',14,0,100,0,0,0,21559,0,'Reth''hedron the Subduer'),
(22357,0,4,'I will break you in two! Relent, fool!',14,0,100,0,0,0,21560,0,'Reth''hedron the Subduer'),
(22357,0,5,'Flee now while you still have your life!',14,0,100,0,0,0,21561,0,'Reth''hedron the Subduer'),
(22357,1,0,'You will regret this, mortal! Reth''hedron will return... I will have my vengeance!',14,0,100,53,0,0,21606,0,'Reth''hedron the Subduer');

UPDATE `spell_dbc` SET `Effect1` = 28, `EffectImplicitTargetA1` = 25, `EffectMiscValue1` = 23416, `EffectMiscValueB1` = 64 WHERE `Id` = 41288;
UPDATE `spell_script_names` SET `ScriptName` = 'spell_q11010_q11102_q11023_q11008_q11090_check_fly_mount' WHERE `spell_id` IN (39844,40160);

DELETE FROM `spell_script_names` WHERE `spell_id` = 41291;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(41291,'spell_q11010_q11102_q11023_q11008_q11090_check_fly_mount');

UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4, `AIName` = 'SmartAI', `flags_extra` = 128 WHERE `entry` = 23416;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (22357,23416);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2235700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22357,0,0,1,11,0,100,0,0,0,0,0,0,117,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Respawn - Set Evade On'),
(22357,0,1,2,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Set Event Phase Reset Off'),
(22357,0,2,3,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Set Event Phase 1'),
(22357,0,3,4,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Set Invincibility HP 0'),
(22357,0,4,0,61,0,100,0,0,0,0,0,0,102,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Set Health Regeneration On'),
(22357,0,5,6,23,1,100,0,41291,1,1000,1000,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Has Aura ''Soul Cannon'' (Event Phase 1) - Set Evade Off'),
(22357,0,6,7,61,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Set Invincibility HP 1'),
(22357,0,7,0,61,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Set Event Phase 2'),
(22357,0,8,9,23,2,100,0,41291,0,1000,1000,0,117,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Has No Aura ''Soul Cannon'' (Event Phase 2) - Set Evade On'),
(22357,0,9,10,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Set Invincibility HP 0'),
(22357,0,10,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Set Event Phase 1'),
(22357,0,11,0,0,2,50,0,15000,20000,15000,20000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - IC (Event Phase 2) - Say Line 0'),
(22357,0,12,0,2,2,100,0,0,10,0,0,0,80,2235700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Health Between 0-10% (Event Phase 2) - Call Timed Action List'),
(22357,0,13,0,0,0,100,0,3000,5000,3000,5000,0,11,41280,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - IC - Cast ''Shadow Bolt'''),
(22357,0,14,0,0,0,100,0,12000,16000,12000,16000,0,11,41281,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - IC - Cast ''Cripple'''),
(22357,0,15,0,0,0,100,0,2000,2000,2000,2000,0,11,41288,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - IC - Cast ''Reth''hedron Knockdown: The Bolt Trigger'''),
(22357,0,16,17,17,0,100,0,0,0,0,0,0,11,41283,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Summoned Unit - Cast ''Abyssal Toss'''),
(22357,0,17,0,61,0,100,0,0,0,0,0,0,4,10667,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Play Sound 10667'),
(22357,0,18,19,34,0,100,0,8,1,0,0,0,11,41340,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Point 1 Reached - Cast ''Reth''hedron Quest Complete'''),
(22357,0,19,20,61,0,100,0,0,0,0,0,0,11,41339,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Cast ''Cosmetic - Legion Ring Purple Lightning (Self)'''),
(22357,0,20,0,61,0,100,0,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - Linked - Force Despawn'),

(2235700,9,0,0,0,0,100,0,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Script - Set Event Phase 3'),
(2235700,9,1,0,0,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Script - Set Invincibility HP 1'),
(2235700,9,2,0,0,0,100,0,0,0,0,0,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Script - Set Evade Off'),
(2235700,9,3,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Script - Set React State ''Passive'''),
(2235700,9,4,0,0,0,100,0,0,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Script - Stop Combat'),
(2235700,9,5,0,0,0,100,0,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Script - Set Health Regeneration Off'),
(2235700,9,6,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Script - Set Active On'),
(2235700,9,7,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron the Subduer - On Script - Say Line 1'),
(2235700,9,8,0,0,0,100,0,3000,3000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,-1557.93,9834.34,200.949,0,'Reth''hedron the Subduer - On Script - Move To Point 1'),

(23416,0,0,0,11,0,100,0,0,0,0,0,0,41,30000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron''s Target - On Respawn - Force Despawn'),
(23416,0,1,0,8,0,100,0,41283,0,0,0,0,11,41284,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Reth''hedron''s Target - On Spell Hit ''Abyssal Toss'' - Cast ''Abyssal Impact''');
