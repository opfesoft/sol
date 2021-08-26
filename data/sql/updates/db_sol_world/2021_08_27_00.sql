-- DB update 2021_08_26_07 -> 2021_08_27_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_26_07';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_26_07 2021_08_27_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630019220096767578'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630019220096767578');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28136,28142,28148);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2813600,2814200,2814800);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28136,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - On Just Summoned - Set Active On'),
(28136,0,1,2,61,0,100,0,0,0,0,0,0,41,240000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Force Despawn'),
(28136,0,2,3,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(28136,0,3,4,61,0,100,0,0,0,0,0,0,11,50665,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Cast ''Bleeding Out'''),
(28136,0,4,5,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Store Targetlist (Invoker)'),
(28136,0,5,6,61,0,100,0,0,0,0,0,0,29,0,180,0,0,0,0,7,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Start Follow (Invoker)'),
(28136,0,6,7,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Set Event Phase 1'),
(28136,0,7,0,61,0,100,0,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Remove ''UNIT_STAND_STATE_SIT'''),
(28136,0,8,0,23,1,100,0,50665,0,0,0,0,80,2813600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - On Has No Aura ''Bleeding Out'' - Call Timed Action List (Phase 1)'),
(28136,0,9,0,40,0,100,0,5,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - On WP 5 Reached - Set ''UNIT_STAND_STATE_SIT'''),
(28136,0,10,11,8,1,100,0,50669,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - On Spellhit ''Quest Credit'' - Set Event Phase 2 (Phase 1)'),
(28136,0,11,12,61,0,100,0,0,0,0,0,0,11,50671,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Cast ''Kill Credit Jonathan 01'''),
(28136,0,12,13,61,0,100,0,0,0,0,0,0,11,50709,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Cast ''Strip Aura Jonathan 01'''),
(28136,0,13,14,61,0,100,0,0,0,0,0,0,86,50680,0,12,1,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Cross Cast ''Jonathan Kill Credit'''),
(28136,0,14,15,61,0,100,0,0,0,0,0,0,86,50710,0,12,1,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Cross Cast ''Strip Aura Jonanthan'''),
(28136,0,15,16,61,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Stop Follow'),
(28136,0,16,17,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Say Line 0'),
(28136,0,17,18,61,0,100,0,0,0,0,0,0,53,0,28136,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Start WP Movement'),
(28136,0,18,0,61,0,100,0,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - Linked - Remove ''GOSSIP_OPTION_GOSSIP'''),
(28136,0,19,0,6,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - On Death - Set Active On'),

(2813600,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - On Script - Say Line 1'),
(2813600,9,1,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - On Script - Set Event Phase 2'),
(2813600,9,2,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Crusader Jonathan - On Script - Stop Follow'),
(2813600,9,3,0,0,0,100,0,2000,2000,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Jonathan - On Script - Die'),

(28142,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - On Just Summoned - Set Active On'),
(28142,0,1,2,61,0,100,0,0,0,0,0,0,41,240000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Force Despawn'),
(28142,0,2,3,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(28142,0,3,4,61,0,100,0,0,0,0,0,0,11,50681,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Cast ''Bleeding Out'''),
(28142,0,4,5,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Store Targetlist (Invoker)'),
(28142,0,5,6,61,0,100,0,0,0,0,0,0,29,0,180,0,0,0,0,7,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Start Follow (Invoker)'),
(28142,0,6,7,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Set Event Phase 1'),
(28142,0,7,0,61,0,100,0,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Remove ''UNIT_STAND_STATE_SIT'''),
(28142,0,8,0,23,1,100,0,50681,0,0,0,0,80,2814200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - On Has No Aura ''Bleeding Out'' - Call Timed Action List (Phase 1)'),
(28142,0,9,0,40,0,100,0,5,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - On WP 5 Reached - Set ''UNIT_STAND_STATE_SIT'''),
(28142,0,10,11,8,1,100,0,50669,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - On Spellhit ''Quest Credit'' - Set Event Phase 2 (Phase 1)'),
(28142,0,11,12,61,0,100,0,0,0,0,0,0,11,50683,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Cast ''Kill Credit Lamoof 01'''),
(28142,0,12,13,61,0,100,0,0,0,0,0,0,11,50723,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Cast ''Strip Aura Lamoof 01'''),
(28142,0,13,14,61,0,100,0,0,0,0,0,0,86,50684,0,12,1,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Cross Cast ''Lamoof Kill Credit'''),
(28142,0,14,15,61,0,100,0,0,0,0,0,0,86,50722,0,12,1,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Cross Cast ''Strip Aura Lamoof'''),
(28142,0,15,16,61,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Stop Follow'),
(28142,0,16,17,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Say Line 0'),
(28142,0,17,18,61,0,100,0,0,0,0,0,0,53,0,28142,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Start WP Movement'),
(28142,0,18,0,61,0,100,0,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - Linked - Remove ''GOSSIP_OPTION_GOSSIP'''),
(28142,0,19,0,6,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - On Death - Set Active On'),

(2814200,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - On Script - Say Line 1'),
(2814200,9,1,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - On Script - Set Event Phase 2'),
(2814200,9,2,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Crusader Lamoof - On Script - Stop Follow'),
(2814200,9,3,0,0,0,100,0,2000,2000,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Lamoof - On Script - Die'),

(28148,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - On Just Summoned - Set Active On'),
(28148,0,1,2,61,0,100,0,0,0,0,0,0,41,240000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Force Despawn'),
(28148,0,2,3,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(28148,0,3,4,61,0,100,0,0,0,0,0,0,11,50695,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Cast ''Bleeding Out'''),
(28148,0,4,5,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Store Targetlist (Invoker)'),
(28148,0,5,6,61,0,100,0,0,0,0,0,0,29,0,180,0,0,0,0,7,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Start Follow (Invoker)'),
(28148,0,6,7,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Set Event Phase 1'),
(28148,0,7,0,61,0,100,0,0,0,0,0,0,91,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Remove ''UNIT_STAND_STATE_SIT'''),
(28148,0,8,0,23,1,100,0,50695,0,0,0,0,80,2814800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - On Has No Aura ''Bleeding Out'' - Call Timed Action List (Phase 1)'),
(28148,0,9,0,40,0,100,0,4,0,0,0,0,90,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - On WP 4 Reached - Set ''UNIT_STAND_STATE_SIT'''),
(28148,0,10,11,8,1,100,0,50669,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - On Spellhit ''Quest Credit'' - Set Event Phase 2 (Phase 1)'),
(28148,0,11,12,61,0,100,0,0,0,0,0,0,11,50698,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Cast ''Kill Credit Jospehine 01'''),
(28148,0,12,13,61,0,100,0,0,0,0,0,0,11,50711,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Cast ''Strip Aura Josephine 01'''),
(28148,0,13,14,61,0,100,0,0,0,0,0,0,86,50699,0,12,1,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Cross Cast ''Josephine Kill Credit'''),
(28148,0,14,15,61,0,100,0,0,0,0,0,0,86,50712,0,12,1,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Cross Cast ''Strip Aura Josephine'''),
(28148,0,15,16,61,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Stop Follow'),
(28148,0,16,17,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Say Line 0'),
(28148,0,17,18,61,0,100,0,0,0,0,0,0,53,0,28148,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Start WP Movement'),
(28148,0,18,0,61,0,100,0,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - Linked - Remove ''GOSSIP_OPTION_GOSSIP'''),
(28148,0,19,0,6,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - On Death - Set Active On'),

(2814800,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - On Script - Say Line 1'),
(2814800,9,1,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - On Script - Set Event Phase 2'),
(2814800,9,2,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Crusader Josephine - On Script - Stop Follow'),
(2814800,9,3,0,0,0,100,0,2000,2000,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crusader Josephine - On Script - Die');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
