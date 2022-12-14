UPDATE `creature_template` SET `speed_walk` = 6, `InhabitType` = `InhabitType` | 4 WHERE `entry` = 26231;
UPDATE `creature` SET `position_x` = 4059.45, `position_y` = 7087.14, `position_z` = 653.324, `orientation` = 1.68854, `spawntimesecs` = -1 WHERE `guid` = 40270;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (26231,26232,26265);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2623100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(26231,0,0,0,34,0,100,0,2,8,0,0,0,80,2623100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saragosa - On WP 9 Reached - Call Timed Action List'),

(2623100,9,0,0,0,0,100,0,6000,6000,0,0,0,11,46802,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saragosa - On Script - Cast Spell ''Frost Breath'''),
(2623100,9,1,0,0,0,100,0,2000,2000,0,0,0,242,10,0,0,0,0,0,10,45761,26265,0,0,0,0,0,0,'Saragosa - On Script - Set Scale (Saragosa''s End Invisman)'),
(2623100,9,2,0,0,0,100,0,3000,3000,0,0,0,28,0,0,0,0,0,0,10,45761,26265,0,0,0,0,0,0,'Saragosa - On Script - Remove All Auras (Saragosa''s End Invisman)'),
(2623100,9,3,0,0,0,100,0,3000,3000,0,0,0,242,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saragosa - On Script - Set Scale'),
(2623100,9,4,0,0,0,100,0,2500,2500,0,0,0,12,26232,1,120000,0,0,0,1,0,0,0,0,0,0,0,0,'Saragosa - On Script - Summon Creature ''Saragosa'''),
(2623100,9,5,0,0,0,100,0,0,0,0,0,0,242,0,0,0,0,0,0,10,45761,26265,0,0,0,0,0,0,'Saragosa - On Script - Reset Scale (Saragosa''s End Invisman)'),
(2623100,9,6,0,0,0,100,0,0,0,0,0,0,242,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saragosa - On Script - Reset Scale'),
(2623100,9,7,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saragosa - On Script - Force Despawn'),

(26232,0,0,0,0,0,100,0,0,40,3400,6200,0,11,51779,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saragosa - IC - Cast ''Frostfire Bolt'''),
(26232,0,1,0,0,0,100,0,8500,17500,20100,40100,0,11,15063,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Saragosa - IC - Cast ''Frost Nova'''),

(26265,0,0,1,8,0,100,0,46793,0,0,0,0,70,0,0,0,0,0,0,10,40270,26231,1,0,0,0,0,0,'Saragosa''s End Invisman - On Spellhit ''Activate Power Focus'' - Respawn Creature ''Saragosa'''),
(26265,0,1,2,61,0,100,0,0,0,0,0,0,75,46789,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saragosa''s End Invisman - Linked - Add Aura ''Blue Power Focus'''),
(26265,0,2,0,61,0,100,0,0,0,0,0,0,75,46796,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Saragosa''s End Invisman - Linked - Add Aura ''Blue Flame Shield''');

DELETE FROM `waypoint_data` WHERE `id` = 402700;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(402700,1,4059.45,7087.14,653.324,NULL,0,3,0,0,100,0),
(402700,2,4059.45,7087.14,653.324,1.68854,5000,3,0,0,100,0),
(402700,3,4056.26,7114.11,654.115,NULL,0,0,0,0,100,0),
(402700,4,4052.01,7150.03,653.843,NULL,0,0,0,0,100,0),
(402700,5,4047.55,7187.79,652.873,NULL,0,0,0,0,100,0),
(402700,6,4042.81,7227.85,648.971,NULL,0,0,0,0,100,0),
(402700,7,4039.27,7257.71,643.686,NULL,0,0,0,0,100,0),
(402700,8,4035.71,7287.85,635.972,NULL,0,2,0,0,100,0),
(402700,9,4033.89,7303.23,635.972,NULL,60000,0,0,0,100,0);
