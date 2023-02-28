UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 185011;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21926,20635,20771);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185011;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2084135,2097871,2063500,2077100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21926,0,0,1,54,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - On Just Summoned - Disable Event Phase Reset'),
(21926,0,1,2,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - Linked - Set Event Phase 1'),
(21926,0,2,0,61,0,100,0,0,0,0,0,0,50,185011,30,0,0,0,0,1,0,0,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - Linked - Summon Gameobject ''Multi-Spectrum Light Trap'''),
(21926,0,3,4,38,0,100,0,1,1,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - On Data Set 1 1 - Store Target 1 (Invoker)'),
(21926,0,4,0,61,0,100,0,0,0,0,0,0,9,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - Linked - Activate Gameobject (Stored Target 1)'),
(21926,0,5,0,1,1,100,1,4000,5000,0,0,0,11,28337,0,0,0,0,0,19,20635,20,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - OOC (Event Phase 1, No Repeat) - Cast ''Magnetic Pull'' (Razaani Light Orb)'),
(21926,0,6,0,1,1,100,1,2000,3000,0,0,0,11,28337,0,0,0,0,0,19,20771,20,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - OOC (Event Phase 1, No Repeat) - Cast ''Magnetic Pull'' (Razaani Light Orb - Mini)'),
(21926,0,7,0,38,0,100,0,2,2,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - On Data Set 2 2 - Set Event Phase 2'),
(21926,0,8,9,38,0,100,0,3,3,0,0,0,11,37903,1,0,0,0,0,23,0,0,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - On Data Set 3 3 - Cast ''Trapping the Light: Kill Credit'' (Owner)'),
(21926,0,9,0,61,0,100,0,0,0,0,0,0,9,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Multi-Spectrum Light Trap Bunny - Linked - Activate Gameobject (Stored Target 1)'),

(185011,1,0,0,60,0,100,1,500,500,0,0,0,45,1,1,0,0,0,0,23,0,0,0,0,0,0,0,0,'Multi-Spectrum Light Trap - On Update (No Repeat) - Set Data 1 1 (Owner)'),

(20635,0,0,0,8,0,100,1,28337,0,0,0,0,80,2063500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razaani Light Orb - On Spellhit ''Magnetic Pull'' (No Repeat) - Call Timed Action List'),

(2063500,9,0,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Razaani Light Orb - On Script - Set Data 2 2 (Invoker)'),
(2063500,9,1,0,0,0,100,0,1000,1000,0,0,0,11,35426,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razaani Light Orb - On Script - Cast ''Arcane Explosion Visual'''),
(2063500,9,2,0,0,0,100,0,500,500,0,0,0,45,3,3,0,0,0,0,7,0,0,0,0,0,0,0,0,'Razaani Light Orb - On Script - Set Data 3 3 (Invoker)'),
(2063500,9,3,0,0,0,100,0,0,0,0,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razaani Light Orb - On Script - Force Despawn'),

(20771,0,0,0,8,0,100,1,28337,0,0,0,0,80,2077100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razaani Light Orb - Mini - On Spellhit ''Magnetic Pull'' (No Repeat) - Call Timed Action List'),

(2077100,9,0,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Razaani Light Orb - Mini - On Script - Set Data 2 2 (Invoker)'),
(2077100,9,1,0,0,0,100,0,1000,1000,0,0,0,11,35426,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razaani Light Orb - Mini - On Script - Cast ''Arcane Explosion Visual'''),
(2077100,9,2,0,0,0,100,0,500,500,0,0,0,45,3,3,0,0,0,0,7,0,0,0,0,0,0,0,0,'Razaani Light Orb - Mini - On Script - Set Data 3 3 (Invoker)'),
(2077100,9,3,0,0,0,100,0,0,0,0,0,0,41,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razaani Light Orb - Mini - On Script - Force Despawn');
