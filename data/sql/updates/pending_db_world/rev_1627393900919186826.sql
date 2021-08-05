INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1627393900919186826');

-- Add movement to various Starving Ghostclaws
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `id` = 16347 AND `guid` IN (81746, 81747, 81748, 81749, 81750, 81751, 81754, 81759, 81760, 81761, 81762, 81763, 81793, 81892, 82042, 82044, 82092, 82099, 82105, 82115, 82117, 82120, 82121, 82128, 82769);

-- Add movement to various Mistbats
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `id` = 16353 AND `guid` IN (81752, 81753, 81755, 81758, 81782, 81794, 82045, 82079, 82100, 82109, 82114, 82116, 82118, 82119, 82464, 82473, 82474);

-- Sol modification: Adjust some positions
UPDATE `creature` SET `position_x` = 7994.22, `position_y` = -6944.73, `position_z` = 56.4144 WHERE `guid` = 82105;
UPDATE `creature` SET `position_x` = 7974.42, `position_y` = -6852.5, `position_z` = 56.5806 WHERE `guid` = 82117;
UPDATE `creature` SET `position_x` = 7949.07, `position_y` = -6791.82, `position_z` = 56.874 WHERE `guid` = 82121;
UPDATE `creature` SET `position_x` = 8018.62, `position_y` = -7106.65, `position_z` = 134.118 WHERE `guid` = 81782;
UPDATE `creature` SET `position_x` = 7545.4, `position_y` = -6126.8, `position_z` = 17.1636 WHERE `guid` = 82474;
