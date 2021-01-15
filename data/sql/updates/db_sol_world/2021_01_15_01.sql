-- DB update 2021_01_15_00 -> 2021_01_15_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_15_00 2021_01_15_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1610731684508241974'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1610731684508241974');

DELETE FROM `gameobject` WHERE `guid` IN (268912,2134514,2134515,2134516,2134517);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(2134514,185522,557,0,0,2,1,-235.563,-13.4403,17.066,1.43332,0,0,0.656869,0.754005,7200,255,1,0),
(2134515,185460,557,0,0,2,1,-235.563,-13.4403,17.066,1.43332,0,0,0.656869,0.754005,300,255,1,0),
(2134516,185460,557,0,0,2,1,8.73419,-223.864,-0.954936,0.284522,0,0,0.141782,0.989898,300,255,1,0),
(2134517,185519,557,0,0,2,1,8.73419,-223.864,-0.954936,0.284522,0,0,0.141782,0.989898,300,255,1,0);

DELETE FROM `creature_text` WHERE `CreatureID` = 22928;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(22928,0,0,'I... I am free! Ethereum were planning on torturing me until I gave in to their requests. I fear that, had you not come along, I would have surely given in to their torment.',12,0,100,0,0,0,20633,0,'Ambassador Pax''ivi'),
(22928,1,0,'Know this, $r. Within Shaffar''s chambers at the end of these tombs rests a creature of unimaginable power. It is held in check by the power of the stasis chamber. You must return to Ameer before you venture further if you wish to destroy it!',12,0,100,0,0,0,20634,0,'Ambassador Pax''ivi');

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 185522;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 22928;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (185519,185522) AND `source_type` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22928,22930) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2292800 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185519,1,0,1,70,0,100,0,2,0,0,0,0,15,10977,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Mana Tombs Stasis Chamber - On Gameobject State Changed - Complete quest'),
(185519,1,1,0,61,0,100,0,0,0,0,0,0,12,22928,8,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mana Tombs Stasis Chamber - Linked - Summon ''Ambassador Pax''ivi'''),

(185522,1,0,1,70,0,100,0,2,0,0,0,0,12,22930,8,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shaffar''s Stasis Chamber - On Gameobject State Changed - Summon ''Yor'''),
(185522,1,1,0,61,0,100,0,0,0,0,0,0,2,16,0,0,0,0,0,19,22930,0,0,0,0,0,0,0,'Shaffar''s Stasis Chamber - Linked - Set Faction ''Yor'''),

(22928,0,0,0,54,0,100,0,0,0,0,0,0,80,2292800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ambassador Pax''ivi - On Just Summoned - Call Timed Action List'),
(2292800,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Ambassador Pax''ivi - On Script - Set Orientation (Closest Player)'),
(2292800,9,1,0,0,0,100,0,2000,2000,0,0,0,1,0,0,1,0,0,0,21,50,0,0,0,0,0,0,0,'Ambassador Pax''ivi - On Script - Say Line 0'),
(2292800,9,2,0,0,0,100,0,8000,8000,0,0,0,1,1,0,1,0,0,0,21,50,0,0,0,0,0,0,0,'Ambassador Pax''ivi - On Script - Say Line 1'),
(2292800,9,3,0,0,0,100,0,14000,14000,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ambassador Pax''ivi - On Script - Cast ''Ethereal Teleport'''),
(2292800,9,4,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ambassador Pax''ivi - On Script - Force Despawn'),

(22930,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,'Yor - On Just Summoned - Attack Closest Player'),
(22930,0,1,0,0,0,100,0,10000,12000,8000,11000,0,11,38361,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Yor - IC - Cast ''Double Breath'''),
(22930,0,2,0,0,0,100,0,7000,9000,12000,15000,0,11,36405,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Yor - IC - Cast ''Stomp''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
