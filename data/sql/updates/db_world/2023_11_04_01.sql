UPDATE `quest_template_addon` SET `SpecialFlags` = `SpecialFlags` & ~1 WHERE `ID` = 5058;
UPDATE `gameobject_template` SET `AIName` = '' WHERE `entry` = 175926;

DELETE FROM `creature_template_addon` WHERE `entry` = 10836;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(10836,0,0,0,0,0,0,'3417');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 10836;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 10836;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (175926,175925);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (17592600,17592500);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(175925,1,0,0,20,0,100,0,5059,0,0,0,0,12,10836,1,300000,2,0,0,8,0,0,0,0,1941.1,-1652.11,59.5329,3.23038,'Outhouse - On Quest ''Locked Away'' Rewarded - Summon Creature ''Farmer Dalson'''),

(10836,0,0,0,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farmer Dalson - On Just Summoned - Set Active On'),
(10836,0,1,2,4,0,100,0,0,0,0,0,0,11,15716,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farmer Dalson - On Aggro - Cast ''Enrage'''),
(10836,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Farmer Dalson - Linked - Say Line 0'),
(10836,0,3,0,0,0,100,0,2000,5000,7000,12000,0,11,16128,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Farmer Dalson - IC - Cast ''Infected Bite''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 3001;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 1 AND `SourceGroup` = 10816 AND `SourceEntry` = 12738;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` = 5059;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,3001,3693,0,0,47,0,5058,64,0,1,0,0,'GO ''Mrs. Dalson''s Diary'' - Group 0: Show gossip text 3693 if quest ''Mrs. Dalson''s Diary'' is not rewarded'),
(14,3001,3694,0,0,47,0,5058,64,0,0,0,0,'GO ''Mrs. Dalson''s Diary'' - Group 0: Show gossip text 3694 if quest ''Mrs. Dalson''s Diary'' is rewarded'),

(1,10816,12738,0,0,47,0,5058,64,0,0,0,0,'Creature ''Wandering Skeleton'' - Group 0: Item ''Dalson Outhouse Key'' can only be looted if quest ''Mrs. Dalson''s Diary'' is rewarded'),
(1,10816,12738,0,0,47,0,5060,64,0,1,0,0,'Creature ''Wandering Skeleton'' - Group 0: Item ''Dalson Outhouse Key'' can only be looted if quest ''Locked Away'' is not rewarded'),

(19,0,5059,0,0,47,0,5060,64,0,1,0,0,'Quest ''Locked Away'' - Group 0: Can accept the quest only if quest ''Locked Away'' is not rewarded'),
(20,0,5059,0,0,47,0,5060,64,0,1,0,0,'Quest ''Locked Away'' - Group 0: Show quest mark only if quest ''Locked Away'' is not rewarded');
