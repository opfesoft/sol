-- DB update 2021_07_26_00 -> 2021_07_29_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_26_00 2021_07_29_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1627595164563551497'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1627595164563551497');

-- Sironas: Remove old model, only use the new one
UPDATE `creature_template` SET `modelid1` = 29354, `modelid2` = 0 WHERE `entry` = 17678;

-- Sironas, Bloodmyst Tesla Coil: Set large
UPDATE `creature_template_addon` SET `isLarge` = 1 WHERE `entry` IN (17678,17979);

-- Demolitionist Legoso: Use another "Exodar" faction which allows to attack monsters; also increase mana and armor
UPDATE `creature_template` SET `faction` = 1647, `ManaModifier` = 6, `ArmorModifier` = 3 WHERE `entry` = 17982;

-- Sunhawk Agent, Sunhawk Saboteur: Disable random movement for those who are standing near a tent
UPDATE `creature` SET `MovementType` = 0, `wander_distance` = 0 WHERE `guid` IN (63313,63336,63338,63318,63322,63341,63335,63315,63319,63340,63323,63357);

DELETE FROM `creature_text` WHERE `CreatureId` IN (17982,17678);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17982,0,0,'There''s no turning back now, $n. Stay close and watch my back.',12,7,100,1,0,0,14648,0,'Demolitionist Legoso'),
(17982,1,0,'There it is! Do you see where the large red crystal is jutting out from the Vector Coil? That''s where I need to plant the first set of explosives.',12,7,100,25,0,0,14649,0,'Demolitionist Legoso'),
(17982,2,0,'Cover me!',12,7,100,5,0,0,14650,0,'Demolitionist Legoso'),
(17982,3,0,'It won''t be much longer, $n. Just keep them off me while I work.',12,7,100,0,0,0,14651,0,'Demolitionist Legoso'),
(17982,4,0,'That''ll do it! Quickly, take cover!',12,7,100,5,0,0,14652,0,'Demolitionist Legoso'),
(17982,5,0,'3...',12,7,100,0,0,0,14653,0,'Demolitionist Legoso'),
(17982,6,0,'2...',12,7,100,0,0,0,14654,0,'Demolitionist Legoso'),
(17982,7,0,'1...',12,7,100,0,0,0,14655,0,'Demolitionist Legoso'),
(17982,8,0,'Don''t get too excited, hero, that was the easy part. The challenge lies ahead! Let''s go.',12,7,100,1,0,0,14656,0,'Demolitionist Legoso'),
(17982,9,0,'What in the Nether is that?!?!',12,7,100,5,0,0,14657,0,'Demolitionist Legoso'),
(17982,10,0,'Be ready for anything, $n.',12,7,100,1,0,0,14658,0,'Demolitionist Legoso'),
(17982,11,0,'Blessed Light! She''s siphoning energy right out of the Vector Coil!',12,7,100,53,0,0,14659,0,'Demolitionist Legoso'),
(17982,12,0,'Cover me, we have to do this quickly. Once I blow the support on this side, it will disrupt the energy beams and she''ll break out! I doubt very much that she''ll be happy to see us.',12,7,100,1,0,0,14660,0,'Demolitionist Legoso'),
(17982,13,0,'I''ve almost got it! Just a little more time...',12,7,100,0,0,0,14661,0,'Demolitionist Legoso'),
(17982,14,0,'Take cover and be ready for the fight of your life, $n!',12,7,100,5,0,0,14662,0,'Demolitionist Legoso'),
(17982,15,0,'Holy mother of O''ros!',12,7,100,5,0,0,14663,0,'Demolitionist Legoso'),
(17982,16,0,'I... I can''t believe it''s over. You did it! You''ve destroyed the blood elves and their leader!',12,7,100,1,0,0,14664,0,'Demolitionist Legoso'),
(17982,17,0,'Get back to Blood Watch. I''ll see you there...',12,7,100,1,0,0,14665,0,'Demolitionist Legoso'),

