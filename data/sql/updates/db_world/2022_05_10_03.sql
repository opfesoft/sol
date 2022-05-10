UPDATE `spell_area` SET `quest_start` = 12924, `quest_start_status` = 74 WHERE `spell` = 55858;
UPDATE `quest_template_addon` SET `NextQuestID` = 12924, `ExclusiveGroup` = -12915 WHERE `ID` IN (12915,12956);
UPDATE `quest_template_addon` SET `PrevQuestID` = 0 WHERE `ID` = 12924;
UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` IN (1975987,1975989,1975991,1975988,1975983,1975990,1975979,1975978,1975981,113932,113933,113934,113935,113938,113939);
UPDATE `creature` SET `phaseMask` = 4 WHERE `guid` IN (116761,116762,116763);
