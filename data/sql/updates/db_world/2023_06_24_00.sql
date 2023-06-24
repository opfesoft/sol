DELETE FROM `creature_text` WHERE `CreatureId` IN (18870,19527);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18870,0,0,'%s absorbs the holy energy of the attack.',16,0,0,0,0,0,17110,0,'Voidshrieker'),
(18870,1,0,'%s absorbs the fire energy of the attack.',16,0,0,0,0,0,17105,0,'Voidshrieker'),
(18870,2,0,'%s absorbs the nature energy of the attack.',16,0,0,0,0,0,17107,0,'Voidshrieker'),
(18870,3,0,'%s absorbs the frost energy of the attack.',16,0,0,0,0,0,17106,0,'Voidshrieker'),
(18870,4,0,'%s absorbs the shadow energy of the attack.',16,0,0,0,0,0,17108,0,'Voidshrieker'),
(18870,5,0,'%s absorbs the arcane energy of the attack.',16,0,0,0,0,0,17109,0,'Voidshrieker'),

(19527,0,0,'%s absorbs the holy energy of the attack.',16,0,0,0,0,0,17110,0,'Vacillating Voidcaller'),
(19527,1,0,'%s absorbs the fire energy of the attack.',16,0,0,0,0,0,17105,0,'Vacillating Voidcaller'),
(19527,2,0,'%s absorbs the nature energy of the attack.',16,0,0,0,0,0,17107,0,'Vacillating Voidcaller'),
(19527,3,0,'%s absorbs the frost energy of the attack.',16,0,0,0,0,0,17106,0,'Vacillating Voidcaller'),
(19527,4,0,'%s absorbs the shadow energy of the attack.',16,0,0,0,0,0,17108,0,'Vacillating Voidcaller'),
(19527,5,0,'%s absorbs the arcane energy of the attack.',16,0,0,0,0,0,17109,0,'Vacillating Voidcaller');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18870,19527);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18870,0,0,0,11,0,100,0,0,0,0,0,0,11,34302,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - On Respawn - Cast ''Coalesce'''),
(18870,0,1,0,4,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - On Aggro - Set Phase 1'),
(18870,0,2,0,0,0,100,0,9000,13000,14000,18000,0,11,22884,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - IC - Cast ''Psychic Scream'''),
(18870,0,3,0,0,2,100,0,0,1000,2000,2500,0,11,34346,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Voidshrieker - IC (Phase 2) - Cast ''Holy Bolt'''),
(18870,0,4,0,0,4,100,0,0,1000,2000,2500,0,11,34348,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Voidshrieker - IC (Phase 3) - Cast ''Fireball'''),
(18870,0,5,0,0,8,100,0,0,1000,2000,2500,0,11,34345,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Voidshrieker - IC (Phase 4) - Cast ''Lightning Bolt'''),
(18870,0,6,0,0,16,100,0,0,1000,2000,2500,0,11,34347,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Voidshrieker - IC (Phase 5) - Cast ''Frostbolt'''),
(18870,0,7,0,0,33,100,0,0,1000,2000,2500,0,11,34344,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Voidshrieker - IC (Phase 6,1) - Cast ''Shadow Bolt'''),
(18870,0,8,0,0,64,100,0,0,1000,5000,5500,0,11,34446,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Voidshrieker - IC (Phase 7) - Cast ''Arcane Missiles'''),

