-- DB update 2021_08_17_00 -> 2021_08_18_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_17_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_17_00 2021_08_18_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629238606461980078'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629238606461980078');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (16927,16928,24920,16966,16967,16946,16947,18974,19408,16879,18978,19261,18975,19282,19335);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (16927,16928,16929,24920,16966,16967,16946,16947,18974,19408,16879,18978,19261,18975,19282,19335);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16927,0,0,1,2,0,100,1,0,50,0,0,0,11,33896,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Whelp - Between 0-50% Health - Cast ''Desperate Defense'' (No Repeat)'),
(16927,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Whelp - Linked - Say Line 0'),

(16928,0,0,0,1,0,100,1,1000,1500,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Ambusher - OOC - Cast ''Sneak'' (No Repeat)'),
(16928,0,1,2,2,0,100,1,0,50,0,0,0,11,33896,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Ambusher - Between 0-50% Health - Cast ''Desperate Defense'' (No Repeat)'),
(16928,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Ambusher - Linked - Say Line 0'),

(16929,0,0,0,0,0,50,0,3000,3000,8000,8000,0,11,33911,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Stonescythe Alpha - IC - Cast ''Tear Armor'''),
(16929,0,1,2,2,0,100,1,0,50,0,0,0,11,33896,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Alpha - Between 0-50% Health - Cast ''Desperate Defense'' (No Repeat)'),
(16929,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Alpha - Linked - Say Line 0'),

(24920,0,0,0,0,0,100,0,2500,5000,15000,20000,0,11,46202,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razorthorn Flayer - IC - Cast ''Pierce Armor'''),
(24920,0,1,0,0,0,100,0,10000,12500,25000,30000,0,11,13443,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Razorthorn Flayer - IC - Cast ''Rend'''),
(24920,0,2,3,2,0,100,1,0,50,0,0,0,11,33896,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razorthorn Flayer - Between 0-50% Health - Cast ''Desperate Defense'' (No Repeat)'),
(24920,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razorthorn Flayer - Linked - Say Line 0'),

(16966,0,0,0,0,0,100,0,0,0,10000,12500,0,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Haal''eshi Windwalker - IC - Cast ''Lightning Bolt'''),
(16966,0,1,0,2,0,100,1,20,80,0,0,0,11,32717,1,0,1,0,0,2,0,0,0,0,0,0,0,0,'Haal''eshi Windwalker - Between 20-80% Health - Cast ''Hurricane'' (No Repeat)'),

(16967,0,0,0,11,0,100,1,0,0,0,0,0,11,29651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Haal''eshi Talonguard - On Respawn - Cast ''Dual Wield'' (No Repeat)'),

(16946,0,0,0,4,0,100,1,0,0,0,0,0,11,32735,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Forgefiend - On Aggro - Cast ''Saw Blade'' (No Repeat)'),
(16946,0,1,0,0,0,100,0,2500,5000,15000,20000,0,11,36486,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Mo''arg Forgefiend - IC - Cast ''Slime Spray'''),

(16947,0,0,0,0,0,100,0,5000,10000,15000,20000,0,11,32003,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gan''arg Servant - IC - Cast ''Power Burn'''),

(18974,0,0,0,0,0,100,0,2500,5000,10000,12500,0,11,32004,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Z''kral - In Combat - Cast ''Drill'''),
(18974,0,1,0,0,0,100,0,5000,10000,15000,20000,0,11,32003,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Z''kral - In Combat - Cast ''Power Burn'''),

(19408,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,15968,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Maiden of Pain - In Combat - Cast ''Lash of Pain'''),
(19408,0,1,0,2,0,100,1,10,30,0,0,0,11,40743,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Maiden of Pain - Between 10-30% Health - Cast ''Frenzy'' (No Repeat)'),

(16879,0,0,0,2,0,100,1,20,80,0,0,0,11,33908,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Starving Helboar - Between 20-80% Health - Cast ''Burning Spikes'' (No Repeat)'),

(18978,0,0,0,4,0,100,0,0,0,0,0,0,11,18968,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heckling Fel Sprite - On Aggro - Cast ''Fire Shield'''),

(19261,0,0,0,1,0,100,1,1000,1500,0,0,0,11,19483,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infernal Warbringer - OOC - Cast ''Immolation'' (No Repeat)'),

(18975,0,0,0,0,0,100,0,2500,5000,10000,15000,0,11,33802,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wrathguard - IC - Cast ''Burn'''),

(19282,0,0,0,11,0,100,1,0,0,0,0,0,11,29651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Subjugator Shi''aziv - On Respawn - Cast ''Dual Wield'' (No Repeat)'),
(19282,0,1,0,0,0,100,0,5000,10000,15000,20000,0,11,32026,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Subjugator Shi''aziv - IC - Cast ''Pain Spike'''),
(19282,0,2,0,2,0,100,1,20,80,0,0,0,11,32000,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Subjugator Shi''aziv - Between 20-80% Health - Cast ''Mind Sear'' (No Repeat)'),

(19335,0,0,0,11,0,100,1,0,0,0,0,0,11,29651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Subjugator Yalqiz - On Respawn - Cast ''Dual Wield'' (No Repeat)'),
(19335,0,1,0,0,0,100,0,5000,10000,15000,20000,0,11,32026,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Subjugator Yalqiz - IC - Cast ''Pain Spike'''),
(19335,0,2,0,2,0,100,1,20,80,0,0,0,11,32000,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Subjugator Yalqiz - Between 20-80% Health - Cast ''Mind Sear'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
