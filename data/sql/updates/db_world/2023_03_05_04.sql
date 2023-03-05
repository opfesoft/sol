-- Totem of Spirits: Disable turning
UPDATE `creature_template` SET `unit_flags2` = `unit_flags2` | 32768 WHERE `entry` = 21071;

-- Enraged Earthen Soul: Remove aura
UPDATE `creature_template_addon` SET `auras` = NULL WHERE `entry` = 21073;

-- Enraged Earth/Fire Spirit: Add Fel Fire Aura
UPDATE `creature_template_addon` SET `auras` = '36006' WHERE `entry` IN (21050,21061);
UPDATE `creature_addon` SET `auras` = '36006' WHERE `guid` IN (3009217,3009227,3009237,3009239,3009254,3009256,3009259,3009261,3009265,3009268,3009213,3009212,3009209,3009208,3009207,3009203,3009202,3009200,3009199,3009196,3009192,3009191,3009187,3009185,3009178,3009176,3009174,3009173,3009169);

-- Credit Marker: Earth/Fire/Water/Air: Remove spawns
DELETE FROM `creature` WHERE `id` IN (21092,21094,21095,21096);

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (21071,21050,22115,21073,21061,21097,21059,21109,21060,21116);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21071,21050,22115,21073,21061,21097,21059,21109,21060,21116);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21071,0,0,0,54,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Totem of Spirits - On Just Summoned - Set Root On'),
(21071,0,1,0,38,0,100,0,1,1,0,0,0,33,21092,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Totem of Spirits - On Data Set 1 1 - Quest Credit ''Credit Marker: Earth'' (Owner)'),
(21071,0,2,0,38,0,100,0,2,2,0,0,0,33,21094,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Totem of Spirits - On Data Set 2 2 - Quest Credit ''Credit Marker: Fire'' (Owner)'),
(21071,0,3,0,38,0,100,0,3,3,0,0,0,33,21095,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Totem of Spirits - On Data Set 3 3 - Quest Credit ''Credit Marker: Water'' (Owner)'),
(21071,0,4,0,38,0,100,0,4,4,0,0,0,33,21096,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Totem of Spirits - On Data Set 4 4 - Quest Credit ''Credit Marker: Air'' (Owner)'),

(21050,0,0,0,0,0,100,0,0,0,5000,10000,0,11,38498,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Enraged Earth Spirit - IC - Cast ''Fiery Boulder'''),
(21050,0,1,2,6,0,100,0,0,0,0,0,0,12,21073,3,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Earth Spirit - On Death - Summon Creature ''Enraged Earthen Soul'''),
(21050,0,2,0,61,0,100,0,0,0,0,0,0,11,38365,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Earth Spirit - Linked - Cast ''Summon Enraged Earth Shard'''),

(22115,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Enraged Earth Shard - On Just Summoned - Start Attack (Closest Player)'),
(22115,0,1,0,1,0,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Earth Shard - OOC - Force Despawn'),

(21073,0,0,1,54,0,100,0,0,0,0,0,0,75,36113,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Earthen Soul - On Just Summoned - Add Aura ''Cosmetic: Earthen Soul'''),
(21073,0,1,2,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,19,21071,0,0,0,0,0,0,0,'Enraged Earthen Soul - Linked - Store Target 1 (Totem of Spirits)'),
(21073,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Earthen Soul - Linked - Move To Point 1 (Stored Target 1)'),
(21073,0,3,4,34,0,100,0,8,1,0,0,0,45,1,1,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Earthen Soul - On Point 1 Reached - Set Data 1 1 (Stored Target 1)'),
(21073,0,4,5,61,0,100,0,0,0,0,0,0,11,36025,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Earthen Soul - Linked - Cast ''Earth Soul Captured'' (Invoker)'),
(21073,0,5,0,61,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Earthen Soul - Linked - Force Despawn'),

(21061,0,0,0,0,0,100,0,0,0,5000,10000,0,11,36247,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Enraged Fire Spirit - IC - Cast ''Fel Fireball'''),
(21061,0,1,0,6,0,100,0,0,0,0,0,0,12,21097,3,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Fire Spirit - On Death - Summon Creature ''Enraged Fiery Soul'''),

(21097,0,0,1,54,0,100,0,0,0,0,0,0,75,36114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Fiery Soul - On Just Summoned - Add Aura ''Cosmetic: Fiery Soul'''),
(21097,0,1,2,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,19,21071,0,0,0,0,0,0,0,'Enraged Fiery Soul - Linked - Store Target 1 (Totem of Spirits)'),
(21097,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Fiery Soul - Linked - Move To Point 1 (Stored Target 1)'),
(21097,0,3,4,34,0,100,0,8,1,0,0,0,45,2,2,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Fiery Soul - On Point 1 Reached - Set Data 2 2 (Stored Target 1)'),
(21097,0,4,5,61,0,100,0,0,0,0,0,0,11,36115,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Fiery Soul - Linked - Cast ''Fiery Soul Captured'' (Invoker)'),
(21097,0,5,0,61,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Fiery Soul - Linked - Force Despawn'),

(21059,0,0,0,0,0,100,0,0,0,5000,10000,0,11,38032,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Enraged Water Spirit - IC - Cast ''Stormbolt'''),
(21059,0,1,0,6,0,100,0,0,0,0,0,0,12,21109,3,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Water Spirit - On Death - Summon Creature ''Enraged Watery Soul'''),

(21109,0,0,1,54,0,100,0,0,0,0,0,0,75,36169,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Watery Soul - On Just Summoned - Add Aura ''Cosmetic: Watery Soul'''),
(21109,0,1,2,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,19,21071,0,0,0,0,0,0,0,'Enraged Watery Soul - Linked - Store Target 1 (Totem of Spirits)'),
(21109,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Watery Soul - Linked - Move To Point 1 (Stored Target 1)'),
(21109,0,3,4,34,0,100,0,8,1,0,0,0,45,3,3,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Watery Soul - On Point 1 Reached - Set Data 3 3 (Stored Target 1)'),
(21109,0,4,5,61,0,100,0,0,0,0,0,0,11,36170,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Watery Soul - Linked - Cast ''Water Soul Captured'' (Invoker)'),
(21109,0,5,0,61,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Watery Soul - Linked - Force Despawn'),

(21060,0,0,0,0,0,100,0,0,0,5000,10000,0,11,12058,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Enraged Air Spirit - IC - Cast ''Chain Lightning'''),
(21060,0,1,0,0,0,100,0,10000,20000,20000,40000,0,11,32717,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Enraged Air Spirit - IC - Cast ''Hurricane'''),
(21060,0,2,0,6,0,100,0,0,0,0,0,0,12,21116,3,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Air Spirit - On Death - Summon Creature ''Enraged Airy Soul'''),

(21116,0,0,1,54,0,100,0,0,0,0,0,0,75,36178,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Airy Soul - On Just Summoned - Add Aura ''Cosmetic: Blue Cyclone'''),
(21116,0,1,2,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,19,21071,0,0,0,0,0,0,0,'Enraged Airy Soul - Linked - Store Target 1 (Totem of Spirits)'),
(21116,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Airy Soul - Linked - Move To Point 1 (Stored Target 1)'),
(21116,0,3,4,34,0,100,0,8,1,0,0,0,45,4,4,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Airy Soul - On Point 1 Reached - Set Data 4 4 (Stored Target 1)'),
(21116,0,4,5,61,0,100,0,0,0,0,0,0,11,36181,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Enraged Airy Soul - Linked - Cast ''Air Soul Captured'' (Invoker)'),
(21116,0,5,0,61,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Enraged Airy Soul - Linked - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (21073,21097,21109,21116) AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,21073,0,0,29,1,21071,15,0,0,0,0,'Creature ''Enraged Earthen Soul'' - Group 0: Execute SAI ID 0 only if near creature ''Totem of Spirits'''),
(22,1,21097,0,0,29,1,21071,15,0,0,0,0,'Creature ''Enraged Fiery Soul'' - Group 0: Execute SAI ID 0 only if near creature ''Totem of Spirits'''),
(22,1,21109,0,0,29,1,21071,15,0,0,0,0,'Creature ''Enraged Watery Soul'' - Group 0: Execute SAI ID 0 only if near creature ''Totem of Spirits'''),
(22,1,21116,0,0,29,1,21071,15,0,0,0,0,'Creature ''Enraged Airy Soul'' - Group 0: Execute SAI ID 0 only if near creature ''Totem of Spirits''');
