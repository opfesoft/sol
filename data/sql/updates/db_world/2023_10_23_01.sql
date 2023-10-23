DELETE FROM `creature_text` WHERE `CreatureId` IN (22810,22811,22812,22813,22814,22815);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(22810,0,0,'At last I am released! Thank you, gentle $r. I must return to the expedition at once! They will know of your deeds. This I vow.',12,0,100,0,0,0,20435,0,'Rescued Cenarion Expedition Druid'),
(22811,0,0,'What is this? Where am I? How... How did I... Cursed ethereals! I was on an escort mission out of Shattrath when we were ambushed! I must return to the city at once! Your name will be recorded as a friend of the Lower City, $n.',12,0,100,0,0,0,20438,0,'Rescued Lower City Brute'),
(22812,0,0,'Blessed Light! Free of my confines at last... Thank you, hero. A''dal will be told of your heroics.',12,0,100,0,0,0,20439,0,'Rescued Sha''tar Vindicator'),
(22813,0,0,'I will tell the tale of your heroics to Haramad myself! All Consortium will know your name, $n. Thank you, my friend.',12,0,100,0,0,0,20436,0,'Rescued Consortium Dealer'),
(22814,0,0,'$R save me! Thank you! My people thank you too!',12,0,100,0,0,0,20440,0,'Rescued Sporeggar Scout'),
(22815,0,0,'The Keepers of Time thank you for your assistance. The Timeless One shall be pleased with this outcome...',12,0,100,0,0,0,20437,0,'Rescued Keepers of Time Custodian');
