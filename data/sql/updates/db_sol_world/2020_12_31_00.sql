-- DB update 2020_12_30_08 -> 2020_12_31_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_30_08';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_30_08 2020_12_31_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609370819010452359'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609370819010452359');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (23714,23592,4378,4379,23873,4356,4357,3414,3376,3459,4128,3466,3476,3455,3454,3386,3385,8236,6020,3382,6494,3384,3383,4316,3286,3283,7288,7307,7308,7310,7287,7067,3282,3471,3284,3285,3244,3241,3245,3280,3278,3276,3242,3246,3425,3255,3248,3426,4127,3463,4129);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (23714,23592,4378,4379,23873,4356,4357,3414,3376,3459,4128,3466,3476,3455,3454,3386,3385,8236,6020,3382,6494,3384,3383,4316,3286,3283,7288,7307,7308,7310,7287,7067,3282,3471,3284,3285,3244,3241,3245,3280,3278,3276,3242,3246,3425,3255,3248,3426,4127,3463,4129) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23714,0,0,0,0,0,100,0,0,0,8400,9200,0,11,9532,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Elder - IC - Cast ''Lightning Bolt'''),
(23714,0,1,0,2,0,100,1,0,60,0,0,0,11,11986,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimtotem Elder - Between 0-60% Health - Cast ''Healing Wave'' (No Repeat)'),

(23592,0,0,0,0,0,100,0,3400,4000,10800,12400,0,11,43108,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grimtotem Breaker - IC - Cast ''Bone Breaker'''),

(4378,0,0,0,0,0,100,1,0,0,0,0,0,11,43133,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Darkmist Recluse - IC - Cast ''Debilitating Poison'' (No Repeat)'),

(4379,0,0,0,0,0,100,1,0,0,0,0,0,11,745,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Darkmist Silkspinner - IC - Cast ''Web'' (No Repeat)'),
(4379,0,1,0,0,0,100,0,2400,2800,32400,32800,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Darkmist Silkspinner - IC - Cast ''Poison'''),

(23873,0,0,0,0,0,100,1,0,0,0,0,0,11,53625,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Goreclaw the Ravenous - IC - Cast ''Heroic Leap'' (No Repeat)'),
(23873,0,1,0,0,0,100,0,2600,2900,17600,17900,0,11,32019,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Goreclaw the Ravenous - IC - Cast ''Gore'''),

(4356,0,0,0,0,0,100,0,2300,2600,32300,32600,0,11,3427,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bloodfen Razormaw - IC - Cast ''Infected Wound'''),

(4357,0,0,0,0,0,100,0,2200,2800,22200,22800,0,11,6607,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bloodfen Lashtail - IC - Cast ''Lash'''),

(3414,0,0,0,0,0,100,0,2200,2400,9600,9800,0,11,14873,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'General Twinbraid - IC - Cast ''Sinister Strike'''),

(3376,0,0,0,0,0,100,0,2100,3100,9100,10100,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Bael''dun Soldier - IC - Cast ''Strike'''),

(3459,0,0,0,0,0,100,0,2600,3300,9600,11200,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razormane Warfrenzy - IC - Cast ''Strike'''),

(4128,0,0,0,0,0,100,0,2100,2500,12100,12500,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hecklefang Stalker - IC - Cast ''Tendon Rip'''),

(3466,0,0,0,4,0,100,0,0,0,0,0,0,11,17498,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zhevra Courser - On Aggro - Cast ''Speed'''),

(3476,0,0,0,0,0,100,0,2400,2900,12400,12900,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Isha Awak - IC - Cast ''Thrash'''),

(3455,0,0,0,0,0,100,0,2300,2800,9400,9900,0,11,5679,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cannoneer Whessan - IC - Cast ''Torch Burn'''),

(3454,0,0,0,0,0,100,0,2300,2800,9400,9900,0,11,5679,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cannoneer Smythe - IC - Cast ''Torch Burn'''),

(3386,0,0,0,0,0,100,0,0,0,8400,8900,0,11,9734,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Theramore Preserver - IC - Cast ''Holy Smite'''),
(3386,0,1,0,2,0,100,1,0,70,0,0,0,11,11640,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Preserver - Between 0-70% Health - Cast ''Renew'' (No Repeat)'),
(3386,0,2,0,2,0,100,1,0,30,0,0,0,11,11642,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Preserver - Between 0-30% Health - Cast ''Heal'' (No Repeat)'),

(3385,0,0,0,4,0,100,0,0,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Marine - On Aggro - Cast ''Defensive Stance'''),
(3385,0,1,0,0,0,100,0,6100,6400,12800,15200,0,11,72,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Theramore Marine - IC - Cast ''Shield Bash'''),
(3385,0,2,0,2,0,100,1,0,40,0,0,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Theramore Marine - Between 0-40% Health - Cast ''Disarm'' (No Repeat)'),

(8236,0,0,0,2,0,100,1,0,30,0,0,0,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Muck Frenzy - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),

(6020,0,0,0,0,0,100,0,2400,2900,12100,13100,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Slimeshell Makrura - IC - Cast ''Thrash'''),

(3382,0,0,0,0,0,100,0,2100,2500,2100,2500,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Southsea Cannoneer - IC - Cast ''Shoot'''),
(3382,0,1,0,9,0,100,0,4,30,1,1,0,79,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southsea Cannoneer - Within 4-30 Range - Set Ranged Movement'),
(3382,0,2,0,9,0,100,0,0,4,1,1,0,79,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southsea Cannoneer - Within 0-4 Range - Set Ranged Movement'),

(6494,0,0,0,2,0,100,1,0,60,0,0,0,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Tazan - Between 0-60% Health - Cast ''Backhand'' (No Repeat)'),

(3384,0,0,0,0,0,100,1,0,0,0,0,0,11,3011,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Southsea Privateer - IC - Cast ''Fire Shot'' (No Repeat)'),
(3384,0,1,0,0,0,100,0,2100,2500,2100,2500,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Southsea Privateer - IC - Cast ''Shoot'''),
(3384,0,2,0,9,0,100,0,4,30,1,1,0,79,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southsea Privateer - Within 4-30 Range - Set Ranged Movement'),
(3384,0,3,0,9,0,100,0,0,4,1,1,0,79,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southsea Privateer - Within 0-4 Range - Set Ranged Movement'),

(3383,0,0,0,0,0,100,0,2100,2300,32100,32300,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Southsea Cutthroat - IC - Cast ''Poison'''),

(4316,0,0,0,0,0,100,0,2100,2400,12100,13100,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Kolkar Packhound - IC - Cast ''Tendon Rip'''),

(3286,0,0,0,0,0,100,0,2100,2300,32100,32300,0,11,744,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Overseer - IC - Cast ''Poison'''),

(3283,0,0,0,0,0,100,1,5000,8000,0,0,0,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Enforcer - IC - Cast ''Battle Shout'' (No Repeat)'),
(3283,0,1,0,2,0,100,1,0,40,0,0,0,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Enforcer - Between 0-40% Health - Cast ''Disarm'' (No Repeat)'),

(7288,0,0,0,0,0,100,0,2400,2800,12400,12800,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Grand Foreman Puzik Gallywix - IC - Cast ''Strike'''),

(7307,0,0,0,0,0,100,0,2500,3500,12500,14500,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Lookout - IC - Cast ''Thrash'''),

(7308,0,0,0,0,0,100,1,0,0,0,0,0,11,12024,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Patroller - IC - Cast ''Net'' (No Repeat)'),

(7310,0,0,0,0,0,100,0,2500,3000,13000,14000,0,11,12057,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mutated Venture Co. Drone - IC - Cast ''Strike'''),

(7287,0,0,0,0,0,100,0,2400,3000,12400,13000,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Foreman Silixiz - IC - Cast ''Thrash'''),

(7067,0,0,0,0,0,100,0,3800,4900,9800,13800,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Drone - IC - Cast ''Thrash'''),

(3282,0,0,0,0,0,100,0,2100,2500,2100,2500,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Venture Co. Mercenary - IC - Cast ''Shoot'''),
(3282,0,1,0,9,0,100,0,4,30,1,1,0,79,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Mercenary - Within 4-30 Range - Set Ranged Movement'),
(3282,0,2,0,9,0,100,0,0,4,1,1,0,79,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Mercenary - Within 0-4 Range - Set Ranged Movement'),

(3471,0,0,0,0,0,100,1,0,0,0,0,0,11,12024,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Tinkerer Sniggles - IC - Cast ''Net'' (No Repeat)'),

(3284,0,0,0,0,0,100,0,2500,3500,12500,14500,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Drudger - IC - Cast ''Thrash'''),

(3285,0,0,0,0,0,100,0,2500,3500,12500,14500,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Venture Co. Peon - IC - Cast ''Thrash'''),

(3244,0,0,0,2,0,100,1,0,60,0,0,0,11,7272,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Greater Plainstrider - Between 0-60% Health - Cast ''Dust Cloud'' (No Repeat)'),

(3241,0,0,0,4,0,100,0,0,0,0,0,0,11,17498,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Savannah Patriarch - On Aggro - Cast ''Speed'''),

(3245,0,0,0,2,0,100,1,0,30,0,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ornery Plainstrider - Between 0-30% Health - Cast ''Frenzy'' (No Repeat)'),

(3280,0,0,0,2,0,100,1,0,80,0,0,0,11,6728,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Witchwing Windcaller - Between 0-80% Health - Cast ''Enveloping Winds'' (No Repeat)'),

(3278,0,0,0,0,0,100,1,4000,6500,0,0,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Witchwing Slayer - IC - Cast ''Demoralizing Shout'' (No Repeat)'),
(3278,0,1,0,12,0,100,1,0,20,0,0,0,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Witchwing Slayer - Target Between 0-20% Health - Cast ''Execute'' (No Repeat)'),

(3276,0,0,0,2,0,100,1,0,80,0,0,0,11,7098,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Witchwing Harpy - Between 0-80% Health - Cast ''Curse of Mending'' (No Repeat)'),

(3242,0,0,0,4,0,100,0,0,0,0,0,0,11,17498,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zhevra Runner - On Aggro - Cast ''Speed'''),

(3246,0,0,0,4,0,100,0,0,0,0,0,0,11,17498,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fleeting Plainstrider - On Aggro - Cast ''Speed'''),

(3425,0,0,0,4,0,100,0,0,0,0,0,0,11,17498,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Savannah Prowler - On Aggro - Cast ''Speed'''),

(3255,0,0,0,4,0,100,0,0,0,0,0,0,11,17498,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sunscale Screecher - On Aggro - Cast ''Speed'''),

(3248,0,0,0,4,0,100,0,0,0,0,0,0,11,17498,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Barrens Giraffe - On Aggro - Cast ''Speed'''),

(3426,0,0,0,4,0,100,0,0,0,0,0,0,11,17498,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zhevra Charger - On Aggro - Cast ''Speed'''),

(4127,0,0,0,0,0,100,0,2100,2400,12100,13100,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hecklefang Hyena - IC - Cast ''Tendon Rip'''),

(3463,0,0,0,4,0,100,0,0,0,0,0,0,11,17498,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wandering Barrens Giraffe - On Aggro - Cast ''Speed'''),

(4129,0,0,0,0,0,100,0,2100,2400,12100,13100,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Hecklefang Snarler - IC - Cast ''Tendon Rip'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
