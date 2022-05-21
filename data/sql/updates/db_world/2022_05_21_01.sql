DELETE FROM `gossip_menu_option` WHERE `MenuID` = 10192;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(10192,0,0,'Oh great Queen of the Dragons, I have somehow misplaced my Key to the Focusing Iris. Can you find it for me?',32832,1,1,0,0,0,0,'',0,0),
(10192,1,0,'Oh great Queen of the Dragons, I have somehow misplaced my Heroic Key to the Focusing Iris. Can you find it for me?',32836,1,1,0,0,0,0,'',0,0);
