UPDATE `creature_template_addon` SET `isLarge` = 1 WHERE `entry` = 20736;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (22422,19963);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (185193,185195,185196,185197,185198);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2242200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22422,0,0,1,77,0,100,0,1,1,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Counter 1 Value 1 - Set Active On'),
(22422,0,1,0,61,0,100,0,0,0,0,0,0,67,1,120000,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - Linked - Create Timed Event 1'),
(22422,0,2,3,59,0,100,0,1,0,0,0,0,63,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Timed Event 1 Triggered - Reset Counter 1'),
(22422,0,3,0,61,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - Linked - Set Active Off'),
(22422,0,4,0,77,0,100,0,1,5,60000,60000,0,80,2242200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Counter 1 Value 5 - Call Timed Action List'),

(2242200,9,0,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Remove Timed Event 1'),
(2242200,9,1,0,0,0,100,0,2000,2000,0,0,0,86,40227,0,10,73126,20736,1,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Cross Cast ''Green Beam'' (Blade''s Edge - Legion - Invis Bunny)'),
(2242200,9,2,0,0,0,100,0,5000,5000,0,0,0,86,40227,0,10,73127,20736,1,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Cross Cast ''Green Beam'' (Blade''s Edge - Legion - Invis Bunny)'),
(2242200,9,3,0,0,0,100,0,5000,5000,0,0,0,86,40227,0,10,73129,20736,1,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Cross Cast ''Green Beam'' (Blade''s Edge - Legion - Invis Bunny)'),
(2242200,9,4,0,0,0,100,0,5000,5000,0,0,0,86,40227,0,10,73130,20736,1,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Cross Cast ''Green Beam'' (Blade''s Edge - Legion - Invis Bunny)'),
(2242200,9,5,0,0,0,100,0,5000,5000,0,0,0,86,40227,0,10,73133,20736,1,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Cross Cast ''Green Beam'' (Blade''s Edge - Legion - Invis Bunny)'),
(2242200,9,6,0,0,0,100,0,1000,1000,0,0,0,12,19963,4,120000,0,0,0,8,0,0,0,0,2870.55,4814.18,283.66,0.34,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Summon Creature ''Doomcryer'' (CONDITION_NEAR_CREATURE)'),
(2242200,9,7,0,0,0,100,0,30000,30000,0,0,0,63,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Reset Counter 1'),
(2242200,9,8,0,0,0,100,0,0,0,0,0,0,92,0,0,0,0,0,0,11,20736,100,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Interrupt Cast ''Green Beam'' (Blade''s Edge - Legion - Invis Bunny)'),
(2242200,9,9,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blade''s Edge - Legion - Anger Camp - Invis Bunny - On Script - Set Active Off'),

(185193,1,0,0,64,0,100,0,1,0,0,0,0,63,1,1,0,0,0,0,10,78759,22422,1,0,0,0,0,0,'Legion Obelisk - On Gossip Hello - Increase Counter 1 (Blade''s Edge - Legion - Anger Camp - Invis Bunny)'),

(185195,1,0,0,64,0,100,0,1,0,0,0,0,63,1,1,0,0,0,0,10,78759,22422,1,0,0,0,0,0,'Legion Obelisk - On Gossip Hello - Increase Counter 1 (Blade''s Edge - Legion - Anger Camp - Invis Bunny)'),

(185196,1,0,0,64,0,100,0,1,0,0,0,0,63,1,1,0,0,0,0,10,78759,22422,1,0,0,0,0,0,'Legion Obelisk - On Gossip Hello - Increase Counter 1 (Blade''s Edge - Legion - Anger Camp - Invis Bunny)'),

(185197,1,0,0,64,0,100,0,1,0,0,0,0,63,1,1,0,0,0,0,10,78759,22422,1,0,0,0,0,0,'Legion Obelisk - On Gossip Hello - Increase Counter 1 (Blade''s Edge - Legion - Anger Camp - Invis Bunny)'),

(185198,1,0,0,64,0,100,0,1,0,0,0,0,63,1,1,0,0,0,0,10,78759,22422,1,0,0,0,0,0,'Legion Obelisk - On Gossip Hello - Increase Counter 1 (Blade''s Edge - Legion - Anger Camp - Invis Bunny)'),

(19963,0,0,1,60,0,100,257,0,0,0,0,0,11,35502,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomcryer - On Update - Cast ''Legion Teleport Target'''),
(19963,0,1,2,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomcryer - Linked - Set Active On'),
(19963,0,2,3,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomcryer - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(19963,0,3,0,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomcryer - Linked - Set Run Off'),
(19963,0,4,5,60,0,100,257,4500,4500,0,0,0,28,35502,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomcryer - On Update - Remove Aura ''Legion Teleport Target'''),
(19963,0,5,6,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomcryer - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(19963,0,6,7,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,2879.38,4817.19,282.752,0,'Doomcryer - Linked - Move To Point 1'),
(19963,0,7,0,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,2879.38,4817.19,282.752,0.326421,'Doomcryer - Linked - Set Home Position'),
(19963,0,8,0,0,0,100,0,13000,13000,20000,30000,0,11,34017,0,0,0,0,0,5,30,0,0,0,0,0,0,0,'Doomcryer - IC - Cast ''Rain of Chaos'''),
(19963,0,9,0,0,0,100,0,3000,5000,8000,11000,0,11,37629,0,0,0,0,0,5,30,0,0,0,0,0,0,0,'Doomcryer - IC - Cast ''Melt Flesh'''),
(19963,0,10,0,0,0,100,0,9000,9000,40000,40000,0,11,36541,32,0,0,0,0,5,30,0,0,0,0,0,0,0,'Doomcryer - IC - Cast ''Curse of Burning Shadows''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 2242200 AND `SourceId` = 9;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,7,2242200,9,0,29,1,19963,50,0,1,0,0,'Creature ''Blade''s Edge - Legion - Anger Camp - Invis Bunny'' - Group 0: Execute SAI ID 6 if not near creature ''Doomcryer''');
