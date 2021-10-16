-- DB update 2021_10_16_00 -> 2021_10_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_16_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_16_00 2021_10_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634426341073931262'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634426341073931262');

DELETE FROM `quest_template_addon` WHERE `ID` = 4083;
UPDATE `gameobject` SET `position_x` = 1225.07, `position_y` = -244.98, `position_z` = -85.67  WHERE `guid` = 67871;
UPDATE `gossip_menu_option` SET `OptionText` = 'I have paid your price, Gloom''rel.  Now, teach me your secrets!', `OptionBroadcastTextID` = 4900 WHERE `MenuID` = 1945 AND `OptionID` = 0;
UPDATE `gossip_menu_option` SET `OptionText` = 'Gloom''rel, tell me your secrets!', `OptionBroadcastTextID` = 4897 WHERE `MenuID` = 1945 AND `OptionID` = 1;
UPDATE `quest_offer_reward` SET `RewardText` = 'The gems make no sound as they fall into depths of the chalice...' WHERE `ID` = 4083;
UPDATE `quest_request_items` SET `CompletionText` = 'The spectral chalice floats in the air, slowing rising and falling... as if to the beat of a dying heart.' WHERE `ID` = 4083;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