(18870,0,9,10,8,1,100,0,0,2,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - On Spellhit (Holy) (Phase 1) - Set Phase 2'),
(18870,0,10,11,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Say Line 0'),
(18870,0,11,0,61,0,100,0,0,0,0,0,0,11,34336,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Cast ''Damage Reduction: Holy'''),

(18870,0,12,13,8,1,100,0,0,4,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - On Spellhit (Fire) (Phase 1) - Set Phase 3'),
(18870,0,13,14,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Say Line 1'),
(18870,0,14,0,61,0,100,0,0,0,0,0,0,11,34333,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Cast ''Damage Reduction: Fire'''),

(18870,0,15,16,8,1,100,0,0,8,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - On Spellhit (Nature) (Phase 1) - Set Phase 4'),
(18870,0,16,17,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Say Line 2'),
(18870,0,17,0,61,0,100,0,0,0,0,0,0,11,34335,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Cast ''Damage Reduction: Nature'''),

(18870,0,18,19,8,1,100,0,0,16,0,0,0,22,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - On Spellhit (Frost) (Phase 1) - Set Phase 5'),
(18870,0,19,20,61,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Say Line 3'),
(18870,0,20,0,61,0,100,0,0,0,0,0,0,11,34334,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Cast ''Damage Reduction: Frost'''),

(18870,0,21,22,8,1,100,0,0,32,0,0,0,22,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - On Spellhit (Shadow) (Phase 1) - Set Phase 6'),
(18870,0,22,23,61,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Say Line 4'),
(18870,0,23,0,61,0,100,0,0,0,0,0,0,11,34338,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Cast ''Damage Reduction: Shadow'''),

(18870,0,24,25,8,1,100,0,0,64,0,0,0,22,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - On Spellhit (Shadow) (Phase 1) - Set Phase 7'),
(18870,0,25,26,61,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Say Line 5'),
(18870,0,26,0,61,0,100,0,0,0,0,0,0,11,34331,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Voidshrieker - Linked - Cast ''Damage Reduction: Arcane'''),

(19527,0,0,0,11,0,100,0,0,0,0,0,0,11,34302,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - On Respawn - Cast ''Coalesce'''),
(19527,0,1,0,1,0,100,0,30000,300000,0,0,0,11,34842,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - OOC - Cast ''De-Materialize'' (CONDITION_NEAR_CREATURE)'),
(19527,0,2,0,8,0,100,0,34842,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - On Spellhit ''De-Materialize'' - Force Despawn'),
(19527,0,3,0,4,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - On Aggro - Set Phase 1'),
(19527,0,4,0,0,2,100,0,0,1000,2000,2500,0,11,34346,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - IC (Phase 2) - Cast ''Holy Bolt'''),
(19527,0,5,0,0,4,100,0,0,1000,2000,2500,0,11,34348,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - IC (Phase 3) - Cast ''Fireball'''),
(19527,0,6,0,0,8,100,0,0,1000,2000,2500,0,11,34345,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - IC (Phase 4) - Cast ''Lightning Bolt'''),
(19527,0,7,0,0,16,100,0,0,1000,2000,2500,0,11,34347,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - IC (Phase 5) - Cast ''Frostbolt'''),
(19527,0,8,0,0,33,100,0,0,1000,2000,2500,0,11,34344,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - IC (Phase 6,1) - Cast ''Shadow Bolt'''),
(19527,0,9,0,0,64,100,0,0,1000,5000,5500,0,11,34446,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - IC (Phase 7) - Cast ''Arcane Missiles'''),

(19527,0,10,11,8,1,100,0,0,2,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - On Spellhit (Holy) (Phase 1) - Set Phase 2'),
(19527,0,11,12,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Say Line 0'),
(19527,0,12,0,61,0,100,0,0,0,0,0,0,11,34336,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Cast ''Damage Reduction: Holy'''),

(19527,0,13,14,8,1,100,0,0,4,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - On Spellhit (Fire) (Phase 1) - Set Phase 3'),
(19527,0,14,15,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Say Line 1'),
(19527,0,15,0,61,0,100,0,0,0,0,0,0,11,34333,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Cast ''Damage Reduction: Fire'''),

(19527,0,16,17,8,1,100,0,0,8,0,0,0,22,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - On Spellhit (Nature) (Phase 1) - Set Phase 4'),
(19527,0,17,18,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Say Line 2'),
(19527,0,18,0,61,0,100,0,0,0,0,0,0,11,34335,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Cast ''Damage Reduction: Nature'''),

(19527,0,19,20,8,1,100,0,0,16,0,0,0,22,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - On Spellhit (Frost) (Phase 1) - Set Phase 5'),
(19527,0,20,21,61,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Say Line 3'),
(19527,0,21,0,61,0,100,0,0,0,0,0,0,11,34334,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Cast ''Damage Reduction: Frost'''),

(19527,0,22,23,8,1,100,0,0,32,0,0,0,22,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - On Spellhit (Shadow) (Phase 1) - Set Phase 6'),
(19527,0,23,24,61,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Say Line 4'),
(19527,0,24,0,61,0,100,0,0,0,0,0,0,11,34338,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Cast ''Damage Reduction: Shadow'''),

(19527,0,25,26,8,1,100,0,0,64,0,0,0,22,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - On Spellhit (Shadow) (Phase 1) - Set Phase 7'),
(19527,0,26,27,61,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Say Line 5'),
(19527,0,27,0,61,0,100,0,0,0,0,0,0,11,34331,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - Linked - Cast ''Damage Reduction: Arcane''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 19527;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,2,19527,0,0,29,1,19681,20,0,0,0,0,'Creature ''Vacillating Voidcaller'' - Group 0: Execute SAI ID 1 if near creature ''Void Spawner L''');
