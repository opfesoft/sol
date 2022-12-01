UPDATE `creature_template_addon` SET `auras` = '15088 12787' WHERE `entry` = 19299;
UPDATE `creature_template_addon` SET `auras` = '22696' WHERE `entry` = 19350;
UPDATE `creature_template` SET `faction` = 90 WHERE `entry` = 19381;
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (59391,59400,59413);
DELETE FROM `creature_addon` WHERE `guid` IN (59351,59352,59353,59354,59361,59362,59365,59366,59370,59390,59393,59395,59399,59400,59401,59404,59405,59406,59408,59412,59413,69911,69914,69916,69917,69918);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (19299,16959,18977,19381,19681,19263);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (19299,16959,18977,19335,18679,19381,16879,19261,18677,17014,19681,19263,19414,16946,22323,16967,16966);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` > 0 AND `entryorguid` IN (16974,16975);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 1 AND `entryorguid` = 19527;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(19299,0,0,0,0,0,100,0,4000,6000,12000,16000,0,11,32417,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Deathwhisperer - IC - Cast ''Mind Flay'''),

(16959,0,0,0,0,0,100,0,5000,8000,15000,20000,0,11,33678,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Dread Tactician - IC - Cast ''Carrion Swarm'''),
(16959,0,1,0,0,0,100,0,8000,11000,24000,29000,0,11,12098,0,0,0,0,0,6,0,0,0,0,0,0,0,0,'Dread Tactician - IC - Cast ''Sleep'''),
(16959,0,2,0,2,0,100,1,0,30,0,0,0,11,33679,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Dread Tactician - Between 0-30% Health - Cast ''Inferno'' (No Repeat)'),

(18977,0,0,0,9,0,100,1,8,40,0,0,0,11,33971,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felguard Destroyer - Within 8-40 Range - Cast ''Sweeping Charge'' (No Repeat)'),
(18977,0,1,0,0,0,100,0,7000,9000,11000,15000,0,11,13737,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felguard Destroyer - IC - Cast ''Mortal Strike'''),
(18977,0,2,0,0,0,100,0,3000,5000,7000,11000,0,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Felguard Destroyer - IC - Cast ''Cleave'''),

(19335,0,0,0,11,0,100,0,0,0,0,0,0,11,29651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Subjugator Yalqiz - On Respawn - Cast ''Dual Wield'''),
(19335,0,1,0,0,0,100,0,5000,10000,15000,20000,0,11,32026,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Subjugator Yalqiz - IC - Cast ''Pain Spike'''),
(19335,0,2,0,2,0,100,1,0,80,0,0,0,11,32000,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Subjugator Yalqiz - Between 0-80% Health - Cast ''Mind Sear'' (No Repeat)'),

(18679,0,0,0,0,0,100,0,5000,7000,11000,14000,0,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vorakem Doomspeaker - IC - Cast ''Hamstring'''),
(18679,0,1,0,0,0,100,0,7000,9000,12000,15000,0,11,33804,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Vorakem Doomspeaker - IC - Cast ''Flame Wave'''),
(18679,0,2,3,2,0,100,1,0,20,0,0,0,11,8599,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vorakem Doomspeaker - Between 0-20% Health - Cast ''Enrage'' (No Repeat)'),
(18679,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vorakem Doomspeaker - Linked - Say Line 0'),

(19381,0,0,0,11,0,100,0,0,0,0,0,0,11,33800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Flame Wave - On Respawn - Cast ''Flame Wave'''),

(16879,0,0,0,2,0,100,1,0,80,0,0,0,11,33908,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Starving Helboar - Between 0-80% Health - Cast ''Burning Spikes'' (No Repeat)'),

(19261,0,0,0,25,0,100,0,0,0,0,0,0,75,19483,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Warbringer - On Reset - Add Aura ''Immolation'''),

(18677,0,0,0,0,0,100,0,3000,3200,7500,8400,0,11,38875,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mekthorg the Wild - IC - Cast ''Pike Vault'''),
(18677,0,1,2,2,0,100,1,0,40,0,0,0,11,8599,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mekthorg the Wild - Between 0-40% Health - Cast ''Enrage'' (No Repeat)'),
(18677,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mekthorg the Wild - Linked - Say Line 0'),
(18677,0,3,0,2,0,100,1,0,15,0,0,0,11,37704,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mekthorg the Wild - Between 0-15% Health - Cast ''Whirlwind'' (No Repeat)'),

(17014,0,0,0,11,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - On Respawn - Set Invincibility HP 1'),
(17014,0,1,0,1,0,100,0,30000,300000,0,0,0,11,34842,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - OOC - Cast ''De-Materialize'' (CONDITION_NEAR_CREATURE)'),
(17014,0,2,0,0,0,100,0,5000,5000,10000,15000,0,11,34259,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - IC - Cast ''Fear'''),
(17014,0,3,0,2,0,100,1,0,10,0,0,0,11,34233,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - Between 0-10% Health - Cast ''Collapse'' (No Repeat)'),
(17014,0,4,5,8,0,100,0,34233,0,0,0,0,11,34234,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - On Spellhit ''Collapse'' - Cast ''Collapse'''),
(17014,0,5,0,61,0,100,0,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - Linked - Die'),
(17014,0,6,0,8,0,100,0,34842,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - On Spellhit ''De-Materialize'' - Force Despawn'),

(19681,0,0,0,1,0,100,0,1000,120000,120000,240000,0,11,34303,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Void Spawner L - OOC - Cast ''Nether Charge'''),

(16974,0,1,0,1,0,100,0,30000,300000,0,0,0,11,34842,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rogue Voidwalker - OOC - Cast ''De-Materialize'' (CONDITION_NEAR_CREATURE)'),
(16974,0,2,0,8,0,100,0,34842,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rogue Voidwalker - On Spellhit ''De-Materialize'' - Force Despawn'),

(16975,0,1,0,1,0,100,0,30000,300000,0,0,0,11,34842,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uncontrolled Voidwalker - OOC - Cast ''De-Materialize'' (CONDITION_NEAR_CREATURE)'),
(16975,0,2,0,8,0,100,0,34842,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uncontrolled Voidwalker - On Spellhit ''De-Materialize'' - Force Despawn'),

(19527,0,1,0,1,0,100,0,30000,300000,0,0,0,11,34842,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vacillating Voidcaller - OOC - Cast ''De-Materialize'' (CONDITION_NEAR_CREATURE)'),

(19263,0,0,0,0,0,100,0,5000,7000,12000,16000,0,11,34113,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warboss Nekrogg - IC - Cast ''Bonechewer Bite'''),
(19263,0,1,0,0,0,100,0,10000,12000,25000,30000,0,11,30474,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Warboss Nekrogg - IC - Cast ''Bloodthirst'''),

(19414,0,0,0,0,0,100,0,3000,3000,3000,5000,0,11,11976,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Shattered Hand Guard - IC - Cast ''Strike'''),
(19414,0,1,0,0,0,100,0,6000,9000,13000,16000,0,11,33960,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Shattered Hand Guard - IC - Cast ''Counterstrike'''),

(16946,0,0,0,0,0,100,0,0,0,2000,4000,0,11,32735,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Forgefiend - IC - Cast ''Saw Blade'''),
(16946,0,1,0,9,0,100,0,0,10,15000,20000,0,11,36486,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Forgefiend - Within 0-10 Range - Cast ''Slime Spray'''),

(22323,0,0,0,0,0,100,0,1000,2000,3000,5000,0,11,36247,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Incandescent Fel Spark - IC - Cast ''Fel Fireball'''),
(22323,0,1,0,0,0,100,0,8000,11000,18000,24000,0,11,39055,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Incandescent Fel Spark - IC - Cast ''Flames of Chaos'''),
(22323,0,2,0,6,0,100,0,0,0,0,0,0,11,44877,3,0,0,0,0,1,0,0,0,0,0,0,0,0,'Incandescent Fel Spark - On Just Died - Cast ''Living Flare Master'''),

(16967,0,0,0,11,0,100,0,0,0,0,0,0,11,29651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Haal\'eshi Talonguard - On Respawn - Cast ''Dual Wield'''),
(16967,0,1,0,4,0,100,0,0,0,0,0,0,11,32720,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Haal''eshi Talonguard - On Aggro - Cast ''Sprint'''),
(16967,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Haal''eshi Talonguard - Between 0-15% Health - Flee For Assist (No Repeat)'),

(16966,0,0,0,0,0,100,0,0,0,3000,5000,0,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Haal''eshi Windwalker - IC - Cast ''Lightning Bolt'''),
(16966,0,1,0,0,0,100,0,8000,12000,20000,24000,0,11,32717,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Haal''eshi Windwalker - IC - Cast ''Hurricane'''),
(16966,0,2,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Haal''eshi Windwalker - Between 0-15% Health - Flee For Assist (No Repeat)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` = 2 AND `SourceEntry` IN (16974,16975,17014,19527) AND `SourceId` = 0;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 34303;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,2,16974,0,0,29,1,19681,20,0,0,0,0,'Rogue Voidwalker - Group 0: Execute SAI ID 1 only if near creature ''Void Spawner L'''),

