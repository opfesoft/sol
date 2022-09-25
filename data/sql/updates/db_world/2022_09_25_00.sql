DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (6560,6561,6559);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,6560,0,0,0,47,0,8309,8,0,0,0,0,'Hive''Ashi Glyphed Crystal - Group 0: Show gossip option 0 if quest ''Glyph Chasing'' is in progress'),
(15,6560,0,0,0,2,0,20455,1,1,1,0,0,'Hive''Ashi Glyphed Crystal - Group 0: Show gossip option 0 if item ''Hive''Ashi Rubbing'' is not in the inventory or in the bank'),
(15,6560,0,0,0,2,0,20453,1,0,0,0,0,'Hive''Ashi Glyphed Crystal - Group 0: Show gossip option 0 if item ''Geologist''s Transcription Kit'' is in the inventory'),

(15,6561,0,0,0,47,0,8309,8,0,0,0,0,'Hive''Regal Glyphed Crystal - Group 0: Show gossip option 0 if quest ''Glyph Chasing'' is in progress'),
(15,6561,0,0,0,2,0,20456,1,1,1,0,0,'Hive''Regal Glyphed Crystal - Group 0: Show gossip option 0 if item ''Hive''Regal Rubbing'' is not in the inventory or in the bank'),
(15,6561,0,0,0,2,0,20453,1,0,0,0,0,'Hive''Regal Glyphed Crystal - Group 0: Show gossip option 0 if item ''Geologist''s Transcription Kit'' is in the inventory'),

(15,6559,0,0,0,47,0,8309,8,0,0,0,0,'Hive''Zora Glyphed Crystal - Group 0: Show gossip option 0 if quest ''Glyph Chasing'' is in progress'),
(15,6559,0,0,0,2,0,20454,1,1,1,0,0,'Hive''Zora Glyphed Crystal - Group 0: Show gossip option 0 if item ''Hive''Zora Rubbing'' is not in the inventory or in the bank'),
(15,6559,0,0,0,2,0,20453,1,0,0,0,0,'Hive''Zora Glyphed Crystal - Group 0: Show gossip option 0 if item ''Geologist''s Transcription Kit'' is in the inventory');
