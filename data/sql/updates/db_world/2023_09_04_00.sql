DELETE FROM `npc_text` WHERE `ID` = 8345;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`)
VALUES
(8345,'Talk about making the wrong investment!$B$BLord Valthalak''s dark book of spells fetched a pretty penny in the black market.  It''s too bad he didn''t take too kindly to getting his possessions stolen.  That stinker got us even after he''d been dead for months!','',11932,0,1,0,0,0,0,0,0);

UPDATE `creature_template` SET `gossip_menu_id` = 7092, `npcflag` = `npcflag` | 1 WHERE `entry` = 16123;

DELETE FROM `gossip_menu` WHERE `MenuID` = 7092;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7092,8345);
