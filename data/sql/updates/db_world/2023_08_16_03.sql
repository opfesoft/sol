UPDATE `creature_model_info` SET `BoundingRadius` = 2.29167, `CombatReach` = 16.875 WHERE `DisplayID` = 20746;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (22038,22482);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2203800,2248200);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22038,0,0,1,4,0,100,0,0,0,0,0,0,28,37989,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - On Aggro - Remove Aura ''Tunnel Bore Bone Passive'''),
(22038,0,1,2,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - Linked - Set Root On'),
(22038,0,2,3,61,0,100,0,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - Linked - Remove ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(22038,0,3,0,61,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - Linked - Remove ''UNIT_STAND_STATE_SUBMERGED'''),
(22038,0,4,0,9,0,100,0,1,50,2000,3500,0,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hai''shulud - Within 1-50 Range - Cast ''Poison'''),
(22038,0,5,0,0,0,100,0,1000,6000,8000,11000,0,11,32738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hai''shulud - IC - Cast ''Bore'''),
(22038,0,6,8,7,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - On Evade - Set Root Off'),
(22038,0,7,8,11,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - On Respawn - Set Root Off'),
(22038,0,8,9,61,0,100,0,0,0,0,0,0,11,37989,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - Linked - Cast ''Tunnel Bore Bone Passive'''),
(22038,0,9,10,61,0,100,0,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - Linked - Set ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(22038,0,10,0,61,0,100,0,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - Linked - Set ''UNIT_STAND_STATE_SUBMERGED'''),
(22038,0,11,0,54,0,100,0,0,0,0,0,0,80,2203800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - On Just Summoned - Call Timed Action List'),

(2203800,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - On Script - Set Active On'),
(2203800,9,1,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - On Script - Set React State ''Passive'''),
(2203800,9,2,0,0,0,100,0,2000,2000,0,0,0,3,0,20746,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - On Script - Morph To Model 20746'),
(2203800,9,3,0,0,0,100,0,2000,2000,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hai''shulud - On Script - Set React State ''Aggressive'''),

(22482,0,0,1,4,0,100,0,0,0,0,0,0,28,37989,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - On Aggro - Remove Aura ''Tunnel Bore Bone Passive'''),
(22482,0,1,2,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - Linked - Set Root On'),
(22482,0,2,3,61,0,100,0,0,0,0,0,0,19,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - Linked - Remove ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(22482,0,3,0,61,0,100,0,0,0,0,0,0,91,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - Linked - Remove ''UNIT_STAND_STATE_SUBMERGED'''),
(22482,0,4,0,9,0,100,0,1,50,2000,3500,0,11,31747,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mature Bone Sifter - Within 1-50 Range - Cast ''Poison'''),
(22482,0,5,0,0,0,100,0,1000,6000,8000,11000,0,11,32738,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mature Bone Sifter - IC - Cast ''Bore'''),
(22482,0,6,8,7,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - On Evade - Set Root Off'),
(22482,0,7,8,11,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - On Respawn - Set Root Off'),
(22482,0,8,9,61,0,100,0,0,0,0,0,0,11,37989,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - Linked - Cast ''Tunnel Bore Bone Passive'''),
(22482,0,9,10,61,0,100,0,0,0,0,0,0,18,33554434,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - Linked - Set ''UNIT_FLAG_NON_ATTACKABLE'' & ''UNIT_FLAG_NOT_SELECTABLE'''),
(22482,0,10,0,61,0,100,0,0,0,0,0,0,90,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - Linked - Set ''UNIT_STAND_STATE_SUBMERGED'''),
(22482,0,11,0,54,0,100,0,0,0,0,0,0,80,2248200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - On Just Summoned - Call Timed Action List'),

(2248200,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - On Script - Set Active On'),
(2248200,9,1,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - On Script - Set React State ''Passive'''),
(2248200,9,2,0,0,0,100,0,2000,2000,0,0,0,3,0,20617,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - On Script - Morph To Model 20617'),
(2248200,9,3,0,0,0,100,0,2000,2000,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mature Bone Sifter - On Script - Set React State ''Aggressive''');
