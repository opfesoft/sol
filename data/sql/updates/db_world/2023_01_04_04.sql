DELETE FROM `gameobject` WHERE `guid` IN (74150,74151,74152,74153,74154);
DELETE FROM `pool_gameobject` WHERE `guid` IN (74150,74151,74152,74153,74154);
DELETE FROM `pool_template` WHERE `entry` = 4510;
DELETE FROM `pool_pool` WHERE `pool_id` = 4510;
