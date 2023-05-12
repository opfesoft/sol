DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (10641,10668,10669);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(19,0,10641,0,0,47,0,10640,64,0,0,0,0,'Quest ''Against the Legion'' - Group 0: Can accept the quest only if quest ''Altruis (Aldor)'' is rewarded'),
(19,0,10641,0,1,47,0,10689,64,0,0,0,0,'Quest ''Against the Legion'' - Group 1: Can accept the quest only if quest ''Altruis (Scryers)'' is rewarded'),
(20,0,10641,0,0,47,0,10640,64,0,0,0,0,'Quest ''Against the Legion'' - Group 0: Show quest mark only if quest ''Altruis (Aldor)'' is rewarded'),
(20,0,10641,0,1,47,0,10689,64,0,0,0,0,'Quest ''Against the Legion'' - Group 1: Show quest mark only if quest ''Altruis (Scryers)'' is rewarded'),

(19,0,10668,0,0,47,0,10640,64,0,0,0,0,'Quest ''Against the Illidari'' - Group 0: Can accept the quest only if quest ''Altruis (Aldor)'' is rewarded'),
(19,0,10668,0,1,47,0,10689,64,0,0,0,0,'Quest ''Against the Illidari'' - Group 1: Can accept the quest only if quest ''Altruis (Scryers)'' is rewarded'),
(20,0,10668,0,0,47,0,10640,64,0,0,0,0,'Quest ''Against the Illidari'' - Group 0: Show quest mark only if quest ''Altruis (Aldor)'' is rewarded'),
(20,0,10668,0,1,47,0,10689,64,0,0,0,0,'Quest ''Against the Illidari'' - Group 1: Show quest mark only if quest ''Altruis (Scryers)'' is rewarded'),

(19,0,10669,0,0,47,0,10640,64,0,0,0,0,'Quest ''Against All Odds'' - Group 0: Can accept the quest only if quest ''Altruis (Aldor)'' is rewarded'),
(19,0,10669,0,1,47,0,10689,64,0,0,0,0,'Quest ''Against All Odds'' - Group 1: Can accept the quest only if quest ''Altruis (Scryers)'' is rewarded'),
(20,0,10669,0,0,47,0,10640,64,0,0,0,0,'Quest ''Against All Odds'' - Group 0: Show quest mark only if quest ''Altruis (Aldor)'' is rewarded'),
(20,0,10669,0,1,47,0,10689,64,0,0,0,0,'Quest ''Against All Odds'' - Group 1: Show quest mark only if quest ''Altruis (Scryers)'' is rewarded');

UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` IN (10641,10668,10669);
UPDATE `quest_template_addon` SET `NextQuestID` = 0 WHERE `NextQuestID` IN (10641,10668,10669);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18417 AND `id` IN (0,1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18417,0,0,1,19,0,100,0,9991,0,0,0,0,52,532,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Altruis the Sufferer - On Quest ''Survey the Land'' Accepted - Activate Taxi Path 532'),
(18417,0,1,0,61,0,100,0,7715,0,0,0,0,26,9991,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Altruis the Sufferer - Linked - Quest Credit ''Survey the Land''');
