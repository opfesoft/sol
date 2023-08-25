DELETE FROM `creature` WHERE `guid` = 3009583;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009583,3395,1,0,0,1,1,0,1,-1213.37,-2725.07,106.693,5.37718,-1,0,1,0,0,0,0,0,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (3395,3274,3275,3397);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3395,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Verog the Dervish - On Respawn - Set Active On'),
(3395,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Verog the Dervish - Linked - Say Line 0'),
(3395,0,2,0,61,0,100,0,0,0,0,0,0,53,0,339500,0,0,0,2,1,0,0,0,0,0,0,0,0,'Verog the Dervish - Linked - Start WP Movement'),
(3395,0,3,0,1,0,100,0,300000,300000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Verog the Dervish - OOC - Force Despawn'),

(3274,0,0,0,4,0,100,0,0,0,0,0,0,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kolkar Pack Runner - On Aggro - Cast ''Battle Shout'''),
(3274,0,1,2,6,0,3,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kolkar Pack Runner - On Just Died - Say Line 0'),
(3274,0,2,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,3009583,3395,1,2,0,0,0,0,'Kolkar Pack Runner - Linked - Respawn Target (Verog the Dervish)'),

(3275,0,0,0,0,0,100,0,5000,7000,6000,9000,0,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Marauder - IC - Cast ''Strike'''),
(3275,0,1,2,6,0,3,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kolkar Marauder - On Just Died - Say Line 0'),
(3275,0,2,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,3009583,3395,1,2,0,0,0,0,'Kolkar Marauder - Linked - Respawn Target (Verog the Dervish)'),

(3397,0,0,0,16,0,100,0,6742,30,15000,45000,0,11,6742,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kolkar Bloodcharger - On Friendly Unit Missing Buff ''Bloodlust'' - Cast ''Bloodlust'''),
(3397,0,1,0,0,0,100,0,9000,12000,15000,19000,0,11,172,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Bloodcharger - IC - Cast ''Corruption'''),
(3397,0,2,3,6,0,3,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kolkar Bloodcharger - On Just Died - Say Line 0'),
(3397,0,3,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,3009583,3395,1,2,0,0,0,0,'Kolkar Bloodcharger - Linked - Respawn Target (Verog the Dervish)');

DELETE FROM `waypoints` WHERE `entry` = 339500;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(339500,1,-1210.45,-2728.79,106.818,'Verog the Dervish'),
(339500,2,-1210.08,-2733.22,104.645,NULL),
(339500,3,-1209.65,-2738.38,102.646,NULL);
