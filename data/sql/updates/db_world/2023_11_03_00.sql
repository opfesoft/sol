UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 128 WHERE `entry` = 7898;

DELETE FROM `gameobject` WHERE `guid` IN (17233,17235,17236,3009192,3009193,3009194,3009195,3009196,3009197);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(17233,142189,1,0,0,1,1,-10050.8,-3717.16,5.44262,2.65289,0,0,0.970295,0.241925,900,100,1,0),
(17235,142189,1,0,0,1,1,-10285.8,-3881.83,1.07085,-2.26893,0,0,-0.906307,0.422619,900,100,1,0),
(17236,142189,1,0,0,1,1,-10217,-3817.65,1.35298,2.65289,0,0,0.970295,0.241925,900,100,1,0),

(3009192,142194,1,0,0,1,1,-10118.2,-4052.65,5.39791,1.25489,0,0,0,0,-1,100,1,0),
(3009193,142194,1,0,0,1,1,-10247.8,-3982.76,1.81727,0.960364,0,0,0,0,-1,100,1,0),
(3009194,142194,1,0,0,1,1,-10155.6,-3947.92,7.56555,4.26296,0,0,0,0,-1,100,1,0),
(3009195,142194,1,0,0,1,1,-10286.6,-3883.28,0.916568,5.7827,0,0,0,0,-1,100,1,0),
(3009196,142194,1,0,0,1,1,-10218.5,-3817.15,1.3351,4.42004,0,0,0,0,-1,100,1,0),
(3009197,142194,1,0,0,1,1,-10052.5,-3716.79,5.48603,4.32188,0,0,0,0,-1,100,1,0);

DELETE FROM `pool_gameobject` WHERE `guid` IN (17233,17235,17236);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(17233,355,0,'Inconspicuous Landmark'),
(17235,355,0,'Inconspicuous Landmark'),
(17236,355,0,'Inconspicuous Landmark');

DELETE FROM `creature_text` WHERE `CreatureId` IN (7899,7901,7902);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(7899,0,0,'Hey!  Get away from our treasure!',12,0,100,0,0,0,3931,0,'Treasure Hunting Pirate'),
(7899,0,1,'That''s our treasure, you lubber!',12,0,100,0,0,0,3932,0,'Treasure Hunting Pirate'),
(7899,0,2,'We didn''t hide this stuff just you could steal it!',12,0,100,0,0,0,3933,0,'Treasure Hunting Pirate'),

(7901,0,0,'Hey!  Get away from our treasure!',12,0,100,0,0,0,3931,0,'Treasure Hunting Swashbuckler'),
(7901,0,1,'That''s our treasure, you lubber!',12,0,100,0,0,0,3932,0,'Treasure Hunting Swashbuckler'),
(7901,0,2,'We didn''t hide this stuff just you could steal it!',12,0,100,0,0,0,3933,0,'Treasure Hunting Swashbuckler'),

(7902,0,0,'Hey!  Get away from our treasure!',12,0,100,0,0,0,3931,0,'Treasure Hunting Buccaneer'),
(7902,0,1,'That''s our treasure, you lubber!',12,0,100,0,0,0,3932,0,'Treasure Hunting Buccaneer'),
(7902,0,2,'We didn''t hide this stuff just you could steal it!',12,0,100,0,0,0,3933,0,'Treasure Hunting Buccaneer');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (7899,7901,7902);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (7898,7899,7901,7902);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 789800;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7898,0,0,0,54,0,100,0,0,0,0,0,0,80,789800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Just Summoned - Call Timed Action List'),

(789800,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Script - Set Active On'),
(789800,9,1,0,0,0,100,0,0,0,0,0,0,70,300,0,0,0,0,0,20,142194,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Script - Respawn GO (Pirate''s Treasure!)'),
(789800,9,2,0,0,0,100,0,0,0,0,0,0,12,7899,1,300000,0,25,25,1,0,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Script - Summon Creature ''Treasure Hunting Pirate'''),
(789800,9,3,0,0,0,100,0,0,0,0,0,0,12,7899,1,300000,0,25,25,1,0,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Script - Summon Creature ''Treasure Hunting Pirate'''),
(789800,9,4,0,0,0,100,0,0,0,0,0,0,12,7902,1,300000,0,25,25,1,0,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Script - Summon Creature ''Treasure Hunting Buccaneer'''),
(789800,9,5,0,0,0,100,0,0,0,0,0,0,12,7902,1,300000,0,25,25,1,0,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Script - Summon Creature ''Treasure Hunting Buccaneer'''),
(789800,9,6,0,0,0,100,0,0,0,0,0,0,12,7901,1,300000,0,25,25,1,0,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Script - Summon Creature ''Treasure Hunting Swashbuckler'''),
(789800,9,7,0,0,0,100,0,300000,300000,0,0,0,233,0,0,0,0,0,0,20,142189,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Script - Despawn GO (Inconspicuous Landmark)'),
(789800,9,8,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pirate treasure trigger mob - On Script - Force Despawn'),

(7899,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Pirate - On Just Summoned - Set Active On'),
(7899,0,1,2,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Pirate - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7899,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,20,142189,0,0,0,0,0,0,0,'Treasure Hunting Pirate - Linked - Move To Point 1 (Inconspicuous Landmark)'),
(7899,0,3,4,34,0,100,0,8,1,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Pirate - On Point 1 Reached - Set Home Position'),
(7899,0,4,0,61,0,100,0,8,1,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Pirate - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7899,0,5,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Pirate - On Aggro - Say Line 0'),
(7899,0,6,0,0,0,100,0,3000,7000,8000,18000,0,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Treasure Hunting Pirate - IC - Cast ''Strike'''),

(7901,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Swashbuckler - On Just Summoned - Set Active On'),
(7901,0,1,2,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Swashbuckler - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7901,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,20,142189,0,0,0,0,0,0,0,'Treasure Hunting Swashbuckler - Linked - Move To Point 1 (Inconspicuous Landmark)'),
(7901,0,3,4,34,0,100,0,8,1,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Swashbuckler - On Point 1 Reached - Set Home Position'),
(7901,0,4,0,61,0,100,0,8,1,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Swashbuckler - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7901,0,5,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Swashbuckler - On Aggro - Say Line 0'),
(7901,0,6,0,0,0,100,0,10000,25000,20000,30000,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Treasure Hunting Swashbuckler - IC - Cast ''Disarm'''),

(7902,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Buccaneer - On Just Summoned - Set Active On'),
(7902,0,1,2,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Buccaneer - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7902,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,20,142189,0,0,0,0,0,0,0,'Treasure Hunting Buccaneer - Linked - Move To Point 1 (Inconspicuous Landmark)'),
(7902,0,3,4,34,0,100,0,8,1,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Buccaneer - On Point 1 Reached - Set Home Position'),
(7902,0,4,0,61,0,100,0,8,1,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Buccaneer - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(7902,0,5,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Treasure Hunting Buccaneer - On Aggro - Say Line 0'),
(7902,0,6,0,0,0,100,0,3000,7000,8000,18000,0,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Treasure Hunting Buccaneer - IC - Cast ''Strike''');
