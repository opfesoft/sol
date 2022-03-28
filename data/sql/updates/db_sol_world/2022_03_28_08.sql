-- DB update 2022_03_28_07 -> 2022_03_28_08
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_28_07';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_28_07 2022_03_28_08 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648498717668812042'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648498717668812042');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (3183,3184);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,3183,3939,0,0,47,0,5230,64,0,1,0,0,'Shadow Priestess Vandis - Group 0: Show gossip menu text 3939 if quest ''Return to the Bulwark'' is not rewarded'),
(14,3183,4040,0,0,47,0,5230,64,0,0,0,0,'Shadow Priestess Vandis - Group 0: Show gossip menu text 4040 if quest ''Return to the Bulwark'' is rewarded'),
(15,3183,0,0,0,47,0,5230,64,0,0,0,0,'Shadow Priestess Vandis - Group 0: Show gossip option 0 if quest ''Return to the Bulwark'' is rewarded'),

(14,3184,3940,0,0,47,0,5217,64,0,1,0,0,'High Priestess MacDonnell - Group 0: Show gossip menu text 3940 if quest ''Return to Chillwind Camp'' is not rewarded'),
(14,3184,4039,0,0,47,0,5217,64,0,0,0,0,'High Priestess MacDonnell - Group 0: Show gossip menu text 4039 if quest ''Return to Chillwind Camp'' is rewarded'),
(15,3184,0,0,0,47,0,5217,64,0,0,0,0,'High Priestess MacDonnell - Group 0: Show gossip option 0 if quest ''Return to Chillwind Camp'' is rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
