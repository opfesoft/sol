-- DB update 2022_03_25_00 -> 2022_03_26_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_25_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_25_00 2022_03_26_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648313409520043789'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648313409520043789');

UPDATE `creature_template` SET `gossip_menu_id` = 3692 WHERE `entry` = 3692;
DELETE FROM `gossip_menu` WHERE `MenuID` = 3692 AND `TextID` IN (3213,3214);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(3692,3213),
(3692,3214);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (3692,3693,3694,3695,-37101);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (369200,369201,369202,369203,369300,369301,369302,369400,369500,369501);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3692,0,0,0,19,0,100,0,994,0,0,0,0,80,369200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Quest ''Escape Through Force'' Accepted - Call Timed Action List'),
(3692,0,1,0,19,0,100,0,995,0,0,0,0,80,369201,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Quest ''Escape Through Stealth'' Accepted - Call Timed Action List'),
(3692,0,2,0,40,0,100,0,35,369200,0,0,0,80,369202,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On WP 35 Reached - Call Timed Action List'),
(3692,0,3,0,58,0,100,0,0,369200,0,0,0,80,369203,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On WP Path Ended - Call Timed Action List'),
(3692,0,4,5,40,0,100,0,2,369201,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On WP 2 Reached - Force Despawn'),
(3692,0,5,6,61,0,100,0,0,0,0,0,0,15,995,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Volcor - Linked - Reward Quest ''Escape Through Stealth'''),
(3692,0,6,7,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - Linked - Say Line 2'),
(3692,0,7,0,61,0,100,0,0,0,0,0,0,11,6298,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - Linked - Cast Spell ''Form of the Moonstalker'''),
(3692,0,8,0,4,0,30,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Aggro - Say Line 4'),
(3692,0,9,0,40,0,100,0,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On WP Reached - Remove ''UNIT_STAND_STATE_SIT'''),

(369200,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Volcor - On Script - Store Target 1 (Invoker)'),
(369200,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Set Active On'),
(369200,9,2,0,0,0,100,0,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Remove ''UNIT_STAND_STATE_SIT'''),
(369200,9,3,0,0,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(369200,9,4,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(369200,9,5,0,0,0,100,0,0,0,0,0,0,1,3,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Volcor - On Script - Say Line 3'),
(369200,9,6,0,0,0,100,0,0,0,0,0,0,53,0,369200,0,0,0,2,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Start WP Movement'),

(369201,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Volcor - On Script - Store Target 1 (Invoker)'),
(369201,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Set Active On'),
(369201,9,2,0,0,0,100,0,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Remove ''UNIT_STAND_STATE_SIT'''),
(369201,9,3,0,0,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(369201,9,4,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(369201,9,5,0,0,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Volcor - On Script - Say Line 1'),
(369201,9,6,0,0,0,100,0,0,0,0,0,0,53,0,369201,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Start WP Movement'),

(369202,9,0,0,0,0,100,0,0,0,0,0,0,54,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Pause WP Movement'),
(369202,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Volcor - On Script - Set Orientation (Target 1)'),
(369202,9,2,0,0,0,100,0,1000,1000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Say Line 5'),
(369202,9,3,0,0,0,100,0,0,0,0,0,0,15,994,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Volcor - On Script - Reward Quest ''Escape Through Force'' (Target 1)'),

(369203,9,0,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,3695,0,0,0,0,0,0,0,'Volcor - On Script - Set Data 1 1 (Grimclaw)'),
(369203,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,19,3695,0,0,0,0,0,0,0,'Volcor - On Script - Set Orientation (Grimclaw)'),
(369203,9,2,0,0,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,19,3695,0,0,0,0,0,0,0,'Volcor - On Script - Say Line 6'),
(369203,9,3,0,0,0,100,0,7000,7000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Say Line 0'),
(369203,9,4,0,0,0,100,0,15000,15000,0,0,0,41,0,0,0,0,0,0,19,3695,0,0,0,0,0,0,0,'Volcor - On Script - Force Despawn (Grimclaw)'),
(369203,9,5,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Volcor - On Script - Force Despawn'),

(3693,0,0,0,20,0,100,0,995,0,0,0,0,12,3694,8,0,0,0,0,8,0,0,0,0,6339.14,341.764,24.3387,0.498114,'Terenthis - On Quest ''Escape Through Stealth'' Rewarded - Summon Creature ''Sentinel Selarin'''),
(3693,0,1,0,20,0,100,0,994,0,0,0,0,12,3694,8,0,0,0,0,8,0,0,0,0,6339.14,341.764,24.3387,0.498114,'Terenthis - On Quest ''Escape Through Force'' Rewarded - Summon Creature ''Sentinel Selarin'''),
(3693,0,2,0,20,0,100,0,985,0,0,0,0,80,369300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terenthis - On Quest ''How Big a Threat?'' (Part 2) Rewarded - Call Timed Action List'),
(3693,0,3,0,20,0,100,0,986,0,0,0,0,80,369301,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terenthis - On ''Quest A Lost Master'' (Part 1) Rewarded - Call Timed Action List'),
(3693,0,4,0,19,0,100,0,993,0,0,0,0,80,369302,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terenthis - On ''Quest A Lost Master'' (Part 2) Accepted - Call Timed Action List'),

(369300,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terenthis - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(369300,9,1,0,0,0,100,0,0,0,0,0,0,12,3695,8,0,0,0,0,8,0,0,0,0,6402.48,368.301,16.3091,1.0602,'Terenthis - On Script - Summon Creature ''Grimclaw'''),
(369300,9,2,0,0,0,100,0,50000,50000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terenthis - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(369301,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terenthis - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(369301,9,1,0,0,0,100,0,1000,1000,0,0,0,1,8,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Terenthis - On Script - Say Line 8'),
(369301,9,2,0,0,0,100,0,3000,3000,0,0,0,1,9,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Terenthis - On Script - Say Line 9'),
(369301,9,3,0,0,0,100,0,3000,3000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terenthis - On Script - Set Emote State ''STATE_USESTANDING'''),
(369301,9,4,0,0,0,100,0,6000,6000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terenthis - On Script - Set Emote State ''ONESHOT_NONE'''),
(369301,9,5,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terenthis - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),

(369302,9,0,0,0,0,100,0,0,0,0,0,0,1,10,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Terenthis - On Script - Say Line 10'),
(369302,9,1,0,0,0,100,0,0,0,0,0,0,11,6236,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Terenthis - On Script - Cast ''Form of the Moonstalker'''),
(369302,9,2,0,0,0,100,0,2000,2000,0,0,0,1,11,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Terenthis - On Script - Say Line 11'),

(3694,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Just Summoned - Set Active On'),
(3694,0,1,2,61,0,100,0,0,0,0,0,0,53,1,3694,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - Linked - Start WP Movement'),
(3694,0,2,0,61,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - Linked - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(3694,0,3,0,40,0,100,0,19,3694,0,0,0,80,369400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On WP 19 Reached - Call Timed Action List'),
(3694,0,4,0,58,0,100,0,0,3694,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On WP Path Ended - Force Despawn'),

(369400,9,0,0,0,0,100,0,0,0,0,0,0,54,120000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Pause WP Movement'),
(369400,9,1,0,0,0,100,0,1000,1000,0,0,0,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Sheath Weapon'),
(369400,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Say Line 0'),
(369400,9,3,0,0,0,100,0,7000,7000,0,0,0,1,7,0,0,0,0,0,19,3693,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Say Line 7 (Terenthis)'),
(369400,9,4,0,0,0,100,0,7000,7000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Say Line 1'),
(369400,9,5,0,0,0,100,0,7000,7000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Say Line 2'),
(369400,9,6,0,0,0,100,0,2000,2000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(369400,9,7,0,0,0,100,0,90000,90000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Say Line 3'),
(369400,9,8,0,0,0,100,0,5000,5000,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(369400,9,9,0,0,0,100,0,1000,1000,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentinel Selarin - On Script - Ready Melee Weapon'),

(-37101,0,0,0,22,0,100,0,101,50000,50000,0,0,80,369501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Received Emote ''WAVE'' - Call Timed Action List'),
(-37101,0,1,0,38,0,100,0,1,1,0,0,0,69,0,0,0,1,0,0,7,0,0,0,0,0,0,0,0.1,'Grimclaw - Data Set 1 1 - Move To Position (Invoker)'),

(3695,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Just Summoned - Set Active On'),
(3695,0,1,0,61,0,100,0,0,0,0,0,0,53,1,3695,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - Linked - Start WP Movement'),
(3695,0,2,0,40,0,100,0,1,3695,0,0,0,1,0,0,0,0,0,0,19,3693,0,0,0,0,0,0,0,'Grimclaw - On WP 1 Reached - Say Line 0 (Terenthis)'),
(3695,0,3,0,40,0,100,0,9,3695,0,0,0,80,369500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On WP 9 Reached - Call Timed Action List'),
(3695,0,4,0,58,0,100,0,0,3695,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On WP Path Ended - Force Despawn'),

(369500,9,0,0,0,0,100,0,0,0,0,0,0,54,43000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Pause WP Movement'),
(369500,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 0'),
(369500,9,2,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,19,3693,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 1 (Terenthis)'),
(369500,9,3,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 1'),
(369500,9,4,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,19,3693,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 2 (Terenthis)'),
(369500,9,5,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,19,3693,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 3 (Terenthis)'),
(369500,9,6,0,0,0,100,0,1000,1000,0,0,0,86,6238,0,19,3693,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Cross Cast ''Speak with Animals'''),
(369500,9,7,0,0,0,100,0,2000,2000,0,0,0,1,4,0,0,0,0,0,19,3693,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 4 (Terenthis)'),
(369500,9,8,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 2'),
(369500,9,9,0,0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,19,3693,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 5 (Terenthis)'),
(369500,9,10,0,0,0,100,0,7000,7000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 3'),
(369500,9,11,0,0,0,100,0,5000,5000,0,0,0,1,6,0,0,0,0,0,19,3693,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 6 (Terenthis)'),

(369501,9,0,0,0,0,100,0,1000,1000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 4'),
(369501,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Set Orientation (Invoker)'),
(369501,9,2,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,4.01203,'Grimclaw - On Script - Set Orientation'),
(369501,9,3,0,0,0,100,0,1000,1000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Say Line 5'),
(369501,9,4,0,0,0,100,0,5000,5000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimclaw - On Script - Evade');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (3693,-37101);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 3692;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,3693,0,0,29,1,3694,100,0,1,0,0,'Terenthis - Group 0: Execute SAI ID 0 only if ''Sentinel Selarin'' is not nearby'),
(22,2,3693,0,0,29,1,3694,100,0,1,0,0,'Terenthis - Group 0: Execute SAI ID 1 only if ''Sentinel Selarin'' is not nearby'),

(22,1,-37101,0,0,47,0,993,2,0,0,0,0,'Grimclaw - Group 0: Execute SAI ID 0 only if quest ''A Lost Master'' (Part 2) is completed'),

(14,3692,3213,0,0,47,0,993,64,0,1,0,0,'Volcor - Group 0: Show gossip text 3213 if quest ''A Lost Master'' (Part 2) is not rewarded'),

(14,3692,3214,0,0,47,0,993,64,0,0,0,0,'Volcor - Group 0: Show gossip text 3214 if quest ''A Lost Master'' (Part 2) is rewarded'),
(14,3692,3214,0,0,47,0,994,64,0,1,0,0,'Volcor - Group 0: Show gossip text 3214 if quest ''Escape Through Force'' is not rewarded'),
(14,3692,3214,0,0,47,0,995,64,0,1,0,0,'Volcor - Group 0: Show gossip text 3214 if quest ''Escape Through Stealth'' is not rewarded');

DELETE FROM `waypoints` WHERE `entry` IN (3692,369200,369201,3695,369500,3694);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(369200,1,4604.17,-4.33054,69.5229,'Volcor - Quest ''Escape Through Force'''),
(369200,2,4607.27,4.94939,70.1223,NULL),
(369200,3,4611.45,12.4407,69.453,NULL),
(369200,4,4613.81,16.6638,70.6562,NULL),
(369200,5,4618.13,24.4018,70.7224,NULL),
(369200,6,4622.95,32.5303,69.5785,NULL),
(369200,7,4626.26,38.1105,69.0281,NULL),
(369200,8,4629.95,43.6425,68.4591,NULL),
(369200,9,4633.11,48.379,67.5631,NULL),
(369200,10,4634.3,55.1567,66.9605,NULL),
(369200,11,4635.63,62.7411,65.4889,NULL),
(369200,12,4637.2,71.7156,63.3412,NULL),
(369200,13,4639.75,76.9388,62.0869,NULL),
(369200,14,4642.51,82.5947,61.0418,NULL),
(369200,15,4645.39,88.5048,60.3851,NULL),
(369200,16,4650.41,93.8276,59.5227,NULL),
(369200,17,4655.28,98.998,58.6649,NULL),
(369200,18,4660.2,104.218,58.4603,NULL),
(369200,19,4665.18,108.074,58.0499,NULL),
(369200,20,4670.72,112.359,57.0993,NULL),
(369200,21,4675.33,115.93,56.8969,NULL),
(369200,22,4679.24,120.63,56.6884,NULL),
(369200,23,4684.09,126.45,55.9244,NULL),
(369200,24,4688.21,131.397,55.5033,NULL),
(369200,25,4692.44,135.918,55.0173,NULL),
(369200,26,4697.06,140.868,54.2172,NULL),
(369200,27,4701.45,145.562,53.2203,NULL),
(369200,28,4705.02,150.031,52.4275,NULL),
(369200,29,4709.21,155.279,52.0846,NULL),
(369200,30,4713.2,162.665,52.6526,NULL),
(369200,31,4716.9,169.528,53.5005,NULL),
(369200,32,4721.31,174.969,54.0867,NULL),
(369200,33,4725.44,180.07,54.7346,NULL),
(369200,34,4728.19,184.687,55.4932,NULL),
(369200,35,4734.01,194.431,55.3888,NULL),
(369200,36,4739.32,200.16,54.8311,NULL),
(369200,37,4743.45,204.611,54.1037,NULL),
(369200,38,4747.92,209.436,53.1076,NULL),

(369201,1,4604.17,-4.33054,69.5229,'Volcor - Quest ''Escape Through Stealth'''),
(369201,2,4607.27,4.94939,70.1223,NULL),
(369201,3,4612.49,14.2943,69.8441,NULL),

(3695,1,6409.01,381.597,13.7997,'Grimclaw - Quest ''How Big a Threat?'' (Part 2) - Summoned by Terenthis'),
(3695,2,6415.22,389.472,12.5587,NULL),
(3695,3,6422.38,398.542,11.1623,NULL),
(3695,4,6429.16,395.692,11.6041,NULL),
(3695,5,6430.53,392.118,12.881,NULL),
(3695,6,6432.15,387.875,13.9055,NULL),
(3695,7,6434.98,380.46,13.9422,NULL),
(3695,8,6437.87,372.912,13.9415,NULL),
(3695,9,6436.29,366.529,13.9415,NULL),
(3695,10,6437.87,372.912,13.9415,NULL),
(3695,11,6434.98,380.46,13.9422,NULL),
(3695,12,6432.15,387.875,13.9055,NULL),
(3695,13,6430.53,392.118,12.881,NULL),
(3695,14,6429.16,395.692,11.6041,NULL),
(3695,15,6422.38,398.542,11.1623,NULL),
(3695,16,6415.22,389.472,12.5587,NULL),
(3695,17,6409.01,381.597,13.7997,NULL),

(3694,1,6345.31,347.301,23.6466,'Sentinel Selarin - Quest ''Escape Through Stealth'' / ''Escape Through Force'' - Summoned by Terenthis'),
(3694,2,6353.39,354.557,22.3779,NULL),
(3694,3,6364.81,356.999,22.0936,NULL),
(3694,4,6372.83,358.213,21.1243,NULL),
(3694,5,6380.4,358.84,20.0845,NULL),
(3694,6,6387.81,359.455,18.9899,NULL),
(3694,7,6392.79,361.45,18.2076,NULL),
(3694,8,6398.12,363.588,17.366,NULL),
(3694,9,6403.68,370.92,15.6815,NULL),
(3694,10,6407.44,377.364,14.5471,NULL),
(3694,11,6412.09,385.326,13.1412,NULL),
(3694,12,6416.57,392.998,12.0215,NULL),
(3694,13,6424.95,399.193,10.9586,NULL),
(3694,14,6428.93,396.971,11.1736,NULL),
(3694,15,6430.55,392.607,12.727,NULL),
(3694,16,6432,388.708,13.7662,NULL),
(3694,17,6434.16,382.538,13.9415,NULL),
(3694,18,6436.71,375.264,13.9403,NULL),
(3694,19,6435.16,366.176,13.9403,NULL),
(3694,20,6436.9,374.833,13.9403,NULL),
(3694,21,6433.71,383.84,13.9403,NULL),
(3694,22,6431.63,389.723,13.5875,NULL),
(3694,23,6430.16,393.785,12.3123,NULL),
(3694,24,6428.84,397.45,11.0941,NULL),
(3694,25,6424,400.084,10.9784,NULL),
(3694,26,6418.77,396.365,11.4971,NULL),
(3694,27,6413.76,392.804,12.2825,NULL),
(3694,28,6410.46,386.242,13.1025,NULL),
(3694,29,6405.96,377.274,14.6778,NULL),
(3694,30,6401.4,368.195,16.4249,NULL),
(3694,31,6398.01,364.986,17.1999,NULL),
(3694,32,6393.69,360.887,18.1549,NULL),
(3694,33,6385.09,359.24,19.2917,NULL),
(3694,34,6377.21,357.731,20.6589,NULL),
(3694,35,6371.78,357.622,21.2469,NULL),
(3694,36,6365.67,357.5,22.0137,NULL),
(3694,37,6358.35,357.353,22.2106,NULL),
(3694,38,6352.65,354.652,22.3604,NULL),
(3694,39,6348.45,352.662,22.6056,NULL),
(3694,40,6343.5,347.714,23.5736,NULL),
(3694,41,6337.56,341.781,24.2942,NULL),
(3694,42,6330.39,334.611,25.1449,NULL),
(3694,43,6322.42,326.649,25.3338,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
