-- DB update 2022_02_28_00 -> 2022_03_06_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_28_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_28_00 2022_03_06_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1646605634708536613'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1646605634708536613');

UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` IN (1836,1840,12126,12128);
UPDATE `creature_template_addon` SET `mount` = 0 WHERE `entry` = 12126;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` IN (46787,48188,48190,49594,52005,45436);
UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 48221;

DELETE FROM `creature_template_addon` WHERE `entry` = 1840;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(1840,0,0,0,0,0,0,NULL);

DELETE FROM `creature_text` WHERE `CreatureId` IN (1836,1842,1840,12126);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(1836,0,0,'Sir?',12,0,100,6,0,0,7319,0,'Scarlet Cavalier'),
(1836,1,0,'Something is wrong with the Highlord. Do something!',12,0,100,5,0,0,7320,0,'Scarlet Cavalier'),
(1836,2,0,'What the...',12,0,100,6,0,0,7321,0,'Scarlet Cavalier'),
(1836,3,0,'Hey, what''s going on over there? Sir, are you alright? Sir??',12,0,100,6,0,0,7322,0,'Scarlet Cavalier'),
(1836,4,0,'Highlord Fordring, are you alright?',12,0,100,6,0,0,7323,0,'Scarlet Cavalier'),

(1840,0,0,'You will not make it to the forest''s edge, Fordring.',14,0,100,0,0,0,7395,0,'Grand Inquisitor Isillien'),
(1840,1,0,'You disappoint me, Taelan. I had plans for you... grand plans. Alas, it was only a matter of time before your filthy bloodline would catch up with you.',12,0,100,0,0,0,7337,0,'Grand Inquisitor Isillien'),
(1840,2,0,'It is as they say: Like father, like son. You are as weak of will as Tirion... perhaps more so. I can only hope my assassins finally succeeded in ending his pitiful life.',12,0,100,0,0,0,7338,0,'Grand Inquisitor Isillien'),
(1840,3,0,'The Grand Crusader has charged me with destroying you and your newfound friends, Taelan, but know this: I do this for pleasure, not of obligation or duty.',12,0,100,0,0,0,7359,0,'Grand Inquisitor Isillien'),
(1840,4,0,'%s calls for his guardsmen.',16,0,100,22,0,0,7360,0,'Grand Inquisitor Isillien'),
(1840,5,0,'The end is now, Fordring.',12,0,100,0,0,0,7361,0,'Grand Inquisitor Isillien'),
(1840,6,0,'Enough!',12,0,100,0,0,0,7381,0,'Grand Inquisitor Isillien'),
(1840,7,0,'%s laughs.',16,0,100,11,0,0,7382,0,'Grand Inquisitor Isillien'),
(1840,8,0,'Did you really believe that you could defeat me? Your friends are soon to join you, Taelan.',12,0,100,0,0,0,7383,0,'Grand Inquisitor Isillien'),
(1840,9,0,'Tragic. The elder Fordring lives on... You are too late, old man. Retreat back to your cave, hermit, unless you wish to join your son in the Twisting Nether.',12,0,100,0,0,0,7433,0,'Grand Inquisitor Isillien'),
(1840,10,0,'Then come, hermit!',12,0,100,0,0,0,7436,0,'Grand Inquisitor Isillien'),

(1842,0,0,'NOOOOOOOOOOOO!',14,0,100,0,0,0,7318,0,'Highlord Taelan Fordring'),
(1842,1,0,'I will lead us through Hearthglen to the forest''s edge. From there, you will take me to my father.',12,0,100,0,0,0,7313,0,'Highlord Taelan Fordring'),
(1842,2,0,'Remove your disguise, lest you feel the bite of my blade when the fury has taken control.',12,0,100,0,0,0,7314,0,'Highlord Taelan Fordring'),
(1842,3,0,'Halt.',12,0,100,0,0,0,7315,0,'Highlord Taelan Fordring'),
(1842,4,0,'%s calls for his mount.',16,0,100,22,0,0,7316,0,'Highlord Taelan Fordring'),
(1842,5,0,'It''s not much further. The main road is just up ahead.',12,0,100,0,0,0,7329,0,'Highlord Taelan Fordring'),
(1842,6,0,'Isillien!',14,0,100,0,0,0,7370,0,'Highlord Taelan Fordring'),
(1842,7,0,'This is not your fight, stranger. Protect yourself from the attacks of the Crimson Elite. I shall battle the Grand Inquisitor.',12,0,100,0,0,0,7371,0,'Highlord Taelan Fordring'),