(17678,0,0,'Petulant children, pray to your gods for you are about to meet them!',14,7,100,0,0,0,14666,0,'Sironas');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17982,17678,17979);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 1 AND `entryorguid` = 17649;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 2 AND `entryorguid` IN (17110,17214,17241);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 3 AND `entryorguid` IN (17101,17116,17311);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 4 AND `entryorguid` IN (17240,17242,17117);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `id` = 5 AND `entryorguid` IN (17215,17246);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1798200,1798201,1798202,1798203,1798204,1798205,1798206,1798207,1798208);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `id` = 27 AND `entryorguid` = 1765800;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17982,0,0,1,11,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Respawn - Set Emote State ''ONESHOT_NONE'''),
(17982,0,1,0,61,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - Linked - Remove ''UNIT_STAND_STATE_KNEEL'''),
(17982,0,2,0,0,0,100,0,1000,1000,10000,15000,0,11,8056,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Demolitionist Legoso - IC - Cast ''Frost Shock'''),
(17982,0,3,0,0,0,100,0,0,0,15000,15000,0,11,325,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - IC - Cast ''Lightning Shield'''),
(17982,0,4,0,0,0,100,0,15000,15000,110000,130000,0,11,38116,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - IC - Cast ''Searing Totem'''),
(17982,0,5,0,0,0,100,0,20000,20000,110000,130000,0,11,31633,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - IC - Cast ''Strength of Earth Totem'''),
(17982,0,6,0,74,0,100,0,41,75,30000,30000,40,11,8004,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Friendly Between 41-75% Health - Cast ''Lesser Healing Wave'''),
(17982,0,7,0,74,0,100,0,1,40,30000,30000,40,11,913,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Friendly Between 1-40% Health - Cast ''Healing Wave'''),
(17982,0,8,0,19,0,100,0,9759,0,0,0,0,80,1798200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Quest ''Ending Their World'' Accepted - Call Timed Action List'),
(17982,0,9,0,40,0,100,0,46,1798200,0,0,0,80,1798201,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On WP 46 Reached - Call Timed Action List'),
(17982,0,10,0,40,0,100,0,56,1798200,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On WP 56 Reached - Say Line 2'),
(17982,0,11,0,58,0,100,0,0,1798200,0,0,0,80,1798202,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On WP Path Ended - Call Timed Action List'),
(17982,0,12,0,58,0,100,0,0,1798201,0,0,0,80,1798203,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On WP Path Ended - Call Timed Action List'),
(17982,0,13,0,40,0,100,0,17,1798202,0,0,0,80,1798204,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On WP 17 Reached - Call Timed Action List'),
(17982,0,14,0,40,0,100,0,21,1798202,0,0,0,80,1798205,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On WP 21 Reached - Call Timed Action List'),
(17982,0,15,0,58,0,100,0,0,1798202,0,0,0,80,1798206,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On WP Path Ended - Call Timed Action List'),
(17982,0,16,0,58,0,100,0,0,1798203,0,0,0,80,1798207,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On WP Path Ended - Call Timed Action List'),
(17982,0,17,0,38,0,100,0,1,1,0,0,0,80,1798208,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Data Set 1 1 - Call Timed Action List'),
(17982,0,18,19,54,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Just Summoned - Set Phase 1'),
(17982,0,19,20,61,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - Linked - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17982,0,20,0,61,0,100,0,0,0,0,0,0,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - Linked - Sheath Weapon'),
(17982,0,21,0,1,1,100,0,3000,3000,5000,8000,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - OOC - Play Emote ''ONESHOT_CHEER(DNR)'' (Phase 1)'),

(1798200,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Active On'),
(1798200,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Store Target ID 1 (Invoker)'),
(1798200,9,2,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1798200,9,3,0,0,0,100,0,0,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,-1925.59,-10539.9,0,0,'Demolitionist Legoso - On Script - Load Grid (Sironas)'),
(1798200,9,4,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Orientation (Target ID 1)'),
(1798200,9,5,0,0,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,63402,17678,1,0,0,0,0,0,'Demolitionist Legoso - On Script - Respawn Target (Sironas)'),
(1798200,9,6,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 0'),
(1798200,9,7,0,0,0,100,0,3000,3000,0,0,0,53,1,1798200,0,0,0,2,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Start WP Movement'),

(1798201,9,0,0,0,0,100,0,0,0,0,0,0,54,9000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Pause WP Movement'),
(1798201,9,1,0,0,0,100,0,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Defensive'''),
(1798201,9,2,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.27391,'Demolitionist Legoso - On Script - Set Orientation'),
(1798201,9,3,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 1'),
(1798201,9,4,0,0,0,100,0,7000,7000,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Aggressive'''),

(1798202,9,0,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Passive'''),
(1798202,9,1,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1798202,9,2,0,0,0,100,0,5000,5000,0,0,0,12,17610,4,30000,0,0,0,8,0,0,0,0,-1970.28,-10661.4,116.024,0,'Demolitionist Legoso - On Script - Summon Creature ''Sunhawk Agent'''),
(1798202,9,3,0,0,0,100,0,6000,6000,0,0,0,1,3,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 3'),
(1798202,9,4,0,0,0,100,0,1000,1000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1798202,9,5,0,0,0,100,0,2000,2000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Emote State ''STATE_USESTANDING'''),
(1798202,9,6,0,0,0,100,0,14000,14000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Emote State ''ONESHOT_NONE'''),
(1798202,9,7,0,0,0,100,0,0,0,0,0,0,202,1,0,0,0,0,0,15,182088,30,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set GO State ''GO_STATE_READY'' (Draenei Explosives)'),
(1798202,9,8,0,0,0,100,0,1000,1000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 4'),
(1798202,9,9,0,0,0,100,0,0,0,0,0,0,70,600,0,0,0,0,0,15,182088,30,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Respawn GO (Draenei Explosives)'),
(1798202,9,10,0,0,0,100,0,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Aggressive'''),
(1798202,9,11,0,0,0,100,0,0,0,0,0,0,53,1,1798201,0,0,0,2,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Start WP Movement'),

(1798203,9,0,0,0,0,100,0,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Defensive'''),
(1798203,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.918923,'Demolitionist Legoso - On Script - Set Orientation'),
(1798203,9,2,0,0,0,100,0,1000,1000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 5'),
(1798203,9,3,0,0,0,100,0,1000,1000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 6'),
(1798203,9,4,0,0,0,100,0,1000,1000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 7'),
(1798203,9,5,0,0,0,100,0,1000,1000,0,0,0,202,2,0,0,0,0,0,15,182088,70,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set GO State ''GO_STATE_ACTIVE_ALTERNATIVE'' (Draenei Explosives)'),
(1798203,9,6,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,182088,70,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Respawn GO (Draenei Explosives) (Reset Despawn Timer)'),
(1798203,9,7,0,0,0,100,0,2000,2000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 8'),
(1798203,9,8,0,0,0,100,0,2000,2000,0,0,0,70,600,0,0,0,0,0,15,182089,70,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Respawn GO (Vector Coil Fire (S))'),
(1798203,9,9,0,0,0,100,0,0,0,0,0,0,70,600,0,0,0,0,0,15,182090,70,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Respawn GO (Vector Coil Fire (L))'),
(1798203,9,10,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.25215,'Demolitionist Legoso - On Script - Set Orientation'),
(1798203,9,11,0,0,0,100,0,1000,1000,0,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Play Emote ''ONESHOT_POINT(DNR)'''),
(1798203,9,12,0,0,0,100,0,2000,2000,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Aggressive'''),
(1798203,9,13,0,0,0,100,0,0,0,0,0,0,53,1,1798202,0,0,0,2,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Start WP Movement'),

(1798204,9,0,0,0,0,100,0,0,0,0,0,0,54,6000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Pause WP Movement'),
(1798204,9,1,0,0,0,100,0,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Defensive'''),
(1798204,9,2,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.984689,'Demolitionist Legoso - On Script - Set Orientation'),
(1798204,9,3,0,0,0,100,0,1000,1000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 9'),
(1798204,9,4,0,0,0,100,0,2000,2000,0,0,0,1,10,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 10'),
(1798204,9,5,0,0,0,100,0,2000,2000,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Aggressive'''),

(1798205,9,0,0,0,0,100,0,0,0,0,0,0,54,17000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Pause WP Movement'),
(1798205,9,1,0,0,0,100,0,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Defensive'''),
(1798205,9,2,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,1.2097,'Demolitionist Legoso - On Script - Set Orientation'),
(1798205,9,3,0,0,0,100,0,1000,1000,0,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 11'),
(1798205,9,4,0,0,0,100,0,4000,4000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Orientation (Stored Target ID 1)'),
(1798205,9,5,0,0,0,100,0,2000,2000,0,0,0,1,12,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 12'),
(1798205,9,6,0,0,0,100,0,9000,9000,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Aggressive'''),

(1798206,9,0,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Passive'''),
(1798206,9,1,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1798206,9,2,0,0,0,100,0,5000,5000,0,0,0,12,17610,4,30000,0,0,0,8,0,0,0,0,-1929.19,-10587.5,176.257,0,'Demolitionist Legoso - On Script - Summon Creature ''Sunhawk Agent'''),
(1798206,9,3,0,0,0,100,0,6000,6000,0,0,0,1,13,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 13'),
(1798206,9,4,0,0,0,100,0,1000,1000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1798206,9,5,0,0,0,100,0,2000,2000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Emote State ''STATE_USESTANDING'''),
(1798206,9,6,0,0,0,100,0,14000,14000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Emote State ''ONESHOT_NONE'''),
(1798206,9,7,0,0,0,100,0,0,0,0,0,0,202,1,0,0,0,0,0,15,182091,30,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set GO State ''GO_STATE_READY'' (Draenei Explosives)'),
(1798206,9,8,0,0,0,100,0,1000,1000,0,0,0,1,14,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 14'),
(1798206,9,9,0,0,0,100,0,0,0,0,0,0,70,600,0,0,0,0,0,15,182091,30,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Respawn GO (Draenei Explosives)'),
(1798206,9,10,0,0,0,100,0,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Aggressive'''),
(1798206,9,11,0,0,0,100,0,0,0,0,0,0,53,1,1798203,0,0,0,2,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Start WP Movement'),

(1798207,9,0,0,0,0,100,0,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Defensive'''),
(1798207,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,5.72639,'Demolitionist Legoso - On Script - Set Orientation'),
(1798207,9,2,0,0,0,100,0,1000,1000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 5'),
(1798207,9,3,0,0,0,100,0,1000,1000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 6'),
(1798207,9,4,0,0,0,100,0,1000,1000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 7'),
(1798207,9,5,0,0,0,100,0,1000,1000,0,0,0,202,2,0,0,0,0,0,15,182091,70,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set GO State ''GO_STATE_ACTIVE_ALTERNATIVE'' (Draenei Explosives)'),
(1798207,9,6,0,0,0,100,0,0,0,0,0,0,70,10,0,0,0,0,0,15,182091,70,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Respawn GO (Draenei Explosives) (Reset Despawn Timer)'),
(1798207,9,7,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,10,63402,17678,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 0 (Sironas)'),
(1798207,9,8,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,10,63402,17678,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Send Target ID 1 (Sironas)'),
(1798207,9,9,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,10,63402,17678,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Orientation (Sironas)'),
(1798207,9,10,0,0,0,100,0,2000,2000,0,0,0,70,600,0,0,0,0,0,15,182089,70,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Respawn GO (Vector Coil Fire (S))'),
(1798207,9,11,0,0,0,100,0,0,0,0,0,0,70,600,0,0,0,0,0,15,182090,70,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Respawn GO (Vector Coil Fire (L))'),
(1798207,9,12,0,0,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Emote State ''STATE_READY1H'''),
(1798207,9,13,0,0,0,100,0,2000,2000,0,0,0,45,1,1,0,0,0,0,10,63402,17678,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Data 1 1 (Sironas)'),
(1798207,9,14,0,0,0,100,0,2000,2000,0,0,0,1,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 15'),
(1798207,9,15,0,0,0,100,0,2000,2000,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set React State ''Aggressive'''),

(1798208,9,0,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Emote State ''ONESHOT_NONE'''),
(1798208,9,1,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Set Orientation (Stored Target ID 1)'),
(1798208,9,2,0,0,0,100,0,3000,3000,0,0,0,1,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 16'),
(1798208,9,3,0,0,0,100,0,5000,5000,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Play Emote ''ONESHOT_CHEER(DNR)'''),
(1798208,9,4,0,0,0,100,0,0,0,0,0,0,26,9759,0,0,0,0,0,18,45,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Quest Credit ''Ending Their World'''),
(1798208,9,5,0,0,0,100,0,4000,4000,0,0,0,1,17,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Say Line 17'),
(1798208,9,6,0,0,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Demolitionist Legoso - On Script - Force Despawn'),

(17678,0,0,2,1,0,100,0,1000,1000,10000,10000,0,11,31612,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sironas - OOC - Cast ''Sironas Channeling'''),
(17678,0,1,2,21,0,100,0,0,0,0,0,0,11,31612,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sironas - On Reached Home - Cast ''Sironas Channeling'''),
(17678,0,2,0,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sironas - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(17678,0,3,0,0,0,100,0,7000,9000,11000,11000,0,11,12742,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sironas - IC - Cast ''Immolate'''),
(17678,0,4,0,0,0,100,0,6000,7000,25000,25000,0,11,8282,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sironas - IC - Cast ''Curse of Blood'''),
(17678,0,5,0,0,0,100,0,4000,4000,15000,15000,0,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sironas - IC - Cast ''Upper Cut'''),
(17678,0,6,7,38,0,100,0,1,1,0,0,0,51,0,0,0,0,0,0,11,17979,100,0,0,0,0,0,0,'Sironas - On Data Set 1 1 - Kill ''Bloodmyst Tesla Coil'''),
(17678,0,7,8,61,0,100,0,0,0,0,0,0,28,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sironas - Linked - Remove All Auras'),
(17678,0,8,9,61,0,100,0,0,0,0,0,0,75,29050,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sironas - Linked - Add Aura ''Serverside - Grow'' (2 Stacks)'),
(17678,0,9,10,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sironas - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(17678,0,10,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Sironas - Linked - Start Attack (Stored Target ID 1)'),
(17678,0,11,0,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,63688,17982,0,0,0,0,0,0,'Sironas - On Death - Set Data 1 1 (Demolitionist Legoso)'),

(17979,0,0,0,60,0,100,0,2000,2000,15000,15000,0,11,31611,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmyst Tesla Coil - On Update - Cast ''Bloodmyst Tesla'''),

-- Quest end event: Remove gossip / quest giver from the summoned creatures and also summon Legoso
(17101,0,3,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Diktynna - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17116,0,3,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Exarch Menelaous - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17215,0,5,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Daedal - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17110,0,2,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Acteon - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17214,0,2,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Fateema - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17240,0,4,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Admiral Odesyus - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17311,0,3,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cowlen - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17242,0,4,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archaeologist Adamant Ironheart - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17117,0,4,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Injured Night Elf Priestess - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17246,0,5,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'\"Cookie\" McWeaksauce - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17241,0,2,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Priestess Kyleen Il''dinare - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(17649,0,1,0,54,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kessel - On Just Summoned - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1765800,9,27,0,0,0,100,0,0,0,0,0,0,12,17982,2,300000,0,0,0,8,0,0,0,0,-1952.17,-11837.9,55.9567,1.17557,'Exarch Admetius - On Script - Summon Creature ''Demolitionist Legoso''');

DELETE FROM `gameobject` WHERE `guid` BETWEEN 92308 AND 92357;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
-- Draenei Explosives
(92308,182088,530,0,0,1,1,-1954.11,-10653.8,110.21,1.65806,0,0,0.737277,0.675591,-1,100,1,0),
(92309,182088,530,0,0,1,1,-1955.34,-10654.1,110.55,5.06146,0,0,-0.573576,0.819152,-1,100,1,0),
(92310,182088,530,0,0,1,1,-1956.61,-10654.4,110.952,2.87979,0,0,0.991445,0.130528,-1,100,1,0),
(92311,182088,530,0,0,1,1,-1956.08,-10655.9,110.826,1.64061,0,0,0.731353,0.681999,-1,100,1,0),
(92312,182088,530,0,0,1,1,-1954.59,-10655.8,110.405,2.74016,0,0,0.979924,0.19937,-1,100,1,0),
-- Vector Coil Fire (S)
(92313,182089,530,0,0,1,1,-1950.96,-10653.9,131.447,3.9619,0,0,-0.91706,0.39875,-1,100,1,0),
(92314,182089,530,0,0,1,1,-1951.9,-10652.7,111.106,2.18166,0,0,0.887011,0.461749,-1,100,1,0),
(92315,182089,530,0,0,1,1,-1951.81,-10655.1,118.384,0.244346,0,0,0.121869,0.992546,-1,100,1,0),
(92316,182089,530,0,0,1,1,-1952.61,-10657.6,124.488,1.78023,0,0,0.777145,0.629321,-1,100,1,0),
(92317,182089,530,0,0,1,1,-1943.77,-10651.6,126.567,1.48353,0,0,0.67559,0.737278,-1,100,1,0),
(92318,182089,530,0,0,1,1,-1943.54,-10656.2,116.082,0.191985,0,0,0.0958452,0.995396,-1,100,1,0),
(92319,182089,530,0,0,1,1,-1949.93,-10650.5,138.922,1.27409,0,0,0.594822,0.803857,-1,100,1,0),
(92320,182089,530,0,0,1,1,-1943.67,-10652.7,144.157,4.88692,0,0,-0.642787,0.766045,-1,100,1,0),
(92321,182089,530,0,0,1,1,-1940.96,-10661.9,140.16,4.13643,0,0,-0.878817,0.47716,-1,100,1,0),
(92322,182089,530,0,0,1,1,-1934.88,-10666.6,137.629,4.97419,0,0,-0.608761,0.793354,-1,100,1,0),
(92323,182089,530,0,0,1,1,-1911.58,-10584.6,180.204,4.55531,0,0,-0.760405,0.649449,-1,100,1,0),
(92324,182089,530,0,0,1,1,-1908.22,-10581.1,181.217,0.90757,0,0,0.438371,0.898794,-1,100,1,0),
(92325,182089,530,0,0,1,1,-1913.97,-10593.8,184.884,3.90954,0,0,-0.927183,0.374608,-1,100,1,0),
(92326,182089,530,0,0,1,1,-1899.36,-10583.7,190.802,0.261798,0,0,0.130526,0.991445,-1,100,1,0),
(92327,182089,530,0,0,1,1,-1914.11,-10593,179.212,0.59341,0,0,0.292371,0.956305,-1,100,1,0),
(92328,182089,530,0,0,1,1,-1912.1,-10599.9,211.563,3.28124,0,0,-0.997563,0.0697661,-1,100,1,0),
(92329,182089,530,0,0,1,1,-1914.14,-10591.1,192.886,4.36332,0,0,-0.819152,0.573577,-1,100,1,0),
(92330,182089,530,0,0,1,1,-1889.36,-10572,179.539,5.39307,0,0,-0.43051,0.902586,-1,100,1,0),
(92331,182089,530,0,0,1,1,-1887.08,-10536.8,178.884,3.42085,0,0,-0.990268,0.139175,-1,100,1,0),
(92332,182089,530,0,0,1,1,-1901.16,-10596.2,206.669,5.34071,0,0,-0.45399,0.891007,-1,100,1,0),
-- Vector Coil Fire (L)
(92333,182090,530,0,0,1,1,-1916.39,-10679.9,144.612,1.72787,0,0,0.760405,0.649449,-1,100,1,0),
(92334,182090,530,0,0,1,1,-1908.39,-10677.6,144.235,5.70723,0,0,-0.284015,0.95882,-1,100,1,0),
(92335,182090,530,0,0,1,1,-1934.61,-10670.4,143.083,4.55531,0,0,-0.760405,0.649449,-1,100,1,0),
(92336,182090,530,0,0,1,1,-1927.86,-10671.9,134.736,2.54818,0,0,0.956305,0.292372,-1,100,1,0),
(92337,182090,530,0,0,1,1,-1934.52,-10668.9,130.337,1.69297,0,0,0.748956,0.66262,-1,100,1,0),
(92338,182090,530,0,0,1,1,-1958.8,-10653.8,111.749,5.86431,0,0,-0.207912,0.978148,-1,100,1,0),
(92339,182090,530,0,0,1,1,-1960.86,-10657.4,122.376,2.14675,0,0,0.878817,0.47716,-1,100,1,0),
(92340,182090,530,0,0,1,1,-1939.57,-10663.7,153.416,1.71042,0,0,0.754709,0.656059,-1,100,1,0),
(92341,182090,530,0,0,1,1,-1958.07,-10659.3,146.445,1.81514,0,0,0.788011,0.615662,-1,100,1,0),
(92342,182090,530,0,0,1,1,-1948.24,-10655.2,110.43,4.55531,0,0,-0.760405,0.649449,-1,100,1,0),
(92343,182090,530,0,0,1,1,-1911.36,-10580.6,179,4.20625,0,0,-0.861628,0.507539,-1,100,1,0),
(92344,182090,530,0,0,1,1,-1904.62,-10587.5,192.487,3.12412,0,0,0.999962,0.00873464,-1,100,1,0),
(92345,182090,530,0,0,1,1,-1923.83,-10598.5,188.116,3.61284,0,0,-0.972369,0.233448,-1,100,1,0),
(92346,182090,530,0,0,1,1,-1905.41,-10604.2,223.47,3.99681,0,0,-0.909961,0.414694,-1,100,1,0),
(92347,182090,530,0,0,1,1,-1903.76,-10593.9,200.858,1.64061,0,0,0.731353,0.681999,-1,100,1,0),
(92348,182090,530,0,0,1,1,-1874.94,-10597.4,220.35,5.23599,0,0,-0.5,0.866025,-1,100,1,0),
(92349,182090,530,0,0,1,1,-1869.71,-10580.3,185.931,1.18682,0,0,0.559193,0.829038,-1,100,1,0),
(92350,182090,530,0,0,1,1,-1884.54,-10534.5,192.883,3.38594,0,0,-0.992546,0.12187,-1,100,1,0),
(92351,182090,530,0,0,1,1,-1919.98,-10615,225.36,4.7822,0,0,-0.681998,0.731354,-1,100,1,0),
(92352,182090,530,0,0,1,1,-1932.26,-10613.4,192.599,3.56047,0,0,-0.978148,0.207912,-1,100,1,0),
-- Draenei Explosives
(92353,182091,530,0,0,1,1,-1913.21,-10583.2,178.66,3.9619,0,0,-0.91706,0.39875,-1,100,1,0),
(92354,182091,530,0,0,1,1,-1914.45,-10584.7,178.783,6.19592,0,0,-0.0436192,0.999048,-1,100,1,0),
(92355,182091,530,0,0,1,1,-1914.49,-10583.2,178.396,5.044,0,0,-0.580703,0.814116,-1,100,1,0),
(92356,182091,530,0,0,1,1,-1913.13,-10584.5,179.101,2.54818,0,0,0.956305,0.292372,-1,100,1,0),
(92357,182091,530,0,0,1,1,-1912.28,-10582,178.752,5.3058,0,0,-0.469471,0.882948,-1,100,1,0);

DELETE FROM `waypoints` WHERE `entry` IN (1798200,1798201,1798202,1798203);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(1798200,1,-1772.7,-11074.7,76.9523,'Demolitionist Legoso - Path 1'),
(1798200,2,-1780.08,-11061.4,77.1293,NULL),
(1798200,3,-1789.99,-11051.5,78.3538,NULL),
(1798200,4,-1793.34,-11044.1,77.0266,NULL),
(1798200,5,-1795.92,-11037.5,75.5467,NULL),
(1798200,6,-1801.48,-11031.9,71.5783,NULL),
(1798200,7,-1805.79,-11027.6,69.3309,NULL),
(1798200,8,-1813.52,-11023.5,68.0101,NULL),
(1798200,9,-1819.19,-11020.5,67.1404,NULL),
(1798200,10,-1831.72,-11013.8,67.6944,NULL),
(1798200,11,-1836.67,-11011.1,67.4923,NULL),
(1798200,12,-1848.11,-11005,65.3691,NULL),
(1798200,13,-1857.23,-11000.2,63.9639,NULL),
(1798200,14,-1865.73,-10993.7,62.8058,NULL),
(1798200,15,-1872.05,-10988.8,61.4307,NULL),
(1798200,16,-1878.68,-10980.3,61.0895,NULL),
(1798200,17,-1885.8,-10971.2,61.0888,NULL),
(1798200,18,-1892.17,-10963.1,61.2231,NULL),
(1798200,19,-1897.48,-10956.3,61.3443,NULL),
(1798200,20,-1906.1,-10945.3,61.4379,NULL),
(1798200,21,-1913.75,-10935.5,61.45,NULL),
(1798200,22,-1919.13,-10926.4,61.6648,NULL),
(1798200,23,-1926.23,-10914.3,62.3165,NULL),
(1798200,24,-1932.05,-10904.4,62.642,NULL),
(1798200,25,-1933.87,-10893,63.3895,NULL),
(1798200,26,-1935.58,-10882.3,64.2848,NULL),
(1798200,27,-1936.99,-10873.4,65.4706,NULL),
(1798200,28,-1938.08,-10864.2,67.0981,NULL),
(1798200,29,-1939.1,-10855.7,68.9003,NULL),
(1798200,30,-1940.16,-10846.8,71.3138,NULL),
(1798200,31,-1934.98,-10837.3,74.6395,NULL),
(1798200,32,-1930.7,-10829.4,77.834,NULL),
(1798200,33,-1935.44,-10821.4,80.0081,NULL),
(1798200,34,-1941.23,-10811.5,83.6688,NULL),
(1798200,35,-1945.47,-10804.3,86.0572,NULL),
(1798200,36,-1936,-10796.1,88.3957,NULL),
(1798200,37,-1928.73,-10789.8,90.5643,NULL),
(1798200,38,-1921.76,-10786.5,92.0401,NULL),
(1798200,39,-1912.78,-10782.3,95.0286,NULL),
(1798200,40,-1905.51,-10778.9,97.4486,NULL),
(1798200,41,-1901.22,-10773.4,99.8107,NULL),
(1798200,42,-1895.09,-10765.4,103.185,NULL),
(1798200,43,-1890.51,-10759.5,105.225,NULL),
(1798200,44,-1888.61,-10751.6,107.601,NULL),
(1798200,45,-1886.23,-10741.6,110.16,NULL),
(1798200,46,-1884.8,-10735.6,111.172,'Demolitionist Legoso - Path 1 - Pause'),
(1798200,47,-1893.7,-10729,111.792,NULL),
(1798200,48,-1899.74,-10724.5,112.127,NULL),
(1798200,49,-1908.93,-10719.2,111.915,NULL),
(1798200,50,-1919.97,-10712.8,111.345,NULL),
(1798200,51,-1926.19,-10707.9,111.07,NULL),
(1798200,52,-1933.18,-10702.3,111.001,NULL),
(1798200,53,-1939.16,-10697.6,110.981,NULL),
(1798200,54,-1943,-10692,110.691,NULL),
(1798200,55,-1947.82,-10685,110.641,NULL),
(1798200,56,-1952.36,-10678.4,110.464,'Demolitionist Legoso - Path 1 - Talk'),
(1798200,57,-1957.77,-10666.8,111.074,NULL),
(1798200,58,-1956.38,-10657.7,111.034,NULL),

(1798201,1,-1959.01,-10662.5,111.701,'Demolitionist Legoso - Path 2'),
(1798201,2,-1962.13,-10668.2,111.589,NULL),
(1798201,3,-1966.28,-10676.6,111.234,NULL),
(1798201,4,-1969.44,-10682.9,111.712,NULL),
(1798201,5,-1976.64,-10689,112.759,NULL),
(1798201,6,-1982.5,-10694,114.072,NULL),
(1798201,7,-1987.16,-10698,115.761,NULL),

(1798202,1,-1994.03,-10688.3,117.282,'Demolitionist Legoso - Path 3'),
(1798202,2,-1999.24,-10680.9,118.553,NULL),
(1798202,3,-2004.21,-10674,119.537,NULL),
(1798202,4,-2009.72,-10666.3,121.382,NULL),
(1798202,5,-2015.61,-10658.1,124.647,NULL),
(1798202,6,-2022,-10651.6,129.038,NULL),
(1798202,7,-2027.06,-10646.5,132.978,NULL),
(1798202,8,-2033.37,-10639.8,138.432,NULL),
(1798202,9,-2037.27,-10635.6,141.504,NULL),
(1798202,10,-2040.68,-10632,143.522,NULL),
(1798202,11,-2037.14,-10619.7,146.068,NULL),
(1798202,12,-2025.22,-10608.5,150.267,NULL),
(1798202,13,-2011.31,-10607.3,155.208,NULL),
(1798202,14,-2001.16,-10610.4,158.722,NULL),
(1798202,15,-1992.39,-10613.1,161.93,NULL),
(1798202,16,-1983.08,-10613.7,163.84,NULL),
(1798202,17,-1974.92,-10614.2,163.961,'Demolitionist Legoso - Path 3 - Pause'),
(1798202,18,-1960.7,-10606.2,165.65,NULL),
(1798202,19,-1955.2,-10593.3,169.77,NULL),
(1798202,20,-1947,-10583.5,173.38,NULL),
(1798202,21,-1938.43,-10573.9,176.35,'Demolitionist Legoso - Path 3 - Pause'),
(1798202,22,-1922.12,-10574.2,177.328,NULL),
(1798202,23,-1914.79,-10581,178.127,NULL),

(1798203,1,-1931.81,-10567.2,176.996,'Demolitionist Legoso - Path 4'),
(1798203,2,-1947.93,-10560.4,177.82,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
