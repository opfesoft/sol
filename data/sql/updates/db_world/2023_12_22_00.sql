UPDATE `broadcast_text` SET `MaleText` = 'Thank you again for helping Hilary, $g mister : miss;!  When I grow up, I wanna be a hero just like you!' WHERE `ID` = 4620;
UPDATE `broadcast_text_locale` SET `MaleText` = 'Nochmals vielen Dank, dass Ihr Hilary geholfen habt, $gwerter Herr:werte Dame;! Wenn ich erwachsen bin, will ich auch so heldenhaft sein!' WHERE `ID` = 4620 AND `locale` = 'deDE';

DELETE FROM `gossip_menu` WHERE `MenuID` = 1622 AND `TextID` = 2277;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(1622,2277);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 152 AND `SourceEntry` IN (8962,8965);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 1622;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(152,0,8962,0,0,16,0,1101,0,0,0,0,0,'Creature ''Hilary'' - Group 0: Allow interaction if Alliance'),
(152,0,8965,0,0,16,0,1101,0,0,0,0,0,'Creature ''Shawn'' - Group 0: Allow interaction if Alliance'),

(14,1622,2276,0,0,47,0,3741,64,0,1,0,0,'Creature ''Shawn'' - Group 0: Show gossip text 2276 if quest ''Hilary''s Necklace'' is not rewarded'),
(14,1622,2277,0,0,47,0,3741,64,0,0,0,0,'Creature ''Shawn'' - Group 0: Show gossip text 2277 if quest ''Hilary''s Necklace'' is rewarded');
