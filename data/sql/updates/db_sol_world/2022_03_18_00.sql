-- DB update 2022_03_17_00 -> 2022_03_18_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_17_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_17_00 2022_03_18_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1647587591368207373'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1647587591368207373');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4983,4980,5044,5045,5046);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (498300,498301,498302,498000,498001,504500,504600);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4983,0,0,0,11,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Respawn - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(4983,0,1,0,19,0,100,0,1273,0,0,0,0,80,498300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Quest ''Questioning Reethe'' Accepted - Call Timed Action List'),
(4983,0,2,0,40,0,100,0,13,4983,0,0,0,80,498301,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On WP 13 Reached - Call Timed Action List'),
(4983,0,3,0,58,0,100,0,0,4983,0,0,0,80,498302,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On WP Path Ended - Call Timed Action List'),
(4983,0,4,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Ogron - On Data Set 1 1 - Set Orientation (Paval Reethe)'),
(4983,0,5,0,4,0,100,0,0,0,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Aggro - Say Line 8'),
(4983,0,6,7,6,0,100,0,0,0,0,0,0,6,1273,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Ogron - On Death - Fail Quest ''Questioning Reethe'' (Stored Target 1)'),
(4983,0,7,8,61,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,4980,0,0,0,0,0,0,0,'Ogron - Linked - Set Data 2 2 (Paval Reethe)'),
(4983,0,8,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - Linked - Set Active On'),

(498300,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Set Active On'),
(498300,9,1,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(498300,9,2,0,0,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Set Faction ''Escortee'''),
(498300,9,3,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(498300,9,4,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ogron - On Script - Store Target 1 (Invoker)'),
(498300,9,5,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Ogron - On Script - Say Line 0 (Stored Target 1)'),
(498300,9,6,0,0,0,100,0,0,0,0,0,0,53,0,4983,0,0,0,2,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Start WP Movement'),

(498301,9,0,0,0,0,100,0,0,0,0,0,0,54,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Pause WP Movement'),
(498301,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,6.281,'Ogron - On Script - Set Orientation'),
(498301,9,2,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Say Line 1'),

(498302,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,4980,0,0,0,0,0,0,0,'Ogron - On Script - Say Line 0 (Paval Reethe)'),
(498302,9,1,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Ogron - On Script - Say Line 1 (Paval Reethe)'),
(498302,9,2,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Say Line 2'),
(498302,9,3,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Ogron - On Script - Say Line 2 (Paval Reethe)'),
(498302,9,4,0,0,0,100,0,8000,8000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Say Line 3'),
(498302,9,5,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Ogron - On Script - Say Line 3 (Paval Reethe)'),
(498302,9,6,0,0,0,100,0,3000,3000,0,0,0,1,4,0,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Ogron - On Script - Say Line 4 (Paval Reethe)'),
(498302,9,7,0,0,0,100,0,4000,4000,0,0,0,1,5,0,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Ogron - On Script - Say Line 5 (Paval Reethe)'),
(498302,9,8,0,0,0,100,0,2000,2000,0,0,0,12,5045,4,45000,0,0,0,8,0,0,0,0,-3384.6,-3211.34,34.868,0,'Ogron - On Script - Summon Creature ''Private Hallan'''),
(498302,9,9,0,0,0,100,0,0,0,0,0,0,12,5044,4,45000,0,0,0,8,0,0,0,0,-3384.44,-3208.48,34.849,0,'Ogron - On Script - Summon Creature ''Theramore Skirmisher'''),
(498302,9,10,0,0,0,100,0,0,0,0,0,0,12,5044,4,45000,0,0,0,8,0,0,0,0,-3385.62,-3209.87,34.904,0,'Ogron - On Script - Summon Creature ''Theramore Skirmisher'''),
(498302,9,11,0,0,0,100,0,0,0,0,0,0,12,5046,4,45000,0,0,0,8,0,0,0,0,-3381.5,-3209.2,35.037,0,'Ogron - On Script - Summon Creature ''Lieutenant Caldwell'''),
(498302,9,12,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Ogron - On Script - Set Data 1 1 (Paval Reethe)'),
(498302,9,13,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,5046,20,0,0,0,0,0,0,'Ogron - On Script - Set Orientation (Lieutenant Caldwell)'),
(498302,9,14,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,19,5046,20,0,0,0,0,0,0,'Ogron - On Script - Say Line 0 (Lieutenant Caldwell)'),
(498302,9,15,0,0,0,100,0,9000,9000,0,0,0,1,1,0,0,0,0,0,19,5046,20,0,0,0,0,0,0,'Ogron - On Script - Say Line 1 (Lieutenant Caldwell)'),
(498302,9,16,0,0,0,100,0,2000,2000,0,0,0,45,1,1,0,0,0,0,19,5045,20,0,0,0,0,0,0,'Ogron - On Script - Set Data 1 1 (Private Hallan)'),
(498302,9,17,0,0,0,100,0,25000,25000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Say Line 5'),
(498302,9,18,0,0,0,100,0,2000,2000,0,0,0,1,8,0,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Ogron - On Script - Say Line 8 (Paval Reethe)'),
(498302,9,19,0,0,0,100,0,12000,12000,0,0,0,51,0,0,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Ogron - On Script - Kill Unit (Paval Reethe)'),
(498302,9,20,0,0,0,100,0,3000,3000,0,0,0,84,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Say Line 6'),
(498302,9,21,0,0,0,100,0,0,0,0,0,0,15,1273,0,0,0,0,0,17,0,15,0,0,0,0,0,0,'Ogron - On Script - Reward Quest ''Questioning Reethe'''),
(498302,9,22,0,0,0,100,0,7000,7000,0,0,0,84,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Say Line 7'),
(498302,9,23,0,0,0,100,0,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ogron - On Script - Force Despawn'),

(4980,0,0,0,11,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Paval Reethe - On Respawn - Set Emote State ''ONESHOT_NONE'''),
(4980,0,1,0,8,0,100,0,7105,0,0,0,0,80,498000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Paval Reethe - On Spellhit ''Fake Shot'' - Call Timed Action List'),
(4980,0,2,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,19,5046,20,0,0,0,0,0,0,'Paval Reethe - On Data Set 1 1 - Set Orientation (Lieutenant Caldwell)'),
(4980,0,3,0,38,1,100,0,2,2,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Paval Reethe - On Data Set 2 2 - Die (Event Phase 1)'),

(498000,9,0,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Paval Reethe - On Script - Set Event Phase 1'),
(498000,9,1,0,0,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Paval Reethe - On Script - Say Line 6'),
(498000,9,2,0,0,0,100,0,4000,4000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Paval Reethe - On Script - Say Line 7'),
(498000,9,3,0,0,0,100,0,0,0,0,0,0,17,93,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Paval Reethe - On Script - Set Emote State ''STATE_STUN_NOSHEATHE'''),
(498000,9,4,0,0,0,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,19,5046,20,0,0,0,0,0,0,'Paval Reethe - On Script - Say Line 2 (Lieutenant Caldwell)'),
(498000,9,5,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,19,4983,20,0,0,0,0,0,0,'Paval Reethe - On Script - Set Data 1 1 (Ogron)'),
(498000,9,6,0,0,0,100,0,1000,1000,0,0,0,1,4,0,0,0,0,0,19,4983,20,0,0,0,0,0,0,'Paval Reethe - On Script - Say Line 4 (Ogron)'),
(498000,9,7,0,0,0,100,0,3000,3000,0,0,0,2,16,0,0,0,0,0,19,5045,20,0,0,0,0,0,0,'Paval Reethe - On Script - Set Faction ''Monster'' (Private Hallan)'),
(498000,9,8,0,0,0,100,0,0,0,0,0,0,2,16,0,0,0,0,0,11,5044,20,0,0,0,0,0,0,'Paval Reethe - On Script - Set Faction ''Monster'' (Theramore Skirmisher)'),
(498000,9,9,0,0,0,100,0,0,0,0,0,0,2,16,0,0,0,0,0,19,5046,20,0,0,0,0,0,0,'Paval Reethe - On Script - Set Faction ''Monster'' (Lieutenant Caldwell)'),

(5044,0,0,1,54,0,100,0,0,0,0,0,0,46,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Skirmisher - On Just Summoned - Move Forward'),
(5044,0,1,0,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Skirmisher - Linked - Set Run Off'),

(5045,0,0,1,54,0,100,0,0,0,0,0,0,46,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hallan - On Just Summoned - Move Forward'),
(5045,0,1,0,61,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hallan - Linked - Set Run Off'),
(5045,0,2,3,38,0,100,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hallan - On Data Set 1 1 - Say Line 0'),
(5045,0,3,0,61,0,100,0,0,0,0,0,0,11,7105,0,0,0,0,0,19,4980,20,0,0,0,0,0,0,'Private Hallan - Linked - Cast ''Fake Shot'' (Paval Reethe)'),

(5046,0,0,0,54,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-3373.98,-3210.88,34.711,0,'Lieutenant Caldwell - On Just Summoned - Move To Position');

DELETE FROM `waypoints` WHERE `entry` = 4983;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(4983,1,-3323.27,-3127.02,34.4515,'Ogron - Quest ''Questioning Reethe'''),
(4983,2,-3326.52,-3127.97,34.4948,NULL),
(4983,3,-3332.97,-3129.87,31.8828,NULL),
(4983,4,-3340.81,-3132.17,30.7453,NULL),
(4983,5,-3349.78,-3134.81,28.5267,NULL),
(4983,6,-3359.17,-3140.31,30.8362,NULL),
(4983,7,-3366.01,-3144.31,35.2659,NULL),
(4983,8,-3366.7,-3154.64,35.6094,NULL),
(4983,9,-3367.34,-3164.1,35.9618,NULL),
(4983,10,-3369.71,-3169.93,36.3928,NULL),
(4983,11,-3371.86,-3175.22,35.608,NULL),
(4983,12,-3374.83,-3182.53,34.3004,NULL),
(4983,13,-3378.53,-3191.64,35.7204,'Pause'),
(4983,14,-3370.92,-3190.48,34.1671,NULL),
(4983,15,-3369.77,-3195.86,34.9534,NULL),
(4983,16,-3368.32,-3202.63,34.866,NULL),
(4983,17,-3366.86,-3209.47,33.9713,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
