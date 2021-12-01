-- DB update 2021_12_01_01 -> 2021_12_01_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_01_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_01_01 2021_12_01_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1638396155535502335'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1638396155535502335');

UPDATE `creature_template` SET `gossip_menu_id` = 1842 WHERE `entry` = 9459;
UPDATE `creature_template` SET `InhabitType` = 1 WHERE `entry` = 9461;

DELETE FROM `gossip_menu` WHERE `MenuID` IN (1842,1843,40060);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(1842,2493),
(1843,2494);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 40060;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 9459;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9459,0,0,2,62,0,100,0,1843,0,0,0,0,12,9461,1,360000,0,0,0,8,0,0,0,0,-7656.94,-3009.47,133.206,4.83028,'Cyrus Therepentous - On Gossip Option 0 Selected - Summon Creature ''Frenzied Black Drake'''),
(9459,0,1,2,62,0,100,0,1842,0,0,0,0,15,4022,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Cyrus Therepentous - On Gossip Option 0 Selected - Reward Quest ''A Taste of Flame (1)'''),
(9459,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Cyrus Therepentous - Linked - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` IN (1842,1843,40060);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (4022,4023);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,1842,0,0,0,47,0,4022,8,0,0,0,0,'Cyrus Therepentous - Group 0: Show gossip option 0 if the quest ''A Taste of Flame (1)'' is in progress'),
(15,1842,1,0,0,47,0,4023,8,0,0,0,0,'Cyrus Therepentous - Group 0: Show gossip option 1 if the quest ''A Taste of Flame (2)'' is in progress'),
(15,1843,0,0,0,29,0,9461,100,0,1,0,0,'Cyrus Therepentous - Group 0: Show gossip option 0 if not near ''Frenzied Black Drake'''),

(19,0,4022,0,0,2,0,10575,1,1,0,0,0,'Quest ''A Taste of Flame (1)'' - Group 0: Can accept the quest only if the player does have the item ''Black Dragonflight Molt'' in the inventory or in the bank'),
(20,0,4022,0,0,2,0,10575,1,1,0,0,0,'Quest ''A Taste of Flame (1)'' - Group 0: Show quest mark only if the player does have the item ''Black Dragonflight Molt'' in the inventory or in the bank'),

(19,0,4023,0,0,2,0,10575,1,1,1,0,0,'Quest ''A Taste of Flame (2)'' - Group 0: Can accept the quest only if the player does not have the item ''Black Dragonflight Molt'' in the inventory or in the bank'),
(20,0,4023,0,0,2,0,10575,1,1,1,0,0,'Quest ''A Taste of Flame (2)'' - Group 0: Show quest mark only if the player does not have the item ''Black Dragonflight Molt'' in the inventory or in the bank');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
