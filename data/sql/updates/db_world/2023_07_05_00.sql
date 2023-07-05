UPDATE `creature_template` SET `unit_flags` = 33554496, `InhabitType` = 7 WHERE `entry` = 20454;
UPDATE `creature_template_addon` SET `emote` = 468 WHERE `entry` = 20454;

DELETE FROM `creature_template_addon` WHERE `entry` = 21425;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(21425,0,0,0,1,0,0,'35684');

UPDATE `creature` SET `position_x` = 3841.64, `position_y` = 2480.76, `position_z` = 114.863, `spawntimesecs` = -1 WHERE `guid` = 73277;
UPDATE `creature` SET `position_x` = 3916.2, `position_y` = 2489.55, `position_z` = 110.877, `spawntimesecs` = -1 WHERE `guid` = 73278;
UPDATE `creature` SET `position_x` = 3881.74, `position_y` = 2540.29, `position_z` = 113.032, `spawntimesecs` = -1 WHERE `guid` = 73279;
UPDATE `gameobject` SET `spawntimesecs` = 1 WHERE `guid` = 25179;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20769,20454,21425,20482);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 184383;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2045400,2045401,2048200,2048201);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20769,0,0,1,11,0,100,0,0,0,0,0,0,11,32566,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - On Respawn - Cast ''Purple Banish State'''),
(20769,0,1,0,61,0,100,0,0,0,0,0,0,242,200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - Linked - Set Scale'),
(20769,0,2,0,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - On Data Set 1 1 - Set Event Phase 1'),
(20769,0,3,0,60,1,100,1,13000,13000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - On Update (Event Phase 1) - Force Despawn'),
(20769,0,4,0,38,0,100,0,2,2,0,0,0,11,35515,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Salaadin''s Energy Ball - On Data Set 2 2 - Cast Spell ''Salaadin''s Tesla'''),

(20454,0,0,0,25,0,100,0,0,0,0,0,0,80,2045400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Reset - Call Timed Action List'),
(20454,0,1,0,23,0,100,0,35515,1,1000,1000,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Has Aura ''Salaadin''s Tesla'' - Set Event Phase 1'),
(20454,0,2,0,23,1,100,0,35515,0,1000,1000,0,80,2045401,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Has No Aura ''Salaadin''s Tesla'' (Event Phase 1) - Call Timed Action List'),
(20454,0,3,0,0,0,100,0,5000,10000,15000,25000,0,11,36533,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - IC - Cast ''Gravity Flux'''),
(20454,0,4,0,0,0,100,0,15000,25000,10000,30000,0,11,36527,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - IC - Cast ''Stasis'''),
(20454,0,5,6,2,0,100,0,0,50,0,0,0,11,36847,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - Between 0-50% Health - Cast ''Mirror Image'''),
(20454,0,6,0,61,0,100,0,0,0,0,0,0,11,36848,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - Linked - Cast ''Mirror Image'''),
(20454,0,7,0,6,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,21425,100,0,0,0,0,0,0,'Nexus-King Salhadaar - On Death - Force Despawn (Nexus-King Salhadaar)'),
(20454,0,8,0,7,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,11,21425,100,0,0,0,0,0,0,'Nexus-King Salhadaar - On Evade - Force Despawn (Nexus-King Salhadaar)'),

(2045400,9,0,0,0,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Disable Event Phase Reset'),
(2045400,9,1,0,0,0,100,0,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Set Fly On'),
(2045400,9,2,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Set Event Phase 0'),
(2045400,9,3,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Set Faction ''Friendly'''),
(2045400,9,4,0,0,0,100,0,0,0,0,0,0,18,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Add ''UNIT_FLAG_NOT_SELECTABLE'''),
(2045400,9,5,0,0,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,11,20769,50,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Respawn Target (Salaadin''s Energy Ball)'),
(2045400,9,6,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,11,20769,50,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Set Data 2 2 (Salaadin''s Energy Ball)'),

(2045401,9,0,0,0,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Set Fly Off'),
(2045401,9,1,0,0,0,100,0,0,0,0,0,0,19,33554432,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Remove ''UNIT_FLAG_NOT_SELECTABLE'''),
(2045401,9,2,0,0,0,100,0,0,0,0,0,0,2,1796,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Set Faction ''Ethereum'''),
(2045401,9,3,0,0,0,100,0,0,0,0,0,0,11,35684,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Cast ''Salaadin''s Overspark'''),
(2045401,9,4,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Say Line 0'),
(2045401,9,5,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Script - Start Attack (Closest Player)'),

(21425,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Nexus-King Salhadaar - On Just Summoned - Start Attack (Closest Player)'),

(184383,1,0,0,70,0,100,0,2,0,0,0,0,12,20482,1,300000,0,0,0,8,0,0,0,0,4017.97,2315.8,114.946,0.436332,'Ethereum Transponder Zeta - On GO State Changed ''GO_ACTIVATED'' - Summon Creature ''Image of Commander Ameer'''),

(20482,0,0,0,19,0,100,0,10406,0,0,0,0,85,35679,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Quest ''Delivering the Message'' Accepted - Invoker Cast ''Protectorate Demolitionist'''),
(20482,0,1,2,54,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Just Summoned - Set Root On'),
(20482,0,2,3,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - Linked - Set Active On'),
(20482,0,3,0,61,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - Linked - Cast ''Simple Teleport'''),
(20482,0,4,0,1,0,100,0,240000,240000,0,0,0,80,2048200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - OOC - Call Timed Action List'),
(20482,0,5,0,4,0,100,0,0,0,0,0,0,80,2048201,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Aggro - Call Timed Action List'),

(2048200,9,0,0,0,0,100,0,0,0,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Cast ''Simple Teleport'''),
(2048200,9,1,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Force Despawn'),

(2048201,9,0,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2048201,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Say Line 0'),
(2048201,9,2,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Remove NPC Flags'),
(2048201,9,3,0,0,0,100,0,2000,2000,0,0,0,11,12980,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Cast ''Simple Teleport'''),
(2048201,9,4,0,0,0,100,0,1000,1000,0,0,0,32,0,0,0,0,0,0,20,184383,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Reset GO (Ethereum Transponder Zeta)'),
(2048201,9,5,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Image of Commander Ameer - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 20454;
