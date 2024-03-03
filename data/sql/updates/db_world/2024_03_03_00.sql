DELETE FROM `creature_template_addon` WHERE `entry` = 29393;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(29393,0,0,0,1,417,0,NULL,NULL);

UPDATE `creature` SET `unit_flags` = 256 WHERE `guid` IN (74518,74519,74520);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-74518,-74519,-74520,24023,24014,29393,29394);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2402300,2401400,2939400);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(24023,0,0,0,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - On Respawn - Disable Event Phase Reset'),
(24023,0,1,2,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - On Reset - Set Event Phase 1'),
(24023,0,2,3,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,74518,24014,0,0,0,0,0,0,'Queen Angerboda - Linked - Respawn Target (Necrolord)'),
(24023,0,3,4,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,74519,24014,0,0,0,0,0,0,'Queen Angerboda - Linked - Respawn Target (Necrolord)'),
(24023,0,4,5,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,74520,24014,0,0,0,0,0,0,'Queen Angerboda - Linked - Respawn Target (Necrolord)'),
(24023,0,5,6,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,74521,29393,0,0,0,0,0,0,'Queen Angerboda - Linked - Respawn Target (King Ymiron)'),
(24023,0,6,0,61,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - Linked - Add ''UNIT_FLAG_IMMUNE_TO_PC'''),
(24023,0,7,0,1,1,100,0,1000,1000,1000,1000,0,11,44473,4096,0,0,0,0,19,29393,10,0,0,0,0,0,0,'Queen Angerboda - OOC (Event Phase 1) - Cast ''Queen Angerboda: Soul Beam'' (King Ymiron)'),
(24023,0,8,0,1,1,100,0,5000,5000,5000,5000,0,80,2402300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - OOC (Event Phase 1) - Call Timed Action List (CONDITION_NEAR_UNIT)'),
(24023,0,9,0,1,1,100,0,0,45000,45000,90000,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - OOC (Event Phase 1) - Say Line 2'),
(24023,0,10,0,4,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - On Aggro - Say Line 1'),
(24023,0,11,0,6,0,100,0,0,0,0,0,0,12,29394,1,60000,0,0,0,8,0,0,0,0,2850.26,-3872.01,248.613,1.41372,'Queen Angerboda - On Death - Summon ''The Lich King'' (CONDITION_QUESTSTATE)'),
(24023,0,12,0,1,2,100,0,60000,60000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - OOC (Event Phase 2) - Force Despawn'),
(24023,0,13,0,0,0,100,0,500,1000,3500,4000,0,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Queen Angerboda - IC - Cast ''Fireball'''),
(24023,0,14,0,0,0,100,0,7000,11000,32000,36000,0,11,43560,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Queen Angerboda - IC - Cast ''Anger of Gjalerbron'''),
(24023,0,15,0,9,0,100,0,0,8,15000,25000,0,11,11831,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Queen Angerboda - Within 0-8 Range - Cast ''Frost Nova'''),

(2402300,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - On Script - Set Active On'),
(2402300,9,1,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - On Script - Set Event Phase 2'),
(2402300,9,2,0,0,0,100,0,0,0,0,0,0,92,0,44473,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - On Script - Interupt Spell ''Queen Angerboda: Soul Beam'' (King Ymiron)'''),
(2402300,9,3,0,0,0,100,0,0,0,0,0,0,11,42808,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - On Script - Cast ''Queen Angerboda''s On Reaction 2 Beam'''),
(2402300,9,4,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - On Script - Say Line 0'),
(2402300,9,5,0,0,0,100,0,5000,5000,0,0,0,45,3,3,0,0,0,0,10,74518,24014,0,0,0,0,0,0,'Queen Angerboda - On Script - Set Data 3 3 (Necrolord)'),
(2402300,9,6,0,0,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,10,74519,24014,0,0,0,0,0,0,'Queen Angerboda - On Script - Set Data 3 3 (Necrolord)'),
(2402300,9,7,0,0,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,10,74520,24014,0,0,0,0,0,0,'Queen Angerboda - On Script - Set Data 3 3 (Necrolord)'),
(2402300,9,8,0,0,0,100,0,2000,2000,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Queen Angerboda - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),

(24014,0,0,0,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Necrolord - On Respawn - Disable Event Phase Reset'),
(24014,0,1,0,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Necrolord - On Reset - Set Event Phase 1'),
(24014,0,2,0,4,0,50,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Necrolord - On Aggro - Say Line 0'),
(24014,0,3,0,0,0,100,0,0,0,3000,4000,0,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Necrolord - IC - Cast ''Shadow Bolt'''),
(24014,0,4,0,0,0,100,0,3000,7000,10000,20000,0,11,17173,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Necrolord - IC - Cast ''Drain Life'''),
(24014,0,5,0,0,0,100,0,5000,8000,25000,30000,0,11,18267,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Necrolord - IC - Cast ''Curse of Weakness'''),
(24014,0,6,0,38,0,100,0,2,2,0,0,0,11,43151,4096,0,0,0,0,7,0,0,0,0,0,0,0,0,'Necrolord - On Data Set 2 2 - Cast ''Necrolord: Purple Beam'' (Invoker)'),
(24014,0,7,0,1,1,100,0,1000,1000,1000,1000,0,11,44473,4096,0,0,0,0,19,29393,10,0,0,0,0,0,0,'Necrolord - OOC (Event Phase 1) - Cast ''Queen Angerboda: Soul Beam'' (King Ymiron)'),
(24014,0,8,0,38,0,100,0,3,3,0,0,0,80,2401400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Necrolord - On Data Set 3 3 - Call Timed Action List'),

(2401400,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Necrolord - On Script - Set Event Phase 2'),
(2401400,9,1,0,0,0,100,0,0,0,0,0,0,92,0,44473,0,0,0,0,1,0,0,0,0,0,0,0,0,'Necrolord - On Script - Interrupt Spell ''Queen Angerboda: Soul Beam'''),
(2401400,9,2,0,0,0,100,0,0,0,0,0,0,11,42809,0,0,0,0,0,19,24023,0,0,0,0,0,0,0,'Necrolord - On Script - Cast ''Queen Angerboda Soul Absorption'' (Queen Angerboda)'),
(2401400,9,3,0,0,0,100,0,1000,1000,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Necrolord - On Script - Die'),

(29393,0,0,1,38,0,100,0,1,1,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'King Ymiron - On Data Set 1 1 - Cast ''Ethereal Teleport'''),
(29393,0,1,0,61,0,100,0,0,0,0,0,0,41,1500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'King Ymiron - Linked - Force Despawn'),

(29394,0,0,0,54,0,100,0,0,0,0,0,0,80,2939400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Lich King - On Just Summoned - Call Timed Action List'),

(2939400,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Lich King - On Script - Set Active On'),
(2939400,9,1,0,0,0,100,0,0,0,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Lich King - On Script - Cast ''Ethereal Teleport'''),
(2939400,9,2,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Lich King - On Script - Say Line 0'),
(2939400,9,3,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,29393,0,0,0,0,0,0,0,'The Lich King - On Script - Set Orientation (King Ymiron)'),
(2939400,9,4,0,0,0,100,0,5000,5000,0,0,0,11,42811,0,0,0,0,0,19,29393,0,0,0,0,0,0,0,'The Lich King - On Script - Cast ''Teleport Other'''),
(2939400,9,5,0,0,0,100,0,15000,15000,0,0,0,45,1,1,0,0,0,0,19,29393,0,0,0,0,0,0,0,'The Lich King - On Script - Set Data 1 1 (King Ymiron)'),
(2939400,9,6,0,0,0,100,0,0,0,0,0,0,92,0,42811,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Lich King - On Script - Interupt Spell ''Teleport Other'''),
(2939400,9,7,0,0,0,100,0,1000,1000,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Lich King - On Script - Cast ''Ethereal Teleport'''),
(2939400,9,8,0,0,0,100,0,1500,1500,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Lich King - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 24023 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,9,24023,0,0,29,1,0,40,0,0,0,0,'Creature ''Queen Angerboda'' - Group 0: Execute SAI ID 8 if nearby player'),

(22,12,24023,0,0,47,0,11453,10,0,0,0,0,'Creature ''Queen Angerboda'' - Group 0: Execute SAI ID 11 if quest ''The Slumbering King (Horde)'' is in progress or completed'),
(22,12,24023,0,1,47,0,11452,10,0,0,0,0,'Creature ''Queen Angerboda'' - Group 1: Execute SAI ID 11 if quest ''The Slumbering King (Alliance)'' is in progress or completed');
