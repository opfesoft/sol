UPDATE `spell_dbc` SET `Effect1` = 28, -- SPELL_EFFECT_SUMMON
`EffectImplicitTargetA1` = 72,         -- TARGET_DEST_CASTER_RANDOM
`EffectRadiusIndex1` = 15,             -- EFFECT_RADIUS_3_YARDS
`EffectMiscValueB1` = 64,              -- see SummonProperties.dbc ID 64

`Effect3` = 6,                         -- SPELL_EFFECT_APPLY_AURA
`EffectImplicitTargetA3` = 1,          -- TARGET_UNIT_CASTER
`EffectApplyAuraName3` = 79,           -- SPELL_AURA_MOD_DAMAGE_PERCENT_DONE
`EffectBasePoints3` = -30,             -- reduce damage by 30%
`EffectMiscValue3` = 127               -- SPELL_SCHOOL_MASK_ALL
WHERE `ID` IN (37947,36042,36045,36048,36595,36579,38888);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (18885,21077,18886,21078,21079,21328,20772,21323,22344);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18885,21077,18886,21078,20202,21079,19940,21328,20772,21323,18690,22344);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 19419 AND `id` > 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 21936 AND `id` > 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19419,0,3,4,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Shardling - On Just Summoned - Set Active On'),
(19419,0,4,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Shardling - Linked - Start Random Movement'),
(19419,0,5,0,1,0,100,0,15000,15000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Shardling - OOC - Force Despawn'),

(21936,0,1,2,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crazed Shardling - On Just Summoned - Set Active On'),
(21936,0,2,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crazed Shardling - Linked - Start Random Movement'),
(21936,0,3,0,1,0,100,0,15000,15000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crazed Shardling - OOC - Force Despawn'),

(18885,0,0,0,2,0,100,0,0,75,0,0,0,11,36042,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Giant - Between 0-75% Health - Cast ''Summon Farahlon Crumbler'''),
(18885,0,1,0,2,0,100,0,0,50,0,0,0,11,36042,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Giant - Between 0-50% Health - Cast ''Summon Farahlon Crumbler'''),
(18885,0,2,0,2,0,100,0,0,25,0,0,0,11,36042,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Giant - Between 0-25% Health - Cast ''Summon Farahlon Crumbler'''),

(21077,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Crumbler - On Just Summoned - Set Active On'),
(21077,0,1,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Crumbler - Linked - Start Random Movement'),
(21077,0,2,0,1,0,100,0,15000,15000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Crumbler - OOC - Force Despawn'),

(18886,0,0,0,2,0,100,0,0,75,0,0,0,11,36045,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Breaker - Between 0-75% Health - Cast ''Summon Farahlon Shardling'''),
(18886,0,1,0,2,0,100,0,0,50,0,0,0,11,36045,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Breaker - Between 0-50% Health - Cast ''Summon Farahlon Shardling'''),
(18886,0,2,0,2,0,100,0,0,25,0,0,0,11,36045,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Breaker - Between 0-25% Health - Cast ''Summon Farahlon Shardling'''),

(21078,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Shardling - On Just Summoned - Set Active On'),
(21078,0,1,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Shardling - Linked - Start Random Movement'),
(21078,0,2,0,1,0,100,0,15000,15000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farahlon Shardling - OOC - Force Despawn'),

(20202,0,0,0,9,0,100,0,0,10,12000,16000,0,11,32959,2,0,0,0,0,5,0,0,0,0,0,0,0,0,'Cragskaar - Within 0-10 Range - Cast ''Knock Away'''),
(20202,0,1,0,2,0,100,0,0,75,0,0,0,11,36048,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cragskaar - Between 0-75% Health - Cast ''Summon Motherlode Shardling'''),
(20202,0,2,0,2,0,100,0,0,50,0,0,0,11,36048,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cragskaar - Between 0-50% Health - Cast ''Summon Motherlode Shardling'''),
(20202,0,3,0,2,0,100,0,0,25,0,0,0,11,36048,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cragskaar - Between 0-25% Health - Cast ''Summon Motherlode Shardling'''),

(21079,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cragskaar Shardling - On Just Summoned - Set Active On'),
(21079,0,1,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cragskaar Shardling - Linked - Start Random Movement'),
(21079,0,2,0,1,0,100,0,15000,15000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cragskaar Shardling - OOC - Force Despawn'),

(19940,0,0,0,0,0,100,0,11900,11900,15000,21200,0,11,8078,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apex - IC - Cast ''Thunderclap'''),
(19940,0,1,0,2,0,100,0,0,75,0,0,0,11,36595,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apex - Between 0-75% Health - Cast ''Summon Apex Crumbler'''),
(19940,0,2,0,2,0,100,0,0,50,0,0,0,11,36595,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apex - Between 0-50% Health - Cast ''Summon Apex Crumbler'''),
(19940,0,3,0,2,0,100,0,0,25,0,0,0,11,36595,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apex - Between 0-25% Health - Cast ''Summon Apex Crumbler'''),

(21328,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apex Crumbler - On Just Summoned - Set Active On'),
(21328,0,1,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apex Crumbler - Linked - Start Random Movement'),
(21328,0,2,0,1,0,100,0,15000,15000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Apex Crumbler - OOC - Force Despawn'),

(20772,0,0,0,2,0,100,0,0,75,0,0,0,11,36579,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netherock - Between 0-75% Health - Cast ''Summon Netherock Crumbler'''),
(20772,0,1,0,2,0,100,0,0,50,0,0,0,11,36579,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netherock - Between 0-50% Health - Cast ''Summon Netherock Crumbler'''),
(20772,0,2,0,2,0,100,0,0,25,0,0,0,11,36579,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netherock - Between 0-25% Health - Cast ''Summon Netherock Crumbler'''),

(21323,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netherock Crumbler - On Just Summoned - Set Active On'),
(21323,0,1,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netherock Crumbler - Linked - Start Random Movement'),
(21323,0,2,0,1,0,100,0,15000,15000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Netherock Crumbler - OOC - Force Despawn'),

(18690,0,0,0,9,0,100,0,0,5,12000,16000,0,11,35238,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Morcrush - Within 0-5 Range - Cast ''War Stomp'''),
(18690,0,1,0,2,0,100,0,0,75,0,0,0,11,38888,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morcrush - Between 0-75% Health - Cast ''Summon Morcrush Shardling'''),
(18690,0,2,0,2,0,100,0,0,50,0,0,0,11,38888,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morcrush - Between 0-50% Health - Cast ''Summon Morcrush Shardling'''),
(18690,0,3,0,2,0,100,0,0,25,0,0,0,11,38888,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morcrush - Between 0-25% Health - Cast ''Summon Morcrush Shardling'''),

(22344,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morcrush Shardling - On Just Summoned - Set Active On'),
(22344,0,1,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morcrush Shardling - Linked - Start Random Movement'),
(22344,0,2,0,9,0,100,0,0,10,16000,21000,0,11,8078,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Morcrush Shardling - Within 0-10 Range - Cast ''Thunderclap'''),
(22344,0,3,0,2,0,100,0,0,50,0,0,0,11,34970,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morcrush Shardling - Between 0-50% Health - Cast ''Frenzy'''),
(22344,0,4,0,1,0,100,0,15000,15000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morcrush Shardling - OOC - Force Despawn');
