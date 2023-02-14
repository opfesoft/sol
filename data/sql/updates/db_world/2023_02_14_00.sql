UPDATE `creature_template_addon` SET `auras` = NULL WHERE `entry` IN (3739,7726,8914,11672,13142,15385,16029,20089,28476,28951,29450,30680,30681,30682,34925);
UPDATE `creature_template_addon` SET `auras` = '42648' WHERE `entry` IN (19027,19030);
UPDATE `creature_template_addon` SET `auras` = '64101' WHERE `entry` = 33243;
UPDATE `creature` SET `modelid` = 0 WHERE `id` = 7726;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (29450);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (7726,29450,30680,30681,30682);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16029 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7726,0,0,0,4,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Naturalist - On Aggro - Set Event Phase 1'),
(7726,0,1,0,0,1,100,0,0,0,3400,4700,0,11,9739,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Naturalist - IC (Event Phase 1) - Cast ''Wrath'''),
(7726,0,2,3,2,0,100,1,0,50,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Naturalist - Between 0-50% Health (No Repeat) - Set Event Phase 2'),
(7726,0,3,4,61,0,100,0,0,0,0,0,0,206,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Naturalist - Linked - Set Caster Combat Distance'),
(7726,0,4,0,61,0,100,0,0,0,0,0,0,11,19030,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Naturalist - Linked - Cast ''Bear Form'''),
(7726,0,5,0,0,2,100,0,5000,7000,11000,13000,0,11,12161,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Naturalist - IC (Event Phase 2) - Cast ''Maul'''),
(7726,0,6,0,0,2,100,0,8000,10000,24000,28000,0,11,15727,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Naturalist - IC (Event Phase 2) - Cast ''Demoralizing Roar'''),
(7726,0,7,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Naturalist - Between 0-15% Health - Flee For Assist'),

(16029,0,2,0,25,0,100,0,0,0,0,0,0,11,28362,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sludge Belcher - On Reset - Cast ''Disease Cloud'''),

(29450,0,0,0,1,0,100,0,0,0,1000,1000,0,11,54512,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vargul Runelord - OOC - Cast ''Plague Shield'''),
(29450,0,1,0,0,0,100,0,2000,4000,7000,10000,0,11,56036,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vargul Runelord - IC - Cast ''Rune of Destruction'''),

(30680,0,0,0,1,0,100,0,0,0,1000,1000,0,11,57740,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onyx Brood General - OOC - Cast ''Devotion Aura'''),
(30680,0,1,0,0,0,100,0,5000,6000,7000,8000,0,11,13737,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Onyx Brood General - IC - Cast ''Mortal Strike'''),
(30680,0,2,0,0,0,100,0,15000,15000,40000,40000,0,11,57733,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Onyx Brood General - IC - Cast ''Draconic Rage'''),

(30681,0,0,0,0,0,100,0,5000,6000,7000,8000,0,11,39529,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Onyx Blaze Mistress - IC - Cast ''Flame Shock'''),
(30681,0,1,0,0,0,100,0,15000,15000,20000,20000,0,11,57757,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Onyx Blaze Mistress - IC - Cast ''Rain of Fire'''),

(30682,0,0,0,0,0,100,0,5000,6000,7000,8000,0,11,57759,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Onyx Flight Captain - IC - Cast ''Hammer Drop'''),
(30682,0,1,0,13,0,100,0,6000,21000,0,0,0,11,58953,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Onyx Flight Captain - On Victim Casting - Cast ''Pummel''');
