-- DB update 2021_01_20_00 -> 2021_01_22_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_20_00 2021_01_22_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1611303272488515914'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1611303272488515914');

UPDATE `creature_template_addon` SET `isLarge` = 1 WHERE `entry` = 30159;

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 31135;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (31135,31191,31192,31193,31194,31195,31196,31222,31242,31271,31277,14688,24110,-121607,30159) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3113500,3113501,3113502,3113503,3113504,3113505,3113506,3122200,3127100,3127700,1468800,3124200,3124201) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(31135,0,0,0,19,0,100,0,13214,0,0,0,0,80,3113500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Quest ''Battle at Valhalas: Fallen Heroes'' Taken - Call Timed Action List'),
(31135,0,1,2,38,0,100,0,1,1,0,0,0,1,4,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Data Set 1 1 - Say Line 4'),
(31135,0,2,3,61,0,100,0,0,0,0,0,0,69,0,0,0,0,1,0,8,0,0,0,0,8216.64,3516.06,624.996,3.57661,'Geirrvif - Linked - Move To Position'),
(31135,0,3,4,61,0,100,0,0,0,0,0,0,81,3,0,0,0,1,0,1,0,0,0,0,0,0,0,0,'Geirrvif - Linked - Set NPC Flags Gossip & Questgiver'),
(31135,0,4,0,61,0,100,0,0,0,0,0,0,15,13214,0,0,0,0,0,18,80,0,0,0,0,0,0,0,'Geirrvif - Linked - Quest Credit ''Battle at Valhalas: Fallen Heroes'''),
(31135,0,5,0,19,0,100,0,13215,0,0,0,0,80,3113501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Quest ''Battle at Valhalas: Khit''rix the Dark Master'' Taken - Call Timed Action List'),
(31135,0,6,7,38,0,100,0,2,2,0,0,0,1,8,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Data Set 2 2 - Say Line 8'),
(31135,0,7,8,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,8216.64,3516.06,624.996,3.57661,'Geirrvif - Linked - Move To Position'),
(31135,0,8,9,61,0,100,0,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - Linked - Set NPC Flags Gossip & Questgiver'),
(31135,0,9,0,61,0,100,0,0,0,0,0,0,15,13215,0,0,0,0,0,18,80,0,0,0,0,0,0,0,'Geirrvif - Linked - Quest Credit ''Battle at Valhalas: Khit''rix the Dark Master'''),
(31135,0,10,0,19,0,100,0,13216,0,0,0,0,80,3113502,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Quest ''Battle at Valhalas: The Return of Sigrid Iceborn'' Taken - Call Timed Action List'),
(31135,0,11,12,38,0,100,0,3,3,0,0,0,1,11,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Data Set 3 3 - Say Line 11'),
(31135,0,12,13,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,8216.64,3516.06,624.996,3.57661,'Geirrvif - Linked - Move To Position'),
(31135,0,13,14,61,0,100,0,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - Linked - Set NPC Flags Gossip & Questgiver'),
(31135,0,14,0,61,0,100,0,0,0,0,0,0,15,13216,0,0,0,0,0,18,80,0,0,0,0,0,0,0,'Geirrvif - Linked - Quest Credit ''Battle at Valhalas: The Return of Sigrid Iceborn'''),
(31135,0,15,0,19,0,100,0,13217,0,0,0,0,80,3113503,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Quest ''Battle at Valhalas: Carnage!'' Taken - Call Timed Action List'),
(31135,0,16,17,38,0,100,0,4,4,0,0,0,1,15,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Data Set 4 4 - Say Line 15'),
(31135,0,17,18,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,8216.64,3516.06,624.996,3.57661,'Geirrvif - Linked - Move To Position'),
(31135,0,18,19,61,0,100,0,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - Linked - Set NPC Flags Gossip & Questgiver'),
(31135,0,19,0,61,0,100,0,0,0,0,0,0,15,13217,0,0,0,0,0,18,80,0,0,0,0,0,0,0,'Geirrvif - Linked - Quest Credit ''Battle at Valhalas: Carnage!'''),
(31135,0,20,0,19,0,100,0,13218,0,0,0,0,80,3113504,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Quest ''Battle at Valhalas: Thane Deathblow'' Taken - Call Timed Action List'),
(31135,0,21,22,38,0,100,0,5,5,0,0,0,1,19,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Data Set 5 5 - Say Line 19'),
(31135,0,22,23,61,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,8216.64,3516.06,624.996,3.57661,'Geirrvif - Linked - Move To Position'),
(31135,0,23,24,61,0,100,0,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - Linked - Set NPC Flags Gossip & Questgiver'),
(31135,0,24,0,61,0,100,0,0,0,0,0,0,15,13218,0,0,0,0,0,18,80,0,0,0,0,0,0,0,'Geirrvif - Linked - Quest Credit ''Battle at Valhalas: Thane Deathblow'''),
(31135,0,25,0,19,0,100,0,13219,0,0,0,0,80,3113505,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Quest ''Battle at Valhalas: Final Challenge'' Taken - Call Timed Action List'),
(31135,0,26,0,38,0,100,0,6,6,0,0,0,80,3113506,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Data Set 6 6 - Call Timed Action List'),
(31135,0,27,0,38,0,100,0,20,20,10000,10000,0,1,27,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Data Set 20 20 - Say Line 27'),
(31135,0,28,29,38,0,100,0,19,19,0,0,0,69,0,0,0,0,1,0,8,0,0,0,0,8216.64,3516.06,624.996,3.57661,'Geirrvif - On Data Set 19 19 - Move To Position'),
(31135,0,29,30,61,0,100,0,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - Linked - Set NPC Flags Gossip & Questgiver'),
(31135,0,30,0,61,0,100,0,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - Linked - Call Script Reset'),
(31135,0,31,0,19,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Geirrvif - On quest taken - Store Target 1'),

(3113500,9,0,0,0,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Script - Remove All NPC Flags'),
(3113500,9,1,0,0,0,100,0,1000,1000,0,0,0,69,8216,3516,653,0,0,0,8,0,0,0,0,8216.64,3516.06,652.885,3.57661,'Geirrvif - On Script - Move To Position'),
(3113500,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 0'),
(3113500,9,3,0,0,0,100,0,6000,6000,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 1'),
(3113500,9,4,0,0,0,100,0,6000,6000,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 2'),
(3113500,9,5,0,0,0,100,0,8000,8000,0,0,0,1,3,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 3'),
(3113500,9,6,0,0,0,100,0,0,0,0,0,0,12,31191,7,0,0,1,0,8,0,0,0,0,8187.23,3514.95,626.187,0.003626,'Geirrvif - On Script - Summon Creature ''Father Jhadras'''),
(3113500,9,7,0,0,0,100,0,0,0,0,0,0,12,31192,7,0,0,1,0,8,0,0,0,0,8196.79,3538.69,626.927,5.3247,'Geirrvif - On Script - Summon Creature ''Masud'''),
(3113500,9,8,0,0,0,100,0,0,0,0,0,0,12,31193,7,0,0,1,0,8,0,0,0,0,8225.91,3543.8,627.512,4.32724,'Geirrvif - On Script - Summon Creature ''Geness Half-Soul'''),
(3113500,9,9,0,0,0,100,0,0,0,0,0,0,12,31194,7,0,0,1,0,8,0,0,0,0,8245.85,3514.61,628.232,3.07453,'Geirrvif - On Script - Summon Creature ''Talla'''),
(3113500,9,10,0,0,0,100,0,0,0,0,0,0,12,31195,7,0,0,1,0,8,0,0,0,0,8231.88,3491.21,627.441,2.38338,'Geirrvif - On Script - Summon Creature ''Eldreth'''),
(3113500,9,11,0,0,0,100,0,0,0,0,0,0,12,31196,7,0,0,1,0,8,0,0,0,0,8202.6,3490.68,625.509,1.0757,'Geirrvif - On Script - Summon Creature ''Rith'''),
(3113500,9,12,0,0,0,100,0,0,0,0,0,0,45,7,7,0,0,0,0,10,121607,24110,0,0,0,0,0,0,'Geirrvif - On Script - Set Data 7 7 (ELM General Purpose Bunny Large)'),

(3113501,9,0,0,0,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Script - Remove All NPC Flags'),
(3113501,9,1,0,0,0,100,0,1000,1000,0,0,0,69,8216,3516,653,0,0,0,8,0,0,0,0,8216.64,3516.06,652.885,3.57661,'Geirrvif - On Script - Move To Position'),
(3113501,9,2,0,0,0,100,0,1000,1000,0,0,0,1,5,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 5'),
(3113501,9,3,0,0,0,100,0,6000,6000,0,0,0,1,6,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 6'),
(3113501,9,4,0,0,0,100,0,6000,6000,0,0,0,1,7,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 7'),
(3113501,9,5,0,0,0,100,0,0,0,0,0,0,12,31222,7,0,0,1,0,8,0,0,0,0,8165,3451,627.199,1.935,'Geirrvif - On Script - Summon Creature ''Khit''rix the Dark Master'''),

(3113502,9,0,0,0,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Script - Remove All NPC Flags'),
(3113502,9,1,0,0,0,100,0,1000,1000,0,0,0,69,8216,3516,653,0,0,0,8,0,0,0,0,8216.64,3516.06,652.885,3.57661,'Geirrvif - On Script - Move To Position'),
(3113502,9,2,0,0,0,100,0,0,0,0,0,0,1,9,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 9'),
(3113502,9,3,0,0,0,100,0,9000,9000,0,0,0,1,10,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 10'),
(3113502,9,4,0,0,0,100,0,0,0,0,0,0,12,31242,7,0,0,1,0,8,0,0,0,0,8258.84,3599.05,677.646,0.383,'Geirrvif - On Script - Summon Creature ''Sigrid Iceborn'''),

(3113503,9,0,0,0,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Script - Remove All NPC Flags'),
(3113503,9,1,0,0,0,100,0,1000,1000,0,0,0,69,8216,3516,653,0,0,0,8,0,0,0,0,8216.64,3516.06,652.885,3.57661,'Geirrvif - On Script - Move To Position'),
(3113503,9,2,0,0,0,100,0,1000,1000,0,0,0,1,12,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 12'),
(3113503,9,3,0,0,0,100,0,6000,6000,0,0,0,1,13,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 13'),
(3113503,9,4,0,0,0,100,0,8000,8000,0,0,0,1,14,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 14'),
(3113503,9,5,0,0,0,100,0,0,0,0,0,0,12,31271,7,0,0,1,0,8,0,0,0,0,8141.53,3488.1,626.986,3.66212,'Geirrvif - On Script - Summon Creature ''Carnage'''),

(3113504,9,0,0,0,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Script - Remove All NPC Flags'),
(3113504,9,1,0,0,0,100,0,1000,1000,0,0,0,69,8216,3516,653,0,0,0,8,0,0,0,0,8216.64,3516.06,652.885,3.57661,'Geirrvif - On Script - Move To Position'),
(3113504,9,2,0,0,0,100,0,1000,1000,0,0,0,1,16,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 16'),
(3113504,9,3,0,0,0,100,0,8000,8000,0,0,0,1,17,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 17'),
(3113504,9,4,0,0,0,100,0,8000,8000,0,0,0,1,18,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 18'),
(3113504,9,5,0,0,0,100,0,0,0,0,0,0,12,31277,7,0,0,1,0,8,0,0,0,0,8151.25,3462.89,672.116,0.6877,'Geirrvif - On Script - Summon Creature ''Thane Banahogg'''),

(3113505,9,0,0,0,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Script - Remove All NPC Flags'),
(3113505,9,1,0,0,0,100,0,1000,1000,0,0,0,69,8216,3516,653,0,0,0,8,0,0,0,0,8216.64,3516.06,652.885,3.57661,'Geirrvif - On Script - Move To Position'),
(3113505,9,2,0,0,0,100,0,0,0,0,0,0,1,20,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 20'),
(3113505,9,3,0,0,0,100,0,6000,6000,0,0,0,1,21,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 21'),
(3113505,9,4,0,0,0,100,0,6000,6000,0,0,0,1,22,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 22'),
(3113505,9,5,0,0,0,100,0,6000,6000,0,0,0,1,23,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 23'),
(3113505,9,6,0,0,0,100,0,0,0,0,0,0,12,14688,7,0,0,1,0,8,0,0,0,0,8182.54,3489.78,625.505,0.63625,'Geirrvif - On Script - Summon Creature ''Prince Sandoval'''),

(3113506,9,0,0,0,0,100,0,0,0,0,0,0,1,24,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 24'),
(3113506,9,1,0,0,0,100,0,0,0,0,0,0,15,13219,0,0,0,0,0,18,80,0,0,0,0,0,0,0,'Geirrvif - On Script - Quest Credit ''Battle at Valhalas: Final Challenge'''),
(3113506,9,2,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,8216.64,3516.06,624.996,3.57661,'Geirrvif - On Script - Move To Position'),
(3113506,9,3,0,0,0,100,0,5000,5000,0,0,0,1,25,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 25'),
(3113506,9,4,0,0,0,100,0,6000,6000,0,0,0,1,26,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Geirrvif - On Script - Say Line 26'),
(3113506,9,5,0,0,0,100,0,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geirrvif - On Script - Set NPC Flags Gossip & Questgiver'),

(31191,0,0,0,74,0,80,0,0,99,10000,30000,40,11,15586,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Father Jhadras - On Friendly Between 0-99% Health - Cast ''Heal'''),
(31191,0,1,0,0,0,80,0,0,3000,8000,12000,0,11,25054,0,0,0,0,0,5,40,0,0,0,0,0,0,0,'Father Jhadras - IC - Cast ''Holy Smite'''),
(31191,0,2,0,6,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,10,121607,24110,0,0,0,0,0,0,'Father Jhadras - On Just Died - Set Data 3 3 (ELM General Purpose Bunny Large)'),
(31191,0,3,4,1,0,100,0,5000,5000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Father Jhadras - OOC - Set Data 19 19 (Geirrvif)'),
(31191,0,4,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Father Jhadras - Linked - Force Despawn'),
(31191,0,5,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Father Jhadras - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31191,0,6,0,4,0,100,0,0,0,0,0,0,39,70,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Father Jhadras - On Aggro - Call For Help'),
(31191,0,7,0,1,0,100,0,1000,1000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Father Jhadras - OOC - Attack Closest Player'),

(31192,0,0,0,0,0,80,0,10000,15000,15000,25000,0,11,41056,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Masud - IC - Cast ''Whirlwind'''),
(31192,0,1,0,0,0,80,0,0,0,10000,20000,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Masud - IC - Cast ''Cleave'''),
(31192,0,2,0,6,0,100,0,0,0,0,0,0,45,4,4,0,0,0,0,10,121607,24110,0,0,0,0,0,0,'Masud - On Just Died - Set Data 4 4 (ELM General Purpose Bunny Large)'),
(31192,0,3,4,1,0,100,0,5000,5000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Masud - OOC - Set Data 19 19 (Geirrvif)'),
(31192,0,4,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Masud - Linked - Force Despawn'),
(31192,0,5,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Masud - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31192,0,6,0,4,0,100,0,0,0,0,0,0,39,70,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Masud - On Aggro - Call For Help'),
(31192,0,7,0,1,0,100,0,1000,1000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Masud - OOC - Attack Closest Player'),

(31193,0,0,0,0,0,80,0,2000,6000,3000,7000,0,11,61041,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Geness Half-Soul - IC - Cast ''Brutal Fist'''),
(31193,0,1,0,13,0,80,0,10000,15000,0,0,0,11,46182,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Geness Half-Soul - Target Casting - Cast ''Snap Kick'''),
(31193,0,2,0,6,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,10,121607,24110,0,0,0,0,0,0,'Geness Half-Soul - On Just Died - Set Data 2 2 (ELM General Purpose Bunny Large)'),
(31193,0,3,4,1,0,100,0,5000,5000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Geness Half-Soul - OOC - Set Data 19 19 (Geirrvif)'),
(31193,0,4,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geness Half-Soul - Linked - Force Despawn'),
(31193,0,5,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Geness Half-Soul - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31193,0,6,0,4,0,100,0,0,0,0,0,0,39,70,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Geness Half-Soul - On Aggro - Call For Help'),
(31193,0,7,0,1,0,100,0,1000,1000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Geness Half-Soul - OOC - Attack Closest Player'),

(31194,0,0,0,0,0,80,0,0,0,5000,15000,0,11,14873,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Talla - IC - Cast ''Sinister Strike'''),
(31194,0,1,0,0,0,80,0,0,0,20000,25000,0,11,30981,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Talla - IC - Cast ''Crippling Poison'''),
(31194,0,2,0,6,0,100,0,0,0,0,0,0,45,6,6,0,0,0,0,10,121607,24110,0,0,0,0,0,0,'Talla - On Just Died - Set Data 6 6 (ELM General Purpose Bunny Large)'),
(31194,0,3,4,1,0,100,0,5000,5000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Talla - OOC - Set Data 19 19 (Geirrvif)'),
(31194,0,4,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talla - Linked - Force Despawn'),
(31194,0,5,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Talla - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31194,0,6,0,4,0,100,0,0,0,0,0,0,39,70,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talla - On Aggro - Call For Help'),
(31194,0,7,0,1,0,100,0,1000,1000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Talla - OOC - Attack Closest Player'),

(31195,0,0,0,0,0,80,0,0,0,6000,12000,0,11,34829,2,0,0,0,0,5,0,0,0,0,0,0,0,0,'Eldreth - IC - Cast ''Arcane Shot'''),
(31195,0,1,0,0,0,80,0,10000,20000,10000,20000,0,11,44475,2,0,0,0,0,5,0,0,0,0,0,0,0,0,'Eldreth - IC - Cast ''Magic Dampening Field'''),
(31195,0,2,0,9,0,80,0,5,30,3000,6000,0,11,15620,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Eldreth - Within 5-30 Range - Cast ''Shoot'''),
(31195,0,3,0,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,121607,24110,0,0,0,0,0,0,'Eldreth - On Just Died - Set Data 1 1 (ELM General Purpose Bunny Large)'),
(31195,0,4,5,1,0,100,0,5000,5000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Eldreth - OOC - Set Data 19 19 (Geirrvif)'),
(31195,0,5,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eldreth - Linked - Force Despawn'),
(31195,0,6,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Eldreth - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31195,0,7,0,4,0,100,0,0,0,0,0,0,39,70,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eldreth - On Aggro - Call For Help'),
(31195,0,8,0,1,0,100,0,1000,1000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Eldreth - OOC - Attack Closest Player'),

(31196,0,0,0,0,0,80,0,0,0,10000,20000,0,11,61044,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rith - IC - Cast ''Demoralizing Shout'''),
(31196,0,1,0,0,0,80,0,0,0,20000,30000,0,11,58461,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Rith - IC - Cast ''Sunder Armor'''),
(31196,0,2,0,6,0,100,0,0,0,0,0,0,45,5,5,0,0,0,0,10,121607,24110,0,0,0,0,0,0,'Rith - On Just Died - Set Data 5 5 (ELM General Purpose Bunny Large)'),
(31196,0,3,4,1,0,100,0,5000,5000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Rith - OOC - Set Data 19 19 (Geirrvif)'),
(31196,0,4,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rith - Linked - Force Despawn'),
(31196,0,5,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Rith - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31196,0,6,0,4,0,100,0,0,0,0,0,0,39,70,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rith - On Aggro - Call For Help'),
(31196,0,7,0,1,0,100,0,1000,1000,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Rith - OOC - Attack Closest Player'),

(-121607,0,0,0,38,0,100,1,1,1,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny Large - On Data Set 1 1 - Increment Phase By 1'),
(-121607,0,1,0,38,0,100,1,2,2,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny Large - On Data Set 2 2 - Increment Phase By 1'),
(-121607,0,2,0,38,0,100,1,3,3,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny Large - On Data Set 3 3 - Increment Phase By 1'),
(-121607,0,3,0,38,0,100,1,4,4,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny Large - On Data Set 4 4 - Increment Phase By 1'),
(-121607,0,4,0,38,0,100,1,5,5,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny Large - On Data Set 5 5 - Increment Phase By 1'),
(-121607,0,5,0,38,0,100,1,6,6,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny Large - On Data Set 6 6 - Increment Phase By 1'),
(-121607,0,6,0,38,0,100,1,7,7,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny Large - On Data Set 7 7 - Call Script Reset'),
(-121607,0,7,8,1,32,100,1,0,0,0,0,0,45,1,1,0,0,0,0,11,31135,100,0,0,0,0,0,0,'ELM General Purpose Bunny Large - OOC - Set Data 1 1 (Geirrvif) (Phase 6) (No Repeat)'),
(-121607,0,8,0,61,32,100,0,0,0,0,0,0,78,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'ELM General Purpose Bunny Large - Linked - Call Script Reset (Phase 6)'),

(31222,0,0,0,0,0,80,0,0,0,10000,20000,0,11,38243,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Khit''rix the Dark Master - IC - Cast ''Mind Flay'''),
(31222,0,1,0,0,0,80,0,5000,25000,5000,25000,0,11,22884,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Khit''rix the Dark Master - IC - Cast ''Psychic Scream'''),
(31222,0,2,0,0,0,80,0,10000,15000,120000,180000,0,11,61055,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Khit''rix the Dark Master - IC - Cast ''Summon Bone Spiders'''),
(31222,0,3,0,54,0,100,0,0,0,0,0,0,80,3122200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Khit''rix the Dark Master - On Just Summoned - Call Timed Action List'),
(31222,0,4,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Khit''rix the Dark Master - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31222,0,5,0,6,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Khit''rix the Dark Master - On Just Died - Set Data 2 2 (Geirrvif)'),
(31222,0,6,7,1,0,100,0,10000,10000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Khit''rix the Dark Master - OOC - Set Data 19 19 (Geirrvif)'),
(31222,0,7,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Khit''rix the Dark Master - Linked - Force Despawn'),

(3122200,9,0,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Khit''rix the Dark Master - On Script - Set Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(3122200,9,1,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,8197.6,3502.56,625.108,0.585,'Khit''rix the Dark Master - On Script - Move To Position'),
(3122200,9,2,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Khit''rix the Dark Master - On Script - Say Line 0'),
(3122200,9,3,0,0,0,100,0,1000,1000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Khit''rix the Dark Master - On Script - Remove Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(3122200,9,4,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Khit''rix the Dark Master - On Script - Set Home Position'),
(3122200,9,5,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Khit''rix the Dark Master - On Script - Attack Closest Player'),

(31242,0,0,0,1,0,100,1,0,0,0,0,0,11,61165,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - OOC - Cast ''Frostbite Weapon'''),
(31242,0,1,0,9,0,100,0,0,3,8000,20000,0,11,61170,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sigrid Iceborn - Within 0-3 Range - Cast ''Flash Freeze'''),
(31242,0,2,0,9,0,100,0,5,30,5000,10000,1,11,61168,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Sigrid Iceborn - Within 5-30 Range - Cast ''Throw'''),
(31242,0,4,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,10,123494,31135,0,0,0,0,0,0,'Sigrid Iceborn - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31242,0,5,0,6,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,10,123494,31135,0,0,0,0,0,0,'Sigrid Iceborn - On Just Died - Set Data 3 3 (Geirrvif)'),
(31242,0,6,7,1,0,100,1,25000,25000,0,0,0,45,19,19,0,0,0,0,10,123494,31135,0,0,0,0,0,0,'Sigrid Iceborn - OOC - Set Data 19 19 (Geirrvif)'),
(31242,0,7,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - Linked - Force Despawn'),
(31242,0,8,0,54,0,100,0,0,0,0,0,0,80,3124200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - On Just Summoned - Call Timed Action List'),
(31242,0,9,10,38,0,100,1,1,1,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - On Data Set 1 1 - Set Home Position (No Repeat)'),
(31242,0,10,11,61,0,100,1,0,0,0,0,0,49,0,0,0,0,0,0,21,90,0,0,0,0,0,0,0,'Sigrid Iceborn - Linked - Attack Closest Player (No Repeat)'),
(31242,0,11,0,61,0,100,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - Linked - Say Line 1 (No Repeat)'),
(31242,0,12,0,31,0,100,0,61170,0,2000,2000,0,80,3124201,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - On Spell ''Flash Freeze'' Hit Target - Call Timed Action List'),

(3124200,9,0,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - On Script - Set Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(3124200,9,1,0,0,0,100,0,0,0,0,0,0,12,30159,7,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - On Script - Summon Creature ''Sigrid Iceborn''s Proto-Drake'' (No Repeat)'),
(3124200,9,2,0,0,0,100,0,0,0,0,0,0,11,46598,0,0,0,0,0,19,30159,100,0,0,0,0,0,0,'Sigrid Iceborn - On Script - Cast ''Ride Vehicle Hardcoded'' (No Repeat)'),
(3124200,9,3,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - On Script - Say Line 0'),
(3124200,9,4,0,0,0,100,0,18000,18000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn - On Script - Remove Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),

(3124201,9,0,0,0,0,100,0,0,0,0,0,0,11,57635,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sigrid Iceborn - On Script - Cast ''Disengage'''),
(3124201,9,1,0,0,0,100,0,1000,1000,0,0,0,11,61168,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Sigrid Iceborn - On Script - Cast ''Throw'''),

(30159,0,0,0,54,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn''s Proto-Drake - On Just Summoned - Set Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(30159,0,1,0,27,0,100,0,0,0,0,0,0,53,1,30159,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn''s Proto-Drake - On Passenger Boarded - Start WP Movement'),
(30159,0,2,3,40,0,100,1,9,0,0,0,0,45,1,1,0,0,0,0,11,31242,20,0,0,0,0,0,0,'Sigrid Iceborn''s Proto-Drake - On WP 9 Reached - Set Data 1 1 (Sigrid Iceborn) (No Repeat)'),
(30159,0,3,0,61,0,100,1,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sigrid Iceborn''s Proto-Drake - Linked - Force Despawn (No Repeat)'),

(31271,0,1,0,0,0,80,0,10000,30000,20000,40000,0,11,61065,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Carnage - IC - Cast ''War Stomp'''),
(31271,0,2,0,0,0,80,0,5000,12000,5000,12000,0,11,61070,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Carnage - IC - Cast ''Smash'''),
(31271,0,3,0,54,0,100,0,0,0,0,0,0,80,3127100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Carnage - On Just Summoned - Call Timed Action List'),
(31271,0,4,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Carnage - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31271,0,5,0,6,0,100,0,0,0,0,0,0,45,4,4,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Carnage - On Just Died - Set Data 4 4 (Geirrvif)'),
(31271,0,6,7,1,0,100,1,10000,10000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Carnage - OOC - Set Data 19 19 (Geirrvif) (No Repeat)'),
(31271,0,7,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Carnage - Linked - Force Despawn'),

(3127100,9,0,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,8193.26,3496.17,625.067,0.746269,'Carnage - On Script - Move To Position'),
(3127100,9,1,0,0,0,100,0,5000,5000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Carnage - On Script - Remove Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(3127100,9,2,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Carnage - On Script - Set Home Position'),
(3127100,9,3,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Carnage - On Script - Attack Closest Player'),

(31277,0,0,0,0,0,80,0,5000,10000,15000,20000,0,11,13737,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thane Banahogg - IC - Cast ''Mortal Strike'''),
(31277,0,1,0,0,0,80,0,5000,10000,5000,10000,0,11,61133,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thane Banahogg - IC - Cast ''Punt'''),
(31277,0,2,0,0,0,100,0,20000,20000,20000,30000,0,11,61134,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Thane Banahogg - IC - Cast ''Leap'''),
(31277,0,3,0,12,0,100,0,0,19,5000,10000,0,11,61140,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Thane Banahogg - Target Between 0-19% Health - Cast ''Execute'''),
(31277,0,4,0,54,0,100,0,0,0,0,0,0,80,3127700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thane Banahogg - On Just Summoned - Call Timed Action List'),
(31277,0,5,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Thane Banahogg - On Killed Player - Set Data 20 20 (Geirrvif)'),
(31277,0,6,0,6,0,100,0,0,0,0,0,0,45,5,5,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Thane Banahogg - On Just Died - Set Data 5 5 (Geirrvif)'),
(31277,0,7,8,1,0,100,1,15000,15000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Thane Banahogg - OOC - Set Data 19 19 (Geirrvif) (No Repeat)'),
(31277,0,8,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thane Banahogg - Linked - Force Despawn'),

(3127700,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thane Banahogg - On Script - Say Line 0'),
(3127700,9,1,0,0,0,100,0,5000,5000,0,0,0,97,25,30,0,0,0,0,1,0,0,0,0,8169,3477.07,626.469,0.673769,'Thane Banahogg - On Script - Jump To Pos'),
(3127700,9,2,0,0,0,100,0,2000,2000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,8192.78,3493.97,625.145,0.717758,'Thane Banahogg - On Script - Move To Position'),
(3127700,9,3,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thane Banahogg - On Script - Say Line 1'),
(3127700,9,4,0,0,0,100,0,2000,2000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thane Banahogg - On Script - Say Line 2'),
(3127700,9,5,0,0,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thane Banahogg - On Script - Remove Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(3127700,9,6,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thane Banahogg - On Script - Set Home Position'),
(3127700,9,7,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,0,'Thane Banahogg - On Script - Attack Closest Player'),

(14688,0,0,0,0,0,80,0,5000,10000,10000,20000,0,11,61162,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Prince Sandoval - IC - Cast ''Engulfing Strike'''),
(14688,0,1,0,0,0,80,0,15000,20000,30000,30000,0,11,61163,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Prince Sandoval - IC - Cast ''Fire Nova'''),
(14688,0,2,0,0,0,100,0,30000,30000,30000,30000,0,11,61144,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - IC - Cast ''Fire Shield'''),
(14688,0,3,4,0,0,100,0,31100,31100,30000,30000,0,11,61145,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - IC - Cast ''Ember Shower'''),
(14688,0,4,5,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - IC - Disable Combat Movement'),
(14688,0,5,6,61,0,100,0,0,0,0,0,0,18,131077,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Set Flags Server Controlled & Disable Movement & Pacified'),
(14688,0,6,0,61,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Set Rooted On'),
(14688,0,7,8,0,0,100,0,45100,45100,30000,30000,0,19,131077,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - IC - Remove Flags Server Controlled & Disable Movement & Pacified'),
(14688,0,8,9,61,0,100,0,0,0,0,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Enable Combat Movement'),
(14688,0,9,10,61,0,100,0,0,0,0,0,0,28,61144,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Remove Aura ''Fire Shield'''),
(14688,0,10,11,61,0,100,0,0,0,0,0,0,28,61145,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Remove Aura ''Ember Shower'''),
(14688,0,11,0,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Set Rooted Off'),
(14688,0,12,0,54,0,100,0,0,0,0,0,0,80,1468800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - On Just Summoned - Call Timed Action List'),
(14688,0,13,0,5,0,100,0,0,0,1,0,0,45,20,20,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Prince Sandoval - On Killed Player - Set Data 20 20 (Geirrvif)'),
(14688,0,14,0,6,0,100,0,0,0,0,0,0,45,6,6,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Prince Sandoval - On Just Died - Set Data 6 6 (Geirrvif)'),
(14688,0,15,16,1,0,100,1,15000,15000,0,0,0,45,19,19,0,0,0,0,11,31135,100,0,0,0,0,0,0,'Prince Sandoval - OOC - Set Data 19 19 (Geirrvif)'),
(14688,0,16,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Force Despawn'),
(14688,0,17,18,7,0,100,0,0,0,0,0,0,19,131077,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - On Evade - Remove Flags Server Controlled & Disable Movement & Pacified'),
(14688,0,18,19,61,0,100,0,0,0,0,0,0,28,61144,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Remove Aura ''Fire Shield'''),
(14688,0,19,20,61,0,100,0,0,0,0,0,0,28,61145,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Remove Aura ''Ember Shower'''),
(14688,0,20,0,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - Linked - Set Rooted Off'),

(1468800,9,0,0,0,0,100,0,0,0,0,0,0,11,4335,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - On Just Summoned - Cast ''Spawn Smoke (scale x2.00)'''),
(1468800,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - On Just Summoned - Say Line 0'),
(1468800,9,2,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - On Script - Say Line 1'),
(1468800,9,3,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,8197.6,3502.56,625.108,0.585,'Prince Sandoval - On Script - Move To Position'),
(1468800,9,4,0,0,0,100,0,7500,7500,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - On Script - Say Line 2'),
(1468800,9,5,0,0,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - On Script - Remove Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1468800,9,6,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Prince Sandoval - On Script - Set Home Position'),
(1468800,9,7,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Prince Sandoval - On Script - Attack Closest Player');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
