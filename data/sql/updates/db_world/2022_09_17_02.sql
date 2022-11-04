DELETE FROM `creature` WHERE `guid` = 190247;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(190247,5595,0,0,0,1,1,1,-4552.39,-896.782,628.633,3.34483,300,0,1,0,2,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 190247;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(190247,1902470,0,0,0,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 1902470;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(1902470,1,-4552.39,-896.782,628.633,NULL,0,0,1,0,100,0),
(1902470,2,-4571.39,-896.264,651.567,NULL,0,0,1,0,100,0),
(1902470,3,-4589.99,-901.846,676.836,NULL,0,0,1,0,100,0),
(1902470,4,-4610.82,-917.361,706.62,NULL,0,0,1,0,100,0),
(1902470,5,-4635.23,-928.682,738.215,NULL,0,0,1,0,100,0),
(1902470,6,-4652.98,-931.127,758.215,NULL,0,0,1,0,100,0),
(1902470,7,-4671.22,-939.369,776.936,NULL,0,0,1,0,100,0),
(1902470,8,-4693.6,-938.376,787.811,NULL,0,0,1,0,100,0),
(1902470,9,-4709.45,-932.536,794.806,NULL,0,0,1,0,100,0),
(1902470,10,-4736.27,-907.288,796.935,NULL,0,0,1,0,100,0),
(1902470,11,-4756.81,-896.912,801.729,NULL,0,0,1,0,100,0),
(1902470,12,-4777.11,-899.693,814.528,NULL,0,0,1,0,100,0),
(1902470,13,-4804.58,-902.562,829.09,NULL,0,0,1,0,100,0),
(1902470,14,-4824.69,-910.126,830.965,NULL,0,0,1,0,100,0),
(1902470,15,-4841.75,-924.793,844.143,NULL,0,0,1,0,100,0),
(1902470,16,-4852.96,-950.442,845.615,NULL,0,0,1,0,100,0),
(1902470,17,-4852.99,-981.269,849.042,NULL,0,0,1,0,100,0),
(1902470,18,-4845.49,-988.7,858.542,NULL,0,0,1,0,100,0),
(1902470,19,-4833.08,-986.989,873.707,NULL,0,0,1,0,100,0),
(1902470,20,-4825.01,-988.942,880.082,NULL,0,0,1,0,100,0),
(1902470,21,-4808.79,-991.839,890.707,NULL,0,0,1,0,100,0),
(1902470,22,-4801.89,-996.844,893.207,NULL,3000,0,1,0,100,0),
(1902470,23,-4808.79,-991.839,890.707,NULL,0,0,1,0,100,0),
(1902470,24,-4825.01,-988.942,880.082,NULL,0,0,1,0,100,0),
(1902470,25,-4833.08,-986.989,873.707,NULL,0,0,1,0,100,0),
(1902470,26,-4845.49,-988.7,858.542,NULL,0,0,1,0,100,0),
(1902470,27,-4852.99,-981.269,849.042,NULL,0,0,1,0,100,0),
(1902470,28,-4852.96,-950.442,845.615,NULL,0,0,1,0,100,0),
(1902470,29,-4841.75,-924.793,844.143,NULL,0,0,1,0,100,0),
(1902470,30,-4824.69,-910.126,830.965,NULL,0,0,1,0,100,0),
(1902470,31,-4804.58,-902.562,829.09,NULL,0,0,1,0,100,0),
(1902470,32,-4777.11,-899.693,814.528,NULL,0,0,1,0,100,0),
(1902470,33,-4756.81,-896.912,801.729,NULL,0,0,1,0,100,0),
(1902470,34,-4736.27,-907.288,796.935,NULL,0,0,1,0,100,0),
(1902470,35,-4709.45,-932.536,794.806,NULL,0,0,1,0,100,0),
(1902470,36,-4693.6,-938.376,787.811,NULL,0,0,1,0,100,0),
(1902470,37,-4671.22,-939.369,776.936,NULL,0,0,1,0,100,0),
(1902470,38,-4652.98,-931.127,758.215,NULL,0,0,1,0,100,0),
(1902470,39,-4635.23,-928.682,738.215,NULL,0,0,1,0,100,0),
(1902470,40,-4610.82,-917.361,706.62,NULL,0,0,1,0,100,0),
(1902470,41,-4589.99,-901.846,676.836,NULL,0,0,1,0,100,0),
(1902470,42,-4571.39,-896.264,651.567,NULL,0,0,1,0,100,0);