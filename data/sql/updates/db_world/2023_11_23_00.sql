UPDATE `creature_template` set `modelid1` = 19595, `modelid2` = 0, `flags_extra` = 2 where entry = 21080;

DELETE FROM `creature` WHERE `guid` = 3009637;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009637,21080,530,0,0,1,1,0,0,-3425.34,2279.42,33.4432,1.09956,300,0,1,0,0,0,0,0,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 21080;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21080,0,0,1,25,0,100,0,0,0,0,0,0,11,36055,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dormant Infernal - On Reset - Cast ''Stationary Infernal Ball'''),
(21080,0,1,0,61,0,100,0,0,0,0,0,0,36,21080,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dormant Infernal - Linked - Update Template ''Dormant Infernal'''),
(21080,0,2,3,4,0,100,0,0,0,0,0,0,36,19759,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dormant Infernal - On Aggro - Update Template ''Newly Crafted Infernal'''),
(21080,0,3,0,61,0,100,0,0,0,0,0,0,28,36055,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dormant Infernal - Linked - Remove Aura ''Stationary Infernal Ball''');