(12126,0,0,'What have you done, Isillien? You once fought with honor, for the good of our people... and now... you have murdered my boy...',12,0,100,1,0,0,7372,0,'Lord Tirion Fordring'),
(12126,1,0,'May your soul burn in anguish, Isillien! Light give me strength to battle this fiend.',12,0,100,15,0,0,7373,0,'Lord Tirion Fordring'),
(12126,2,0,'Face me, coward. Face the faith and strength that you once embodied.',12,0,100,25,0,0,7374,0,'Lord Tirion Fordring'),
(12126,3,0,'A thousand more like him exist. Ten thousand. Should one fall, another will rise to take the seat of power.',12,0,100,0,0,0,7420,0,'Lord Tirion Fordring'),
(12126,4,0,'%s falls to one knee.',16,0,100,0,0,0,7421,0,'Lord Tirion Fordring'),
(12126,5,0,'Look what they did to my boy.',12,0,100,5,0,0,7423,0,'Lord Tirion Fordring'),
(12126,6,0,'%s holds the limp body of Taelan Fordring and softly sobs.',16,0,100,0,0,0,7425,0,'Lord Tirion Fordring'),
(12126,7,0,'Too long have I sat idle, gripped in this haze... this malaise, lamenting what could have been... what should have been.',12,0,100,0,0,0,7429,0,'Lord Tirion Fordring'),
(12126,8,0,'Your death will not have been in vain, Taelan. A new Order is born on this day... an Order which will dedicate itself to extinguishing the evil that plagues this world. An evil that cannot hide behind politics and pleasantries.',12,0,100,0,0,0,7426,0,'Lord Tirion Fordring'),
(12126,9,0,'This I promise... This I vow...',12,0,100,0,0,0,7430,0,'Lord Tirion Fordring');

UPDATE `broadcast_text` SET `MaleText` = 'What have you done, Isillien? You once fought with honor, for the good of our people... and now... you have murdered my boy...' WHERE `ID` = 7372;

DELETE FROM `creature_questender` WHERE `id` = 12126 AND `quest` = 5944;
INSERT INTO `creature_questender` (`id`, `quest`)
VALUES
(12126,5944);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 1836 AND `id` > 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (1840,1842,12126,12128);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (184000,184001,184200,184201,184202,184203,1212600,1212601);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1836,0,3,4,38,0,100,0,1,1,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Scarlet Cavalier - On Data Set 1 1 - Set Run Off'),
(1836,0,4,0,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,7,0,0,0,0,0,0,0,0.001,'Scarlet Cavalier - Linked - Move To Position (Invoker)'),