(22,2,16975,0,0,29,1,19681,20,0,0,0,0,'Uncontrolled Voidwalker - Group 0: Execute SAI ID 1 only if near creature ''Void Spawner L'''),

(22,2,17014,0,0,29,1,19681,20,0,0,0,0,'Collapsing Voidwalker - Group 0: Execute SAI ID 1 only if near creature ''Void Spawner L'''),

(22,2,19527,0,0,29,1,19681,20,0,0,0,0,'Vacillating Voidcaller - Group 0: Execute SAI ID 1 only if near creature ''Void Spawner L'''),

(13,3,34303,0,0,31,0,3,16974,0,0,0,0,'Spell ''Nether Charge'' - Group 0: Implicit target creature ''Rogue Voidwalker'''),
(13,3,34303,0,1,31,0,3,16975,0,0,0,0,'Spell ''Nether Charge'' - Group 1: Implicit target creature ''Uncontrolled Voidwalker'''),
(13,3,34303,0,2,31,0,3,17014,0,0,0,0,'Spell ''Nether Charge'' - Group 2: Implicit target creature ''Collapsing Voidwalker'''),
(13,3,34303,0,3,31,0,3,19527,0,0,0,0,'Spell ''Nether Charge'' - Group 3: Implicit target creature ''Vacillating Voidcaller''');
