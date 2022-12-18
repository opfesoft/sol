UPDATE `spell_dbc` SET `Effect1` = 28, -- SPELL_EFFECT_SUMMON
`EffectImplicitTargetA1` = 72,         -- TARGET_DEST_CASTER_RANDOM
`EffectRadiusIndex1` = 15,             -- EFFECT_RADIUS_3_YARDS
`EffectMiscValueB1` = 64,              -- see SummonProperties.dbc ID 64

`Effect3` = 6,                         -- SPELL_EFFECT_APPLY_AURA
`EffectImplicitTargetA3` = 1,          -- TARGET_UNIT_CASTER
`EffectApplyAuraName3` = 79,           -- SPELL_AURA_MOD_DAMAGE_PERCENT_DONE
`EffectBasePoints3` = -30,             -- reduce damage by 30%
`EffectMiscValue3` = 127               -- SPELL_SCHOOL_MASK_ALL
WHERE `ID` = 33903;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 19188 AND `id` > 3;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 19419;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19188,0,4,0,2,0,100,1,0,75,0,0,0,11,33903,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Colossus - Between 0-75% Health - Cast ''Summon Crystalhide Rageling'' (No Repeat)'),
(19188,0,5,0,2,0,100,1,0,50,0,0,0,11,33903,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Colossus - Between 0-50% Health - Cast ''Summon Crystalhide Rageling'' (No Repeat)'),
(19188,0,6,0,2,0,100,1,0,25,0,0,0,11,33903,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Colossus - Between 0-25% Health - Cast ''Summon Crystalhide Rageling'' (No Repeat)'),

(19419,0,0,1,2,0,100,1,0,20,0,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Shardling - Between 0-20% Health - Cast ''Enrage'' (No Repeat)'),
(19419,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Shardling - Between 0-20% Health - Say Line 0 (No Repeat)'),
(19419,0,2,0,54,0,100,0,0,0,0,0,0,11,24240,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Raging Shardling - On Just Summoned - Cast Spawn - Red Lightning'),
(19419,0,3,0,1,0,100,1,1000,2000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Raging Shardling - OOC - Start Attack (Closest Player) (No Repeat)');
