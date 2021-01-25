-- DB update 2021_01_25_02 -> 2021_01_26_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_25_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_25_02 2021_01_26_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1611616855374562457'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1611616855374562457');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 25462 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2546200 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25462,0,0,0,19,0,100,0,12593,0,0,0,0,80,2546200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Lich King - On Quest ''In Service Of The Lich King'' Accepted - Call Timed Action List'),

(2546200,9,0,0,0,0,100,0,5000,5000,0,0,0,4,14734,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Lich King - On Script - Play Sound'),
(2546200,9,1,0,0,0,100,0,21000,21000,0,0,0,4,14735,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Lich King - On Script - Play Sound'),
(2546200,9,2,0,0,0,100,0,26000,26000,0,0,0,4,14736,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Lich King - On Script - Play Sound');

DELETE FROM `quest_details` WHERE `ID` = 12593;
INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `VerifiedBuild`)
VALUES
(12593,396,397,396,396,1000,500,1000,1000,20886);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
