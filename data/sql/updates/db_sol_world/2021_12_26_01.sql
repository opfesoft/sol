-- DB update 2021_12_26_00 -> 2021_12_26_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_26_00 2021_12_26_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1640558352842475153'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1640558352842475153');

DELETE FROM `creature` WHERE `guid` = 3110330; -- Corporal Thund Splithoof: Remove obsolete spawn

-- Heroes of Old, part 2: Should be rewarded by Spectral Lockbox, not Corporal Thund Splithoof
DELETE FROM `creature_questender` WHERE `id` = 7750 AND `quest` = 2701;
DELETE FROM `gameobject_questender` WHERE `id` = 141980 AND `quest` = 2701;
INSERT INTO `gameobject_questender` (`id`, `quest`)
VALUES
(141980,2701);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 840 AND `OptionID` = 3;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(840,3,0,'I have destroyed my Azsharite weaponry! I need your assistance in defeating the triad of power.',5260,1,3,0,0,0,0,'',0,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (7572,7750);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 757200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7572,0,0,2,62,0,100,0,842,0,0,0,0,26,2784,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Gossip Option 0 Selected - Quest Credit ''Fall From Grace'' (Invoker)'),
(7572,0,1,2,62,0,100,0,881,0,0,0,0,26,2801,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Gossip Option 0 Selected - Quest Credit ''A Tale of Sorrow'' (Invoker)'),
(7572,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - Linked - Close Gossip'),
(7572,0,3,2,62,0,100,0,840,2,0,0,0,80,757200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Gossip Option 2 Selected - Call Timed Action List'),
(7572,0,4,0,19,0,100,0,2702,0,0,0,0,80,757200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Quest ''Heroes of Old, part 1'' Accepted - Call Timed Action List'),
(7572,0,5,2,62,0,100,0,840,3,0,0,0,11,15247,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Gossip Option 3 Selected - Invoker Cast ''Conjure Fel Salve'''),

(757200,9,0,0,0,0,100,0,0,0,0,0,0,11,11024,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Script - Cast ''Call of Thund'''),
(757200,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fallen Hero of the Horde - On Script - Say Line 0'),
(757200,9,2,0,0,0,100,0,1500,1500,0,0,0,12,7750,3,300000,0,0,0,8,0,0,0,0,-10630.2,-2988.19,28.8757,4.93301,'Fallen Hero of the Horde - On Script - Summon Creature ''Corporal Thund Splithoof'''),

(7750,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Corporal Thund Splithoof - On Just Summoned - Set Active On'),
(7750,0,1,2,61,0,100,0,0,0,0,0,0,70,300,0,0,0,0,0,14,44733,141980,0,0,0,0,0,0,'Corporal Thund Splithoof - Linked - Respawn GO ''Spectral Lockbox'''),
(7750,0,2,0,61,0,100,0,0,0,0,0,0,70,300,0,0,0,0,0,14,44732,141981,0,0,0,0,0,0,'Corporal Thund Splithoof - Linked - Respawn GO ''Spectral Lockbox Particles''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 840;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,840,1451,0,0,47,0,2801,8,0,0,0,0,'Fallen Hero of the Horde - Group 0: Show gossip text 1451 if quest ''A Tale of Sorrow'' is in progress'),
(14,840,1391,0,0,47,0,2801,8,0,1,0,0,'Fallen Hero of the Horde - Group 0: Show gossip text 1391 if quest ''A Tale of Sorrow'' is not in progress'),

(15,840,0,0,0,47,0,2784,8,0,0,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 0 if quest ''Fall From Grace'' is in progress'),

(15,840,1,0,0,47,0,2801,8,0,0,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 1 if quest ''A Tale of Sorrow'' is in progress'),

(15,840,2,0,0,47,0,2702,74,0,0,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 2 if quest ''Heroes of Old, part 1'' is completed, in progress or rewarded'),
(15,840,2,0,0,47,0,2701,64,0,1,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 2 if quest ''Heroes of Old, part 2'' is not rewarded'),
(15,840,2,0,0,29,1,7750,50,0,1,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 2 if not near ''Corporal Thund Splithoof'''),

(15,840,3,0,0,47,0,3627,8,0,0,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 3 if quest ''Uniting the Shattered Amulet'' is in progress'),
(15,840,3,0,0,2,0,11582,1,1,1,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 3 if the player does not have the item ''Fel Salve'' in the inventory or in the bank'),
(15,840,3,0,0,2,0,10696,1,1,1,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 3 if the player does not have the item ''Enchanted Azsharite Felbane Sword'' in the inventory or in the bank'),
(15,840,3,0,0,2,0,10697,1,1,1,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 3 if the player does not have the item ''Enchanted Azsharite Felbane Dagger'' in the inventory or in the bank'),
(15,840,3,0,0,2,0,10698,1,1,1,0,0,'Fallen Hero of the Horde - Group 0: Show gossip option 3 if the player does not have the item ''Enchanted Azsharite Felbane Staff'' in the inventory or in the bank');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
