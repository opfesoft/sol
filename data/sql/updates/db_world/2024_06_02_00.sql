DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16907 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16871 AND `id` = 3;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 19424 AND `id` = 4;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (16873,19422,19440);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16907,0,1,0,4,0,20,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bleeding Hollow Peon - On Aggro - Say Line 0'),

(16873,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bleeding Hollow Dark Shaman - OOC - Cast ''Lightning Shield'''),
(16873,0,1,0,4,0,20,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bleeding Hollow Dark Shaman - On Aggro - Say Line 0'),
(16873,0,2,0,0,0,100,0,0,0,3000,5000,0,11,20825,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bleeding Hollow Dark Shaman - IC - Cast ''Shadow Bolt'''),
(16873,0,3,0,0,0,100,0,4000,8000,30000,45000,0,11,32062,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bleeding Hollow Dark Shaman - IC - Cast ''Fire Nova Totem'''),
(16873,0,4,0,2,0,100,0,0,30,0,0,0,11,6742,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bleeding Hollow Dark Shaman - Between 0-30% Health - Cast ''Bloodlust'''),
(16873,0,5,0,2,0,100,0,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bleeding Hollow Dark Shaman - Between 0-15% Health - Flee For Assist'),

(19422,0,0,0,4,0,20,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bleeding Hollow Necrolyte - On Aggro - Say Line 0'),
(19422,0,1,0,0,0,100,0,0,0,3000,5000,0,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bleeding Hollow Necrolyte - IC - Cast ''Fireball'''),
(19422,0,2,0,0,0,100,0,8000,12000,30000,45000,0,11,34073,32,0,0,0,0,5,0,0,0,0,0,0,0,0,'Bleeding Hollow Necrolyte - IC - Cast ''Curse of the Bleeding Hollow'''),
(19422,0,3,0,0,0,100,0,5000,15000,0,0,0,11,34018,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bleeding Hollow Necrolyte - IC - Cast ''Summon Bleeding Hollow Skeleton'''),
(19422,0,4,0,2,0,100,0,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bleeding Hollow Necrolyte - Between 0-15% Health - Flee For Assist'),
(19422,0,5,0,1,0,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,232,19460,0,0,0,0,0,0,0,'Bleeding Hollow Necrolyte - OOC - Force Despawn (Minion ''Bleeding Hollow Skeleton'')'),

(16871,0,3,0,4,0,20,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bleeding Hollow Grunt - On Aggro - Say Line 1'),

(19424,0,4,0,4,0,20,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bleeding Hollow Tormentor - On Aggro - Say Line 0'),

(19440,0,0,0,11,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eye of Grillok - On Respawn - Disable Auto Attack'),
(19440,0,1,0,0,0,100,0,0,0,0,0,0,25,2,50,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eye of Grillok - IC - Flee For Assist'),
(19440,0,2,0,237,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eye of Grillok - On Flee Finished - Force Despawn');
