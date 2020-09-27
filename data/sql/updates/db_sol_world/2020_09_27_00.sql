-- DB update 2020_09_23_01 -> 2020_09_27_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_09_23_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_09_23_01 2020_09_27_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1601213904298909043'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1601213904298909043');

UPDATE `creature_template` SET `ScriptName` = 'npc_zeppelin_master' WHERE `entry` IN (3149,3150,9564,9566,12136,12137,26537,26538,26539,26540,23635,23713);

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (2441,2101,1969,1971,3841,3842,8767,8786);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(2441,0,0,'Where is the zeppelin now?',22086,1,1,0,0,0,0,'',0,0),
(2101,0,0,'Where is the zeppelin now?',22086,1,1,0,0,0,0,'',0,0),
(1969,0,0,'Where is the zeppelin now?',22086,1,1,0,0,0,0,'',0,0),
(1971,0,0,'Where is the zeppelin now?',22086,1,1,0,0,0,0,'',0,0),
(3841,0,0,'Where is the zeppelin now?',22086,1,1,0,0,0,0,'',0,0),
(3842,0,0,'Where is the zeppelin now?',22086,1,1,0,0,0,0,'',0,0),
(8767,0,0,'Where is the zeppelin to Undercity right now?',22108,1,1,0,0,0,0,'',0,0),
(8767,1,0,'Where is the zeppelin to Grom''gol right now?',22109,1,1,0,0,0,0,'',0,0),
(8786,0,0,'Where is the zeppelin to Orgrimmar right now?',22185,1,1,0,0,0,0,'',0,0),
(8786,1,0,'Where is the zeppelin to Grom''gol right now?',22199,1,1,0,0,0,0,'',0,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