(1842,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Respawn - Disable Event Phase Reset'),
(1842,0,1,2,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - Linked - Set Event Phase 0'),
(1842,0,2,3,61,0,100,0,0,0,0,0,0,2,67,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - Linked - Set Faction ''Scarlet Crusade'''),
(1842,0,3,0,61,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(1842,0,4,0,61,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - Linked - Remove Timed Event 1'),
(1842,0,5,0,34,1,100,0,8,16777215,0,0,0,43,0,2402,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On SMART_ESCORT_LAST_OOC_POINT Reached - Mount Horse (Event Phase 1)'),
(1842,0,6,0,4,0,100,0,0,0,0,0,0,11,17232,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Aggro - Cast ''Devotion Aura'''),
(1842,0,7,0,9,0,100,0,0,5,7000,12000,0,11,14518,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - Within 0-5 Range - Cast ''Crusader Strike'''),
(1842,0,8,0,0,0,100,0,6000,8000,9000,14000,0,11,17143,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - IC - Cast ''Holy Strike'''),
(1842,0,9,0,0,0,100,0,11000,15000,11000,13000,0,11,18819,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - IC - Cast ''Holy Cleave'''),
(1842,0,10,0,2,0,100,1,0,15,0,0,0,11,17233,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - Between 0-15% Health - Cast ''Lay on Hands'' (No Repeat)'),
(1842,0,11,0,20,0,100,0,5862,0,0,0,0,80,184200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Quest ''Scarlet Subterfuge'' Rewarded - Call Timed Action List'),
(1842,0,12,0,59,0,100,0,1,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Timed Event 1 Triggered - Force Despawn'),
(1842,0,13,0,19,0,100,0,5944,0,0,0,0,80,184201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Quest ''In Dreams'' Accepted - Call Timed Action List'),
(1842,0,14,0,40,0,100,0,1,1842,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On WP 1 Reached - Say Line 2'),
(1842,0,15,0,40,0,100,0,25,1842,0,0,0,80,184202,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On WP 25 Reached - Call Timed Action List'),
(1842,0,16,0,58,0,100,0,0,1842,0,0,0,80,184203,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On WP Path Ended - Call Timed Action List'),
(1842,0,17,0,38,0,100,0,1,1,0,0,0,49,0,0,0,0,0,0,19,1840,50,0,0,0,0,0,0,'Highlord Taelan Fordring - On Data Set 1 1 - Start Attack (Grand Inquisitor Isillien)'),
(1842,0,18,0,2,0,100,1,0,50,0,0,0,80,184001,2,0,0,0,0,19,1840,10,0,0,0,0,0,0,'Highlord Taelan Fordring - Between 0-50% Health - Call Timed Action List (Grand Inquisitor Isillien) (No Repeat)'),
(1842,0,19,0,6,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Death - Set Active On'),

(184200,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Active On'),
(184200,9,1,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Remove Timed Event 1'),
(184200,9,2,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(184200,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,10,48188,1836,0,1,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 0 (Scarlet Cavalier)'),
(184200,9,4,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,48188,1836,0,1,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Data 1 1 (Scarlet Cavalier)'),
(184200,9,5,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,10,48190,1836,0,1,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 2 (Scarlet Cavalier)'),
(184200,9,6,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,48190,1836,0,1,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Data 1 1 (Scarlet Cavalier)'),
(184200,9,7,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,10,52005,1836,0,1,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 3 (Scarlet Cavalier)'),
(184200,9,8,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,52005,1836,0,1,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Data 1 1 (Scarlet Cavalier)'),
(184200,9,9,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,10,49594,1836,0,1,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 4 (Scarlet Cavalier)'),
(184200,9,10,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,49594,1836,0,1,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Data 1 1 (Scarlet Cavalier)'),
(184200,9,11,0,0,0,100,0,7000,7000,0,0,0,1,1,0,0,0,0,0,10,48188,1836,0,1,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 1 (Scarlet Cavalier)'),
(184200,9,12,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 0'),
(184200,9,13,0,0,0,100,0,0,0,0,0,0,67,1,300000,300000,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Create Timed Event 1'),
(184200,9,14,0,0,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Faction ''Escortee'''),
(184200,9,15,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,11,1836,2,1,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Start Attack (Scarlet Cavalier)'),
(184200,9,16,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'''),

(184201,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Active On'),
(184201,9,1,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Remove Timed Event 1'),
(184201,9,2,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(184201,9,3,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Add ''UNIT_FLAG_IMMUNE_TO_PC'''),
(184201,9,4,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 1'),
(184201,9,5,0,0,0,100,0,6000,6000,0,0,0,53,0,1842,0,0,0,2,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Start WP Movement'),

(184202,9,0,0,0,0,100,0,0,0,0,0,0,54,7000,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Pause WP Movement (OOC Only)'),
(184202,9,1,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 3'),
(184202,9,2,0,0,0,100,0,3000,3000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 4'),
(184202,9,3,0,0,0,100,0,2000,2000,0,0,0,43,0,2402,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Mount Horse'),
(184202,9,4,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Event Phase 1'),

(184203,9,0,0,0,0,100,0,1000,1000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 5'),
(184203,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,21,40,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Orientation (Closest Player)'),
(184203,9,2,0,0,0,100,0,2000,2000,0,0,0,12,1840,4,120000,0,0,0,8,0,0,0,0,2683.64,-1926.72,72.14,2,'Highlord Taelan Fordring - On Script - Summon Creature ''Grand Inquisitor Isillien'''),
(184203,9,3,0,0,0,100,0,4000,4000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Say Line 6'),
(184203,9,4,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,11,1840,40,1,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Orientation (Grand Inquisitor Isillien)'),
(184203,9,5,0,0,0,100,0,4000,4000,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Event Phase 0'),
(184203,9,6,0,0,0,100,0,0,0,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Dismount'),
(184203,9,7,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Highlord Taelan Fordring - On Script - Set Home Position'),

(1840,0,0,0,37,0,100,0,0,0,0,0,0,80,184000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On AI Init - Call Timed Action List'),
(1840,0,1,0,0,0,100,0,1000,1000,30000,30000,0,11,11647,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - IC - Cast ''Power Word: Shield'''),
(1840,0,2,0,0,0,100,0,3000,3000,8000,9000,0,11,17287,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - IC - Cast ''Mind Blast'''),
(1840,0,3,0,0,0,100,0,7000,8000,15000,15000,0,11,17314,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - IC - Cast ''Mind Flay'''),
(1840,0,4,5,38,0,100,0,1,1,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Data Set 1 1 - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1840,0,5,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,12126,50,0,0,0,0,0,0,'Grand Inquisitor Isillien - Linked - Start Attack (Lord Tirion Fordring)'),
(1840,0,6,0,6,0,100,0,0,0,0,0,0,80,1212601,0,0,0,0,0,19,12126,50,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Death - Call Timed Action List (Lord Tirion Fordring)'),

(184000,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Set Active'),
(184000,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(184000,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 0'),
(184000,9,3,0,0,0,100,0,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Set Run Off'),
(184000,9,4,0,0,0,100,0,4000,4000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,2677,-1917,68,0,'Grand Inquisitor Isillien - On Script - Move To Position'),
(184000,9,5,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 1'),
(184000,9,6,0,0,0,100,0,10000,10000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 2'),
(184000,9,7,0,0,0,100,0,10000,10000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 3'),
(184000,9,8,0,0,0,100,0,10000,10000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 4'),
(184000,9,9,0,0,0,100,0,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,0,2681.09,-1934.44,72.1445,1.75708,'Grand Inquisitor Isillien - On Script - Summon Creature ''Crimson Elite'''),
(184000,9,10,0,0,0,100,0,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,0,2689.36,-1929.08,72.1444,2.21654,'Grand Inquisitor Isillien - On Script - Summon Creature ''Crimson Elite'''),
(184000,9,11,0,0,0,100,0,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,0,2694,-1875,66.86,3.8,'Grand Inquisitor Isillien - On Script - Summon Creature ''Crimson Elite'''),
(184000,9,12,0,0,0,100,0,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,0,2693,-1869,66.87,3.9,'Grand Inquisitor Isillien - On Script - Summon Creature ''Crimson Elite'''),
(184000,9,13,0,0,0,100,0,0,0,0,0,0,12,12128,4,40000,0,0,0,8,0,0,0,0,2697,-1879,66.8,3.8,'Grand Inquisitor Isillien - On Script - Summon Creature ''Crimson Elite'''),
(184000,9,14,0,0,0,100,0,5000,5000,0,0,0,1,7,0,0,0,0,0,19,1842,30,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 7 (Highlord Taelan Fordring)'),
(184000,9,15,0,0,0,100,0,5000,5000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 5'),
(184000,9,16,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,11,12128,100,1,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Set Data 1 1 (Crimson Elite)'),
(184000,9,17,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(184000,9,18,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,1842,30,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Start Attack (Highlord Taelan Fordring)'),
(184000,9,19,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,1842,30,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Set Data 1 1 (Highlord Taelan Fordring)'),

(184001,9,0,0,0,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 6'),
(184001,9,1,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Set Home Position'),
(184001,9,2,0,0,0,100,0,0,0,0,0,0,11,18969,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Cast ''Taelan Death'''),
(184001,9,3,0,0,0,100,0,3000,3000,0,0,0,116,900,0,0,0,0,0,19,1842,30,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Set Corpse Delay (Highlord Taelan Fordring)'),
(184001,9,4,0,0,0,100,0,0,0,0,0,0,51,0,0,0,0,0,0,19,1842,30,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Kill Unit (Highlord Taelan Fordring)'),
(184001,9,5,0,0,0,100,0,0,0,0,0,0,18,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Add ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(184001,9,6,0,0,0,100,0,6000,6000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 7'),
(184001,9,7,0,0,0,100,0,3000,3000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grand Inquisitor Isillien - On Script - Say Line 8'),
(184001,9,8,0,0,0,100,0,5000,5000,0,0,0,12,12126,4,180000,0,0,0,8,0,0,0,0,2642.8,-1913,71.2,0.4,'Grand Inquisitor Isillien - On Script - Summon Creature ''Lord Tirion Fordring'''),

(12126,0,0,1,37,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On AI Init - Set Active On'),
(12126,0,1,2,61,0,100,0,0,0,0,0,0,43,0,2402,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - Linked - Mount Horse'),
(12126,0,2,3,61,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - Linked - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(12126,0,3,0,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,11,1842,50,2,0,0,0,0,0.001,'Lord Tirion Fordring - Linked - Move To Position (Highlord Taelan Fordring)'),
(12126,0,4,0,4,0,100,0,0,0,0,0,0,11,17232,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Aggro - Cast ''Devotion Aura'''),
(12126,0,5,0,9,0,100,0,0,5,7000,12000,0,11,14518,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - Within 0-5 Range - Cast ''Crusader Strike'''),
(12126,0,6,0,0,0,100,0,6000,8000,9000,14000,0,11,17143,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - IC - Cast ''Holy Strike'''),
(12126,0,7,0,0,0,100,0,11000,15000,11000,13000,0,11,18819,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - IC - Cast ''Holy Cleave'''),
(12126,0,8,0,34,0,100,0,8,1,0,0,0,80,1212600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On WP 1 Reached - Call Timed Action List'),
(12126,0,9,0,38,0,100,0,1,1,0,0,0,80,1212601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Data Set 1 1 - Call Timed Action List'),

(1212600,9,0,0,0,0,100,0,500,500,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Dismount'),
(1212600,9,1,0,0,0,100,0,500,500,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1212600,9,2,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Set Home Position'),
(1212600,9,3,0,0,0,100,0,5000,5000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1212600,9,4,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,19,1840,50,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Set Orientation (Grand Inquisitor Isillien)'),
(1212600,9,5,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 0'),
(1212600,9,6,0,0,0,100,0,7000,7000,0,0,0,1,9,0,0,0,0,0,19,1840,50,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 9 (Grand Inquisitor Isillien)'),
(1212600,9,7,0,0,0,100,0,10000,10000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 1'),
(1212600,9,8,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 2'),
(1212600,9,9,0,0,0,100,0,5000,5000,0,0,0,1,10,0,0,0,0,0,19,1840,50,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 10 (Grand Inquisitor Isillien)'),
(1212600,9,10,0,0,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Set Faction ''Escortee'''),
(1212600,9,11,0,0,0,100,0,3000,3000,0,0,0,45,1,1,0,0,0,0,19,1840,50,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Set Data 1 1 (Grand Inquisitor Isillien)'),
(1212600,9,12,0,0,0,100,0,500,500,0,0,0,49,0,0,0,0,0,0,19,1840,50,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Start Attack (Grand Inquisitor Isillien)'),

(1212601,9,0,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 3'),
(1212601,9,1,0,0,0,100,0,7000,7000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 4'),
(1212601,9,2,0,0,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1212601,9,3,0,0,0,100,0,3000,3000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 5'),
(1212601,9,4,0,0,0,100,0,3000,3000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 6'),
(1212601,9,5,0,0,0,100,0,3000,3000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1212601,9,6,0,0,0,100,0,5000,5000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 7'),
(1212601,9,7,0,0,0,100,0,7000,7000,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 8'),
(1212601,9,8,0,0,0,100,0,12000,12000,0,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Say Line 9'),
(1212601,9,9,0,0,0,100,0,1000,1000,0,0,0,15,5944,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Area Explored'),
(1212601,9,10,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Tirion Fordring - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'''),

(12128,0,0,1,37,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crimson Elite - On AI Init - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(12128,0,1,0,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crimson Elite - Linked - Disable Event Phase Reset'),
(12128,0,2,0,9,0,100,0,0,5,7000,12000,0,11,14518,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crimson Elite - Within 0-5 Range - Cast ''Crusader Strike'''),
(12128,0,3,0,0,0,100,0,6000,8000,9000,14000,0,11,17143,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Crimson Elite - IC - Cast ''Holy Strike'''),
(12128,0,4,5,38,0,100,0,1,1,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crimson Elite - On Data Set 1 1 - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(12128,0,5,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crimson Elite - Linked - Set Event Phase 1'),
(12128,0,6,0,1,1,100,0,5000,5000,5000,5000,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,0,'Crimson Elite - OOC - Start Attack (Closest Player) (Event Phase 1)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 1842;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 18969;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,18969,0,0,31,0,3,1842,0,0,0,0,'Spell ''Taelan Death'' - Group 0: Implicit target ''Highlord Taelan Fordring''');

UPDATE `quest_poi_points` SET `X` = 2674, `Y` = -2477 WHERE `QuestID` = 5944 AND `Idx1` = 1;

DELETE FROM `waypoints` WHERE `entry` = 12126;
DELETE FROM `waypoints` WHERE `entry` = 1842 AND `pointid` > 71;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(1842,72,2691.46,-1880.97,66.5305,'Taelan Fordring'),
(1842,73,2685.69,-1889.39,65.9096,'Taelan Fordring'),
(1842,74,2676.81,-1896.79,65.8872,'Taelan Fordring'),
(1842,75,2670.04,-1905.19,65.5253,'Taelan Fordring');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
